<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form id="frmInput" action="editSave" method="post">
	<input type="hidden" name="id" class="id" value="${admin.id}"/>
	<table class="jhui-tableHighlight">
		<tr>
			<th>*用户名:</th>
			<td><input type="text" name="account" value="${admin.account}" class="easyui-textbox" required="true"/></td>
			<th>*姓名:</th>
			<td><input type="text" name="name" value="${admin.name}" class="easyui-textbox" required="true"/></td>
		</tr>
		<tr>
			<th>*手机号:</th>
			<td><input type="text" name="phone" value="${admin.phone}" class="easyui-textbox" required="true"/></td>
			<th>*状态:</th>
			<td>
				<input name="status" type="radio" class="easyui-validatebox" value="1" <c:if test="${admin.status == 1}">checked="checked"</c:if> />启用
				<input name="status" type="radio" class="easyui-validatebox" value="0" <c:if test="${admin.status == 0}">checked="checked"</c:if>/>禁用
			</td>
		</tr>
		<tr>
			<th>*角色:</th>
			<td>
				<select  name="roleId" class="easyui-combobox" required="true">
					<option value="${admin.roleId}">${admin.roleName}</option>
					<c:forEach items="${roles}" var="role">
						<option value="${role.id}">${role.name}</option>
					</c:forEach>
				</select>
			</td>
			<th>*帐号类型:</th>
			<td>
				<select  name="type" class="easyui-combobox" required="true" style="width: 100px">
					<option value="0" <c:if test="${admin.type == 0}">selected</c:if> >运营账户</option>
					<option value="1"<c:if test="${admin.type == 1}">selected</c:if>>监管账户</option>
				</select>
			</td>
		</tr>
	</table>
</form>
