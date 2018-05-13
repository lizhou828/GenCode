<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form id="frmInput" action="editSave" method="post">
	<input type="hidden" name="id" class="id" value="${role.id}"/>
	<table class="jhui-tableHighlight">
		<tr>
			<th>*角色名称:</th>
			<td><input type="text" name="name" value="${role.name}" class="easyui-textbox" required="true" data-options="validType:'checkAppNumEdit'"/></td>
		</tr>
		<tr>
			<th>*状态:</th>
			<td>
				<input name="status" type="radio" class="easyui-validatebox" value="1" <c:if test="${role.status ==1}"> checked="checked"</c:if> />启用
				<input name="status" type="radio" class="easyui-validatebox" value="0" <c:if test="${role.status ==0}"> checked="checked"</c:if>/>禁用
			</td>
		</tr>
	</table>
</form>
