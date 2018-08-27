<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<form id="frmInput" action="editSave" method="post">
	<input type="hidden" name="id" class="id" value="${productDict.id}"/>
	<table class="jhui-tableHighlight">
		<tr>
			<th>*批准文号:</th>
			<td>
				<input type="text" name="approvalNumber" value="${productDict.approvalNumber}" class="easyui-textbox" required="true" data-options="validType:'checkAppNumEdit'"/></td>
			<th>产品名称:</th>
			<td><input type="text" name="productName" value="${productDict.productName}" class="easyui-textbox"/></td>
		</tr>
		<tr>
			<th>商品名:</th>
			<td><input type="text" name="name" value="${productDict.name}"  class="easyui-textbox"/></td>
			<th>剂型:</th>
			<td><input type="text" name="dosageForm" value="${productDict.dosageForm}"  class="easyui-textbox"/></td>
		</tr>
		<tr>
			<th>含量规格:</th>
			<td><input type="text" name="spec" value="${productDict.spec}"  class="easyui-textbox"/></td>
			<th>生产企业:</th>
			<td><input type="text" name="manufacturer" value="${productDict.manufacturer}"  class="easyui-textbox"/></td>
		</tr>
		<tr>
			<th>生产地址:</th>
			<td><input type="text" name="manufacturerAddress" value="${productDict.manufacturerAddress}"  class="easyui-textbox"/></td>
			<th>注册日期:</th>
			<td><input type="text" name="registerDate" value="<fmt:formatDate value="${productDict.registerDate}" pattern="yyyy-MM-dd" />" class="easyui-datebox" /></td>
		</tr>
		<tr>
			<th>批准文号有效期至:</th>
			<td><input type="text" name="approvalValidityPeriod" value="<fmt:formatDate value="${productDict.approvalValidityPeriod}" pattern="yyyy-MM-dd" />"  class="easyui-datebox" /></td>
			<th>药品本位码:</th>
			<td><input type="text" name="drugStandardCode" value="${productDict.drugStandardCode}"  class="easyui-textbox drugStandardCode"/></td>
		</tr>
		<tr>
			<th>药品注册批件/药品注册证/再注册证/药品批件（含进口）:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="drugRegisterFile" class="filebox-input" data-name="drugRegisterFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list">
					<c:if test="${not empty productDict.drugRegisterFile}">
						<c:set var="drugRegisterFile" value="${productDict.drugRegisterFile}" />
						<c:forEach items="${fn:split(drugRegisterFile,',')}" var="item" begin="0"
								   end="${fn:length(fn:split(drugRegisterFile,','))}" varStatus="stat">
							<div class="file-item">
								<span class="file-fn">
									<a target="_blank" href="${item}">查看</a>
									<a class="file-remove" href="javascript:void(0);">删除</a>
								</span>
								 <span class="file-icon">
									 <input type="hidden" name="drugRegisterFile" value="${item}">
									 <img src="" onerror="getDefaultThumbnail('${item}',this)">
								</span>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</td>
		</tr>
		<tr>
			<th>药品注册批件/药品注册证/再注册证/药品批件（含进口）有效期:</th>
			<td colspan="3"><input type="text" name="drugRegisterPeriod" value="<fmt:formatDate value="${productDict.drugRegisterPeriod}" pattern="yyyy-MM-dd" />" class="easyui-datebox"/></td>
		</tr>
		<tr>
			<th>检验报告/进口检验检疫报告:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="checkReportFile" class="filebox-input" data-name="checkReportFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list">
					<c:if test="${not empty productDict.checkReportFile}">
						<c:set var="checkReportFile" value="${productDict.checkReportFile}" />
						<c:forEach items="${fn:split(checkReportFile,',')}" var="item" begin="0"
								   end="${fn:length(fn:split(checkReportFile,','))}" varStatus="stat">
							<div class="file-item">
								<span class="file-fn">
									<a target="_blank" href="${item}">查看</a>
									<a class="file-remove" href="javascript:void(0);">删除</a>
								</span>
								<span class="file-icon">
									 <input type="hidden" name="checkReportFile" value="${item}">
									 <img src="" onerror="getDefaultThumbnail('${item}',this)">
								</span>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</td>
		</tr>
		<tr>
			<th>检验报告/进口检验检疫报告有效期 :</th>
			<td colspan="3"><input type="text" name="checkReportPeriod" value="<fmt:formatDate value="${productDict.checkReportPeriod}" pattern="yyyy-MM-dd" />" class="easyui-datebox"/></td>
		</tr>
		<tr>
			<th>中文包装/标签/说明书 :</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="instructions" class="filebox-input" data-name="instructions" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list">
					<c:if test="${not empty productDict.instructions}">
						<c:set var="instructions" value="${productDict.instructions}" />
						<c:forEach items="${fn:split(instructions,',')}" var="item" begin="0"
								   end="${fn:length(fn:split(instructions,','))}" varStatus="stat">
							<div class="file-item">
								<span class="file-fn">
									<a target="_blank" href="${item}">查看</a>
									<a class="file-remove" href="javascript:void(0);">删除</a>
								</span>
								<span class="file-icon">
									 <input type="hidden" name="instructions" value="${item}">
									 <img src="" onerror="getDefaultThumbnail('${item}',this)">
								</span>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</td>
		</tr>
		<tr>
			<th>生物制品批签发合格证:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="biologicsCertificationFile" class="filebox-input" data-name="biologicsCertificationFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list">
					<c:if test="${not empty productDict.biologicsCertificationFile}">
						<c:set var="biologicsCertificationFile" value="${productDict.biologicsCertificationFile}" />
						<c:forEach items="${fn:split(biologicsCertificationFile,',')}" var="item" begin="0"
								   end="${fn:length(fn:split(biologicsCertificationFile,','))}" varStatus="stat">
							<div class="file-item">
								<span class="file-fn">
									<a target="_blank" href="${item}">查看</a>
									<a class="file-remove" href="javascript:void(0);">删除</a>
								</span>
								<span class="file-icon">
									 <input type="hidden" name="biologicsCertificationFile" value="${item}">
									  <img src="" onerror="getDefaultThumbnail('${item}',this)">
								</span>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</td>
		</tr>
		<tr>
			<th>生物制品批签发合格证有效期 :</th>
			<td colspan="3"><input type="text" name="biologicsCertificationPeriod" value="<fmt:formatDate value="${productDict.biologicsCertificationPeriod}" pattern="yyyy-MM-dd" />" class="easyui-datebox" /></td>
		</tr>
		<tr>
			<th>一致性评价证明文件:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="evaluationFile" class="filebox-input" data-name="evaluationFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list">
					<c:if test="${not empty productDict.evaluationFile}">
						<c:set var="evaluationFile" value="${productDict.evaluationFile}" />
						<c:forEach items="${fn:split(evaluationFile,',')}" var="item" begin="0"
								   end="${fn:length(fn:split(evaluationFile,','))}" varStatus="stat">
							<div class="file-item">
								<span class="file-fn">
									<a target="_blank" href="${item}">查看</a>
									<a class="file-remove" href="javascript:void(0);">删除</a>
								</span>
								<span class="file-icon">
									 <input type="hidden" name="evaluationFile" value="${item}">
									 <img src="" onerror="getDefaultThumbnail('${item}',this)">
								</span>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</td>
		</tr>
		<tr>
			<th>认证文件:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="authenticatedFile" class="filebox-input" data-name="authenticatedFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list">
					<c:if test="${not empty productDict.authenticatedFile}">
						<c:set var="authenticatedFile" value="${productDict.authenticatedFile}" />
						<c:forEach items="${fn:split(authenticatedFile,',')}" var="item" begin="0"
								   end="${fn:length(fn:split(authenticatedFile,','))}" varStatus="stat">
							<div class="file-item">
								<span class="file-fn">
									<a target="_blank" href="${item}">查看</a>
									<a class="file-remove" href="javascript:void(0);">删除</a>
								</span>
								<span class="file-icon">
									 <input type="hidden" name="authenticatedFile" value="${item}">
									 <img src="" onerror="getDefaultThumbnail('${item}',this)">
								</span>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</td>
		</tr>
		<tr>
			<th>新药证书:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="newDrugCertificationFile" class="filebox-input" data-name="newDrugCertificationFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list">
					<c:if test="${not empty productDict.newDrugCertificationFile}">
						<c:set var="newDrugCertificationFile" value="${productDict.newDrugCertificationFile}" />
						<c:forEach items="${fn:split(newDrugCertificationFile,',')}" var="item" begin="0"
								   end="${fn:length(fn:split(newDrugCertificationFile,','))}" varStatus="stat">
							<div class="file-item">
								<span class="file-fn">
									<a target="_blank" href="${item}">查看</a>
									<a class="file-remove" href="javascript:void(0);">删除</a>
								</span>
								<span class="file-icon">
									 <input type="hidden" name="newDrugCertificationFile" value="${item}">
									  <img src="" onerror="getDefaultThumbnail('${item}',this)">
								</span>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</td>
		</tr>
		<tr>
			<th>新药证书有效期:</th>
			<td><input type="text" name="newDrugCertificationPeriod" value="<fmt:formatDate value="${productDict.newDrugCertificationPeriod}" pattern="yyyy-MM-dd" />" class="easyui-datebox" /></td>
		</tr>
		<tr>
			<th>中药保密处方证书:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="chinesePrescriptionFile" class="filebox-input" data-name="chinesePrescriptionFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list">
					<c:if test="${not empty productDict.chinesePrescriptionFile}">
						<c:set var="chinesePrescriptionFile" value="${productDict.chinesePrescriptionFile}" />
						<c:forEach items="${fn:split(chinesePrescriptionFile,',')}" var="item" begin="0"
								   end="${fn:length(fn:split(chinesePrescriptionFile,','))}" varStatus="stat">
							<div class="file-item">
								<span class="file-fn">
									<a target="_blank" href="${item}">查看</a>
									<a class="file-remove" href="javascript:void(0);">删除</a>
								</span>
								<span class="file-icon">
									 <input type="hidden" name="chinesePrescriptionFile" value="${item}">
									 <img src="" onerror="getDefaultThumbnail('${item}',this)">
								</span>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</td>
		</tr>
		<tr>
			<th>中药保密处方证书有效期:</th>
			<td colspan="3"><input type="text" name="chinesePrescriptionPeriod" value="<fmt:formatDate value="${productDict.chinesePrescriptionPeriod}" pattern="yyyy-MM-dd" />" class="easyui-datebox"/></td>
		</tr>
		<tr>
			<th>其他附件:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="otherFile" class="filebox-input" data-name="otherFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list">
					<c:if test="${not empty productDict.otherFile}">
						<c:set var="otherFile" value="${productDict.otherFile}" />
						<c:forEach items="${fn:split(otherFile,',')}" var="item" begin="0"
								   end="${fn:length(fn:split(otherFile,','))}" varStatus="stat">
							<div class="file-item">
								<span class="file-fn">
									<a target="_blank" href="${item}">查看</a>
									<a class="file-remove" href="javascript:void(0);">删除</a>
								</span>
								<span class="file-icon">
									 <input type="hidden" name="otherFile" value="${item}">
									 <img src="" onerror="getDefaultThumbnail('${item}',this)">
								</span>
							</div>
						</c:forEach>
					</c:if>
				</div>
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
<script>
    $('.file-upload').fileupload();
</script>
