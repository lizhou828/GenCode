<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.preview-img{width: 100px;height: 100px;display: table-cell;text-align: center;vertical-align: middle;}
	.preview-img img {max-width: 100%;}
</style>
<form id="frmInput" action="editSave" method="post">
	<input type="hidden" name="id" value="${obj.id}"/>
	<input type="hidden" name="auditor" value="${sessionScope.id}"/>
	<input type="hidden" name="modifier" value="${sessionScope.id}"/>
	<input type="hidden" name="companyId" value="${obj.companyId}"/>
	<table class="jhui-tableHighlight">
		<tr>
			<th>企业名称:</th>
			<td>${obj.companyName}</td>
		</tr>
		<tr>
			<th>印章名称:</th>
			<td>${obj.sealName}</td>
		</tr>
		<tr>
			<th>图片:</th>
			<td><a href="${obj.seal}" class="preview-img" target="_blank">
				<c:if test="${not empty obj.seal}"><img src="" onerror="getDefaultThumbnail('${obj.seal}',this)"></c:if></a></td>
		</tr>
		<tr>
			<th>审核结果:</th>
			<td>
				<input name="status" type="radio" class="easyui-validatebox" value="1" checked="checked" />审核通过
				<input name="status" type="radio" class="easyui-validatebox" value="2"/>审核不通过
			</td>
		</tr>
		<tr>
			<th>审核理由:</th>
			<td colspan="3">
				<input type="text" name="auditRemark" class="easyui-textbox" value="${obj.auditRemark}"/>
			</td>
		</tr>
	</table>
</form>