<%--
  Created by IntelliJ IDEA.
  User: leroy
  Date: 2017/12/12
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page trimDirectiveWhitespaces="true" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<c:set var="ctx" value="${pageContext['request'].contextPath}"/>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<meta charset="UTF-8">--%>
    <%--<title>电子资料交换平台-运营端</title>--%>
    <%--<link rel="stylesheet" type="text/css" href="${ctx}/task/css/base.css?v=${resourceVersion}">--%>
    <%--<link rel="stylesheet" type="text/css" href="${ctx}/task/css/common.css?v=${resourceVersion}">--%>
    <%--<link rel="stylesheet" type="text/css" href="${ctx}/task/css/icon.css?v=${resourceVersion}">--%>
    <%--<link rel="stylesheet" type="text/css" href="${ctx}/task/css/task-launch.css?v=${resourceVersion}">--%>
    <%--<link rel="stylesheet" type="text/css" href="${ctx}/task/css/datepicker.min.css?v=${resourceVersion}">--%>
    <%--<link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_472974_oq9cg8xrmc3ul3di.css">--%>
    <%--<script type="text/javascript" src="${ctx}/js/common/json2.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="section-body">--%>
    <%--<!-- 筛选栏 -->--%>
    <%--<div class="filter-bar mb-5">--%>
        <%--主题:<input class="base-input"  type="text"  id="filter_title">--%>
        <%--发送方公司名称:<input class="base-input"  type="text"  id="filter_fromCompanyName">--%>
        <%--接收方公司名称:<input class="base-input"  type="text"  id="filter_toCompanyName">--%>
        <%--产品名称:<input class="base-input"  type="text"  id="filter_productName">--%>
    <%--</div>--%>
    <%--<div class="filter-bar mb-5">--%>
        <%--状态:<select class="base-select" id="filter_status">--%>
            <%--<option value="-9">状态</option>--%>
            <%--<option value="0">待发送</option>--%>
            <%--<option value="1">待接收</option>--%>
            <%--<option value="2">已接收</option>--%>
            <%--<option value="-1">已拒绝</option>--%>
        <%--</select>--%>
        <%--发送时间:<input class="base-input datepicker"  type="text"  data-toggle="datepicker"--%>
                   <%--id="filter_startTime">--%>
        <%--<span>-</span>--%>
        <%--<input class="base-input datepicker"  type="text"  data-toggle="datepicker"--%>
               <%--id="filter_endTime">--%>
        <%--<button type="button" class="base-button" onclick="loadData()">查询</button>--%>
        <%--<button class="toolbar-btn" type="button" onclick="loadData(1)"><i class="iconfont icon-shuaxin"></i>刷新</button>--%>
    <%--</div>--%>
    <%--<!-- table -->--%>
    <%--<div id="page_table_div">--%>

    <%--</div>--%>
<%--</div>--%>
<%--<script>--%>
    <%--var ctx = '${ctx}'--%>
<%--</script>--%>
<%--<script src="${ctx}/task/js/jquery.min.js"></script>--%>
<%--<script src="${ctx}/task/js/common.js?v=${resourceVersion}"></script>--%>
<%--<script src="${ctx}/task/js/datepicker.min.js"></script>--%>
<%--<script src="${ctx}/task/js/index.js?v=${resourceVersion}"></script>--%>
<%--<script src="${ctx}/task/js/page.js?v=${resourceVersion}"></script>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>电子资料交换平台-运营端</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/task/css/base.css?v=${resourceVersion}">
    <link rel="stylesheet" type="text/css" href="${ctx}/task/css/common.css?v=${resourceVersion}">
    <link rel="stylesheet" type="text/css" href="${ctx}/task/css/icon.css?v=${resourceVersion}">
    <link rel="stylesheet" type="text/css" href="${ctx}/task/css/task-launch.css?v=${resourceVersion}">
    <script type="text/javascript"  src="${ctx}/task/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/common/json2.js"></script>
    <%@ include file="../common/easyui.jsp"%>
</head>
<body>
<div  class="jhui-toolbar">
    <div class="easyui-panel jhui-toolbar-header">
        <div class="functions">
            <a onclick="loadData(1)" id="refreshBtn" data-options="group:'g1',plain:true,iconCls:'icon-reload'" href="javascript:void(0);" class="easyui-linkbutton">刷新</a>
        </div>
        <div class="search">
        </div>
    </div>
    <div class="easyui-panel" data-options="border:false" style="height:65px">
        <form action="" id="searchForm">
            <table class="jhui-table">
                <tbody>
                <tr>
                    <th>主题</th>
                    <td><input class="easyui-textbox" id="filter_title" type="text"/></td>
                    <th>发送方公司名称</th>
                    <td><input class="easyui-textbox" id="filter_fromCompanyName" type="text"/></td>
                    <th>接收方公司名称</th>
                    <td><input class="easyui-textbox" id="filter_toCompanyName" type="text"/></td>

                    <td rowspan="3" class="button">
                        <a onclick="loadData()" href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="group:'g2',plain:true,iconCls:'icon-search'">搜索</a>
                    </td>
                </tr>
                <tr>
                    <th>状态</th>
                    <td>
                        <select id="filter_status" class="easyui-combobox">
                            <option value="-9">状态</option>
                            <option value="0">待发送</option>
                            <option value="1">待接收</option>
                            <option value="2">已接收</option>
                            <option value="-1">已拒绝</option>
                        </select>
                    </td>
                    <th>产品名称</th>
                    <td><input class="easyui-textbox" id="filter_productName" type="text"/></td>
                    <th>发送时间</th>
                    <td>
                        <input class="easyui-datebox" id="filter_startTime" type="text"/>--<input class="easyui-datebox" id="filter_endTime" type="text"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>


    <div class="section-body" style="overflow-y:auto">
        <div id="page_table_div" >
        </div>
    </div>

</div>



<script src="${ctx}/task/js/common.js?v=${resourceVersion}"></script>
<script src="${ctx}/task/js/index.js?v=${resourceVersion}"></script>
<script src="${ctx}/task/js/page.js?v=${resourceVersion}"></script>
<script type="text/javascript">
    var ctx = '${ctx}'
</script>
</body>
</html>
