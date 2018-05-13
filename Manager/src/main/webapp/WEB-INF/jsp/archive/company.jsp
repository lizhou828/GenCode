<%--
企业列表
  Created by IntelliJ IDEA.
  User: TonyZeng
  Date: 2017/11/28
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>电子资料交换平台-运营端</title>
    <jsp:include page="../common/easyui.jsp"/>
</head>
<body class="easyui-layout" data-options="region:'center',border:false">
<div id="p" class="easyui-panel" title="企业名称：${company.data.companyName}" style="width:100%;height:100%;padding:0px;">
    <div id="easyuiTabsArchiveList" class="easyui-tabs" style="width:100%;height:750px">
        <%--企业档案--%>
        <div title="企业档案">
            <table id="dg" style="height: 100%" hidden="hidden" class="easyui-datagrid"
                   data-options="rownumbers:true,singleSelect:true,autoRowHeight:false,pagination:true,pageSize:20"
                   url="/archive/company/company/search?companyId=${companyId}">
                <thead>
                <tr>
                    <th field="name">文件名称</th>
                    <th field="expiredDate">有效期至</th>
                    <th field="modifyTime">归档时间</th>
                    <th data-options="field:'images',align:'center',formatter:formatColumnOfCompany">操作</th>
                </tr>
                </thead>
            </table>
        </div>
        <%--商品档案--%>
        <div title="商品档案">
            <jsp:include page="goods.jsp">
                <jsp:param name="companyId" value="${companyId}"/>
            </jsp:include>
        </div>
        <%--客户资料档案--%>
        <div title="客户资料档案">
            <jsp:include page="customer.jsp">
                <jsp:param name="companyId" value="${companyId}"/>
            </jsp:include>
        </div>
        <%--人员档案--%>
        <div title="人员档案">
            <jsp:include page="employ.jsp">
                <jsp:param name="companyId" value="${companyId}"/>
            </jsp:include>
        </div>
        <%--合同/协议--%>
        <div title="合同/协议">
            <jsp:include page="contract.jsp">
                <jsp:param name="companyId" value="${companyId}"/>
            </jsp:include>
        </div>
        <%--委托书--%>
        <%--<div title="委托书">--%>
            <%--<jsp:include page="powerOfAttorney.jsp">--%>
                <%--<jsp:param name="companyId" value="${companyId}"/>--%>
            <%--</jsp:include>--%>
        <%--</div>--%>
    </div>
</div>
<script>
    var ctx = '${ctx}';
    var companyId = '${companyId}';
</script>
<script src="${ctx}/js/archive/company.js?v=${resourceVersion}"></script>
</body>
</html>