<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="frmInput" name="mainForm" action="" method="post"  enctype="multipart/form-data">
	<input type="hidden" id="url" value="batchSave"/>
	<table class="jhui-tableHighlight">
		<tr>
			<th>请选择文档:建议上传excl2003文档</th>
			<td colspan="2" >
				<input type="file" id="uploadFile" name="file" accept=".xlsx, .xls, .csv" />
			</td>
		</tr>
		<tr height="60">
			<th>上传进度：</th>
			<td>
				<div id="progressbar" class="easyui-progressbar" style="width:520px;height:35px;"></div>
			</td>
		</tr>
		<tr><td colspan="2"><a id="tempLoad" data-options="group:'g2',plain:true,iconCls:'icon-release'" href="/template/数据字典模板.xlsx" class="easyui-linkbutton">下载模板</a></td></tr>
		<tr><td colspan="2"><span style="color: red">
		温馨提示：<br/>
		*请先进行模板下载，再在该excel中进行数据字典批量新增！<br/>
		</span></td></tr>
	</table>
</form>
