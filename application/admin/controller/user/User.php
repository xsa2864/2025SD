<?php

namespace app\admin\controller\user;

use app\common\controller\Backend;
use app\common\library\Auth;
use fast\Random;
use think\Db;

/**
 * 会员管理
 *
 * @icon fa fa-user
 */
class User extends Backend
{

    protected $relationSearch = true;
    protected $searchFields = 'id,username,nickname';
    protected $noNeedRight = ['money'];

    /**
     * @var \app\admin\model\User
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\User;
    }

    /**
     * 查看
     */
    public function index()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $list = $this->model
                ->with('puser')
                ->where($where)
                ->order($sort, $order)
                ->paginate($limit);
            foreach ($list as $k => $v) {
                $v->getRelation('puser')->visible(['username']);
                $v->avatar = $v->avatar ? cdnurl($v->avatar, true) : letter_avatar($v->nickname);
                $v->hidden(['password', 'salt', 'pay_password', 'pay_salt']);
                $v->frozen_amount = Db::name("m_order")->where("user_id",$v->id)->where("status",2)->sum("amount");
            }
            $result = array("total" => $list->total(), "rows" => $list->items());

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 添加
     */
    public function add()
    {
        if (false === $this->request->isPost()) {
            return $this->view->fetch();
        }

        $params = $this->request->post('row/a');
        if (empty($params)) {
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $this->token();
        $exists = $this->model->where('username',"=", $params['username'])->find(); 
        if ($exists) {
            $this->error('用户名已存在，请更换'); 
        }
        $exists = $this->model->where('mobile',"=", $params['mobile'])->find(); 
        if ($exists) {
            $this->error('手机号已存在，请更换'); 
        }
        if(!empty($params['password'])){
            $params['salt'] = Random::alnum(); 
            $params['password'] = $this->getEncryptPassword($params['password'], $params['salt']);
        } 
        if(!empty($params['pay_password'])){
            $params['pay_salt'] = Random::alnum(); 
            $params['pay_password'] = $this->getEncryptPassword($params['pay_password'], $params['pay_salt']);
        } 
        $params['nickname'] = $params['username'];
        $params['email'] = $params['username']."@gamil.com";
        $params['invite_code'] = $this->getInviteCode(1);

        $params = $this->preExcludeFields($params);

        if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
            $params[$this->dataLimitField] = $this->auth->id;
        }
        $result = false;
        Db::startTrans();
        try {
            //是否采用模型验证
            if ($this->modelValidate) {
                $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.add' : $name) : $this->modelValidate;
                $this->model->validateFailException()->validate($validate);
            }
            $result = $this->model->allowField(true)->save($params); 
            Db::commit();
        } catch (ValidateException|PDOException|Exception $e) {
            Db::rollback();
            $this->error($e->getMessage());
        }
        if ($result === false) {
            $this->error(__('No rows were inserted'));
        }
        if($params['pid']>0){
            $mc = new \app\common\model\MembershipChain;
            $mc->synUserChain($this->model->id, $params['pid']);
        }
        $this->success();
    }

    /**
     * 获取邀请码
     * @param int $type 类型 1=邀请码 2=会员编号
     * @return string
     */
    public function getInviteCode($type=1)
    {
        if($type==1){
            $code = Random::alnum(6);
            $result = Db::name("user")->where("invite_code",$code)->find();
        }else{
            $code = Random::alnum(8);
            $result = Db::name("user")->where("invite_code",$code)->find();
        }
        if($result){
            return $this->getInviteCode($type);
        }
        return $code;
    }

    /**
     * 编辑
     */
    public function edit($ids = null)
    {
        if ($this->request->isPost()) {
            $this->token();
            $params = $this->request->post('row/a');  
            if(!empty($params['pay_password'])){
                $params['pay_salt'] = Random::alnum(); 
                $params['pay_password'] = $this->getEncryptPassword($params['pay_password'], $params['pay_salt']);
                $this->request->post(['row' => $params]);
            } 
        }
        $row = $this->model->get($ids);
        $this->modelValidate = true;
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $this->view->assign('groupList', build_select('row[group_id]', \app\admin\model\UserGroup::column('id,name'), $row['group_id'], ['class' => 'form-control selectpicker']));
        return parent::edit($ids);
    }

    public function getEncryptPassword($password, $salt = '')
    {
        return md5(md5($password) . $salt);
    }

    /**
     * 加扣款
     *
     * @param $ids
     * @return string
     * @throws DbException
     * @throws \think\Exception
     */
    public function money($ids = null)
    {
        $row = $this->model->get($ids); 
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds) && !in_array($row[$this->dataLimitField], $adminIds)) {
            $this->error(__('You have no permission'));
        }
        if (false === $this->request->isPost()) {
            $this->view->assign('row', $row);
            return $this->view->fetch();
        }
        $params = $this->request->post('row/a');
        if (empty($params)) {
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $params = $this->preExcludeFields($params);
        $result = false;
        Db::startTrans();
        try {
            $type = $params['money']>0?1:2;
            $result = \app\common\model\User::money($params['money'], $row->id, "管理员：".$this->auth->id, $type);
            Db::commit();
        } catch (ValidateException|PDOException|Exception $e) {
            Db::rollback();
            $this->error($e->getMessage());
        }
        if (false === $result) {
            $this->error(__('No rows were updated'));
        }
        $this->success();
    }


    /**
     * 删除
     */
    public function del($ids = "")
    {
        if (!$this->request->isPost()) {
            $this->error(__("Invalid parameters"));
        }
        $ids = $ids ? $ids : $this->request->post("ids");
        $row = $this->model->get($ids);
        $this->modelValidate = true;
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        Auth::instance()->delete($row['id']);
        $this->success();
    }

}
