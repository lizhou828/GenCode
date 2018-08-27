<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"></c:set>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<%@ include file="../common/easyui.jsp"%>
	<script type="text/javascript" src="${ctx}/js/admin/index.js?v=${resourceVersion}"></script>
</head>
<body class="easyui-layout" data-options="region:'center',border:false">
		<div id="toolbar" class="jhui-toolbar">
			<div class="easyui-panel jhui-toolbar-header">
				<div class="functions">
					<a onclick="$.easyuiDialog.openSimple('新建', 'add', 900, 500, null)" data-options="group:'g2',plain:true,iconCls:'icon-add'" href="javascript:void(0);" class="easyui-linkbutton">新建</a>
					<a  onclick="$.dataGridOperation.toolHrefID('编辑','edit',  900, 500)" data-options="group:'g1',plain:true,iconCls:'icon-edit'" href="javascript:void(0);" class="easyui-linkbutton">编辑</a>
					<a  onclick="updatePassword()" data-options="group:'g1',plain:true,iconCls:'icon-lock'" href="javascript:void(0);" class="easyui-linkbutton">修改密码</a>
					<a onclick="onOffUse(0);" data-options="group:'g1',plain:true,iconCls:'icon-clear'" href="javascript:void(0);" class="easyui-linkbutton">禁用</a>
					<a onclick="onOffUse(1);" data-options="group:'g1',plain:true,iconCls:'icon-ok'" href="javascript:void(0);" class="easyui-linkbutton">启用</a>
					<a onclick="remove();" data-options="group:'g1',plain:true,iconCls:'icon-cancel'" href="javascript:void(0);" class="easyui-linkbutton">删除</a>
					<a onclick="$.dataGridOperation.toolReload()" data-options="group:'g1',plain:true,iconCls:'icon-reload'" href="javascript:void(0);" class="easyui-linkbutton">刷新</a>
				</div>
				<div class="search">
				</div>
			</div>
			<div class="easyui-panel" data-options="border:false" style="height:40px;">
				<form action="" id="searchForm">
					<table class="jhui-table">
						<tbody>
						<tr>
							<th style="width:60px;">用户名</th>
							<td> <input type="text" name="account" class="easyui-textbox" /></td>
							<th style="width:60px;">姓名:</th>
							<td><input type="text" name="name" class="easyui-textbox"/></td>
							<th style="width:60px;">角色</th>
							<td>
								<select name="roleId" class="easyui-combobox roleId">
									<option value="">--请选择--</option>
									<c:forEach items="${roles}" var="role">
										<option value="${role.id}">${role.name}</option>
									</c:forEach>
								</select>
							</td>
							<th style="width:60px;">状态</th>
							<td>
								<select name="status" class="easyui-combobox">
									<option value="">--请选择--</option>
									<option value="0" >禁用</option>
									<option value="1" >启用</option>
								</select>
							</td>
							<th style="width:60px;">创建日期</th>
							<td colspan="3">
								<input class="easyui-datebox" name="startDate" type="text" style="width:100px;"/> <input type="text" name="endDate" class="easyui-datebox" style="width:100px;"/>
							</td>
							<td  class="button">
								<a href="javascript:parameterSearch()" data-options="iconCls:'icon-search'"  class="easyui-linkbutton">搜索</a>
							</td>
						</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<div id="cc"  class="easyui-layout" style="height:100%;">
			<table id="dg" class="easyui-datagrid" style="height: 100%;"
				data-options="toolbar:'#toolbar', rownumbers:true, fitColumns:true, singleSelect:false, border:false, pagination:true,pageSize:20"
				url="search">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th field="id" hidden></th>
						<th field="account">用户名</th>
						<th field="name">姓名</th>
						<th field="phone">手机号</th>
						<th field="roleName">角色</th>
						<th field="type" formatter="formatType">帐号类型</th>
						<th field="status" formatter="formatStatus">状态</th>
						<th field="creatorAccount">创建人</th>
						<th field="createTime" formatter="UIFormatter.DateTime">创建时间</th>
					</tr>
				</thead>
			</table>
		</div>
</body>
</html>
