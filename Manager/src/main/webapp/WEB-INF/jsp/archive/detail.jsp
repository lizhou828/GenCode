<%--
档案明细列表
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
    <jsp:include page="../common/easyui.jsp"/>
</head>
<body class="easyui-layout" data-options="region:'center',border:false">
<%--工具栏--%>
<table id="dg" style="height: 100%" class="easyui-datagrid"
       data-options="rownumbers:true,singleSelect:true,autoRowHeight:false,pagination:true,pageSize:20" url="/archive/company/${archiveType}/detail?archiveId=${archiveId}" >
    <thead>
    <tr>
        <th field="name">资质名称</th>
        <th field="expiredDate">有效期至</th>
        <th data-options="field:'images',align:'center',formatter:formatOperateColumn">产品所属企业档案</th>
    </tr>
    </thead>
</table>
<script>
    var ctx = '${ctx}';
    var archiveType = '${archiveType}';
    var archiveId = '${archiveId}';
</script>
<script src="${ctx}/js/archive/detail.js?v=${resourceVersion}"></script>
</body>
</html>