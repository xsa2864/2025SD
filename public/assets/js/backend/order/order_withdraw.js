define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'order/order_withdraw/index' + location.search,
                    add_url: 'order/order_withdraw/add',
                    edit_url: 'order/order_withdraw/edit',
                    del_url: 'order/order_withdraw/del',
                    multi_url: 'order/order_withdraw/multi',
                    import_url: 'order/order_withdraw/import',
                    table: 'm_order_withdraw',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                fixedColumns: true,
                fixedRightNumber: 1,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id'), operate: false},
                        {field: 'order_sn', title: __('Order_sn'), operate: 'LIKE'},
                        {field: 'user_id', title: __('User_id')},
                        {field: 'admin_id', title: __('Admin_id'), operate: false},
                        {field: 'amount', title: __('Amount'), operate:false},
                        {field: 'fees', title: __('Fees'), operate: false},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.normal, searchList: {0: '待支付', 1: '完成', 2: '驳回'}},
                        {field: 'note', title: __('Note'), operate: false},
                        {field: 'over_time', title: __('Over_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, buttons: [ 
                            {name: 'edit', text: '修改', title: '修改', icon: 'fa fa-list', classname: 'btn btn-xs btn-warning btn-editone btn-dialog' ,url:$.fn.bootstrapTable.defaults.extend.edit_url},
                            {name: 'assets', text: '收款信息', title: '收款列表', icon: 'fa fa-list', classname: 'btn btn-xs btn-info btn-dialog btn-editones' ,url:function(row){
                                return 'user/bankinfo/index?id='+row.bank_id
                            }}
                        ], events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
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
