<%--
  Created by IntelliJ IDEA.
  User: leroy
  Date: 2017/12/12
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <title>资质交换平台</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/task/css/base.css?v=${resourceVersion}">
    <link rel="stylesheet" type="text/css" href="${ctx}/task/css/common.css?v=${resourceVersion}">
    <link rel="stylesheet" type="text/css" href="${ctx}/task/css/icon.css?v=${resourceVersion}">
    <link rel="stylesheet" type="text/css" href="${ctx}/task/css/task-launch.css?v=${resourceVersion}">
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_472974_oq9cg8xrmc3ul3di.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/task/css/dialog.css?v=${resourceVersion}">
</head>
<body>
<div class="section-body">
    <div class="base-breadcrumbs mb-5">
        <a href="#">详情</a>
    </div>
    <div class="base-item mb-5">
        <h4 class="base-title">主题</h4>
        <div class="base-item-body">
            <p>${store.title}</p>
            <p style="float: right"><a href="${ctx}/template/PDF-SIGN-CLIENT.exe" style="color:red;text-decoration: underline;margin-right: 10px;margin-top: 10px;" ref="noopener noreferrer" >安装签章插件</a></p>
        </div>
    </div>
    <div class="base-item mb-5">
        <h4 class="base-title">发送企业基本信息</h4>
        <div class="base-item-body">
            <ul class="base-ul-list lf-rt">
                <li>
                    <span class="lf">发送企业名称：</span>
                    <div class="rt">${store.fromName}</div>
                </li>
                <li>
                    <span class="lf">企业类型：</span>
                    <div class="rt">${store.fromTypeStr}</div>
                </li>
                <li>
                    <span class="lf">经办人：</span>
                    <div class="rt">${store.fromAgent}</div>
                </li>
                <li>
                    <span class="lf">经办人手机：</span>
                    <div class="rt">${store.fromAgentPhone}</div>
                </li>
                <li>
                    <span class="lf">地址：</span>
                    <div class="rt">${store.fromAddress}</div>
                </li>
            </ul>
            <c:if test="${companies != null && fn:length(companies) > 0}">
                <div class="item mb-7">
                    <h5 class="base-title-sm mb-5">企业档案</h5>
                    <table class="base-table mb-7">
                        <thead>
                        <tr>
                            <th></th>
                            <th>文件名称</th>
                            <th>有效期至</th>
                            <th>查看</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${companies}" var="item" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${item.name}</td>
                                <td>${item.valid}</td>
                                <td><a href="javascript:void(0);" class="base-button seal-view-link" data-src="${item.url}">预览</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${products != null && fn:length(products) > 0}">
                <div class="item mb-7">
                    <h5 class="base-title-sm mb-5">商品档案</h5>
                    <table class="base-table mb-7">
                        <thead>
                        <tr>
                            <th></th>
                            <th>产品名称</th>
                            <th>产品类型</th>
                            <th>包装规格/型号</th>
                            <th>生产厂家</th>
                            <th>产品所属企业档案</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="product" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${product.name}</td>
                                <td>${product.type}</td>
                                <td>${product.packageSpec}</td>
                                <td>${product.manufacturer}</td>
                                <td>
                                    <c:if test="${product.manufacturerArchiveId != null}">
                                        <a href="${ctx}/archives/companyClient/task/showCompanyClientArchives?archiveId=${product.manufacturerArchiveId}"
                                           class="base-button blue">查看</a>
                                    </c:if>
                                </td>
                                <td>
                                    <i class="iconfont icon-down-trangle-copy show-internal-table"></i>
                                </td>
                            </tr>
                            <tr class="internal-table">
                                <td colspan="2"></td>
                                <td colspan="5">
                                    <table class="base-table">
                                        <thead>
                                        <tr>
                                            <th>资质名称</th>
                                            <th>有效期至</th>
                                            <th>查看</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${product.archives}" var="item" varStatus="status">
                                            <tr>
                                                <td>${item.name}</td>
                                                <td>${item.valid}</td>
                                                <td><a href="javascript:void(0);" class="base-button seal-view-link" data-src="${item.url}">预览</a></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${employs != null && fn:length(employs) > 0}">
                <div class="item mb-7">
                    <h5 class="base-title-sm mb-5">人员档案</h5>
                    <table class="base-table mb-7">
                        <thead>
                        <tr>
                            <th></th>
                            <th>姓名</th>
                            <th>手机号码</th>
                            <th>身份证号</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${employs}" var="employ" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${employ.name}</td>
                                <td>${employ.phone}</td>
                                <td>${employ.idCardNumber}</td>
                                <td>
                                    <i class="iconfont icon-down-trangle-copy show-internal-table"></i>
                                </td>
                            </tr>
                            <tr class="internal-table">
                                <td colspan="2"></td>
                                <td colspan="3">
                                    <table class="base-table">
                                        <thead>
                                        <tr>
                                            <th>资质名称</th>
                                            <th>有效期至</th>
                                            <th>查看</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${employ.archives}" var="item" varStatus="status">
                                            <tr>
                                                <td>${item.name}</td>
                                                <td>${item.valid}</td>
                                                <td><a href="javascript:void(0);" class="base-button seal-view-link" data-src="${item.url}">预览</a></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${contracts != null && fn:length(contracts) > 0}">
                <div class="item mb-7">
                    <h5 class="base-title-sm mb-5">合同协议</h5>
                    <table class="base-table mb-7">
                        <thead>
                        <tr>
                            <td></td>
                            <th>文件名称</th>
                            <th>有效期至</th>
                            <th>查看</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${contracts}" var="item" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${item.name}</td>
                                <td>${item.valid}</td>
                                <td><a href="javascript:void(0);" class="base-button seal-view-link" data-src="${item.url}">预览</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${attorneys != null && fn:length(attorneys)> 0}">
                <div class="item mb-7">
                    <h5 class="base-title-sm mb-5">委托书</h5>
                    <table class="base-table mb-7">
                        <thead>
                        <tr>
                            <td></td>
                            <th>文件名称</th>
                            <th>有效期至</th>
                            <th>查看</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${attorneys}" var="item" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${item.name}</td>
                                <td>${item.valid}</td>
                                <td><a href="javascript:void(0);" class="base-button seal-view-link" data-src="${item.url}">预览</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
    <div class="base-item mb-5">
        <h4 class="base-title">留言</h4>
        <div class="base-item-body">
            <p>${store.fromMessage}</p>
        </div>
    </div>
    <c:if test="${store.status == -1}">
        <div class="base-item mb-5">
            <h4 class="base-title">接收方留言</h4>
            <div class="base-item-body">
                <p>${store.receiveMessage}</p>
            </div>
        </div>
    </c:if>
    <div class="base-button-group">
        <a href="javascript:history.go(-1)" class="base-button-lg blue">返回</a>
    </div>
</div>
<script src="${ctx}/task/js/jquery.min.js"></script>
<script src="${ctx}/task/js/common.js?v=${resourceVersion}"></script>
<script src="${ctx}/js/common/dialog.js?v=${resourceVersion}"></script>
<script src="${ctx}/task/js/sealView.js?v=${resourceVersion}"></script>
<script>
    $(function () {
        $('.section-body').on('click', '.show-internal-table', function () {
            $(this).closest('tr').next().toggle();
            $(this).toggleClass('arrow-up');
        });
    });
</script>
</body>
</html>
