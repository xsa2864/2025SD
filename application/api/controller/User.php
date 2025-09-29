<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\common\library\Ems;
use app\common\library\Sms;
use fast\Random;
use think\Config;
use think\Validate;
use think\Db;

/**
 * 会员接口
 */
class User extends Api
{
    protected $noNeedLogin = ['login', 'mobilelogin', 'register', 'resetpwd', 'changeemail', 'changemobile', 'third'];
    protected $noNeedRight = '*';

    public function _initialize()
    {
        parent::_initialize();

        if (!Config::get('fastadmin.usercenter')) {
            $this->error(__('User center already closed'));
        }

    }

    /**
     * 会员中心
     * @ApiReturnParams   (name="id", type="string", description="用户ID")     
     * @ApiReturnParams   (name="username", type="string", description="用户名")    
     * @ApiReturnParams   (name="nickname", type="string", description="昵称")     
     * @ApiReturnParams   (name="mobile", type="string", description="手机号")     
     * @ApiReturnParams   (name="level", type="string", description="等级")     
     * @ApiReturnParams   (name="money", type="string", description="金额")    
     * @ApiReturnParams   (name="score", type="string", description="积分")    
     * @ApiReturnParams   (name="invite_code", type="string", description="邀请码")    
     * @ApiReturnParams   (name="deal_count", type="string", description="现在订单数量")
     * @ApiReturnParams   (name="max_order", type="string", description="最大订单数量")
     * @ApiReturnParams   (name="day_commission", type="string", description="当天收益")
     * @ApiReturnParams   (name="frozen_amount", type="string", description="冻结金额")
     * @ApiReturnParams   (name="signiture", type="string", description="信誉分")
     * @ApiReturnParams   (name="is_paypwd", type="string", description="是否支付密码 0否 1是")
     */
    public function index()
    {
        $where=[];
        $where['user_id']=$this->auth->id;
        $where['status']=1;
        $where['create_time']=['>=',$this->auth->resettime];
        $day_commission=Db::name("m_order")->where($where)->whereTime('create_time', 'today')->sum("commission");
        $frozen_amount=Db::name("m_order")->field("sum(amount + commission) as total")->where("user_id",$this->auth->id)->where("status",2)->find()["total"];
        $this->success('', [
            'id' => $this->auth->id,
            'username' => $this->auth->username,
            'nickname' => $this->auth->nickname,
            'mobile' => $this->auth->mobile,
            'level' => $this->auth->level,
            'money' => $this->auth->money,
            'score' => $this->auth->score,
            'invite_code' => $this->auth->invite_code,
            'deal_count' => $this->auth->deal_count,
            'signiture' => $this->auth->signiture,
            'is_paypwd' => empty($this->auth->pay_password)?0:1,
            'max_order' => Db::name("m_level")->where("level",$this->auth->level)->value("max_order")??0,
            'day_commission' => $day_commission,
            'frozen_amount' => $frozen_amount??0,
        ]);
    }

    /**
     * 会员登录
     *
     * @ApiMethod (POST)
     * @ApiParams (name="account", type="string", required=true, description="账号")
     * @ApiParams (name="password", type="string", required=true, description="密码")
     */
    public function login()
    {
        $account = $this->request->post('account');
        $password = $this->request->post('password');
        if (!$account || !$password) {
            $this->error(__('Invalid parameters'));
        }
        $ret = $this->auth->login($account, $password);
        if ($ret) {
            $data = ['userinfo' => $this->auth->getUserinfo()];
            $this->success(__('Logged in successful'), $data);
        } else {
            $this->error($this->auth->getError());
        }
    }

