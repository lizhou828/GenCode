<%--
公用-档案列表
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
<%--数据列表--%>
<table id="dg" class="easyui-datagrid" hidden="hidden" style="height: 95%"
       data-options="rownumbers:true,singleSelect:true,autoRowHeight:false,pagination:true,pageSize:20"
       url="/company/archiveAudit/${param.archiveType}/search?companyId=${param.companyId}">
    <thead>
    <tr>
        <th field="archiveName">档案名称</th>
        <th field="companyName">企业名称</th>
        <th field="submitTime">提交时间</th>
        <th field="auditStatus" align="right">状态</th>
        <th field="auditor" align="right">审核人</th>
        <th field="auditTime" align="right">审核时间</th>
        <th data-options="field:'archiveId',align:'center',formatter:${param.formatterName}">操作</th>
    </tr>
    </thead>
</table>
