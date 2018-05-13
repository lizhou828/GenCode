/**
 * Created by Administrator on 2017/11/28.
 */

/**
 * 自定义easyui data-grid的"操作"列
 * @param value 字段的值，也就是field:'archiveId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatOperateColumn(value, rowData, rowIndex) {
    var detailUrl = ctx + "/archive/company-"+rowData["companyId"]+".html";
    return "<a href='" + detailUrl + "'>查看</a>";
}

function parameterSearch(){
    var queryParams = $('#searchForm').serializeObject();
    $('#dg').datagrid({
        url:'/archive/company/search',
        queryParams: queryParams,
        onLoadError:function (msg){$('#dg').datagrid('loadData', {total:0, rows:[]});}
    });

}