define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'order/fixed_deposit/index' + location.search,
                    add_url: 'order/fixed_deposit/add',
                    edit_url: 'order/fixed_deposit/edit',
                    del_url: 'order/fixed_deposit/del',
                    multi_url: 'order/fixed_deposit/multi',
                    import_url: 'order/fixed_deposit/import',
                    table: 'm_fixed_deposit',
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
                        {field: 'id', title: __('Id'), operate:false},
                        {field: 'user_id', title: __('User_id')},
                        {field: 'order_sn', title: __('Order_sn'), operate: 'LIKE'},
                        {field: 'name', title: __('Name'),  operate:false},
                        {field: 'type', title: __('Type'), searchList: {"0":__('定存')}, formatter: Table.api.formatter.normal, operate:false},
                        {field: 'day', title: __('Day'), operate:false},
                        {field: 'amount', title: __('Amount'), operate:false},
                        {field: 'rate', title: __('Rate'), operate:false},
                        {field: 'interest', title: __('Interest'), operate:false},
                        {field: 'status', title: __('Status'), searchList: {"0":__('等待中'),"1":__('完成')}, formatter: Table.api.formatter.status},
                        {field: 'start_time', title: __('Start_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'expire_time', title: __('Expire_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
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
