<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="frmInput" action="addSave" method="post">
	<table class="jhui-tableHighlight">
		<tr>
			<th>*批准文号:</th>
			<td><input type="text" name="approvalNumber" class="easyui-textbox" required="true" data-options="validType:'checkAppNumAdd'"/></td>
			<th>*产品名称:</th>
			<td><input type="text" name="productName" class="easyui-textbox" required="true"/></td>
		</tr>
		<tr>
			<th>商品名:</th>
			<td><input type="text" name="name" class="easyui-textbox"/></td>
			<th>剂型:</th>
			<td><input type="text" name="dosageForm" class="easyui-textbox"/></td>
		</tr>
		<tr>
			<th>含量规格:</th>
			<td><input type="text" name="spec" class="easyui-textbox"/></td>
			<th>*生产企业:</th>
			<td><input type="text" name="manufacturer" class="easyui-textbox" required="true"/></td>
		</tr>
		<tr>
			<th>生产地址:</th>
			<td><input type="text" name="manufacturerAddress" class="easyui-textbox"/></td>
			<th>注册日期:</th>
			<td><input type="text" name="registerDate" class="easyui-datebox" /></td>
		</tr>
		<tr>
			<th>批准文号有效期至:</th>
			<td><input type="text" name="approvalValidityPeriod" class="easyui-datebox" /></td>
			<th>药品本位码:</th>
			<td><input type="text" name="drugStandardCode" class="easyui-textbox"/></td>
		</tr>
		<tr>
			<th>药品注册批件/药品注册证/再注册证/药品批件（含进口）:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="drugRegisterFile" class="filebox-input" data-name="drugRegisterFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list"></div>
			</td>
		</tr>
		<tr>
			<th>药品注册批件/药品注册证/再注册证/药品批件（含进口）有效期:</th>
			<td colspan="3"><input type="text" name="drugRegisterPeriod" class="easyui-datebox"/></td>
		</tr>
		<tr>
			<th>检验报告/进口检验检疫报告:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="checkReportFile" class="filebox-input" data-name="checkReportFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list"></div>
			</td>
		</tr>
		<tr>
			<th>检验报告/进口检验检疫报告有效期 :</th>
			<td colspan="3"><input type="text" name="checkReportPeriod" class="easyui-datebox"/></td>
		</tr>
		<tr>
			<th>中文包装/标签/说明书 :</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="instructions" class="filebox-input" data-name="instructions" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list"></div>
			</td>
		</tr>
		<tr>
			<th>生物制品批签发合格证:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="biologicsCertificationFile" class="filebox-input" data-name="biologicsCertificationFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list"></div>
			</td>
		</tr>
		<tr>
			<th>生物制品批签发合格证有效期 :</th>
			<td colspan="3"><input type="text" name="biologicsCertificationPeriod" class="easyui-datebox" /></td>
		</tr>
		<tr>
			<th>一致性评价证明文件:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="evaluationFile" class="filebox-input" data-name="evaluationFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list"></div>
			</td>
		</tr>
		<tr>
			<th>认证文件:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="authenticatedFile" class="filebox-input" data-name="authenticatedFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list"></div>
			</td>
		</tr>
		<tr>
			<th>新药证书:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="newDrugCertificationFile" class="filebox-input" data-name="newDrugCertificationFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list"></div>
			</td>
		</tr>
		<tr>
			<th>新药证书有效期:</th>
			<td colspan="3"><input type="text" name="newDrugCertificationPeriod" class="easyui-datebox" /></td>
		</tr>
		<tr>
			<th>中药保密处方证书:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="chinesePrescriptionFile" class="filebox-input" data-name="chinesePrescriptionFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list"></div>
			</td>
		</tr>
		<tr>
			<th>中药保密处方证书有效期:</th>
			<td colspan="3"><input type="text" name="chinesePrescriptionPeriod" class="easyui-datebox"/></td>
		</tr>
		<tr>
			<th>其他附件:</th>
			<td colspan="3" class="file-upload">
				<div class="filebox-wrap"><input id="otherFile" class="filebox-input" data-name="otherFile" labelPosition="top" data-options="prompt:'请选择...'" style="width:100%"></div>
				<div class="file-list"></div>
			</td>
		</tr>
		<tr>
			<th>*状态:</th>
			<td colspan="3">
				<input name="status" type="radio" class="easyui-validatebox" value="1" checked="checked" />启用
				<input name="status" type="radio" class="easyui-validatebox" value="0"/>禁用
			</td>
		</tr>
	</table>
</form>
<script>
	$('.file-upload').fileupload();
</script>