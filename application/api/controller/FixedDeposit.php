<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\Db;

/**
 * 定存接口
 * @ApiWeigh   (36)
 */
class FixedDeposit extends Api
{ 
    protected $noNeedRight = "*";
    public $rate = [
            '1'=>['day'=>3,'rate'=>0.001,'name'=>'3天定存 利率 0.001'],
            '2'=>['day'=>7,'rate'=>0.004,'name'=>'7天定存 利率 0.004'], 
            '3'=>['day'=>30,'rate'=>0.02,'name'=>'30天定存 利率 0.02'],
            // '4'=>['day'=>0.01,'rate'=>0.01,'name'=>'0.01天定存 利率 0.01'],
        ]; 
    public $amount = [2000,5000,10000,30000,50000,100000,300000];

    /**
     * 获取配置列表
     *
     * @ApiMethod (GET) 
     *   
     */
    public function getList() 
    {
        $catalog['rate'] = $this->rate; 
        $catalog['amount'] = $this->amount;
        $this->success("success",$catalog);
    } 

    /**
     * 生成订单
     *
     * @ApiMethod (POST) 
     * @ApiParams (name="type", type="string", required=true, description="类型ID") 
     * @ApiParams (name="money", type="string", required=true, description="金额")  
     * @ApiParams (name="pay_password", type="string", description="支付密码") 
     *   
     */
    public function makeOrder()
    {
        $type = $this->request->post('type', 0); 
        $money = $this->request->post('money', 0); 
        $pay_password = $this->request->post('pay_password', ""); 
        if(!in_array($money, $this->amount)){
            $this->error(__("请输入有效金额"));
        }
        if(!isset($this->rate[$type])){
            $this->error(__("请选择收益类型"));
        }
        if($money>$this->auth->money){
            $this->error(__("余额不足"));
        }

        $amount = Db::name("m_fixed_deposit")->where("user_id",$this->auth->id)->value("max(amount)");
        if($amount>=$money){
            $this->error(__("The number of buyers has been reached"));
        } 

        $py = new \app\api\controller\User;
        if ($this->auth->pay_password != $py->getEncryptPassword($pay_password, $this->auth->pay_salt)) {
            $this->error(__('The password is incorrect'));
        }  

        $catalogs=$this->rate[$type];

        $data=[]; 
        $data['user_id']=$this->auth->id;
        $data['order_sn']=\app\common\model\Order::getOrderSn("FD");
        $data['name']=$catalogs['name'];
        $data['amount']=$money;
        $data['day']=$catalogs['day'];
        $data['rate']=$catalogs['rate'];
        $data['interest']=$money * $catalogs['rate'];
        $data['start_time']=time();
        $data['expire_time']=time() + $catalogs['day'] * 24 * 3600;
        $result = Db::name("m_fixed_deposit")->insert($data);

        if($result){
            \app\common\model\User::money(- $money, $this->auth->id, "定存");
            $this->success(__("Purchase successful!"),$data);
        }else{
            $this->error(__("Purchase failed, try again."));
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
        $list=Db::name("m_fixed_deposit")->where($where)->paginate($per_page); 
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
        $result=Db::name("m_fixed_deposit")->where($where)->find();
        $this->success("success",$result);
    } 
}
