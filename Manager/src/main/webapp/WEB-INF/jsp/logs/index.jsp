<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<%@ include file="../common/easyui.jsp"%>
	<script type="text/javascript" src="${ctx}/js/logs/index.js?v=${resourceVersion}"></script>
</head>
<body class="easyui-layout" data-options="region:'center',border:false">
	<div id="toolbar" class="jhui-toolbar">
		<div class="easyui-panel jhui-toolbar-header">
			<div class="functions">
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
						<th style="width:40px;">用户名</th>
						<td> <input type="text" name="operatorName" class="easyui-textbox"/></td>
						<th style="width:40px;">业务名</th>
						<td> <input type="text" name="businessName" class="easyui-textbox"/></td>
						<th style="width:40px;">状态</th>
						<td>
							<select name="businessStatus">
								<option value="">--请选择--</option>
								<option value="1">成功</option>
								<option value="0">失败</option>
								<option value="2">异常</option>
							</select>
						</td>
						<th style="width:40px;">IP地址</th>
						<td> <input type="text" name="operatorIp" class="easyui-textbox"/></td>
						<th style="width:40px;">查询时间段</th>
						<td>
							<input class="easyui-datebox" name="startCreateDate" type="text"/>-<input class="easyui-datebox" name="endCreateDate" type="text"/>
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
					<th field="id" hidden></th>
					<th field="operatorType" formatter="operatorTypeFormatter">角色</th>
					<th field="operatorName">用户名</th>
					<th field="businessName">业务名</th>
					<th field="businessStatus" formatter="businessStatusFormatter">状态</th>
					<th field="businessRemarks">备注</th>
					<th field="timeCountDesc" align='left'>耗时</th>
					<th field="operatorIp">IP</th>
					<th field="description">描述</th>
					<th field="createDate" formatter="UIFormatter.DateTime">操作时间</th>



					<%--<th field="status" width="4%" halign='center' align='center' formatter="formatStatus">状态</th>--%>
					<%--<th field="title" formatter="titleByStatus">摘要</th>--%>
					<%--<th field="createTime" formatter="UIFormatter.DateTime">日期</th>--%>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script>

	function operatorTypeFormatter(value){
		if(value==1){
			return "管理员";
		}else if(value==2){
			return "用户";
		}
		return "其他";
	}

	function businessStatusFormatter(value){
		if(value==1){
			return "成功";
		}else if(value==2){
			return "异常";
		}
		return "失败";
	}
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
