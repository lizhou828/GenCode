$(function () {
    //查看详情
    $("#detailBtn").click(function () {
        var _docid = $.dataGridOperation.getCheckedId();
        if (_docid > 0) {
            var buttons = new Array();
            buttons[0] = {
                iconCls: 'icon-cancel', text: '取消', handler: function () {
                    $.easyuiDialog.close();
                }
            };
            window.location.href = ctx + "/archive/company-"+_docid+".html"
        }
    });
    $('#dg').datagrid({
        view: detailview,
        detailFormatter:function(index,row){
            return '<div style="padding:2px">' +
                        '<table class="ddv"></table>' +
                        '<div class="easyui-panel">' +
                            '<div class="easyui-pagination" data-options="total:114"></div>' +
                        '</div>' +
                    '</div>';
        },
        onExpandRow: function(index,row){
            var productName = $('#productName').val();
            var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
            ddv.datagrid({
                url:'listProduct?companyId='+row.id+'&productName='+productName,
                fitColumns:true,
                singleSelect:true,
                rownumbers:true,
                loadMsg:'正在加载数据...',
                height:'auto',
                pagination: true,   //是否分页
                pageSize: 10,
                columns:[[
                    {field:'productName',title:'产品名称',width:100},
                    {field:'getProductTypeStr',title:'产品类型',width:100},
                    {field:'packageSpec',title:'包装规格/型号',width:100},
                    {field:'manufacturer',title:'生产厂家',width:100},
                    {field:'manufacturerArchiveId',title:'操作',width:100,
                        formatter:function(value,row,index){
                            if(value){
                                //return "<a href='detail.shtml?id=" + value + "'>查看</a>";
                            }
                        }},
                ]],
                onResize:function(){
                    $('#dg').datagrid('fixDetailRowHeight',index);
                },
                onLoadSuccess:function(){
                    setTimeout(function(){
                        $('#dg').datagrid('fixDetailRowHeight',index);
                    },0);
                },
                onDblClickRow: function (rowIndex, row) {
                    window.location.href = ctx + "detail.shtml?id="+row.manufacturerArchiveId
                }
            });
            $('#dg').datagrid('fixDetailRowHeight',index);
        }
    });

})



function parameterSearch(){
    var queryParams = $('#searchForm').serializeObject();
    $('#dg').datagrid({
        url:'search.shtml',
        queryParams: queryParams,
        onLoadError:function (msg){$('#dg').datagrid('loadData', {total:0, rows:[]});}
    });

}