<%--
  Created by IntelliJ IDEA.
  User: jiaxueyan
  Date & Time: 2018年04月20日 13时43分
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form id="frmInput" action="saveFreeTime" method="post">
    <input hidden name="id" value="${obj.id}">
    <input hidden name="serviceId" value="${companyService.id}">
    <table class="jhui-tableHighlight">
        <tr>
            <th>企业名称:</th>
            <td>${obj.companyName}</td>
        </tr>
        <tr>
            <th>免费时间</th>
            <td><input class="easyui-datetimebox" name="freeStartTime" type="text" value="<fmt:formatDate value="${companyService.freeStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
                --
                <input class="easyui-datetimebox" name="freeEndTime" type="text" value="<fmt:formatDate value="${companyService.freeEndTime}" pattern="yyyy-MM-dd HH:mm:ss" />"/></td>
        </tr>
    </table>

</form>