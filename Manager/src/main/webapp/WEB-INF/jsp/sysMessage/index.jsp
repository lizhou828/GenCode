<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<%@ include file="../common/easyui.jsp"%>
	<script type="text/javascript" src="${ctx}/js/sysMessage/index.js?v=${resourceVersion}"></script>
</head>
<body class="easyui-layout" data-options="region:'center',border:false">
	<div id="toolbar" class="jhui-toolbar">
		<div class="easyui-panel jhui-toolbar-header">
			<div class="functions">
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
						<th style="width:60px;">摘要</th>
						<td> <input type="text" name="name" class="easyui-textbox"/></td>
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
					<th field="status" width="4%" halign='center' align='center' formatter="formatStatus">状态</th>
					<th field="title" style="text-align: left;" formatter="titleByStatus">摘要</th>
					<th field="createTime" formatter="UIFormatter.DateTime">日期</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script>

	/* 根据状态 status 判断 title 样式 */
	function titleByStatus(value,row) {
	    if(row.status==0){
	        return "<sapn style='font-size: 14px;color: #c9302c'>"+value+"</sapn>";
		}else{
	        return value;
		}
    }

    /* 状态 */
    function formatStatus(value) {
		if(value==0){
		    return "未读";
		}
		return "已读";
    }

    //将未读数量清空
    $(function () {
        window.top.$("#messageRemind").html('');
    })

</script>
</html>
