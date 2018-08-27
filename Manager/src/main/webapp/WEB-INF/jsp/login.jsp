<%--
  Created by IntelliJ IDEA.
  User: lier
  Date: 2017/11/9
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String ctx = request.getContextPath();
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <title>登录</title>
    <%@ include file="common/easyui.jsp"%>
    <link type="text/css" rel="stylesheet" href="<%=ctx%>/css/common/login.css"/>
    <script type="text/javascript" language="javascript">
        function login(){
            var account = $("#loginId").val();
            var userPassword = $("#password").val();
            var verifyCode = $("#verifyCode").val();
            if (account == "" || account == null) {
                alert("请输入用户名");
                return false;
            }
            if (userPassword == "" || userPassword == null) {
                alert("请输入密码");
                return false;
            }
            if (verifyCode == "" || verifyCode == null) {
                alert("请输入验证码");
                return false;
            }
            $.ajax({
                url:'/login/doLogin',
                type:'post',
                data:{'account':account,'password':userPassword,'verifyCode':verifyCode},
                dataType:'json',
                success:function (data) {
                    if(data.code == 0){
                        window.location.href='/index';
                    }else{
                        alert(data.msg);
                    }
                }
            });
            return false;
        }
        // 刷新验证码图片
        function changeImg() {
            var imgSrc = $("#imgObj");
            var src = imgSrc.attr("src");
            imgSrc.attr("src", changeUrl(src));
        }
        //为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
        function changeUrl(url) {
            var timestamp = (new Date()).valueOf();
            var index = url.indexOf("?",url);
            if (index > 0) {
                url = url.substring(0, url.indexOf( "?",url));
            }
            if ((url.indexOf("&") >= 0)) {
                url = url + "×tamp=" + timestamp;
            } else {
                url = url + "?timestamp=" + timestamp;
            }
            return url;
        }

    </script>
</head>
<body id="body_bg" class="easyui-layout" leftMargin="1" topmargin="1" >
<div style="position:fixed;top:20px;left:50%;margin-left:-225px;padding:10px 15px;width:450px;background-color:#e0ecfc;font-size:14px;color:#0d439d;border-radius:10px;">
    温馨提示：若想达到最佳效果，建议使用IE8+浏览器、360浏览器(兼容模式)、搜狗浏览器(兼容模式)！
</div>
<form name="Login" id="loginForm" method="post" action="">
    <div id="login_bg">
        <div id="login_con">
            <div id="holderDiv" class="holder">&nbsp;</div>
            <div class="login_con_left">用 户 名</div>
            <div class="login_con_right">
                <input id="loginId" name="account"  type="text" class="input_bg" value="" style="width:180px;" tabindex="1"/>
            </div>
            <div class="login_con_left">密&nbsp;&nbsp;码</div>
            <div class="login_con_right">
                <input id="password" name="password" type="password" class="input_bg" value="" style="width:180px;" tabindex="2"/>
            </div>
            <div class="login_con_left">验 证 码</div>
            <div class="login_con_right">
                <input id="verifyCode" name="verifyCode" class="input_bg"  style="width:70px;vertical-align: middle;" tabindex="3"/>
                <img id="imgObj" src="/login/picCode" style="vertical-align: middle;" onclick="changeImg()">
            </div>
            <div class="clear_both"></div>
            <div class="login_con_left">&nbsp;</div>
            <input type="button"  class="btnLogin" value="登 录" onclick="login()"/>
        </div>
        <div class="footer-login">
            <p>深圳国裕网络科技有限公司</p>
            <p>Copyright 2015 gr158.com Technology CO.,Ltd. All Rights Reserved</p>
        </div>
    </div>
</form>
</body>
</html>
