<%--
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
    <jsp:include page="../../common/easyui.jsp"/>
</head>
<body class="easyui-layout" data-options="region:'center',border:false">
<%--工具栏--%>
<div class="jhui-toolbar">
    <div class="easyui-panel jhui-toolbar-header">
        <select id="statusSelect" class="easyui-combobox" panelHeight="auto">
            <option value="-9">全部</option>
            <option value="0">待审核</option>
            <option value="1">审核通过</option>
            <option value="2">审核拒绝</option>
        </select>
        <a href="#" class="easyui-linkbutton" iconCls="icon-search"
           onclick="searchData()">查询</a>
    </div>
</div>
<div id="p" class="easyui-panel" title="" style="width:100%;height:100%;padding:0px;">
    <div id="easyuiTabsArchiveList" class="easyui-tabs" style="width:100%;height: 100%">
        <%--商品档案--%>
        <div title="企业档案" style="height: 100%">
            <jsp:include page="partial/list.jsp">
                <jsp:param name="archiveType" value="company"/>
                <jsp:param name="formatterName" value="formatOperateColumnOfCompany"/>
            </jsp:include>
        </div>
        <%--商品档案--%>
        <div title="商品档案" style="height: 100%">
            <jsp:include page="partial/list.jsp">
                <jsp:param name="archiveType" value="goods"/>
                <jsp:param name="formatterName" value="formatOperateColumnOfGoods"/>
            </jsp:include>
        </div>
        <%--客户资料档案--%>
        <div title="客户资料档案" style="height: 100%">
            <jsp:include page="partial/list.jsp">
                <jsp:param name="archiveType" value="customer"/>
                <jsp:param name="formatterName" value="formatOperateColumnOfCustomer"/>
            </jsp:include>
        </div>
        <%--人员档案--%>
        <div title="人员档案" style="height: 100%">
            <jsp:include page="partial/list.jsp">
                <jsp:param name="archiveType" value="employ"/>
                <jsp:param name="formatterName" value="formatOperateColumnOfEmploy"/>
            </jsp:include>
        </div>
        <%--合同/协议--%>
        <div title="合同/协议" style="height: 100%">
            <jsp:include page="partial/list.jsp">
                <jsp:param name="archiveType" value="contract"/>
                <jsp:param name="formatterName" value="formatOperateColumnOfContract"/>
            </jsp:include>
        </div>
        <%--委托书--%>
        <%--<div title="委托书" style="height: 100%">--%>
            <%--<jsp:include page="partial/list.jsp">--%>
                <%--<jsp:param name="archiveType" value="powerOfAttorney"/>--%>
                <%--<jsp:param name="formatterName" value="formatOperateColumnOfPowerOfAttorney"/>--%>
            <%--</jsp:include>--%>
        <%--</div>--%>
    </div>
</div>
<script>
    var ctx = '${ctx}';
</script>
<script src="/js/company/archiveAudit/index.js?v=${resourceVersion}"></script>
</body>
</html>