define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'order/order_mark/index' + location.search,
                    add_url: 'order/order_mark/add' + location.search,
                    edit_url: 'order/order_mark/edit',
                    del_url: 'order/order_mark/del',
                    multi_url: 'order/order_mark/multi',
                    import_url: 'order/order_mark/import',
                    table: 'm_order_mark',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id'), operate:false},
                        {field: 'user_id', title: __('User_id')},
                        // {field: 'product_id', title: __('Product_id'), operate:false},
                        {field: 'product.price', title: __('产品金额'), operate:false},
                        {field: 'number', title: __('Number'), operate:false},
                        {field: 'commission_rate', title: __('Commission_rate'), operate:false},
                        {field: 'sort_id', title: __('Sort_id'), operate:false},
                        {field: 'mark_num', title: __('Mark_num'), operate:false},
                        {field: 'mark_over', title: __('Mark_over'), operate:false},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.normal, searchList: {0: '未匹配', 1: '匹配'}},
                        {field: 'over_time', title: __('Over_time'), operate:false, addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'create_time', title: __('Create_time'), operate:false, addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            $("#c-price").data("change", function (obj) { 
                $("#c-product_id").data("params", function (obj) { 
                    console.log(obj)
                    console.log($("#c-price").val())
                    return {custom: {price: $("#c-price").val()}};
                });
            });
            
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
