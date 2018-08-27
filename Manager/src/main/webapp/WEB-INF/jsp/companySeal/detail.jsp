<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.preview-img{width: 100px;height: 100px;display: table-cell;text-align: center;vertical-align: middle;}
	.preview-img img {max-width: 100%;}
</style>
<form id="frmInput">
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
				<c:if test="${obj.status eq 0}">待审核</c:if>
				<c:if test="${obj.status eq 1}">审核通过</c:if>
				<c:if test="${obj.status eq 2}">审核不通过</c:if>
			</td>
		</tr>
		<tr>
			<th>审核理由:</th>
			<td>${obj.auditRemark}</td>
		</tr>
	</table>
</form>