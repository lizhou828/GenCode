<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.preview-img{width: 100px;height: 100px;display: table-cell;text-align: center;vertical-align: middle;}
	.preview-img img {max-width: 100%;}
</style>
<form id="frmInput">
	<input type="hidden" name="id" value="${obj.id}"/>
	<table class="jhui-tableHighlight" title="UKey申请信息">
		<tr>
			<th>证书类型:</th>
			<td>
				<c:if test="${obj.type eq 1}">新发</c:if>
				<c:if test="${obj.type eq 2}">遗失补发</c:if>
				<c:if test="${obj.type eq 3}">注销</c:if>
			</td>
		</tr>
		<tr>
			<th>公司名称:</th>
			<td>${obj.companyName}</td>
		</tr>
		<tr>
			<th>营业执照:</th>
			<td>
				<a href="${obj.businessLicense}" class="preview-img" target="_blank">
					<c:if test="${not empty obj.businessLicense}"><img src="" onerror="getDefaultThumbnail('${obj.businessLicense}',this)"></c:if></a>
			</td>
		</tr>
		<tr>
			<th>经办人:</th>
			<td>
				${obj.agentName}
			</td>
		</tr>
		<tr>
			<th>身份证号码:</th>
			<td>${obj.idCardNumber}</td>
		<tr>
			<th>身份证附件:</th>
			<td>
				<c:set var="idCard" value="${obj.idCardFile}" />
				<c:forEach items="${fn:split(idCard,',')}" var="item" begin="0"
						   end="${fn:length(fn:split(idCard,','))}" varStatus="stat">
					<a href="${item}" class="preview-img" target="_blank">
						<c:if test="${not empty item}"><img src="" onerror="getDefaultThumbnail('${item}',this)"></c:if></a>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>手机号码:</th>
			<td>
				${obj.mobilePhone}
			</td>
		</tr>

		<tr>
			<th>邮寄地址:</th>
			<td>${area}-${obj.mailAddress}</td>
		</tr>
		<tr>
			<th>邮寄联系人:</th>
			<td>${obj.mailContacts}</td>
		</tr>
		<tr>
			<th>邮寄联系人电话:</th>
			<td>${obj.mailMobilePhone}</td>
		</tr>
		<c:set var="powerOfAttorney" value="${powerOfAttorney}" />
		<c:forEach items="${fn:split(powerOfAttorney,',')}" var="item" begin="0"
				   end="${fn:length(fn:split(powerOfAttorney,','))}" varStatus="stat">
			<tr>
				<th>企业委托书:</th>
				<td>
					<a href="${item}" class="preview-img" target="_blank">
						<c:if test="${not empty item}"><img src="" onerror="getDefaultThumbnail('${item}',this)"></c:if></a>
				</td>
			</tr>
		</c:forEach>
		<c:forEach items="${obj.companySeallist}" var="item" begin="0"
				   end="${fn:length(obj.companySeallist)}" varStatus="stat">
			<tr>
				<th>印章名称:</th>
				<td>${item.sealName}</td>
			</tr>
			<tr>
				<th>图片上传:</th>
				<td>
					<a href="${item.seal}" class="preview-img" target="_blank">
						<c:if test="${not empty item.seal}"><img src="" onerror="getDefaultThumbnail('${item.seal}',this)"></c:if></a>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${companyInvoice != null}">
			<tr>
				<th>发票信息</th>
				<td></td>
			</tr>
			<tr>
				<th>发票抬头：</th>
				<td>${companyInvoice.title}</td>
			</tr>
			<tr>
				<th>纳税人识别号：</th>
				<td>${companyInvoice.code}</td>
			</tr>
			<tr>
				<th>单位地址：</th>
				<td>${companyInvoice.address}</td>
			</tr>
			<tr>
				<th>电话号码：</th>
				<td>${companyInvoice.phoneNumber}</td>
			</tr>
			<tr>
				<th>开户银行：</th>
				<td>${companyInvoice.bankName}</td>
			</tr>
			<tr>
				<th>银行账号</th>
				<td>${companyInvoice.bankAccount}</td>
			</tr>
			<tr>
				<th>开票内容：</th>
				<td>${companyInvoice.content}</td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>
		</c:if>
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
			<td>${obj.checkRemark}</td>
		</tr>
	</table>
	</div>
</form>