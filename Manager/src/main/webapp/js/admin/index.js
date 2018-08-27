function formatStatus(value){
	if(value == 0){
		return "禁用";
	}else{
		return "启用";
	}
}
function formatType(value){
    if(value == 0){
        return "运营账户";
    }else{
        return "监管账户";
    }
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

function updatePassword(){
    var ids = getCheckedIds();
    if(ids == null || ids.length < 1){
        return false;
    }
    if(ids.length > 1){
        $.messager.alert('提示','请选择单条记录操作!',"warning");
        return false;
    }
    var checkedRow = $.dataGridOperation.getChecked();
    var id = checkedRow.id;
    var account = checkedRow.account;
    $.dataGridOperation.toolHrefID('修改密码','password?account='+account,  900, 500,null);
}