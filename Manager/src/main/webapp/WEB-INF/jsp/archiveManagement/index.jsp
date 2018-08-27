<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <%@ include file="../common/easyui.jsp"%>
    <script type="text/javascript" src="${ctx}/js/easyui/datagrid-detailview.js?v=${resourceVersion}"></script>
    <script src="${ctx}/js/archiveManagement/index.js?v=${resourceVersion}"></script>
</head>
<body class="easyui-layout" data-options="region:'center',border:false">
<div id="toolbar" class="jhui-toolbar">
    <div class="easyui-panel jhui-toolbar-header">
        <div class="functions">
            <a  id="detailBtn" data-options="group:'g1',plain:true,iconCls:'icon-search'" href="javascript:void(0);" class="easyui-linkbutton">查看详情</a>
            <a onclick="$.dataGridOperation.toolReload()" id="refreshBtn" data-options="group:'g1',plain:true,iconCls:'icon-reload'" href="javascript:void(0);" class="easyui-linkbutton">刷新</a>
        </div>
        <div class="search">
        </div>
    </div>
    <div class="easyui-panel" data-options="border:false" style="height:65px">
        <form action="" id="searchForm">
            <table class="jhui-table">
                <tbody>
                <tr>
                    <th>企业名称</th>
                    <td><input class="easyui-textbox" name="companyName" type="text"></input></td>
                    <th>产品名称</th>
                    <td><input class="easyui-textbox" name="productName" type="text" id="productName"></input></td>
                    <td rowspan="2" class="button">
                        <a onclick="parameterSearch()" href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="group:'g2',plain:true,iconCls:'icon-search'">搜索</a>
                    </td>
                </tr>
                <tr>
                    <th>创建时间</th>
                    <td><input class="easyui-datebox" name="startCreateTime" type="text"></input>
                        --
                        <input class="easyui-datebox" name="endCreateTime" type="text"></input></td>
                    <th>审核时间</th>
                    <td><input class="easyui-datebox" name="startAuditTime" type="text"></input>
                        --
                        <input class="easyui-datebox" name="endAuditTime" type="text"></input></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
<table id="dg" class="easyui-datagrid" style="height:100%;"
       data-options="toolbar:'#toolbar', rownumbers:true, fitColumns:true, singleSelect:true, border:false, pagination:true,pageSize:20"
       url="search">
    <thead>
    <tr>
        <th field="companyName">企业名称</th>
        <th field="fileNum">文件数量</th>
        <th field="createTime" formatter="UIFormatter.DateTime">提交时间</th>
        <th field="auditTime" formatter="UIFormatter.DateTime">审核时间</th>
      <%--  <th data-options="field:'companyId',align:'center',formatter:formatOperateColumn">操作</th>--%>
    </tr>
    </thead>
</table>
</body>
<script>
    var ctx = '${ctx}';
</script>
</html>
