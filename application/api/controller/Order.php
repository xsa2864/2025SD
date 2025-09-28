<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\common\model\MembershipChain;
use think\Db;

/**
 * 订单接口
 * @ApiWeigh   (38)
 */
class Order extends Api
{ 
    protected $noNeedRight = "*";
    /**
     * 生成订单
     *
     * @ApiMethod (POST) 
     *   
     */
    public function makeOrder()
    {
        $mc = new MembershipChain(); 
        $result = $mc->isWithinTimeRange();
        if(!$result){
            $this->error(__("The operation is currently unavailable. Please proceed during working hours %s",[config("site.order_time")]));
        } 
        if($this->auth->money<0){
            $this->error(__("Insufficient balance"));
        }
        $order_sn = Db::name("m_order")->where("user_id",$this->auth->id)->where("status",0)->value("order_sn");
        if($order_sn){
            $this->error(__("The order has not been completed"),['order_sn'=>$order_sn]);
        } 
        $oinfo = Db::name("m_order")->where("user_id",$this->auth->id)->where("status", 2)->order("id desc")->find(); 
        if(empty($oinfo)){
            $purchase_amount=config("site.purchase_amount")??0;
            if($purchase_amount>0 && $this->auth->money<$purchase_amount){
                $this->error(__("Amount less than %s",[$purchase_amount]));
            }
        }else if($oinfo['mark_no']==2){
            $this->error(__("The order has not been completed"),['order_sn'=>$oinfo['order_sn']]);
        }     
        $lv = Db::name("m_level")->where('level', $this->auth->level??1)->find();    
        if(empty($lv)){
            $this->error(__("Level not set yet"));
        } 
        $new_sort_id = $this->auth->deal_count + 1; 
        if($lv['max_order']<$new_sort_id){
            $this->error(__("The limit has been reached"));
        } 
        $mark_no = 0;
        $number = 1;

        $where=[];
        $where['user_id']=$this->auth->id;
        $where['sort_id']=$new_sort_id;
        $where['status']=0;
        $mark_info = Db::name("m_order_mark")->where($where)->order("create_time asc")->find(); 
        if(!empty($mark_info)){
            $product = Db::name("m_product")->where('id', $mark_info['product_id'])->find();
            $commission_rate=$mark_info['commission_rate'];
            if($mark_info['mark_num']==$mark_info['mark_over']){
                $mark_no=2; 
            }else{
                $mark_no=1; 
            }
            $number = $mark_info['number'];
            Db::name("m_order_mark")->where('id', $mark_info['id'])->update(['status'=>1,'over_time'=>time()]);
        }else{      
            $product = $this->randomInMoneyRange();
            $number = $product['targetQty']??1;
            $commission_rate=$lv['commission_rate'];
        }
        if(empty($product)){
            $this->error(__("No product data"));
        }        
        
        $amount=abs($product['price'] * $number); 
        $commission=round($amount * $commission_rate /100,2);
        $order_sn =\app\common\model\Order::getOrderSn("O");

        $data=[];
        $data['order_sn']=$order_sn;
        $data['user_id']=$this->auth->id;
        $data['product_id']=$product['id'];
        $data['amount']=$amount;
        $data['number']=$number;
        $data['commission']=$commission;
        $data['commission_rate']=$commission_rate;
        $data['sort_id']=$new_sort_id;
        $data['mark_no']=$mark_no; 
        $data['create_time']=time();
        $result=Db::name("m_order")->insertGetId($data);
        if($result){  
            Db::name("user")->where("id",$this->auth->id)->update(['deal_count'=>$new_sort_id]); 
            $this->success(__("Order successful"),$data);
        }else{
            $this->error(__("Order failed"));
        }
    } 

