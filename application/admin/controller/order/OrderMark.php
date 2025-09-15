<?php

namespace app\admin\controller\order;

use app\common\controller\Backend;
use think\Db;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class OrderMark extends Backend
{

    /**
     * OrderMark模型对象
     * @var \app\admin\model\order\OrderMark
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\order\OrderMark;

    }



    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */


    /**
     * 添加
     *
     * @return string
     * @throws \think\Exception
     */
    public function add()
    {
        $user_id = $this->request->get("user_id",0);
        if(empty($user_id)){
            $this->error("用户不存在");
        }
        $info = Db::name("user")->field("money,deal_count")->where("id",$user_id)->find(); 
        $deal_max = Db::name("m_order_mark")->where("user_id",$user_id)->where("status",0)->max("sort_id");
        if($info["deal_count"] < $deal_max){
            $info["deal_count"] = $deal_max;
        }
        if (false === $this->request->isPost()) {            
            $this->view->assign('info', $info);
            return $this->view->fetch();
        }
        $params = $this->request->post('row/a');
        if (empty($params)) {
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $params = $this->preExcludeFields($params);

        if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
            $params[$this->dataLimitField] = $this->auth->id;
        }

        if($info['deal_count'] > $params['sort_id']){
            $this->error("派单序号要大于已经做单数");
        }
        $product_arr = array_filter($params['product_id']);
        if(empty($product_arr)){
            $this->error("派单不能为空");
        }
        $number_arr = array_filter($params['number']);
        $commission_rate_arr = array_filter($params['commission_rate']);
        $sort_id = $params['sort_id'];
        $mark_num = 1;
        $mark_over = count($product_arr)/2;
        $result = false;
        Db::startTrans();
        try { 
            $datas=[];
            foreach ($product_arr as $key => $value) {
                if($key%2==1){             
                    $data = [];
                    $data['user_id'] = $user_id;
                    $data['product_id'] = $value;
                    $data['number'] = $number_arr[$mark_num - 1];
                    $data['commission_rate'] = $commission_rate_arr[$mark_num - 1];
                    $data['sort_id'] = $sort_id;    
                    $data['mark_num'] = $mark_num;    
                    $data['mark_over'] = $mark_over;    
                    $data['create_time'] = time();   
                    $datas[]=$data;
                    $sort_id++; 
                    $mark_num++; 
                }
            } 
            $result = Db::name("m_order_mark")->insertAll($datas);
            Db::commit();
        } catch (ValidateException|PDOException|Exception $e) {
            Db::rollback();
            $this->error($e->getMessage());
        }
        if ($result === false) {
            $this->error(__('No rows were inserted'));
        }
        $this->success();
    }

    /**
     * 编辑
     *
     * @param $ids
     * @return string
     * @throws DbException
     * @throws \think\Exception
     */
    public function edit($ids = null)
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
            //是否采用模型验证
            if ($this->modelValidate) {
                $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : $name) : $this->modelValidate;
                $row->validateFailException()->validate($validate);
            }
            $result = $row->allowField(true)->save($params);
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

}
