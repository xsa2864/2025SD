<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\Validate; 
use think\Db;

/**
 * 等级接口
 * @ApiWeigh   (33)
 */
class Level extends Api
{
    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 获取等级列表
     *
     * @ApiMethod (GET) 
     * @ApiParams   (name="page", type="integer", description="页码")
     * @ApiParams   (name="per_page", type="integer", description="数量")
     * 
     * @ApiReturnParams   (name="id", type="int", description="ID")
     * @ApiReturnParams   (name="title", type="string", description="名称")
     * @ApiReturnParams   (name="pic", type="string", description="图片")     
     * @ApiReturnParams   (name="level", type="string", description="等级")     
     * @ApiReturnParams   (name="enough_price", type="string", description="升级金额")     
     * @ApiReturnParams   (name="max_order", type="string", description="最大做单数")     
     * @ApiReturnParams   (name="Withdraw_min", type="string", description="最低提现额")     
     * @ApiReturnParams   (name="Withdraw_max", type="string", description="最高提现额")     
     * @ApiReturnParams   (name="commission_rate", type="string", description="佣金率(%)")     
     */
    public function getList()
    { 
        $page = $this->request->get("page",1);        
        $per_page = $this->request->get("per_page",15); 
  
        $list = Db::name("m_level")->paginate($per_page)->each(function($item){
                        $item['pic'] = cdnurl($item['pic'],true); 
                        return $item;
                    });
        $this->success('',$list);
    }
 
  
}