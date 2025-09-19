define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/bankinfo/index' + location.search,
                    add_url: 'user/bankinfo/add',
                    edit_url: 'user/bankinfo/edit',
                    del_url: 'user/bankinfo/del',
                    multi_url: 'user/bankinfo/multi',
                    import_url: 'user/bankinfo/import',
                    table: 'm_bankinfo',
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
                        {field: 'id', title: __('Id'), visible: false},
                        {field: 'user_id', title: __('User_id')},
                        {field: 'user.username', title: __('User.username'), operate: 'LIKE'}, 
                        {field: 'name', title: __('Name'), operate: false},
                        {field: 'bank_name', title: __('Bank_name'), operate: false},
                        {field: 'card_num', title: __('Card_num'), operate: false},
                        {field: 'mobile', title: __('Mobile'), operate: false},
                        {field: 'erc20', title: __('Erc20'), operate: false},
                        {field: 'trc20', title: __('Trc20'), operate: false},
                        {field: 'address', title: __('Address'), operate: false},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.normal, searchList: {0: '关闭', 1: '开启'}},
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
