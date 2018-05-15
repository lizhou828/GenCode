<%--
  Created by IntelliJ IDEA.
  User: lizhou
  Date & Time: 2018年01月02日 12时21分
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>首营资质交换-500页面</title>
    <link rel="stylesheet" href="<%=ctx%>/css/base.css">
    <link rel="stylesheet" href="<%=ctx%>/css/common.css">
    <link rel="stylesheet" href="<%=ctx%>/css/icon.css">
    <style>
        .container-bg {background: url('<%=ctx%>/image/500.jpg') no-repeat top center;height: 955px;}
    </style>
</head>
<body>
<div class="page-header">
    <div class="container">
        <div class="pull-right user-nav">
            <span class="mr-2 fs-16"><i class="mr-1 icon icon-call"></i>咨询热线：400-9600-158</span>
            <a class="color-white fs-16" href="javascript:void(0);" id="loginBtn"><i class="mr-1 icon icon-login"></i>登录</a>
            <a class="color-white fs-16" href="javascript:void(0);"><i class="mr-1 icon icon-register"></i>注册</a>
        </div>
        <h1 class="fs-16">欢迎来到电子资料交换平台！</h1>
    </div>
</div>
<div class="container nav-bar">
    <div class="nav pull-right fs-18">
        <a href="#">首页</a>
        <a href="#">联系我们</a>
        <a class="active" href="#">关于我们</a>
    </div>
    <h1 class="logo"><a href="/"><img src="<%=ctx%>/image/logo.png"></a></h1>
    <div style="display: none">
        ${ex}
    </div>
</div>
<div class="container-bg"></div>
<div class="footer mb-7 text-center">
    <h3 class="fs-18">版权声明</h3>
    <div class="mt-5 lh-normal">
        <p class="mb-1">粤ICP备15051904号 互联网药品信息服务资格证书：(粤)-经营性-2015-0016 互联网药品交易服务资格证书：国A20160014</p>
        <p>服务热线：400-9600-158  Copyright2015-2017 深圳国裕网络科技有限公司 </p>
    </div>
</div>
</body>
</html>