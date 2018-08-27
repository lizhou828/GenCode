<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form id="frmInput" action="updatePassword" method="post">
	<input type="hidden" name="id" value="${id}"/>
	<table class="jhui-tableHighlight">
		<tr>
			<th>用户名:</th>
			<td>${account}</td>
		</tr>
		<tr>
			<th>*原密码:</th>
			<td><input type="text" name="oldPassword" class="easyui-textbox" required="true"/></td>
		</tr>
		<tr>
			<th>*新密码:</th>
			<td><input type="text" name="password"  class="easyui-textbox" required="true"/></td>
		</tr>
		<tr>
			<th>*确认新密码:</th>
			<td><input type="text" class="easyui-textbox" required="true"/></td>
		</tr>
	</table>
</form>
