<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<%@ include file="../common/easyui.jsp"%>
	<script type="text/javascript" src="${ctx}/js/companyAccount/index.js?v=${resourceVersion}"></script>
</head>
<body class="easyui-layout" data-options="region:'center',border:false">
	<div id="toolbar" class="jhui-toolbar">
		<div class="easyui-panel jhui-toolbar-header">
			<div class="functions">
				<a  id="detailBtn" data-options="group:'g1',plain:true,iconCls:'icon-search'" href="javascript:void(0);" class="easyui-linkbutton">查看详情</a>
				<a onclick="updateStatus(0);" data-options="group:'g1',plain:true,iconCls:'icon-clear'" href="javascript:void(0);" class="easyui-linkbutton">禁用</a>
				<a onclick="updateStatus(1);" data-options="group:'g1',plain:true,iconCls:'icon-ok'" href="javascript:void(0);" class="easyui-linkbutton">启用</a>
				<a onclick="$.dataGridOperation.toolReload()" id="refreshBtn" data-options="group:'g1',plain:true,iconCls:'icon-reload'" href="javascript:void(0);" class="easyui-linkbutton">刷新</a>
				<a onclick="$.dataGridOperation.toolEdit('绑定UKey','bindUKey',  800, 300)"  data-options="group:'g1',plain:true,iconCls:'icon-edit'" href="javascript:void(0);" class="easyui-linkbutton">绑定UKey</a>
				<a onclick="$.dataGridOperation.toolEdit('设置免费时间','setFreeTime',  800, 300)"  data-options="group:'g1',plain:true,iconCls:'icon-edit'" href="javascript:void(0);" class="easyui-linkbutton">设置免费时间</a>
				<a onclick="$.dataGridOperation.toolEdit('登陆失败解锁','unlockLoginFailPage',  800, 300)"  data-options="group:'g1',plain:true,iconCls:'icon-edit'" href="javascript:void(0);" class="easyui-linkbutton">登陆失败解锁</a>
				<a onclick="$.dataGridOperation.toolEdit('重置密码','modifyPasswordPage',  800, 300)"  data-options="group:'g1',plain:true,iconCls:'icon-edit'" href="javascript:void(0);" class="easyui-linkbutton">重置密码</a>
				<a onclick="$.dataGridOperation.toolEdit('修改手机号','modifyPhonePage',  800, 300)"  data-options="group:'g1',plain:true,iconCls:'icon-edit'" href="javascript:void(0);" class="easyui-linkbutton">修改手机号</a>
			</div>
			<div class="search">
			</div>
		</div>		
        <div class="easyui-panel" data-options="border:false" style="height:97px">
        	<form action="" id="searchForm">
				<table class="jhui-table">
					<tbody>
					<tr>
						<th>企业名称</th>
						<td><input class="easyui-textbox" name="companyName" type="text"/></td>
						<th>用户名</th>
						<td><input class="easyui-textbox" name="account" type="text"/></td>
						<th>手机号码</th>
						<td><input class="easyui-textbox" name="phone" type="text"/></td>
						<td rowspan="3" class="button">
							<a onclick="parameterSearch()" href="javascript:void(0);" class="easyui-linkbutton"
							   data-options="group:'g2',plain:true,iconCls:'icon-search'">搜索</a>
						</td>
					</tr>
					<tr>
						<th>状态</th>
						<td>
							<select name="status" class="easyui-combobox">
								<option value="">--请选择--</option>
								<option value="0" >禁用</option>
								<option value="1" >启用</option>
							</select>
						</td>
						<th>推荐人企业名称</th>
						<td><input class="easyui-textbox" name="referralCompanyName" type="text"/></td>
						<th>创建时间</th>
						<td><input class="easyui-datebox" name="startCreateTime" type="text"/>
							--
							<input class="easyui-datebox" name="endCreateTime" type="text"/></td>
					</tr>
					<tr>
						<th>免费时间</th>
						<td><input class="easyui-datebox" name="startFreeTime" type="text"/>
							--
							<input class="easyui-datebox" name="endFreeTime" type="text"/></td>
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
				<th field="id" hidden></th>
				<th field="companyId" hidden></th>
				<th data-options="field:'ck',checkbox:true"></th>
				<th field="companyName">企业名称</th>
				<th field="account">用户名</th>
				<th field="phone">手机号码</th>
				<th field="status" formatter="formatStatus">状态</th>
				<th field="createTime" formatter="UIFormatter.DateTime">创建时间</th>
				<th field="referralCompanyName">推荐人企业名称</th>
				<th field="freeStartTime" formatter="UIFormatter.DateTime">免费开始时间</th>
				<th field="freeEndTime" formatter="UIFormatter.DateTime">免费结束时间</th>
            </tr>
        </thead>
    </table>
</body>
</html>
