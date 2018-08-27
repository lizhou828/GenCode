<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="frmInput" action="addSave" method="post">
	<table class="jhui-tableHighlight">
		<tr>
			<th>*用户名:</th>
			<td><input type="text" name="account" class="easyui-textbox" required="true"/></td>
			<th>*密码:</th>
			<td><input type="text" name="password" class="easyui-textbox" required="true"/></td>
		</tr>
		<tr>
			<th>*姓名:</th>
			<td><input type="text" name="name" class="easyui-textbox" required="true"/></td>
			<th>*手机号:</th>
			<td><input type="text" name="phone" class="easyui-textbox" required="true"/></td>
		</tr>
		<tr>
			<th>*状态:</th>
			<td>
				<input name="status" type="radio" class="easyui-validatebox" value="1" checked="checked" />启用
				<input name="status" type="radio" class="easyui-validatebox" value="0"/>禁用
			</td>
			<th>*角色:</th>
			<td>
				<select  name="roleId" class="easyui-combobox" required="true" style="width: 80px">
					<c:forEach items="${roles}" var="role">
						<option value="${role.id}">${role.name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>*帐号类型:</th>
			<td>
				<select  name="type" class="easyui-combobox" required="true" style="width: 100px">
					<option value="0">运营账户</option>
					<option value="1">监管账户</option>
				</select>
			</td>
		</tr>
	</table>
</form>