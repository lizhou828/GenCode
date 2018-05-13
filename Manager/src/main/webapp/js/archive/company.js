/**
 * Created by Administrator on 2017/11/28.
 */
/**
 * 根据档案类型加档案列表
 * @param archiveType [company|goods|customer|employ|contract|powerOfAttorney]
 */
/**
 * 自定义easyui data-grid的"操作"列
 * @param value 字段的值，也就是field:'companyId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatColumnOfCompany(value, rowData, rowIndex) {
    if (rowData["images"]) {
        var html = "";
        $.each(rowData["images"], function (index, value) {
            html += "<a target='_blank' href='" + value + "'>查看</a>&nbsp;";
        });
    }
    return html;
    // return "<a href='" + rowData["images"]+ "'>预览</a>";
}

/**
 * 自定义easyui data-grid的列
 * @param value 字段的值，也就是field:'companyId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatColumnOfGoods(value, rowData, rowIndex) {
    var detailUrl = ctx + "/archive/company/goods/detail-" + rowData["id"] + ".html";
    return "<a href='" + detailUrl + "'>档案详情</a>";
}/**
 * 自定义easyui data-grid的列
 * @param value 字段的值，也就是field:'companyId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatColumnOfCustomer(value, rowData, rowIndex) {
    var detailUrl = ctx + "/archive/company/customer/detail-" + rowData["id"] + ".html";
    return "<a href='" + detailUrl + "'>档案详情</a>";
}/**
 * 自定义easyui data-grid的列
 * @param value 字段的值，也就是field:'companyId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatColumnOfEmploy(value, rowData, rowIndex) {
    var detailUrl = ctx + "/archive/company/employ/detail-" + rowData["id"] + ".html";
    return "<a href='" + detailUrl + "'>档案详情</a>";
}/**
 * 自定义easyui data-grid的列
 * @param value 字段的值，也就是field:'companyId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatColumnOfContract(value, rowData, rowIndex) {
    /*var detailUrl = ctx + "/archive/company/contract/detail-" + rowData["id"] + ".html";
    return "<a href='" + detailUrl + "'>档案详情</a>";*/
    return "<a target='_blank' href='" + rowData["file"]  + "'>查看</a>";
}/**
 * 自定义easyui data-grid的列
 * @param value 字段的值，也就是field:'companyId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatColumnOfPA(value, rowData, rowIndex) {
  /*  var detailUrl = ctx + "/archive/company/powerOfAttorney/detail-" + rowData["id"] + ".html";
    return "<a href='" + detailUrl + "'>档案详情</a>";*/
    return "<a target='_blank' href='" + rowData["file"]  + "'>查看</a>";
}

$(function () {
    //让tabs显示在左边
    $('#easyuiTabsArchiveList').tabs({tabPosition:"left"});
});