define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/user/index',
                    add_url: 'user/user/add',
                    edit_url: 'user/user/edit',
                    del_url: 'user/user/del',
                    multi_url: 'user/user/multi',
                    table: 'user',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'user.id',
                fixedColumns: true,
                fixedRightNumber: 1,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id'), operate: false}, 
                        {field: 'pid', title: __('上级ID'), visible: false},
                        {field: 'puser.username', title: __('上级用户'), operate: 'LIKE'},
                        {field: 'username', title: __('Username'), operate: 'LIKE'},
                        {field: 'mobile', title: __('Mobile'), operate: 'LIKE'},
                        {field: 'email', title: __('Email'), operate: 'LIKE'},
                        {field: 'invite_code', title: __('Invite_code'), operate: false},
                        // {field: 'avatar', title: __('Avatar'), events: Table.api.events.image, formatter: Table.api.formatter.image, operate: false},
                        {field: 'deal_count', title: __('Deal_count'), operate: false},
                        {field: 'signiture', title: __('Signiture'), operate: false},
                        // {field: 'gender', title: __('Gender'), visible: false, searchList: {1: __('Male'), 0: __('Female')}},
                        {field: 'money', title: __('Money'), sortable: true, operate: false},
                        {field: 'frozen_amount', title: __('冻结金额'), operate: false},
                        {field: 'level', title: __('Level'), operate: false},
                        // {field: 'score', title: __('Score'), operate: false},
                        // {field: 'successions', title: __('Successions'), visible: false, operate: 'BETWEEN', sortable: true},
                        // {field: 'maxsuccessions', title: __('Maxsuccessions'), visible: false, operate: 'BETWEEN', sortable: true},
                        {field: 'logintime', title: __('Logintime'), operate: false, formatter: Table.api.formatter.datetime, addclass: 'datetimerange', sortable: true},
                        {field: 'loginip', title: __('Loginip'), operate: false, formatter: Table.api.formatter.search},
                        {field: 'jointime', title: __('Jointime'), operate: 'LIKE', formatter: Table.api.formatter.datetime, addclass: 'datetimerange', sortable: true},
                        {field: 'joinip', title: __('Joinip'), operate: false, formatter: Table.api.formatter.search},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.status, searchList: {normal: __('Normal'), hidden: __('Hidden')}},
                        {field: 'operate', title: __('Operate'), table: table,buttons: [ 
                            {name: 'money', text: '加扣款', title: '加扣款', icon: '', classname: 'btn btn-xs btn-info btn-dialog' ,url:function(row){
                                return 'user/user/money?ids='+row.id
                            },extend: 'data-area=\'["450px", "350px"]\''},
                            {name: 'edit', text: '修改', title: '修改', icon: '', classname: 'btn btn-xs btn-warning btn-editone btn-dialog' ,url:$.fn.bootstrapTable.defaults.extend.edit_url},
                            {name: 'assets', text: '派单', title: '派单列表', icon: 'fa fa-list', classname: 'btn btn-xs btn-primary btn-dialog btn-editones' ,url:function(row){
                                return 'order/order_mark/index?user_id='+row.id
                            }},
                            {name: 'assets', text: '做单', title: '订单列表', icon: 'fa fa-list', classname: 'btn btn-xs btn-info btn-dialog btn-editones' ,url:function(row){
                                return 'order/order/index?user_id='+row.id
                            }},
                            {name: 'assets', text: '提现', title: '提现列表', icon: 'fa fa-list', classname: 'btn btn-xs btn-primary btn-dialog btn-editones' ,url:function(row){
                                return 'order/order_withdraw/index?user_id='+row.id
                            }},
                            {name: 'assets', text: '充值', title: '充值列表', icon: 'fa fa-list', classname: 'btn btn-xs btn-info btn-dialog btn-editones' ,url:function(row){
                                return 'order/order_charge/index?user_id='+row.id
                            }},
                            {name: 'assets', text: '变账', title: '资金流', icon: 'fa fa-list', classname: 'btn btn-xs btn-primary btn-dialog btn-editones' ,url:function(row){
                                return 'user/money_log/index?user_id='+row.id
                            }},
                            {name: 'ajax', text: '重置', title: '重置', classname: 'btn btn-xs btn-success btn-magic btn-ajax', icon: 'fa fa-refresh',
                                url: 'order/order/refresh',
                                confirm: '确认重置',
                                success: function (data, ret) { 
                                    // Layer.alert(ret.msg);
                                    //如果需要阻止成功提示，则必须使用return false;
                                    table.bootstrapTable('refresh', {});
                                    //return false;
                                } 
                            },
                        ], events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            table.on('post-body.bs.table',function(){
                $(".btn-editones").data("area",["100%","100%"]);
            })
            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        money: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});