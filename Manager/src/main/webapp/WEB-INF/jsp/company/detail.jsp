<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	.preview-img{width: 100px;height: 100px;display: table-cell;text-align: center;vertical-align: middle;}
	.preview-img img {max-width: 100%;}
</style>
<form id="frmInput">
	<input type="hidden" name="id" value="${obj.id}"/>
	<table class="jhui-tableHighlight" title="企业基本信息">
		<tr>
			<th>公司名称:</th>
			<td>${obj.companyName}</td>
		</tr>
		<tr>
			<th>公司类别:</th>
			<td>
				<c:if test="${obj.type eq 1}">生产企业</c:if>
				<c:if test="${obj.type eq 2}">批发企业及连锁总部</c:if>
				<c:if test="${obj.type eq 3}">零售门店</c:if>
				<c:if test="${obj.type eq 4}">医疗机构（含诊所、社区医院）</c:if>
			</td>
		</tr>
		<tr>
			<th>是否三证合一:</th>
			<td>
				<c:if test="${obj.unifiedLicense eq 1}">是</c:if>
				<c:if test="${obj.unifiedLicense eq 0}">否</c:if>
			</td>
		</tr>
		<tr>
			<th>统一社会信用代码/注册号:</th>
			<td>${obj.unifiedSocialCreditCode}</td>
		<tr>
			<th>营业执照电子版:</th>
			<td>
				<a href="${obj.businessLicense}" class="preview-img" target="_blank">
					<c:if test="${not empty obj.businessLicense}">
						<img src="" onerror="getDefaultThumbnail('${obj.businessLicense}',this)">
					</c:if>
				</a>
			</td>
		</tr>
		<tr>
			<th>营业执照有效期至:</th>
			<td>
				<c:choose>
					<c:when test="${not empty obj.businessLicenseValidityPeri}">
						<fmt:formatDate value="${obj.businessLicenseValidityPeri}" pattern="yyyy-MM-dd" />
					</c:when>
					<c:otherwise>长期有效</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<c:if test="${obj.unifiedLicense eq 0}">
			<tr>
				<th>组织机构代码证:</th>
				<td>${obj.organizationCode}</td>
			</tr>
			<tr>
				<th>组织机构代码证电子版:</th>
				<td>
					<a href="${obj.organizationCodeCertificate}" class="preview-img" target="_blank">
					<c:if test="${not empty obj.organizationCodeCertificate}">
							<img src="" onerror="getDefaultThumbnail('${obj.organizationCodeCertificate}',this)">
					</c:if>
					</a>
				</td>
			</tr>
			<tr>
				<th>组织机构代码证有效期至:</th>
				<td>
					<c:choose>
						<c:when test="${not empty obj.organizationCodeValidityPer}">
							<fmt:formatDate value="${obj.organizationCodeValidityPer}" pattern="yyyy-MM-dd" />
						</c:when>
						<c:otherwise>长期有效</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>税务登记证:</th>
				<td>${obj.taxRegistrationCode}</td>
			</tr>
			<tr>
				<th>税务登记证电子版:</th>
				<td>
					<a href="${obj.taxRegistrationCertificate}" class="preview-img" target="_blank">
						<c:if test="${not empty obj.taxRegistrationCertificate}">
							<img src="" onerror="getDefaultThumbnail('${obj.taxRegistrationCertificate}',this)">
						</c:if>
					</a>
				</td>
			</tr>
			<tr>
				<th>税务登记证有效期至:</th>
				<td>
					<c:choose>
						<c:when test="${not empty obj.taxRegistrationValidityPeri}">
							<fmt:formatDate value="${obj.taxRegistrationValidityPeri}" pattern="yyyy-MM-dd" />
						</c:when>
						<c:otherwise>长期有效</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:if>
		<tr>
			<th>所在地区:</th>
			<td>${area}-${obj.address}</td>
		</tr>
		<tr>
			<th>企业法人:</th>
			<td>${obj.legalPerson}</td>
		</tr>
		<tr>
			<th>注册资本:</th>
			<td>${obj.registeredCapital}万元</td>
		</tr>
		<tr>
			<th>开户银行:</th>
			<td>${obj.bank}</td>
		</tr>
		<tr>
			<th>银行账号:</th>
			<td>${obj.bankAccount}</td>
		</tr>
		<tr>
			<th>账户名:</th>
			<td>${obj.bankAccountName}</td>
		</tr>
		<c:if test="${not empty obj.bankPermit}">
		<tr>
			<th>开户许可证:</th>
			<td>
				<a href="${obj.bankPermit}" class="preview-img" target="_blank">
					<c:if test="${not empty obj.bankPermit}">
						<img src="" onerror="getDefaultThumbnail('${obj.bankPermit}',this)">
					</c:if>
				</a>
			</td>
		</tr>
		</c:if>
		<c:if test="${not empty obj.referralPhone}">
			<tr>
				<th>推荐人手机号码:</th>
				<td>${obj.referralPhone}</td>
			</tr>
		</c:if>
	</table>
	<div class="easyui-tabs" data-options="fit:true,plain:true,border:false">
		<div title="经办人信息">
			<table class="jhui-tableHighlight">
				<tr>
					<th>经办人姓名</th>
					<td>${obj.agentName }</td>
				</tr>
				<tr>
					<th>经办人手机号码</th>
					<td>${obj.phone }</td>
				</tr>
				<tr>
					<th>经办人固话</th>
					<td>${obj.landline }</td>
				</tr>
				<tr>
					<th>邮箱</th>
					<td>${obj.email }</td>
				</tr>
				<tr>
					<th>QQ</th>
					<td>${obj.qq }</td>
				</tr>
				<tr>
					<th>经办人身份证号码</th>
					<td>${obj.idCardNumber }</td>
				</tr>
				<tr>
					<th>经办人身份证扫描件</th>
					<td>
						<a href="${obj.idCardImageFront}" class="preview-img" target="_blank">
							<c:if test="${not empty obj.idCardImageFront}">
								<img src="" onerror="getDefaultThumbnail('${obj.idCardImageFront}',this)">
							</c:if>
						</a>
						<a href="${obj.idCardImageBack}" class="preview-img" target="_blank">
							<c:if test="${not empty obj.idCardImageBack}">
								<img src="" onerror="getDefaultThumbnail('${obj.idCardImageBack}',this)">
							</c:if>
						</a>
					</td>
				</tr>
				<tr>
					<th>身份证有效期至</th>
					<td>
						<c:choose>
							<c:when test="${not empty obj.idCardValidityPeriod}">
								<fmt:formatDate value="${obj.idCardValidityPeriod}" pattern="yyyy-MM-dd" />
							</c:when>
							<c:otherwise>长期有效</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>企业委托书</th>
					<td>
						<c:if test="${not empty obj.powerOfAttorney}">
							<c:set var="powerOfAttorney" value="${obj.powerOfAttorney}" />
							<c:forEach items="${fn:split(powerOfAttorney,',')}" var="item" begin="0"
									   end="${fn:length(fn:split(powerOfAttorney,','))}" varStatus="stat">
								<a href="${item}" class="preview-img" target="_blank">
									<c:if test="${not empty item}"><img src="" onerror="getDefaultThumbnail('${item}',this)"></c:if></a>
							</c:forEach>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>委托书有效期至</th>
					<td>
							<c:choose>
								<c:when test="${not empty obj.powerOfAttorneyValidityPer}">
									<fmt:formatDate value="${obj.powerOfAttorneyValidityPer}" pattern="yyyy-MM-dd" />
								</c:when>
							</c:choose>
					</td>
				</tr>
			</table>
		</div>
		<div title="审核信息">
			<table class="jhui-tableHighlight">
				<tr>
					<th>审核结果:</th>
					<td>
						<c:if test="${obj.status eq 0}">待提交</c:if>
						<c:if test="${obj.status eq 1}">待审核</c:if>
						<c:if test="${obj.status eq 2}">审核通过</c:if>
						<c:if test="${obj.status eq 3}">审核不通过</c:if>
					</td>
				</tr>
				<tr>
					<th>审核理由:</th>
					<td>${obj.auditRemark}</td>
				</tr>
			</table>
		</div>
	</div>
</form>