define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'order/order_charge/index' + location.search,
                    add_url: 'order/order_charge/add',
                    edit_url: 'order/order_charge/edit',
                    del_url: 'order/order_charge/del',
                    multi_url: 'order/order_charge/multi',
                    import_url: 'order/order_charge/import',
                    table: 'm_order_charge',
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
                        {field: 'fees', title: __('Fees'), operate:false},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.normal, searchList: {0: '待支付', 1: '完成', 2: '驳回'}},
                        {field: 'note', title: __('Note'), operate: false},
                        {field: 'over_time', title: __('Over_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
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
