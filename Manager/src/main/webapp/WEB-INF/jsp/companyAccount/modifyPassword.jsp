<%--
  Created by IntelliJ IDEA.
  User: lizhou
  Date & Time: 2018年01月25日 11时08分
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .preview-img{width: 100px;height: 100px;display: table-cell;text-align: center;vertical-align: middle;}
    .preview-img img {max-width: 100%;}
</style>
<form id="frmInput" action="modifyPassword" method="post">
    <input hidden name="id" value="${obj.id}">
    <table class="jhui-tableHighlight">
        <tr>
            <th>企业名称:</th>
            <td>${obj.companyName}</td>
        </tr>
        <tr>
            <th>账号：</th>
            <td><input width="350px" type="text" name="account" value="${user.account}" /></td>
        </tr>
        <tr>
            <th>新密码：</th>
            <td><input width="350px" type="text" name="password" value="" /></td>
        </tr>
    </table>

</form>