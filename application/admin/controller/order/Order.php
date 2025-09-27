<?php

namespace app\admin\controller\order;

use app\common\controller\Backend;
use think\Db;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class Order extends Backend
{

    /**
     * Order模型对象
     * @var \app\admin\model\order\Order
     */
    protected $model = null;
    protected $noNeedRight = ['refresh'];

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\order\Order;

    }



    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */


    /**
     * 查看
     */
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = true;
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();

            $list = $this->model
                    ->with(['user'])
                    ->where($where)
                    ->order($sort, $order)
                    ->paginate($limit);

            foreach ($list as $row) {
                
                $row->getRelation('user')->visible(['username','mobile']);
            }

            $result = array("total" => $list->total(), "rows" => $list->items());

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 重置
     */
    public function refresh($ids = null)
    {
        $user_id = $ids; 
        $list = Db::name("m_order")->where("user_id",$user_id)->where("status","in",[0,2])->select();
        if($list){
            foreach ($list as $row) {
                \app\common\model\User::money($row['amount'], $row['user_id'], $row['order_sn']);  
            }   
            Db::name("m_order")->where("user_id",$user_id)->update(['status'=>1]);
        } 
        Db::name("m_order_mark")->where("user_id",$user_id)->delete();
        $result = Db::name("user")->where("id",$user_id)->update(['deal_count'=>0,'resettime'=>time()]); 
        $this->success("重置成功");
    }

}
