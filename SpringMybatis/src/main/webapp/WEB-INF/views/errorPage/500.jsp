<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date & Time: 2017-04-23 11:13.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isErrorPage="true" %>
<html>
<head>
    <title>error page </title>
</head>
<body>


<%
    String errorMsg = "";
    if(null != exception){
        errorMsg = exception.getMessage();
    }
%>
500 <br>
出错啦！错误信息： <%= errorMsg%>
</body>
</html>

