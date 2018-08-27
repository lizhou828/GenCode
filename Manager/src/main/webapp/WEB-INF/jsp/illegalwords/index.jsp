<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<%@ include file="../common/easyui.jsp"%>
	<script type="text/javascript" src="${ctx}/js/illegalwords/index.js?v=${resourceVersion}"></script>
</head>
<body class="easyui-layout" data-options="region:'center',border:false">
	<div id="toolbar" class="jhui-toolbar">
		<div class="easyui-panel jhui-toolbar-header">
			<div class="functions">
				<a onclick="$.dataGridOperation.toolReload()" data-options="group:'g1',plain:true,iconCls:'icon-reload'" href="javascript:void(0);" class="easyui-linkbutton">刷新</a>
				<a onclick="flushCache()" data-options="group:'g1',plain:true,iconCls:'icon-reload'" href="javascript:void(0);" class="easyui-linkbutton">刷新ReDis缓存</a>
				<a onclick="$.easyuiDialog.openSimple('新增', 'add', 900, 500, null)" data-options="group:'g1',plain:true,iconCls:'icon-add'" href="javascript:void(0);" class="easyui-linkbutton">新增</a>
				<a  onclick="$.dataGridOperation.toolEdit('edit',  900, 500)" data-options="group:'g1',plain:true,iconCls:'icon-edit'" href="javascript:void(0);" class="easyui-linkbutton">编辑</a>
				<a onclick="_delete()" data-options="group:'g1',plain:true,iconCls:'icon-cancel'" href="javascript:void(0);" class="easyui-linkbutton">删除</a>
			</div>
			<div class="search">
			</div>
		</div>
		<div class="easyui-panel" data-options="border:false" style="height:40px;">
			<form action="" id="searchForm">
				<table class="jhui-table">
					<tbody>
					<tr>
						<th style="width:40px;">内容</th>
						<td> <input type="text" name="content" class="easyui-textbox"/></td>

						<th style="width:40px;">状态</th>
						<td>
							<select name="status">
								<option value="">--请选择--</option>
								<option value="1">开启</option>
								<option value="0">关闭</option>
							</select>
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
					<th field="content">内容</th>
					<th field="replaceChar">替换字符</th>
					<th field="status" formatter="statusFormatter">状态</th>
					<th field="creator">创建者</th>
					<th field="createDate" formatter="UIFormatter.DateTime">创建日期</th>
					<th field="modifier">修改者</th>
					<th field="modifyDate" formatter="UIFormatter.DateTime">修改日期</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script type="text/javascript">
	function statusFormatter(value){
		if(value==1){
			return "开启";
		}else if(value==0){
			return "关闭";
		}
		return "其他";
	}
</script>
</html>
