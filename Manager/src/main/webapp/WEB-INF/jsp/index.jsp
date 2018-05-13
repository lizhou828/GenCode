<%--
  Created by IntelliJ IDEA.
  User: lier
  Date: 2017/11/9
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="<%=request.getContextPath()%>"/>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>电子资料交换平台ctx=${ctx}</title>
    <jsp:include page="common/easyui.jsp">
    <script type="text/javascript">
        var type = "${sessionScope.type}";
        $(document).ready(function () {
            $("#westMenu ul").tree({
                onClick: function (node) {//判断是否是叶子节点
                    if ($('ul').tree("isLeaf", node.target))
                        menuTreeClick(node);
                }
            });
        });

        function menuTreeClick(node) {
            var tabs = $("#tabsCenter");
            if (tabs.tabs('exists', node.text)) {
                tabs.tabs('select', node.text);
                var tab = tabs.tabs('getSelected');
                if (tab && tab.find('iframe').length > 0) {
                    var _refresh_iframe = tab.find('iframe')[0];
                    var refresh_url = node.href ? node.href : _refresh_iframe.src;
                    _refresh_iframe.contentWindow.location.href = refresh_url;
                }
            } else {
                var content;
                var scroll = true;
                if (node.href && node.href.indexOf('#') < 0) {
                    content = '<iframe scrolling="' + (scroll ? 'yes' : 'no') + '" frameborder="0"  src="' + node.href + '" style="width:100%;height:100%;"></iframe>';
                    tabs.tabs('add', {
                        id: node.id,
                        iconCls: node.iconCls,
                        title: node.text,
                        content: content,
                        height: 500,
                        closable: true
                    });
                } else {
                    console.info(node);
                }
            }
        }
    </script>
</head>
<body class="easyui-layout">
<!-- North -->
<div class="header" data-options="region:'north',border:false" style="height:60px;background:#ffffff;">
    <jsp:include page="module/north.jsp"/>
</div>
<!-- West -->
<div id="westMenu" title="收起" data-options="region:'west',split:true" style="width:11%; min-width:165px;">
    <jsp:include page="module/west.jsp"/>
</div>
<!-- Center -->
<div data-options="region:'center'">
    <div id="tabsCenter" class="easyui-tabs" data-options="fit:true,border:false">
        <jsp:include page="module/center.jsp"/>
    </div>
</div>
<!-- East -->
<!-- <div title="East" data-options="region:'east',split:true,collapsed:true" style="width:100px;">east region</div> -->
<!-- South -->
<div data-options="region:'south',border:false"
     style="height:26px;line-height:26px;vertical-align:middle;text-align:center;background:#E0ECFF;">
    &copy;<%=Calendar.getInstance().getWeekYear() > 2015 ? "2015-" + Calendar.getInstance().getWeekYear() : "2015"%>
    GLORYPTY Technology CO.,Ltd. All Rights Reserved
</div>
<script type="text/javascript">

    //查询消息条数
    $(function () {
        $.ajax({
            url: '/sysMessage/countUnReadNum',
            type: 'post',
            datType: 'json',
            success: function (result) {
                if (result.code == '0' && result.data && result.data > 0) {
                    $("#messageRemind").html('(' + result.data + ')');
                }
            }, error: function (e1, e2, e3) {
            }
        });
    })


    $(function(){
        //    IE6/7/8/9下，不兼容console对象
        window.console = window.console || (function(){
            var c = {}; c.log = c.warn = c.debug = c.info = c.error = c.time = c.dir = c.profile
                    = c.clear = c.exception = c.trace = c.assert = function(){};
            return c;
        })();
    });

    //数组删除操作
    Array.prototype.removeByValue = function(val) {
        for(var i=0; i<this.length; i++) {
            if(this[i] == val) {
                this.splice(i, 1);
                break;
            }
        }
    }

</script>
</body>
</html>
