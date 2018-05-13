/**
 * JH EasyUI Expand
 * Copyright(c) 2015 GLORYPTY(hardy). All rights reserved.
 * Note:Dealing with iframe shot Dialog not placed at the top
 */
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
    },toolSearch: function(value, name) {
        if (undefined != value) {
        	if (undefined != name) {
            	if(($(".jhui-toolbar form #searchKeywordsGroup").length) < 1){
            		$('.jhui-toolbar form').append('<input type="hidden" id="searchKeywordsGroup" name="searchKeywordsGroup" value=""/>');
            	}
            	$(".jhui-toolbar form #searchKeywordsGroup").val(name);
            }
        	if(($(".jhui-toolbar form #searchKeywords").length) < 1){
        		$('.jhui-toolbar form').append('<input type="hidden" id="searchKeywords" name="searchKeywords" value=""/>');
        	}
        	$(".jhui-toolbar form #searchKeywords").val(value);        	
        }
    	$('#dg').datagrid({
    		   queryParams: $('.jhui-toolbar form').serializeObject(),
    		   onLoadSuccess:function (msg){},
    		   onLoadError:function (msg){$('#dg').datagrid('loadData', {total:0, rows:[]});}
    	});
	 },toolReload: function() {
		 window.location.reload();
	 },toolRefresh: function() {
		 $('#dg').datagrid('reload');
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
	 },toolRemove: function(url) {
		var _docId = $.dataGridOperation.getCheckedId();
		if(_docId < 1) return false;
		$.messager.confirm('操作提示', '您确认要删除此数据?', function(f){if(f){
        	$.ajax({url:(url==undefined||null==url)?"delete.shtml":url, data:{id:_docId},
        		success: function(_msg){
        			$.messager.show({title:"操作提示", msg:_msg.content, showType:'fade', style:{right:'',bottom:''}});
        			if(_msg.type.toUpperCase()=='SUCCESS'){$.dataGridOperation.toolRefresh();}          			
        		}
        	});
	    }});
	 }
};
/*easyuiDialog*/
$.easyuiDialog = {
	init: function(){
		var $dialogDIV = top.$("#_uiDialog_divDynamic");
        if ($dialogDIV.length < 1) {
            top.$("body").append("<div id='_uiDialog_divDynamic'></div>");
            $dialogDIV = top.$("#_uiDialog_divDynamic");
        }
        return $dialogDIV;
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
    				case 'print': buttons[0]={iconCls:'icon-print',text:'打印',handler:function(){top.$("#_uiDialog_divDynamic .divPrint").jqprint();}}; break;
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
    	/*The current page is open in the iframe*/
    	if(top.location!=self.location){
    		var _locUrl = location.href;
        	var _locUrlAry = _locUrl.split("/");
        	if(_locUrlAry.length>4 && _locUrlAry[3]=="admin"){
        		if(url.indexOf("/")!=0 && _locUrlAry[4].indexOf("index.shtml")!=0){
        			url = _locUrl.substring(0,_locUrl.lastIndexOf("/")) + "/" + url;
        		}
        	}
    	}
    	$.easyuiDialog.init().dialog({title:title, href:url, width:width, height:height, buttons:buttons,
    		closed:false, cache:false, modal:true
        });
    },close: function() {
    	$.easyuiDialog.init().dialog('close');
    },submitSimple: function() {
    	top.$('#_uiDialog_divDynamic form').form('submit',{
    		onSubmit: function() {
    			return $(this).form('enableValidation').form('validate');
    		},success: function(_msg) {
    			_msg = $.parseJSON(_msg);    			
    			$.messager.show({title:"操作提示", msg:_msg.content, showType:'fade', style:{right:'',bottom:''}}); 
    			if(_msg.type.toUpperCase()=="SUCCESS") {$.easyuiDialog.close(); $.dataGridOperation.toolRefresh();}
    		}
    	});
    },openPrint: function(title, url, width, height) {
    	$.easyuiDialog.openSimple(title, url, width, height, 'print');
    }
};
