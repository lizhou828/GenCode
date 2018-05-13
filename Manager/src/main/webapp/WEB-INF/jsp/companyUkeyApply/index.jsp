<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<%@ include file="../common/easyui.jsp"%>
	<script type="text/javascript" src="${ctx}/js/companyUkeyApply/index.js?v=${resourceVersion}"></script>
</head>
<body class="easyui-layout" data-options="region:'center',border:false">
	<div id="toolbar" class="jhui-toolbar">
		<div class="easyui-panel jhui-toolbar-header">
			<div class="functions">
				<a  id="editBtn" data-options="group:'g2',plain:true,iconCls:'icon-edit'" href="javascript:void(0);" class="easyui-linkbutton">审核</a>
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
						<td><input class="easyui-textbox" name="companyName" type="text"/></td>
						<th>审核人</th>
						<td><input class="easyui-textbox" name="audi" type="text"/></td>
						<th>状态</th>
						<td>
							<select name="status" class="easyui-combobox">
								<option value="">--请选择--</option>
								<option value="0" >待审核</option>
								<option value="1" >审核通过</option>
								<option value="2" >审核未通过</option>
							</select>
						</td>
						<td rowspan="2" class="button">
							<a onclick="parameterSearch()" href="javascript:void(0);" class="easyui-linkbutton"
							   data-options="group:'g2',plain:true,iconCls:'icon-search'">搜索</a>
						</td>
					</tr>
					<tr>
						<th>审核时间</th>
						<td><input class="easyui-datebox" name="startAuditTime" type="text"/>
							--
							<input class="easyui-datebox" name="endAuditTime" type="text"/></td>
						<th>提交时间</th>
						<td><input class="easyui-datebox" name="startCreateTime" type="text"/>
							--
							<input class="easyui-datebox" name="endCreateTime" type="text"/></td>
					</tr>
					</tbody>
				</table>
			</form>
        </div>
    </div>
	<table id="dg" class="easyui-datagrid" style="height:100%;"
       	data-options="toolbar:'#toolbar', rownumbers:true, fitColumns:true, singleSelect:true, border:false, pagination:true,pageSize:20"
       	url="search.shtml">
        <thead>
            <tr>
				<th field="companyName">企业名称</th>
				<th field="type" formatter="formatType">类型</th>
				<th field="createTime" formatter="UIFormatter.DateTime">提交时间</th>
				<th field="status" formatter="formatStatus">状态</th>
				<th field="audi">审核人</th>
				<th field="checkTime" formatter="UIFormatter.DateTime">审核时间</th>
            </tr>
        </thead>
    </table>
</body>
</html>
