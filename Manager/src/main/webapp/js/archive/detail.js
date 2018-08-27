/**
 * Created by Administrator on 2017/11/28.
 */

/**
 * 自定义easyui data-grid的"操作"列
 * @param value 字段的值，也就是field:'companyId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatOperateColumn(value, rowData, rowIndex) {
    if (rowData["images"]) {
        var html = "";
        $.each(rowData["images"], function (index, value) {
            html += "<a target='_blank' href='" + value + "'>查看</a>&nbsp;";
        });
    }
    return html;
    // return "<a href='" + rowData["id"] + "'>详情</a>";
}
