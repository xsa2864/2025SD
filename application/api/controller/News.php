<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\Validate; 
use think\Db;

/**
 * 资讯接口
 * @ApiWeigh   (34)
 */
class News extends Api
{
    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 获取资讯列表
     *
     * @ApiMethod (GET)
     * @ApiParams   (name="title", type="string", description="商品名称")  
     * @ApiParams   (name="page", type="integer", description="页码")
     * @ApiParams   (name="per_page", type="integer", description="数量")
     * 
     * @ApiReturnParams   (name="id", type="int", description="ID")
     * @ApiReturnParams   (name="title", type="string", description="名称")   
     * @ApiReturnParams   (name="images", type="string", description="图片")     
     * @ApiReturnParams   (name="content", type="string", description="内容")     
     * @ApiReturnParams   (name="create_time_str", type="string", description="添加时间")     
     */
    public function getList()
    {
        $title = $this->request->get('title',""); 
        $page = $this->request->get("page",1);        
        $per_page = $this->request->get("per_page",15);

        $is_order = "weigh desc,create_time desc";
        $wh = [];
        $wh['status'] = 1;        
        if(!empty($title)){
            $wh['title'] = ['like',"%".$title."%"];
        }
        $list = Db::name("m_news")->alias('p') 
                    ->where($wh)
                    ->order($is_order)
                    ->paginate($per_page)->each(function($item){
                        $item['images'] = cdnurl($item['images'],true); 
                        $item['create_time_str'] = date("m/d/Y H:s", $item['create_time']);
                        return $item;
                    });
        $this->success('',$list);
    }

    /**
     * 获取单个详情
     *
     * @ApiMethod (GET)
     * @ApiParams   (name="id", type="integer", description="ID") 
     * 
     * @ApiReturnParams   (name="title", type="integer", description="名称")
     * @ApiReturnParams   (name="images", type="string", description="图片")          
     * @ApiReturnParams   (name="content", type="string", description="商品内容")     
     * @ApiReturnParams   (name="create_time_str", type="string", description="商品发布时间")    
     */
    public function getDetail()
    {
        $id = $this->request->get("id","");  
        $wh = [];
        $wh['id']=$id;
        $wh['status']=1; 
        $info = Db::name("m_news")->field("*")->where($wh)->find();
        if(!empty($info)){ 
            $info['images'] = cdnurl($info['images'],true);
            $info['create_time_str']=date("m/d/Y",$info['create_time']); 
        }
        $this->success('',$info);
    } 
 
  
}