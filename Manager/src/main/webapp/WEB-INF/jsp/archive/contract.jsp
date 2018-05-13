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
            <table id="dg" style="height: 100%" hidden="hidden" class="easyui-datagrid"
                   data-options="rownumbers:true,singleSelect:true,autoRowHeight:false,pagination:true,pageSize:20"
                   url="/archive/company/contract/search?companyId=${param.companyId}">
                <thead>
                <tr>
                    <th field="contractName">名称</th>
                    <th field="expiredDate">有效期至</th>
                    <th data-options="field:'file',align:'center',formatter:formatColumnOfContract">操作</th>
                </tr>
                </thead>
            </table>
<script>
    var ctx = '${ctx}';
    var companyId = '${companyId}';
</script>
<script src="${ctx}/js/archive/company.js?v=${resourceVersion}"></script>