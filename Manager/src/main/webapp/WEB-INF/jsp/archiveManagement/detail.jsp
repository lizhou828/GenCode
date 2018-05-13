<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/easyui.jsp"%>
<style>
    .preview-img{
        display: inline-block; margin: 6px 0; }
    .preview-img img {max-width: 100%;}
</style>
<form id="frmInput">
    <table class="jhui-tableHighlight" title="生产厂家档案">
        <tr>
            <th>产品生产厂家名称:</th>
            <td>${obj.companyName}</td>
        </tr>
        <c:if test="${not empty obj.details}">
        <c:set var="details" value="${ obj.details}" />
        <c:forEach items="${details}" var="item" begin="0"
                   end="${fn:length(details)}" varStatus="stat">
            <tr>
                <th style="width: 320px;">${item.detailName}</th>
                <td>
                            <a href="${item.archive}" class="preview-img" target="_blank">
                                <c:if test="${not empty item.archive}"><img height="32" src="" onerror="getDefaultThumbnail('${item.archive}',this)"></c:if></a>

                </td>

            </tr>
        </c:forEach>
        </c:if>
    </table>
</form>