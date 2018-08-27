<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="frmInput" action="addSave" method="post">
	<table class="jhui-tableHighlight">
		<tr>
			<th>*角色名称:</th>
			<td><input type="text" name="name" class="easyui-textbox" required="true"/></td>
		</tr>
		<tr>
			<th>*状态:</th>
			<td>
				<input name="status" type="radio" class="easyui-validatebox" value="1" checked="checked" />启用
				<input name="status" type="radio" class="easyui-validatebox" value="0"/>禁用
			</td>
		</tr>
	</table>
</form>