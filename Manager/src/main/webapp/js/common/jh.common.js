/**
 * JH Common
 * Copyright(c) 2015 GLORYPTY(hardy). All rights reserved.
 * Note:serializeObject,formatDate
 */
$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};
var formatDate= function (IsMi,obj) {   
    var myDate = new Date(obj);   
    var year = myDate.getFullYear();  
    var month = ("0" + (myDate.getMonth() + 1)).slice(-2);  
    var day = ("0" + myDate.getDate()).slice(-2);  
    var h = ("0" + myDate.getHours()).slice(-2);  
    var m = ("0" + myDate.getMinutes()).slice(-2);  
    var s = ("0" + myDate.getSeconds()).slice(-2);   
    var mi = ("00" + myDate.getMilliseconds()).slice(-3);  
    if (IsMi == "yyyy-MM-dd") {   
        return year + "-" + month + "-" + day;   
    }
    else if(IsMi == "yyyy-MM-dd HH:mm:ss"){   
        return year + "-" + month + "-" + day + " " + h + ":" + m + ":" + s;   
    }  
};
/*messager @yiwen*/  
function slide(message){
   $.messager.show({title:'提示',msg:message,timeout:1000,showType:'fade',style:{right:'', bottom:''}})
}
/* 
 * export @hardy
 * 
 * data :查询参数  ，若传此参数则使用，否则按默认的处理方式   LiuLei 20160419
 * */
function exportExcel(url, rootPath,data){
	console.log(data);
	$.ajaxSettings['contentType']="application/x-www-form-urlencoded; charset=utf-8";
    $.ajax({
        type:"POST",
        url:url,
        data:data?data:$('.jhui-toolbar form').serializeObject(), 
        success:function(data){
        	if(data.type == 'SUCCESS' && ''!=data.content){
        		 window.open(rootPath + data.content);
        	}else{
        		$.messager.alert("操作提示", "导出excel失败","error");
        	}        	
        },
        error:function(XMLHttpRequest, textStatus) {
            if (XMLHttpRequest.status == 500) {
                $.messager.alert("操作提示", eval("(" + XMLHttpRequest.responseText + ")").errorObject.errorText, "error");
            }
        }
    });
	
}
