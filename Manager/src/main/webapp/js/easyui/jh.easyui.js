/**
 * JH EasyUI Expand
 * Copyright(c) 2015#1122 GLORYPTY(hardy). All rights reserved.
 * Note:dataGridOperation,easyuiDialog
 */
$(function() {
	$('.jhui-toolbar .easyui-panel').width("100%");
	$('.jhui-toolbar .search .searchbox .textbox-addon-right a').addClass("easyui-linkbutton l-btn l-btn-small l-btn-plain").width(60).html('<span class="l-btn-left l-btn-icon-left" style="margin-top:-1px"><span class="l-btn-text">搜索</span><span class="l-btn-icon icon-search">&nbsp;</span></span>');
});
$.dataGridOperation = {
	getCheckeds: function() {
		var checkedRowDatas = $('#dg').datagrid('getChecked');
		if (checkedRowDatas.length <= 0) {
			$.messager.alert('提示','请选择需要操作的数据!',"warning");
			return null;
		}
		return checkedRowDatas;
    },getChecked: function() {
		var checkedRowDatas = $.dataGridOperation.getCheckeds();
		if(null == checkedRowDatas){
			return null;
		}else if (checkedRowDatas.length > 1) {
			$.messager.alert('提示','请选择单条记录进行操作!',"warning");
			return null;
		}
		return checkedRowDatas[0];
    },getCheckedId: function() {
    	var _doc = $.dataGridOperation.getChecked();
    	return null!=_doc ? _doc.id : -1;
    },toolHref: function(href) {
		 window.location.href = href;
	},toolHrefID: function(title, url, width, height, button) { 
		 var _docid = $.dataGridOperation.getCheckedId();
		 if(_docid > 0){
			 if(null != url){
				 url += url.indexOf("?")>0?"&":"?";
				 url += "id="+_docid;
			 }else{
				 url = "detail.shtml?id="+_docid;
			 }
			 $.easyuiDialog.openSimple(null==title?"查看详情":title, url, width, height, button);
		 }
	 },toolAdd: function(url, width, height) {
		 $.easyuiDialog.openSimple("新增", (url==undefined||null==url)?"add.shtml":url, width, height);
	 },toolEdit: function(url, width, height) { 
		 $.dataGridOperation.toolHrefID("编辑", (url==undefined||null==url)?"edit.shtml":url, width, height);
	},toolEdit: function(title,url, width, height) {
		$.dataGridOperation.toolHrefID(title, (url==undefined||null==url)?"edit.shtml":url, width, height);
	 },toolEditCallback:function(title,url,width,height,callBack){
		 if(url=='edit.shtml'){
			 var _docid = $.dataGridOperation.getCheckedId();
			 if(_docid > 0){
				 if(null != url){
					 url += url.indexOf("?")>0?"&":"?";
					 url += "id="+_docid;
				 }
			}
		 }
		$.easyuiDialog.openSimpleCallback(null==title?"编辑":title, url, width, height, callBack);
	 },toolRemove: function(url) {
		var _docId = $.dataGridOperation.getCheckedId();
		if(_docId < 1) return false;
		$.messager.confirm('操作提示', '您确认要删除此数据?', function(f){if(f){
        	$.ajax({url:(url==undefined||null==url)?"delete.shtml":url, data:{id:_docId},
        		success: function(_msg){
        			$.messager.show({title:"操作提示", msg:_msg.msg, showType:'fade', style:{right:'',bottom:''}});
        			if(_msg.code == 0){$.dataGridOperation.toolRefresh();}
        		}
        	});
	    }});
	 },toolApprove: function(url) {
			var _docId = $.dataGridOperation.getCheckedId();
			if(_docId < 1) return false;
			var _status = $.dataGridOperation.getChecked().status;
			if(_status=='AGREE'){
				$.messager.alert('提示','请选择未审核记录进行操作!',"warning");
				return;
			}
			$.messager.confirm('操作提示', '您确认要审核此数据?', function(f){if(f){
	        	$.ajax({url:(url==undefined||null==url)?"approve.shtml":url, data:{id:_docId},
	        		success: function(_msg){
	        			$.messager.show({title:"操作提示", msg:_msg.msg, showType:'fade', style:{right:'',bottom:''}});
	        			if(_msg.code == 0){$.dataGridOperation.toolRefresh();}
	        		}
	        	});
		    }});
	 },toolSearch: function(value, name) {
        if (undefined!=value && undefined!=name) {
        	if(($(".jhui-toolbar form #searchKeywordsGroup").length) < 1){
        		$('.jhui-toolbar form').append('<input type="hidden" id="searchKeywordsGroup" name="searchKeywordsGroup" value=""/>');
        	}
        	$(".jhui-toolbar form #searchKeywordsGroup").val(name);        	        	
        } else if(undefined == value){
        	value = $(".jhui-toolbar div.search .textbox-value").val();
        }        
        if(($(".jhui-toolbar form #searchKeywords").length) < 1){
    		$('.jhui-toolbar form').append('<input type="hidden" id="searchKeywords" name="searchKeywords" value=""/>');
    	}
    	$(".jhui-toolbar form #searchKeywords").val(value);    	
    	$('#dg').datagrid({
    		   queryParams: $('.jhui-toolbar form').serializeObject(),
    		   onLoadSuccess:function (msg){},
    		   onLoadError:function (msg){$('#dg').datagrid('loadData', {total:0, rows:[]});}
    	});
	 },toolExport: function(url, rootPath) {
		$.ajaxSettings['contentType']="application/x-www-form-urlencoded; charset=utf-8";
	    $.ajax({
	        type:"POST",
	        url:url,
	        data:$('.jhui-toolbar form').serializeObject(), 
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
	 },toolReload: function() {
		 window.location.reload();
	 },toolRefresh: function() {
		 $('#dg').datagrid('reload');
		 $('#dg').treegrid('reload');
	 }
};
/*easyuiDialog*/
var $iframeTop = this;
$.easyuiDialog = {
	init: function(){
		var $dialogDIV = $iframeTop.$("#_uiDialog_divDynamic");
        if ($dialogDIV.length < 1) {
        	$iframeTop.$("body").append("<div id='_uiDialog_divDynamic'></div>");
            $dialogDIV = $iframeTop.$("#_uiDialog_divDynamic");
        }
        return $dialogDIV;
	},getIFrameSrc: function(url){
		/*The current page is open in the iframe*/
    	if($iframeTop==top && top.location!=self.location){
    		if(/^(\w+)\.(do|action|jhtml|shtml)(.*)$/.test(url)){
    			var _locUrl = location.href;
    			return _locUrl.substring(0, _locUrl.lastIndexOf("/")+1) + url;
    		}
    	}
    	return url;
	},open: function (option) {
		$.easyuiDialog.init().dialog(option);
    },openSimple: function(title, url, width, height, button) {    	
    	var buttons = new Array();
    	if(undefined!=button && null!=button){
    		if(button instanceof Array){
    			buttons = button;
    		}else{
    			switch(button){
    				case 'save': buttons[0]={iconCls:'icon-save',text:'保存',handler:function(){$.easyuiDialog.submitSimple();}}; break;
    				case 'print': buttons[0]={iconCls:'icon-print',text:'打印',handler:function(){$iframeTop.$("#_uiDialog_divDynamic .divPrint").jqprint();}}; break;
    				default: break;
    			}
    			if(buttons.length > 0){
    				buttons[buttons.length] = {iconCls:'icon-cancel',text:'取消',handler:function(){$.easyuiDialog.close();}};
    			}
    		}
    	}else{
    		buttons[0] = {iconCls:'icon-save',text:'确认',handler:function(){$.easyuiDialog.submitSimple();}};
    		buttons[1] = {iconCls:'icon-cancel',text:'取消',handler:function(){$.easyuiDialog.close();}};
    	}
    	$.easyuiDialog.init().dialog({title:title, href:$.easyuiDialog.getIFrameSrc(url), width:width, height:height, buttons:buttons,
    		closed:false, cache:false, modal:true
        });
    },openSimpleCallback: function(title, url, width, height, callback) {   
    		var buttons = new Array();
    		buttons[0] = {iconCls:'icon-save',text:'确认',handler:function(){callback();}};
    		buttons[1] = {iconCls:'icon-cancel',text:'取消',handler:function(){$.easyuiDialog.close();}};
    		$.easyuiDialog.init().dialog({title:title, href:$.easyuiDialog.getIFrameSrc(url), width:width, height:height, buttons:buttons,
    		closed:false, cache:false, modal:true
        });
    },close: function() {
    	$.easyuiDialog.init().dialog('close');
    },submitSimple: function() {
    	var dialogFrms = $iframeTop.$('#_uiDialog_divDynamic form');
		if(dialogFrms.length >= 1){
			$(dialogFrms[0]).form('submit',{
	    		url: $.easyuiDialog.getIFrameSrc($(dialogFrms[0]).attr('action')),
	    		onSubmit: function() {
	    			return $(dialogFrms[0]).form('enableValidation').form('validate');
	    		},success: function(_msg) {
	    			_msg = $.parseJSON(_msg); 			
	    			$iframeTop.$.messager.show({title:"操作提示", msg:_msg.msg, showType:'fade', style:{right:'',bottom:''}});
	    			if(_msg.code == 0) {$.easyuiDialog.close(); $.dataGridOperation.toolRefresh();}
	    		}
	    	});
		}
    },openPrint: function(title, url, width, height) {
    	$.easyuiDialog.openSimple(title, url, width, height, 'print');
    }
};
