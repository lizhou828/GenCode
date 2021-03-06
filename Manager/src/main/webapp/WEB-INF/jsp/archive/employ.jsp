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
                   url="/archive/company/employ/search?companyId=${param.companyId}">
                <thead>
                <tr>
                    <th field="employName">姓名</th>
                    <th field="phone">手机号码</th>
                    <th field="idCardNo">身份证号</th>
                    <th data-options="field:'file',align:'center',formatter:formatColumnOfEmploy">操作</th>
                </tr>
                </thead>
            </table>
<script>
    var ctx = '${ctx}';
    var companyId = '${companyId}';
</script>
<script src="${ctx}/js/archive/company.js?v=${resourceVersion}"></script>