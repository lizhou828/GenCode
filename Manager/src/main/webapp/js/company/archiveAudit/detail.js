/**
 * Created by Administrator on 2017/11/28.
 */
/**
 * 审批通过
 */
function pass() {
    var auditRemark = $("#inputAuditRemark").val();
    $.ajax({
            type: "GET",
            url: ctx + "/company/archiveAudit/" + archiveType + "/audit?pass=true&archiveId=" + archiveId + "&remark=" + auditRemark,
            contentType: "text/html", //必须有
            async: false,
            contentType: "application/json", //必须有
            dataType: "json",
            cache: false,
            success: function (response) {
                if (response.code == 0) {
                    alert("成功");
                    window.location.href="/company/archiveAudit/index.html";
                } else {
                    alert(response.msg);
                }
            },
            error: function (e) {
            }
        }
    );
}

/**
 * 审批不通过
 */
function refuse() {
    var auditRemark = $("#inputAuditRemark").val();
    $.ajax({
            type: "GET",
            url: ctx + "/company/archiveAudit/" + archiveType + "/audit?pass=false&archiveId=" + archiveId + "&remark="+auditRemark,
            contentType: "text/html", //必须有
            async: false,
            contentType: "application/json", //必须有
            dataType: "json",
            cache: false,
            success: function (response) {
                if (response.code == 0) {
                    alert("成功");
                    window.location.href="/company/archiveAudit/index.html";
                } else {
                    alert(response.msg);
                }
            },
            error: function (e) {
            }
        }
    );
}

/**
 * 自定义easyui data-grid的"图片预览"列
 * @param value 字段的值，也就是field:'images'.
 * @param rowData 行数据,就是一行的JSON数据.
 * @param rowIndex 行索引,当前行的Index.
 * @returns {string}
 */
function formatPreviewImageColumn(value, rowData, rowIndex) {
    if (rowData["images"]) {
        var html = "";
        $.each(rowData["images"], function (index, value) {
            html += "<a target='_blank' href='" + value + "'>查看</a>&nbsp;";
        });
    }
    return html;
}
