<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<html>
    <head>
        <title>首页</title>
        <link href="/static/css/main.css" rel="stylesheet" >
    </head>
    <body>
        <div>
            <div class="head">头部</div>
            <div class="left">左边</div>
            <div class="right">
                <iframe src="/user/getByPK/1" frameborder="0" id="rightIframe">
                    我是一个iframe
                </iframe>
            </div>
        </div>
    </body>
</html>
