<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\Db;

/**
 * 提现订单接口
 * @ApiWeigh   (36)
 */
class OrderWithdraw extends Api
{ 
    protected $noNeedRight = "*";
    /**
     * 生成订单
     *
     * @ApiMethod (POST) 
     * @ApiParams (name="price", type="string", required=true, description="金额") 
     * @ApiParams (name="bank_id", type="string", description="银行账户ID") 
     * @ApiParams (name="pay_password", type="string", description="支付密码") 
     *   
     */
    public function makeOrder()
    {
        $price = $this->request->post('price', 0); 
        $bank_id = $this->request->post('bank_id', 0); 
        $pay_password = $this->request->post('pay_password', ""); 
        if($price<=0){
            $this->error(__("Please enter a valid amount"));
        }
        if($price>$this->auth->money){
            $this->error(__("Insufficient balance"));
        }
        $py = new \app\api\controller\User;
        if ($this->auth->pay_password != $py->getEncryptPassword($pay_password, $this->auth->pay_salt)) {
            $this->error(__('The password is incorrect')); 
        }  
        $mc = new \app\common\model\MembershipChain(); 
        $withdraw_time = $mc->isWithinTimeRange("withdraw_time");
        if(!$withdraw_time){
            $this->error(__("Time has not yet expired"));
        } 
        $data=[];
        $data['order_sn']=\app\common\model\Order::getOrderSn("W");
        $data['amount']=$price;
        $data['bank_id']=$bank_id;
        $data['user_id']=$this->auth->id;
        $data['create_time']=time();
        $result=Db::name("m_order_withdraw")->insertGetId($data);
        if($result){
            \app\common\model\User::money(- $price, $this->auth->id, "提现");
            $this->success(__("Withdrawal successful"),$data);
        }else{
            $this->error(__("Withdrawal failed, please try again"));
        } 
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
        $list=Db::name("m_order_withdraw")->where($where)->order("create_time desc")->paginate($per_page); 
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
        $result=Db::name("m_order_withdraw")->where($where)->find();
        $this->success("success",$result);
    } 
}
