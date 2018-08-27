/**
 * Created by Administrator on 2017/11/28.
 */

function searchData(){
    var tab = $('#easyuiTabsArchiveList').tabs('getSelected');
    var index = $('#easyuiTabsArchiveList').tabs('getTabIndex',tab);
    loadArchiveList(index);
}

/**
 *
 * @param archiveType 档案类型 company|goods|customer|employ|contract|powerOfAttorney
 */
function loadArchiveList(index, pageNum, pageSize) {
    var archiveType = getArchiveType(index);
    var auditStatusType = $("#statusSelect").combobox('getValue');
    if(auditStatusType == -9){
        auditStatusType = null;
    }
    if(!pageNum){
        pageNum = 1;
    }
    if(!pageSize){
        pageSize = 20;
    }
    var rqBean = {
        auditStatus: auditStatusType,
        pageNum: pageNum,
        pageSize: pageSize
    };
    $.ajax({
            type: "POST",
            url: ctx + "/company/archiveAudit/" + archiveType + "/list",
            contentType: "application/json", //必须有
            traditional: true,
            async: true,//false=同步
            dataType: "json",
            data: JSON.stringify(rqBean),
            success: function (response) {
                if (response.code == 0) {
                    $('#dg-' + archiveType).datagrid('loadData', response.data);
                    $('#pp-' + archiveType).pagination({
                        total:response.pageInfo.totalOfData,
                        pageSize:20,
                        onSelectPage:function(pageNumber, pageSize){
                            loadArchiveList(index, pageNumber, pageSize);
                        },
                        onRefresh:function(pageNumber, pageSize){
                            loadArchiveList(index, pageNumber, pageSize);
                        },
                    });
                }
            },
            error: function (e) {
            }
        }
    );
}

function getArchiveType(index) {
    var archiveType = '';
    switch (index){
        case 0:
            archiveType = "company";
            break;
        case 1:
            archiveType = "goods";
            break;
        case 2:
            archiveType = "customer";
            break;
        case 3:
            archiveType = "employ";
            break;
        case 4:
            archiveType = "contract";
            break;
        case 5:
            archiveType = "powerOfAttorney";
            break;
        default:
            archiveType = "company";
    }
    return archiveType;
}

$(function () {
    //让tabs显示在左边
    $('#easyuiTabsArchiveList').tabs({tabPosition:"left"});
});

/**
 * 企业档案列表自定义列
 * @param value 字段的值，也就是field:'archiveId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatOperateColumnOfCompany(value, rowData, rowIndex) {
    var detailUrl = ctx + "/company/archiveAudit/company/detail.html?archiveId=" + rowData["archiveId"]+"&auditStatus="+rowData["auditStatus"];
    return "<a href='" + detailUrl + "'>审批</a>";
}

/**
 * 商品档案列表自定义列
 * @param value 字段的值，也就是field:'archiveId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatOperateColumnOfGoods(value, rowData, rowIndex) {
    var detailUrl = ctx + "/company/archiveAudit/goods/detail.html?archiveId=" + rowData["archiveId"]+"&auditStatus="+rowData["auditStatus"];
    return "<a href='" + detailUrl + "'>审批</a>";
}
/**
 * 客户资料档案列表自定义列
 * @param value 字段的值，也就是field:'archiveId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatOperateColumnOfCustomer(value, rowData, rowIndex) {
    var detailUrl = ctx + "/company/archiveAudit/customer/detail.html?archiveId=" + rowData["archiveId"]+"&auditStatus="+rowData["auditStatus"];
    return "<a href='" + detailUrl + "'>审批</a>";
}
/**
 * 人员档案列表自定义列
 * @param value 字段的值，也就是field:'archiveId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatOperateColumnOfEmploy(value, rowData, rowIndex) {
    var detailUrl = ctx + "/company/archiveAudit/employ/detail.html?archiveId=" + rowData["archiveId"]+"&auditStatus="+rowData["auditStatus"];
    return "<a href='" + detailUrl + "'>审批</a>";
}
/**
 * 合同/协议列表自定义列
 * @param value 字段的值，也就是field:'archiveId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatOperateColumnOfContract(value, rowData, rowIndex) {
    var detailUrl = ctx + "/company/archiveAudit/contract/detail.html?archiveId=" + rowData["archiveId"]+"&auditStatus="+rowData["auditStatus"];
    return "<a href='" + detailUrl + "'>审批</a>";
}
/**
 * 委托书列表自定义列
 * @param value 字段的值，也就是field:'archiveId'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatOperateColumnOfPowerOfAttorney(value, rowData, rowIndex) {
    var detailUrl = ctx + "/company/archiveAudit/powerOfAttorney/detail.html?archiveId=" + rowData["archiveId"]+"&auditStatus="+rowData["auditStatus"];
    return "<a href='" + detailUrl + "'>审批</a>";
}