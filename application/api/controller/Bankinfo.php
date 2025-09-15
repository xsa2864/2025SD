<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\Db;

/**
 * 银行卡接口
 * @ApiWeigh   (37)
 */
class Bankinfo extends Api
{ 
    protected $noNeedRight = "*";

    /**
     * 保存
     *
     * @ApiMethod (POST)
     * @ApiParams (name="name", type="string", required=true, description="名字") 
     * @ApiParams (name="bank_name", type="string", required=true, description="银行名称") 
     * @ApiParams (name="card_num", type="string", required=true, description="卡号") 
     * @ApiParams (name="mobile", type="string", required=true, description="手机号") 
     * @ApiParams (name="erc20", type="string", required=true, description="erc20") 
     * @ApiParams (name="trc20", type="string", required=true, description="trc20") 
     * @ApiParams (name="address", type="string", required=true, description="地址") 
     */
    public function save()
    {
        $name = $this->request->post('name', ""); 
        $bank_name = $this->request->post('bank_name', ""); 
        $card_num = $this->request->post('card_num', ""); 
        $mobile = $this->request->post('mobile', ""); 
        $erc20 = $this->request->post('erc20', ""); 
        $trc20 = $this->request->post('trc20', ""); 
        $address = $this->request->post('address', ""); 
        if(empty($name)||empty($bank_name)){
            $this->error("请输入参数");
        }
        $info=Db::name("m_bankinfo")->where("user_id",$this->auth->id)->find();
        if(empty($info)){
            $data=[];
            $data['user_id']=$this->auth->id;
            $data['name']=$name;
            $data['bank_name']=$bank_name;
            $data['card_num']=$card_num;
            $data['mobile']=$mobile;
            $data['erc20']=$erc20;
            $data['trc20']=$trc20;
            $data['address']=$address;
            $id=Db::name("m_bankinfo")->insertGetId($data);
            $data['id']=$id;
            $info=$data;
        }else{
            $data=[]; 
            $data['name']=$name;
            $data['bank_name']=$bank_name;
            $data['card_num']=$card_num;
            $data['mobile']=$mobile;
            $data['erc20']=$erc20;
            $data['trc20']=$trc20;
            $data['address']=$address;
            $result=Db::name("m_bankinfo")->where("id",$info['id'])->update($data);
        }
            
        $this->success("success",$info);
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
    public function getList()
    {
        $page = $this->request->get("page",1);        
        $per_page = $this->request->get("per_page",20);
        $status = $this->request->get('status', ""); 
        $where=[];
        if($status!=""){
            $where['status']=$status;
        }
        $where['user_id']=$this->auth->id;
        $list=Db::name("m_bankinfo")->where($where)->paginate($per_page); 
        $this->success("success",$list->items());
    } 

    /**
     * 获取银行卡信息
     *
     * @ApiMethod (GET) 
     * @ApiParams (name="bank_id", type="string", description="id") 
     *   
     */
    public function getOrderDetail()
    {
        $bank_id = $this->request->get('bank_id',0); 
        $where=[];
        if($bank_id){
            $where['id']=$bank_id;
        }        
        $where['user_id']=$this->auth->id;
        $result=Db::name("m_bankinfo")->where($where)->find();
        $this->success("success",$result);
    } 
}
