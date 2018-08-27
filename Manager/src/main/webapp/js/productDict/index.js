/* 新增标准库时:校验商品名称和通用名称是否为违禁品名称  */
$.extend($.fn.validatebox.defaults.rules, {
    checkAppNumAdd: {
        validator: function(value){
            return checkAppNum(value,'add');
        },
        message: '批准文号已存在'
    },
    checkAppNumEdit: {
        validator: function(value){
            return checkAppNum(value,'edit');
        },
        message: '批准文号已存在'
    }
});
function checkAppNum(value,type){
    value = $.trim(value);
    var id = '';
    if(type == 'edit'){
		id = $(".id").val();
	}
	var param = {'approvalNumber':value,'id':id,'type':type};
    var flag = true;
    if(value){
        $.ajax({
            url:"checkUnique",
            type: "post",
            dataType:"json",
            data:param,
            async:false,
            success: function(data){
                if(data.code == -1){
                    flag = false;
                }else{
                    flag = true;
                }
            }
        });
    }
    return flag;
}

function formatStatus(value){
	if(value == 0){
		return "禁用";
	}else{
		return "启用";
	}
}

function formatAppNum(value){
	return '<a href="javascript:void(0);" onclick="toDetail(\'' + value + '\')">' + value + '</a>'
}

function toDetail(value){
	var buttons = [
		{iconCls:'icon-save',text:'编辑',handler:function(){$.easyuiDialog.openSimple('编辑',"edit?approvalNumber=" + value , 900, 500, null)}},
		{iconCls:'icon-cancel',text:'取消',handler:function(){$.easyuiDialog.close();}}
	];
    $.easyuiDialog.openSimple('详情', 'detail?approvalNumber=' + value, 900, 500,buttons);
}

function parameterSearch(){
	var formData = $("#searchForm").serializeObject();
	searchAjax(formData)
}

function searchAjax(formData){
    $('#dg').datagrid({
        url:'search',
        queryParams: formData,
        onLoadError:function (msg){$('#dg').datagrid('loadData', {total:0, rows:[]});}
    });

}

//启用,禁用
function onOffUse(status){
    var ids = getCheckedIds();
    if(ids == null || ids.length < 1){
        return false;
    }
    ajax('onOffUse',{'ids':ids,'status':status});
}
//删除
function remove(){
    var ids = getCheckedIds();
    if(ids == null || ids.length < 1){
        return false;
    }
    $.messager.confirm('操作提示', '您确认要删除这些数据?', function(f){if(f){
        ajax('delete',{'ids':ids});
    }});
}

function getCheckedIds(){
    var checkedRows = $.dataGridOperation.getCheckeds();
    if(checkedRows == null){
        $.messager.alert('提示','请选择需要操作的数据!',"warning");
        return false;
    }
    var ids = new Array();
    for(var i in checkedRows){
        ids.push(checkedRows[i].id);
    }
    return ids;
}
function ajax(url,data){
    $.ajax({url:url,type:'post',dataType:'json', data:data,
        success: function(_msg){
            $.messager.show({title:"操作提示", msg:_msg.msg, showType:'fade', style:{right:'',bottom:''}});
            if(_msg.code == 0){$.dataGridOperation.toolRefresh();}
        }
    });
}
