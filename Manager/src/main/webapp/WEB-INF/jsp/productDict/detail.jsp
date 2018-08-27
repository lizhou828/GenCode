<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	.preview-img{width: 100px;height: 100px;display: table-cell;text-align: center;vertical-align: middle;}
	.preview-img img {max-width: 100%;}
</style>
<form id="frmInput">
	<table class="jhui-tableHighlight">
		<tr>
			<th>批准文号:</th>
			<td width="60%" colspan="3">${productDict.approvalNumber}</td>
		</tr>
		<tr>
			<th>产品名称:</th>
			<td colspan="3">${productDict.productName}</td>
		</tr>
		<tr>
			<th>商品名:</th>
			<td colspan="3">${productDict.name}</td>
		</tr>
		<tr>
			<th>剂型:</th>
			<td colspan="3">${productDict.dosageForm}</td>
		</tr>
		<tr>
			<th>含量规格:</th>
			<td colspan="3">${productDict.spec}</td>
		</tr>
		<tr>
			<th>生产企业:</th>
			<td colspan="3">${productDict.manufacturer}</td>
		</tr>
		<tr>
			<th>生产地址:</th>
			<td colspan="3">${productDict.manufacturerAddress}</td>
		</tr>
		<tr>
			<th>注册日期:</th>
			<td colspan="3"><fmt:formatDate value="${productDict.registerDate}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>批准文号有效期至:</th>
			<td colspan="3"><fmt:formatDate value="${productDict.approvalValidityPeriod}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>药品本位码:</th>
			<td colspan="3">${productDict.drugStandardCode}</td>
		</tr>
		<tr>
			<th>药品注册批件/药品注册证/再注册证/药品批件（含进口）:</th>
			<td colspan="3">
				<c:if test="${not empty productDict.drugRegisterFile}">
					<c:set var="drugRegisterFile" value="${productDict.drugRegisterFile}" />
					<c:forEach items="${fn:split(drugRegisterFile,',')}" var="item" begin="0"
							   end="${fn:length(fn:split(drugRegisterFile,','))}" varStatus="stat">
						<a href="${item}" class="preview-img" target="_blank">
							<c:if test="${not empty item}"><img src="" onerror="getDefaultThumbnail('${item}',this)"></c:if></a>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>药品注册批件/药品注册证/再注册证/药品批件（含进口）有效期:</th>
			<td colspan="3"><fmt:formatDate value="${productDict.drugRegisterPeriod}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>检验报告/进口检验检疫报告:</th>
			<td colspan="3">
				<c:if test="${not empty productDict.checkReportFile}">
					<c:set var="checkReportFile" value="${productDict.checkReportFile}" />
					<c:forEach items="${fn:split(checkReportFile,',')}" var="item" begin="0"
							   end="${fn:length(fn:split(checkReportFile,','))}" varStatus="stat">
						<a href="${item}" class="preview-img" target="_blank">
							<c:if test="${not empty item}"><img src="" onerror="getDefaultThumbnail('${item}',this)"></c:if></a>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>检验报告/进口检验检疫报告有效期 :</th>
			<td colspan="3"><fmt:formatDate value="${productDict.checkReportPeriod}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>中文包装/标签/说明书 :</th>
			<td colspan="3">
				<c:if test="${not empty productDict.instructions}">
					<c:set var="instructions" value="${productDict.instructions}" />
					<c:forEach items="${fn:split(instructions,',')}" var="item" begin="0"
							   end="${fn:length(fn:split(instructions,','))}" varStatus="stat">
						<a href="${item}" class="preview-img" target="_blank">
							<c:if test="${not empty item}"><img src="" onerror="getDefaultThumbnail('${item}',this)"></c:if></a>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>生物制品批签发合格证:</th>
			<td colspan="3">
				<c:if test="${not empty productDict.biologicsCertificationFile}">
					<c:set var="biologicsCertificationFile" value="${productDict.biologicsCertificationFile}" />
					<c:forEach items="${fn:split(biologicsCertificationFile,',')}" var="item" begin="0"
							   end="${fn:length(fn:split(biologicsCertificationFile,','))}" varStatus="stat">
						<a href="${item}" class="preview-img" target="_blank">
							<c:if test="${not empty item}"><img src="" onerror="getDefaultThumbnail('${item}',this)"></c:if></a>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>生物制品批签发合格证有效期 :</th>
			<td colspan="3"><fmt:formatDate value="${productDict.biologicsCertificationPeriod}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>一致性评价证明文件:</th>
			<td colspan="3">
				<c:if test="${not empty productDict.evaluationFile}">
					<c:set var="evaluationFile" value="${productDict.evaluationFile}" />
					<c:forEach items="${fn:split(evaluationFile,',')}" var="item" begin="0"
							   end="${fn:length(fn:split(evaluationFile,','))}" varStatus="stat">
						<a href="${item}" class="preview-img" target="_blank">
							<c:if test="${not empty item}"><img src="" onerror="getDefaultThumbnail('${item}',this)"></c:if></a>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>认证文件:</th>
			<td colspan="3">
				<c:if test="${not empty productDict.authenticatedFile}">
					<c:set var="authenticatedFile" value="${productDict.authenticatedFile}" />
					<c:forEach items="${fn:split(authenticatedFile,',')}" var="item" begin="0"
							   end="${fn:length(fn:split(authenticatedFile,','))}" varStatus="stat">
						<a href="${item}" class="preview-img" target="_blank">
							<c:if test="${not empty item}"><img src="" onerror="getDefaultThumbnail('${item}',this)"></c:if></a>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>新药证书:</th>
			<td colspan="3">
				<c:if test="${not empty productDict.newDrugCertificationFile}">
					<c:set var="newDrugCertificationFile" value="${productDict.newDrugCertificationFile}" />
					<c:forEach items="${fn:split(newDrugCertificationFile,',')}" var="item" begin="0"
							   end="${fn:length(fn:split(newDrugCertificationFile,','))}" varStatus="stat">
						<a href="${item}" class="preview-img" target="_blank">
							<c:if test="${not empty item}"><img src="" onerror="getDefaultThumbnail('${item}',this)"></c:if></a>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>新药证书有效期:</th>
			<td colspan="3"><fmt:formatDate value="${productDict.newDrugCertificationPeriod}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>中药保密处方证书:</th>
			<td colspan="3">
				<c:if test="${not empty productDict.chinesePrescriptionFile}">
					<c:set var="chinesePrescriptionFile" value="${productDict.chinesePrescriptionFile}" />
					<c:forEach items="${fn:split(chinesePrescriptionFile,',')}" var="item" begin="0"
							   end="${fn:length(fn:split(chinesePrescriptionFile,','))}" varStatus="stat">
						<a href="${item}" class="preview-img" target="_blank">
							<c:if test="${not empty item}"><img src="" onerror="getDefaultThumbnail('${item}',this)"></c:if></a>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>中药保密处方证书有效期:</th>
			<td colspan="3"><fmt:formatDate value="${productDict.chinesePrescriptionPeriod}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>其他附件:</th>
			<td colspan="3">
				<c:if test="${not empty productDict.otherFile}">
					<c:set var="otherFile" value="${productDict.otherFile}" />
					<c:forEach items="${fn:split(otherFile,',')}" var="item" begin="0"
							   end="${fn:length(fn:split(otherFile,','))}" varStatus="stat">
						<a href="${item}" class="preview-img" target="_blank">
							<c:if test="${not empty item}"><img src="" onerror="getDefaultThumbnail('${item}',this)"></c:if></a>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>*状态:</th>
			<td colspan="3">
				<input name="status" type="radio" class="easyui-validatebox" value="1" <c:if test="${productDict.status ==1}"> checked="checked"</c:if> />启用
				<input name="status" type="radio" class="easyui-validatebox" value="0" <c:if test="${productDict.status ==0}"> checked="checked"</c:if>/>禁用
			</td>
		</tr>
	</table>
</form>