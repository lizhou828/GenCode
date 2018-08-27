<%--
  Created by IntelliJ IDEA.
  User: leroy
  Date: 2017/12/7
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="base-page" id="basePage">
    <span>共${page.totalOfData}条，每页显示${page.pageSize}条记录</span>
    <div class="page">
        <button type="button" onclick="firstPage()">首页</button>
        <button type="button" onclick="prePage()">上一页</button>
        <span>${page.pageNum}/${page.totalOfPage}</span>
        <button type="button" onclick="nextPage()">下一页</button>
        <button type="button" onclick="lastPage()">尾页</button>
         跳转到：
        <input type="text" style="width: 30px; text-align: center;" value="${page.pageNum}" id="page-jumpPage">
        <button type="button" onclick="jumpPage()">确定</button>
        <input type="hidden" value="${page.pageNum}" id="page-pageNum">
        <input type="hidden" value="${page.totalOfPage}" id="page-totalPage">
    </div>
</div>

