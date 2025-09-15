define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'order/order/index' + location.search,
                    add_url: 'order/order/add',
                    edit_url: 'order/order/edit',
                    del_url: 'order/order/del',
                    multi_url: 'order/order/multi',
                    import_url: 'order/order/import',
                    table: 'm_order',
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
                        // {field: 'id', title: __('Id')},
                        {field: 'order_sn', title: __('Order_sn'), operate: 'LIKE'},
                        {field: 'user_id', title: __('User_id'), visible: false},
                        {field: 'user.username', title: __('User.username'), operate: 'LIKE'},
                        // {field: 'user.mobile', title: __('User.mobile'), operate: 'LIKE'},
                        {field: 'sort_id', title: __('Sort_id'), operate:false},
                        {field: 'product_id', title: __('Product_id'), operate:false},
                        {field: 'number', title: __('Number'), operate:false},
                        {field: 'amount', title: __('Amount'), operate:false},
                        {field: 'commission', title: __('Commission'), operate:false}, 
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.normal, searchList: {0: '待支付', 1: '完成', 2: '冻结', '-1': '取消订单'}},
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