    /**
     * 手机验证码登录
     * @ApiInternal
     *
     * @ApiMethod (POST)
     * @ApiParams (name="mobile", type="string", required=true, description="手机号")
     * @ApiParams (name="captcha", type="string", required=true, description="验证码")
     */
    public function mobilelogin()
    {
        $mobile = $this->request->post('mobile');
        $captcha = $this->request->post('captcha');
        if (!$mobile || !$captcha) {
            $this->error(__('Invalid parameters'));
        }
        if (!Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('Mobile is incorrect'));
        }
        if (!Sms::check($mobile, $captcha, 'mobilelogin')) {
            $this->error(__('Captcha is incorrect'));
        }
        $user = \app\common\model\User::getByMobile($mobile);
        if ($user) {
            if ($user->status != 'normal') {
                $this->error(__('Account is locked'));
            }
            //如果已经有账号则直接登录
            $ret = $this->auth->direct($user->id);
        } else {
            $ret = $this->auth->register($mobile, Random::alnum(), '', $mobile, []);
        }
        if ($ret) {
            Sms::flush($mobile, 'mobilelogin');
            $data = ['userinfo' => $this->auth->getUserinfo()];
            $this->success(__('Logged in successful'), $data);
        } else {
            $this->error($this->auth->getError());
        }
    }

    /**
     * 注册会员
     *
     * @ApiMethod (POST) 
     * @ApiParams (name="username", type="string", required=true, description="用户名")
     * @ApiParams (name="mobile", type="string", required=true, description="手机号")
     * @ApiParams (name="password", type="string", required=true, description="密码") 
     * @ApiParams (name="pay_password", type="string", description="支付密码") 
     * @ApiParams (name="invite_code", type="string", description="邀请码")
     */
    public function register()
    {
        $username = $this->request->post('username',"");
        $mobile = $this->request->post('mobile',"");
        $password = $this->request->post('password');
        $pay_password = $this->request->post('pay_password',"");
        $email = $this->request->post('email',"");
        // $code = $this->request->post('code');
        $invite_code = $this->request->post('invite_code',""); 
        if (!$username || !$mobile || !$password) {
            $this->error(__('Invalid parameters'));
        }
        if(empty($invite_code)){
            $this->error(__('Invalid supervisor username'));
        }
        $wh = [];
        $wh['status']       = 'normal';
        $wh['username|invite_code']  = $invite_code;
        $result = Db::name("user")->field("id")->where($wh)->find();
        if(empty($result)){
            $this->error(__('Invalid supervisor username'));
        }
        // if ($email && !Validate::is($email, "email")) {
        //     $this->error(__('Email is incorrect'));
        // }
        // if ($mobile && !Validate::regex($mobile, "^1\d{10}$")) {
        //     $this->error(__('Mobile is incorrect'));
        // }
        // $ret = Sms::check($mobile, $code, 'register');
        // if (!$ret) {
        //     $this->error(__('Captcha is incorrect'));
        // }
        $extend = [];
        $extend['pid'] = $result['id']??0;
        $extend['money'] = config("site.register_amount")??0;
        $extend['invite_code'] = $this->getInviteCode(1);
        if(!empty($pay_password)){
            $extend['pay_salt'] = Random::alnum(); 
            $extend['pay_password'] = $this->getEncryptPassword($pay_password, $extend['pay_salt']);    
        }
        $ret = $this->auth->register($username, $password, $email, $mobile, $extend);
        if ($ret) {
            $data = ['userinfo' => $this->auth->getUserinfo()];
            $mc = new \app\common\model\MembershipChain;
            $mc->synUserChain($this->auth->id, $extend['pid']);
            $this->success(__('Sign up successful'), $data);
        } else {
            $this->error($this->auth->getError());
        }
    }

    /**
     * 获取邀请码
     * @param int $type 类型 1=邀请码 2=会员编号
     * @return string
     */
    private function getInviteCode($type=1)
    {
        if($type==1){
            $code = Random::alnum(6);
            $result = Db::name("user")->where("invite_code",$code)->find();
        }else{
            $code = Random::alnum(8);
            $result = Db::name("user")->where("invite_code",$code)->find();
        }
        if($result){
            return $this->getInviteCode($type);
        }
        return $code;
    }

    /**
     * 获取密码加密后的字符串 
     * @param string $password 密码
     * @param string $salt     密码盐
     * @return string
     */
    public function getEncryptPassword($password, $salt = '')
    {
        return md5(md5($password) . $salt);
    }

    /**
     * 退出登录
     * @ApiMethod (POST)
     */
    public function logout()
    {
        if (!$this->request->isPost()) {
            $this->error(__('Invalid parameters'));
        }
        $this->auth->logout();
        $this->success(__('Logout successful'));
    }

    /**
     * 修改会员个人信息
     *
     * @ApiMethod (POST)
     * @ApiParams (name="avatar", type="string", required=true, description="头像地址")
     * @ApiParams (name="username", type="string", required=true, description="用户名")
     * @ApiParams (name="nickname", type="string", required=true, description="昵称")
     * @ApiParams (name="bio", type="string", required=true, description="个人简介")
     * @ApiParams (name="pay_password", type="string", description="密码")
     */
    public function profile()
    {
        $user = $this->auth->getUser();
        $username = $this->request->post('username');
        $nickname = $this->request->post('nickname');
        $bio = $this->request->post('bio');
        $pay_password = $this->request->post('pay_password',"");
        $avatar = $this->request->post('avatar', '', 'trim,strip_tags,htmlspecialchars');
        if ($username) {
            $exists = \app\common\model\User::where('username', $username)->where('id', '<>', $this->auth->id)->find();
            if ($exists) {
                $this->error(__('Username already exists'));
            }
            $user->username = $username;
        }
        if ($nickname) {
            $exists = \app\common\model\User::where('nickname', $nickname)->where('id', '<>', $this->auth->id)->find();
            if ($exists) {
                $this->error(__('Nickname already exists'));
            }
            $user->nickname = $nickname;
        }
        if ($this->auth->pay_password != $this->getEncryptPassword($pay_password, $this->auth->pay_salt)) {
            $this->error(__('Secondary password error'));
        }  
        $user->bio = $bio;
        $user->avatar = $avatar;
        $user->save();
        $this->success();
    }

    /**
     * 修改邮箱
     * @ApiInternal
     *
     * @ApiMethod (POST)
     * @ApiParams (name="email", type="string", required=true, description="邮箱")
     * @ApiParams (name="captcha", type="string", required=true, description="验证码")
     */
    public function changeemail()
    {
        $user = $this->auth->getUser();
        $email = $this->request->post('email');
        $captcha = $this->request->post('captcha');
        if (!$email || !$captcha) {
            $this->error(__('Invalid parameters'));
        }
        if (!Validate::is($email, "email")) {
            $this->error(__('Email is incorrect'));
        }
        if (\app\common\model\User::where('email', $email)->where('id', '<>', $user->id)->find()) {
            $this->error(__('Email already exists'));
        }
        $result = Ems::check($email, $captcha, 'changeemail');
        if (!$result) {
            $this->error(__('Captcha is incorrect'));
        }
        $verification = $user->verification;
        $verification->email = 1;
        $user->verification = $verification;
        $user->email = $email;
        $user->save();

        Ems::flush($email, 'changeemail');
        $this->success();
    }

    /**
     * 修改手机号
     * @ApiInternal
     *
     * @ApiMethod (POST)
     * @ApiParams (name="mobile", type="string", required=true, description="手机号")
     * @ApiParams (name="captcha", type="string", required=true, description="验证码")
     */
    public function changemobile()
    {
        $user = $this->auth->getUser();
        $mobile = $this->request->post('mobile');
        $captcha = $this->request->post('captcha');
        if (!$mobile || !$captcha) {
            $this->error(__('Invalid parameters'));
        }
        if (!Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('Mobile is incorrect'));
        }
        if (\app\common\model\User::where('mobile', $mobile)->where('id', '<>', $user->id)->find()) {
            $this->error(__('Mobile already exists'));
        }
        $result = Sms::check($mobile, $captcha, 'changemobile');
        if (!$result) {
            $this->error(__('Captcha is incorrect'));
        }
        $verification = $user->verification;
        $verification->mobile = 1;
        $user->verification = $verification;
        $user->mobile = $mobile;
        $user->save();

        Sms::flush($mobile, 'changemobile');
        $this->success();
    }

    /**
     * 第三方登录
     * @ApiInternal
     *
     * @ApiMethod (POST)
     * @ApiParams (name="platform", type="string", required=true, description="平台名称")
     * @ApiParams (name="code", type="string", required=true, description="Code码")
     */
    public function third()
    {
        $url = url('user/index');
        $platform = $this->request->post("platform");
        $code = $this->request->post("code");
        $config = get_addon_config('third');
        if (!$config || !isset($config[$platform])) {
            $this->error(__('Invalid parameters'));
        }
        $app = new \addons\third\library\Application($config);
        //通过code换access_token和绑定会员
        $result = $app->{$platform}->getUserInfo(['code' => $code]);
        if ($result) {
            $loginret = \addons\third\library\Service::connect($platform, $result);
            if ($loginret) {
                $data = [
                    'userinfo'  => $this->auth->getUserinfo(),
                    'thirdinfo' => $result
                ];
                $this->success(__('Logged in successful'), $data);
            }
        }
        $this->error(__('Operation failed'), $url);
    }

    /**
     * 重置密码
     * @ApiInternal
     *
     * @ApiMethod (POST)
     * @ApiParams (name="mobile", type="string", required=true, description="手机号")
     * @ApiParams (name="newpassword", type="string", required=true, description="新密码")
     * @ApiParams (name="captcha", type="string", required=true, description="验证码")
     */
    public function resetpwd()
    {
        $type = $this->request->post("type", "mobile");
        $mobile = $this->request->post("mobile");
        $email = $this->request->post("email");
        $newpassword = $this->request->post("newpassword");
        $captcha = $this->request->post("captcha");
        if (!$newpassword || !$captcha) {
            $this->error(__('Invalid parameters'));
        }
        //验证Token
        if (!Validate::make()->check(['newpassword' => $newpassword], ['newpassword' => 'require|regex:\S{6,30}'])) {
            $this->error(__('Password must be 6 to 30 characters'));
        }
        if ($type == 'mobile') {
            if (!Validate::regex($mobile, "^1\d{10}$")) {
                $this->error(__('Mobile is incorrect'));
            }
            $user = \app\common\model\User::getByMobile($mobile);
            if (!$user) {
                $this->error(__('User not found'));
            }
            $ret = Sms::check($mobile, $captcha, 'resetpwd');
            if (!$ret) {
                $this->error(__('Captcha is incorrect'));
            }
            Sms::flush($mobile, 'resetpwd');
        } else {
            if (!Validate::is($email, "email")) {
                $this->error(__('Email is incorrect'));
            }
            $user = \app\common\model\User::getByEmail($email);
            if (!$user) {
                $this->error(__('User not found'));
            }
            $ret = Ems::check($email, $captcha, 'resetpwd');
            if (!$ret) {
                $this->error(__('Captcha is incorrect'));
            }
            Ems::flush($email, 'resetpwd');
        }
        //模拟一次登录
        $this->auth->direct($user->id);
        $ret = $this->auth->changepwd($newpassword, '', true);
        if ($ret) {
            $this->success(__('Reset password successful'));
        } else {
            $this->error($this->auth->getError());
        }
    }

    /**
     * 重置登录密码
     *
     * @ApiMethod (POST) 
     * @ApiParams (name="old_password", type="string", description="旧密码")
     * @ApiParams (name="new_password", type="string", description="新密码") 
     */
    public function resetpassword()
    {
        $mobile         = $this->request->post("mobile","");
        $old_password    = $this->request->post("old_password","");
        $new_password    = $this->request->post("new_password","");
        $captcha        = $this->request->post("captcha","");

        if (!$old_password || !$new_password) {
            $this->error(__('Invalid parameters'));
        } 
        //判断旧密码是否正确
        if ($this->auth->password != $this->getEncryptPassword($old_password, $this->auth->salt)) {
            $this->error(__('The old password is incorrect'));
        }  
        $extend = [];
        $extend['salt'] = Random::alnum(); 
        $extend['password'] = $this->getEncryptPassword($new_password, $extend['salt']);    
        $result = Db::name("user")->where("id",$this->auth->id)->update($extend);
        
        if ($result) {
            $this->success(__('Login password saved successfully'));
        } else {
            $this->error($this->auth->getError());
        }
    }

    /**
     * 重置支付密码
     *
     * @ApiMethod (POST) 
     * @ApiParams (name="old_password", type="string", description="旧密码")
     * @ApiParams (name="new_password", type="string", description="新密码") 
     */
    public function resetpay()
    {
        $mobile         = $this->request->post("mobile","");
        $old_password    = $this->request->post("old_password","");
        $new_password    = $this->request->post("new_password","");
        $captcha        = $this->request->post("captcha","");

        if(empty($this->auth->pay_password)){ 
            if (!$new_password) {
                $this->error(__('Invalid parameters'));
            } 
            $extend = [];
            $extend['pay_salt'] = Random::alnum(); 
            $extend['pay_password'] = $this->getEncryptPassword($new_password, $extend['pay_salt']);    
            $result = Db::name("user")->where("id",$this->auth->id)->update($extend);
        }else{
            if (!$old_password || !$new_password) {
                $this->error(__('Invalid parameters'));
            } 
            //判断旧密码是否正确
            if ($this->auth->pay_password != $this->getEncryptPassword($old_password, $this->auth->pay_salt)) {
                $this->error(__('The old password is incorrect'));
            }  
            $extend = [];
            $extend['pay_salt'] = Random::alnum(); 
            $extend['pay_password'] = $this->getEncryptPassword($new_password, $extend['pay_salt']);    
            $result = Db::name("user")->where("id",$this->auth->id)->update($extend);
        }
 
        if ($result) {
            $this->success(__('Secondary password saved successfully'));
        } else {
            $this->error($this->auth->getError());
        }
    }
}
