<%--
企业列表
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
<div id="toolbar" class="jhui-toolbar">
    <div class="easyui-panel jhui-toolbar-header">
        <form action="" id="searchForm">
        <input class="easyui-textbox" name="companyName" id="companyName" data-options="label:'Name:',prompt:'企业名称（模糊查询）'">


            <a onclick="parameterSearch()" href="javascript:void(0);" class="easyui-linkbutton"
               data-options="group:'g2',plain:true,iconCls:'icon-search'">搜索</a>
        </form>
    </div>
</div>
</div>
<%--数据列表--%>
<table id="dg" style="height: 100%" hidden="hidden" class="easyui-datagrid"
       data-options="toolbar:'#toolbar',rownumbers:true,singleSelect:true,autoRowHeight:false,pagination:true,pageSize:20"
       url="/archive/company/search">
    <thead>
    <tr>
        <th field="companyName">企业名称</th>
        <th field="createTime">创建时间</th>
        <th field="modifyTime">最近更新时间</th>
        <th data-options="field:'companyId',align:'center',formatter:formatOperateColumn">操作</th>
    </tr>
    </thead>
</table>
<script>
    var ctx = '${ctx}';
</script>
<script src="${ctx}/js/archive/index.js?v=${resourceVersion}"></script>
</body>
</html>