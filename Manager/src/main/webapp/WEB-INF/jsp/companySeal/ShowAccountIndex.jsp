<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="easyui-datagrid" style="height:100%;"
	   data-options="rownumbers:true, fitColumns:true, singleSelect:true, border:false, pagination:true,pageSize:20"
	   url="/companySeal/search?companyId=${obj.id}">
	<thead>
	<tr>
		<th field="sealName">印章名称</th>
		<th field="status" formatter="formatStatus">状态</th>
		<th field="seal" formatter="formatSeal">预览</th>
	</tr>
	</thead>
</table>
<script>
    //格式化状态 (Enum:0待提交1待审核2审核通过3审核不通过)
    function formatStatus(value){
        var result = '';
        do{
            if(value==0){result = '待激活';   break;}
            if(value==1){result = '待审核'; 	break;}
            if(value==2){result = '审核通过'; 	break;}
            if(value==3){result = '审核不通过';   break;}
            break;
        }while(true);
        return result ;
    }

    function formatSeal(value,row){
        return '<a target="_blank" href="'+row.seal+'">'+row.seal+'</a>';
    }
</script>