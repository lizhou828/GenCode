<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: lier
  Date: 2017/11/20
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<table class="base-table mb-7">
    <thead>
    <tr>
        <th></th>
        <th>主题</th>
        <th>发送企业名称</th>
        <th>接收企业名称</th>
        <th>状态</th>
        <th>发送时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${page != null && fn:length(page.list) > 0}">
        <c:forEach items="${page.list}" var="task" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${task.title}</td>
                <td>${task.fromName}</td>
                <td>${task.toName}</td>
                <td>${task.statusTxt}</td>
                <td>${task.sendTimeStr}</td>
                <td>
                    <a href="${ctx}/task/detail?storeId=${task.id}" class="base-button blue">详情</a>
                </td>
            </tr>
            <c:if test="${task.productList != null && fn:length(task.productList) > 0}">
                 <tr>
                    <td colspan="7" class="text-left" style="padding: 0 0 0 96px;">
                        <table class="base-table" cellpadding="0" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>产品名称</th>
                                    <th>产品类型</th>
                                    <th>包装规格/型号</th>
                                    <th>生产厂家</th>
                                    <th>产品生产厂家档案</th>
                                </tr>
                            </thead>

                                <c:forEach items="${task.productList}" var="product" varStatus="productVarStatus">
                                    <tr>
                                        <td>${product.name}</td>
                                        <td>${product.typeStr}</td>
                                        <td>${product.packageSpec}</td>
                                        <td>${product.manufacturer}</td>
                                        <td>
                                            <c:if test="${product.manufacturerArchiveId != null}">
                                                <a href="${ctx}/archives/companyClient/task/showCompanyClientArchives?archiveId=${product.manufacturerArchiveId}" class="base-button blue">查看</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>

                        </table>
                    </td>
                </tr>
            </c:if>

        </c:forEach>
    </c:if>
    </tbody>
</table>
<!-- 分页 -->
<c:if test="${page != null && page.totalOfPage > 1}">
    <c:import url="page-bar.jsp"></c:import>
</c:if>
