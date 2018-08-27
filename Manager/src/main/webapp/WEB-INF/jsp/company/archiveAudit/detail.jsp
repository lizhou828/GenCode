<%--
  Created by IntelliJ IDEA.
  User: TonyZeng
  Date: 2017/11/28
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>电子资料交换平台-运营端</title>
    <jsp:include page="../../common/easyui.jsp"/>
</head>
<body>
<%--工具栏--%>
<div id="toolbar" class="jhui-toolbar">
    <div class="easyui-panel jhui-toolbar-header">
        <c:if test="${auditStatus eq '待审核'}">
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search"
               onclick="$('#dlg').dialog('open');">开始审核</a>
        </c:if>
    </div>
</div>
<%--数据列表--%>
<table id="dg" title="" style="height:100%" class="easyui-datagrid"
       data-options="rownumbers:true,singleSelect:true,autoRowHeight:false,pagination:true,pageSize:20"
       url="/company/archiveAudit/${archiveType}/detail.shtml?archiveId=${archiveId}&auditStatus=${auditStatus}">
    <thead>
    <tr>
        <th field="name">明细名称</th>
        <th data-options="field:'images',align:'center',formatter:formatPreviewImageColumn">资质</th>
        <th field="expiredDate">失效日期</th>
        <th field="creator" align="right">创建人</th>
    </tr>
    </thead>
</table>
<%--审核对话框--%>
<div id="dlg" class="easyui-dialog" title="审核" data-options="iconCls:'icon-save',closed: true"
     style="width:400px;height:200px;padding:10px">
    <table cellpadding="5">
        <tr>
            <td>审核理由:</td>
            <td><input id="inputAuditRemark" class="easyui-textbox" name="message" data-options="multiline:true" style="height:60px"></input></td>
        </tr>
        <tr>
            <td>审核结果:</td>
            <td>
                <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                    <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="pass();" style="width:80px">通过</a>
                    <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="refuse();" style="width:80px">不通过</a>
                    <a class="easyui-linkbutton" data-options="iconCls:'icon-clear'" href="javascript:void(0)" onclick="$('#dlg').dialog('close');" style="width:80px">取消</a>
                </div>
            </td>
        </tr>
    </table>
</div>

<script>
    var ctx = '${ctx}';
    var archiveId = '${archiveId}';
    var archiveType = '${archiveType}';
</script>
<script src="${ctx}/js/company/archiveAudit/detail.js?v=${resourceVersion}"></script>
</body>
</html>
