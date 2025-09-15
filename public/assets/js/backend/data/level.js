define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'data/level/index' + location.search,
                    add_url: 'data/level/add',
                    edit_url: 'data/level/edit',
                    del_url: 'data/level/del',
                    multi_url: 'data/level/multi',
                    import_url: 'data/level/import',
                    table: 'm_level',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                search:false,
                showExport: false,
                showToggle: false,
                searchFormVisible: false,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id'), operate: false},
                        {field: 'pic', title: __('Pic'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.images},
                        {field: 'name', title: __('Name'), operate: false},
                        {field: 'level', title: __('Level'), operate: false},
                        {field: 'enough_price', title: __('Enough_price'), operate:false},
                        {field: 'max_order', title: __('Max_order'), operate:false},
                        {field: 'withdraw_min', title: __('Withdraw_min'), operate:false},
                        {field: 'withdraw_max', title: __('Withdraw_max'), operate:false},
                        {field: 'commission_rate', title: __('Commission_rate'), operate:false},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.normal, searchList: {0: '禁用', 1: '开启'}},
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
