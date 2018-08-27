<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"/>
<style>
	.header{

	}
	.header>div{
		overflow: hidden;
		padding: 5px 20px;
	}
	.welcome{
		float: left;
		font-size: 26px;
		color: #fff;
	}
	.northA {
		float: right;
		margin: 12px 8px 0;
		text-decoration: none;
		padding-right: 5px;
		color: black;
		font-size: 16px;
		color: #333;
	}

</style>

<div>
	<div class="welcome"><img src="<%=ctx%>/img/logo.png" style="height: 50px"/></div>
	<a class="northA" href="/login/logOut" class="exit">退出</a>
	<a class="northA" href="javascript:void(0);" >${sessionScope.userName}</a>
</div>
