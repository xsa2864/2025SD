<?php

namespace app\api\controller;

use app\common\controller\Api;
use addons\signin\library\Service;
use addons\signin\library\SigninException;
use DateTime;
use fast\Date;
use think\Db;

/**
 * 签到接口
 */
class Signin extends Api
{
    // protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];

    /**
     * 前端记录
     * @ApiMethod (GET) 
     * 
     *
     */
    public function index()
    { 
        $list=[];
        $list['normal'] = Db::name("signin")->field(['create_date' => Db::raw("FROM_UNIXTIME(createtime,'%Y-%m-%d') AS sign_date")])->where("user_id",$this->auth->id)->where("type",'normal')->whereTime('createtime','-7 days')->select();
        $list['fillup'] = Db::name("signin")->field(['create_date' => Db::raw("FROM_UNIXTIME(createtime,'%Y-%m-%d') AS sign_date")])->where("user_id",$this->auth->id)->where("type",'fillup')->whereTime('createtime','-7 days')->select();
        $this->success("success",$list);
    }


    /**
     * 立即签到
     * @ApiMethod (POST)
     * @ApiParams   (name="type", type="string", description="normal,fillup")   
     * 
     */
    public function dosign()
    {
        if (!$this->request->isPost()) {
            $this->error(__("Request Error"));
        }

        $type = $this->request->post("type","");    
        $type = $type?:"normal";
        $user_id = $this->auth->id;
        // 开始事务
        Db::startTrans();
        try {
            // 使用FOR UPDATE锁定查询，防止并发
            $signin = \addons\signin\model\Signin::where('user_id', $user_id)
                ->where("type",$type)
                ->whereTime('createtime', 'today')
                ->lock(true)
                ->find();

            if ($signin) {
                Db::rollback(); 
                $this->error(__("Signed in today, please come back tomorrow"));
            }

            // 查询最后一次签到记录并锁定
            $lastdata = \addons\signin\model\Signin::where('user_id', $user_id)
                ->where("type",$type)
                ->order('createtime', 'desc')
                ->lock(true)
                ->find();

            $successions = $lastdata && $lastdata['createtime'] > Date::unixtime('day', -1) ? $lastdata['successions'] : 0;
            $successions++; 

            // 创建签到记录
            \addons\signin\model\Signin::create(['user_id' => $user_id, 'successions' => $successions, 'type' => $type, 'createtime' => time()]);
            \app\common\model\User::score(1, $user_id, $type, "连续签到{$successions}天");

            // 提交事务
            Db::commit();
        } catch (SigninException $e) {
            Db::rollback(); 
            $this->error(__("Sign-in failed"));
        } catch (Exception $e) {
            Db::rollback(); 
            $this->error(__("Sign-in failed"));
        }
        $this->success(__("Sign in successfully")); 
    }
}
