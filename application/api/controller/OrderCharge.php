<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\Db;

/**
 * 充值订单接口
 * @ApiWeigh   (37)
 */
class OrderCharge extends Api
{ 
    protected $noNeedRight = "*";
    /**
     * 生成订单
     *
     * @ApiMethod (POST)
     * @ApiParams (name="price", type="string", required=true, description="金额") 
     */
    public function makeOrder()
    {
        $price = $this->request->post('price', 0); 
        if($price<=0){
            $this->error(__("请输入有效金额"));
        }
        $data=[];
        $data['order_sn']=\app\common\model\Order::getOrderSn("C");
        $data['amount']=$price;
        $data['user_id']=$this->auth->id;
        $data['create_time']=time();
        $result=Db::name("m_order_charge")->insertGetId($data);
        $this->success("success","",$data);
    } 
 
    /**
     * 获取订单列表
     *
     * @ApiMethod (GET) 
     * @ApiParams (name="page", type="string", description="页码") 
     * @ApiParams (name="per_page", type="string", description="查询数量") 
     * @ApiParams (name="status", type="string", description="状态") 
     *   
     */
    public function getOrderList()
    {
        $page = $this->request->get("page",1);        
        $per_page = $this->request->get("per_page",20);
        $status = $this->request->get('status', ""); 
        $where=[];
        if($status!=""){
            $where['status']=$status;
        }
        $where['user_id']=$this->auth->id;
        $list=Db::name("m_order_charge")->where($where)->order("create_time desc")->paginate($per_page); 
        $this->success("success",$list->items());
    } 

    /**
     * 获取订单详情
     *
     * @ApiMethod (GET) 
     * @ApiParams (name="order_sn", type="string", description="订单号") 
     *   
     */
    public function getOrderDetail()
    {
        $order_sn = $this->request->get('order_sn',""); 
        $where=[];
        $where['user_id']=$this->auth->id;
        $where['order_sn']=$order_sn;
        $result=Db::name("m_order_charge")->where($where)->find();
        $this->success("success",$result);
    } 
}
