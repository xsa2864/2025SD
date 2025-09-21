<?php
namespace app\common\model;

use think\Db;
use think\Model;
use think\exception\DbException;

class MembershipChain extends Model
{
    protected $name = 'membership_chain';

    /**
     * Synchronize user relationship chain
     * @param int $user_id User ID
     * @param int|null $pid Parent ID
     * @return bool
     * @throws DbException
     */
    public function synUserChain($user_id, $pid = null)
    {
        // Validate inputs
        if (!is_numeric($user_id) || ($pid !== null && !is_numeric($pid))) {
            throw new \InvalidArgumentException('Invalid user_id or pid');
        }

        Db::startTrans();
        try {
            $ancestral_arr = [];
            if ($pid) {
                // Add direct parent relationship
                $ancestral_arr[] = [
                    'user_id' => $user_id,
                    'ancestral_id' => $pid,
                    'level' => 1,
                ];

                // Get parent's ancestors and increment levels
                $pid_above_arr = $this->where([
                    'ancestral_id' => ['neq', 0],
                    'user_id' => $pid
                ])->select();

                foreach ($pid_above_arr as $value) {
                    $ancestral_arr[] = [
                        'user_id' => $user_id,
                        'ancestral_id' => $value['ancestral_id'],
                        'level' => $value['level'] + 1
                    ];
                }
            } else {
                $ancestral_arr[] = [
                    'user_id' => $user_id,
                    'ancestral_id' => 0,
                    'level' => 0,
                ];
            }

            // Batch insert relationships
            $this->insertAll($ancestral_arr);

            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            throw $e;
        }
    }

    /**
     * Update user relationship chain during registration
     * @param int $user_id User ID
     * @param int|null $pid Parent ID
     * @return bool
     * @throws DbException
     */
    public function updateUserChain($user_id, $pid = null)
    {
        if (!is_numeric($user_id)) {
            throw new \InvalidArgumentException('Invalid user_id');
        }

        Db::startTrans();
        try {
            // Insert initial relationship
            $this->insert([
                'user_id' => $user_id,
                'level' => 0,
                'ancestral_id' => 0
            ]);

            // Check if user has root ancestral record
            $have_ancestral = $this->where([
                'user_id' => $user_id,
                'ancestral_id' => 0
            ])->value('id');

            if ($have_ancestral) {
                // Get all descendants
                $descendants = $this->where('ancestral_id', $user_id)
                    ->order('level', 'asc')
                    ->select();

                // Sync user chain
                $result = $this->synUserChain($user_id, $pid);

                if ($result && !empty($descendants)) {
                    foreach ($descendants as $descendant) {
                        $this->synUserChainP($descendant['user_id'], $descendant['ancestral_id']);
                    }
                }

                // Remove temporary root record
                $this->where([
                    'user_id' => $user_id,
                    'ancestral_id' => 0
                ])->delete();
            }

            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            throw $e;
        }
    }

    /**
     * Synchronize relationship chain for users with descendants
     * @param int $user_id User ID
     * @param int $pid Parent ID
     * @return bool
     * @throws DbException
     */
    public function synUserChainP($user_id, $pid)
    {
        if (!is_numeric($user_id) || !is_numeric($pid)) {
            throw new \InvalidArgumentException('Invalid user_id or pid');
        }

        Db::startTrans();
        try {
            $pid_above_arr = $this->where([
                'ancestral_id' => ['neq', 0],
                'user_id' => $pid
            ])->select();

            $insert_data = [];
            foreach ($pid_above_arr as $value) {
                $insert_data[] = [
                    'user_id' => $user_id,
                    'level' => $value['level'] + 1,
                    'ancestral_id' => $value['ancestral_id']
                ];
            }

            if (!empty($insert_data)) {
                $this->insertAll($insert_data);
            }

            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            throw $e;
        }
    }

    /**
     * Count total number of direct descendants
     * @param int $user_id User ID
     * @return int
     */
    public function totalNum($user_id)
    {
        if (!is_numeric($user_id)) {
            throw new \InvalidArgumentException('Invalid user_id');
        }

        return $this->where('ancestral_id', $user_id)->count('user_id');
    }


    public function payCommission($user_id=0,$commission=0,$note="")
    { 
        $where = [];
        $where['user_id'] = $user_id;
        $where['level']   = ['<=',3];
        $list = $this->where($where)->select();
        if(!empty($list))
        {
            foreach ($list as $key => $value) 
            { 
                if($value['level'] == 1){
                    $amount = round($commission * config("site.level1_rate") / 100,2);
                    \app\common\model\User::money($amount, $value['ancestral_id'], $note);  
                }else if($value['level'] == 2){
                    $amount = round($commission * config("site.level2_rate") / 100,2);
                    \app\common\model\User::money($amount, $value['ancestral_id'], $note);  
                }else if($value['level'] == 3){
                    $amount = round($commission * config("site.level3_rate") / 100,2);
                    \app\common\model\User::money($amount, $value['ancestral_id'], $note);  
                }
            }  
        }
    }

    public function isWithinTimeRange($type="order_time") 
    {
        $times = explode('-', config("site.".$type)); 
        if (count($times) !== 2) {
            return false; 
        }

        $startTime = $times[0];
        $endTime = $times[1];
 
        $current = time();
        $today = strtotime('today');

        $start = strtotime($startTime, $today);
        $end = strtotime($endTime, $today);

        if ($start === false || $end === false) {
            return false;
        }
        if ($end < $start) {
            return false;
        }
        return $current >= $start && $current <= $end;
    }
 
}