    /** 
     * @ApiInternal
     */
    public function randomInMoneyRange()
    {
        $min_price = config("site.min_price") ?? 50;
        $max_price = config("site.max_price") ?? 100;
        $min = $this->auth->money * $min_price / 100;
        $max = $this->auth->money * $max_price / 100;

        $product = Db::name('m_product')
            ->where('price', 'between', [$min, $max]) 
            ->orderRaw('rand()')
            ->find();

        if ($product) {
            return $product;
        }

        $product = Db::name('m_product')
            ->where('price', '>', 0)
            ->where('price', '<=', $max)
            ->orderRaw('rand()')
            ->find();

        if (!$product) {
            return false;
        }

        // 计算数量范围
        $minQty = ceil($min / $product['price']);
        $maxQty = floor($max / $product['price']);
        if ($minQty > $maxQty || $minQty < 1) {
            return false;
        }
        $product['targetQty'] = round(($minQty + $maxQty) / 2); 

        return $product;
    }

    /**
     * 支付订单
     *
     * @ApiMethod (Post) 
     * @ApiParams (name="order_sn", type="string", description="订单号") 
     *   
     */
    public function payOrder()
    {
        $order_sn = $this->request->post('order_sn',""); 
        $where=[];
        $where['user_id']=$this->auth->id;
        $where['order_sn']=$order_sn; 
        $result=Db::name("m_order")->where($where)->find();
        if(empty($result)){
            $this->error(__("Invalid order"));
        }
        if($result['status']==1){
            $this->success(__("Order completed"));
        }
        if($result['status']==2 && $result['mark_no']==1)
        { 
            $this->success(__("Order completed"));
        }      
        if($this->auth->money<0){
            $this->error(__("Payment amount insufficient"));
        }
        $amount=$result['amount'];
        $commission=$result['commission'];

        if($result['status']==0){
            $after = \app\common\model\User::money(- $amount, $this->auth->id, $order_sn);
            if($after<0){
                Db::name("m_order")->where("id",$result['id'])->update(['status'=>2]);
                $this->error(__("Payment amount insufficient"));
            } 
        }

        if($result['mark_no']==2)
        {
                $mc = new MembershipChain();
                $where=[];
                $where['user_id']=$this->auth->id;
                $where['status']=2;
                $list=Db::name("m_order")->where($where)->select();
                if($list){
                    foreach ($list as $key => $value) {                        
                        \app\common\model\User::money($value['amount'], $value['user_id'], $value['order_sn']);  
                        \app\common\model\User::money($value['commission'], $value['user_id'], $value['order_sn']."佣金");  
                        Db::name("m_order")->where("id",$value['id'])->update(['status'=>1,"over_time"=>time()]); 
                        $mc->payCommission($value['user_id'], $value['commission'], "佣金");
                    }
                }
                \app\common\model\User::money($amount, $this->auth->id, $order_sn);  
                \app\common\model\User::money($commission, $this->auth->id, $order_sn."佣金");  
                Db::name("m_order")->where("id",$result['id'])->update(['status'=>1,"over_time"=>time()]); 
                $mc->payCommission($this->auth->id,$commission,"佣金");
                \app\common\model\User::autolevel($this->auth->id);
        }else if($result['mark_no']==1){
                Db::name("m_order")->where("id",$result['id'])->update(['status'=>2]);
        }else{
                \app\common\model\User::money($amount, $this->auth->id, $order_sn);  
                \app\common\model\User::money($commission, $this->auth->id, $order_sn."佣金");  
                Db::name("m_order")->where("id",$result['id'])->update(['status'=>1,"over_time"=>time()]);
                $mc = new MembershipChain();
                $mc->payCommission($this->auth->id,$commission,"佣金");
                \app\common\model\User::autolevel($this->auth->id);
        }  
        $this->success(__("Finish"));
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
        $list=Db::name("m_order")->field("*")->where($where)->order("create_time desc")->paginate($per_page)
                    ->each(function($item){
                        $info = Db::name("m_product")->where("id",$item['product_id'])->find();
                        if(!empty($info)){
                            $info['images'] = cdnurl($info['images'],true); 
                            $item['product_info'] = $info;    
                        }                        
                        return $item;
                    });
        $this->success("success",$list);
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
        $result=Db::name("m_order")->where($where)->find();
        if($result){
            $info = Db::name("m_product")->where("id",$result['product_id'])->find(); 
            if(!empty($info)){
                $info['images'] = cdnurl($info['images'],true); 
            }   
            $result['product_info'] = $info; 
        }
        $this->success("success",$result);
    } 
}
