
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

//删除
function remove(){
    var checkedRows = $.dataGridOperation.getCheckeds();
    if(checkedRows == null){
        $.messager.alert('提示','请选择需要操作的数据!',"warning");
        return false;
    }
    var ids = new Array();
    for(var i in checkedRows){
        ids.push(checkedRows[i].id);
    }
    $.messager.confirm('操作提示', '您确认要删除这些数据?', function(f){if(f){
        ajax('delete',{'ids':ids});
    }});
}
function ajax(url,data){
    $.ajax({url:url,type:'post',dataType:'json', data:data,
        success: function(_msg){
            $.messager.show({title:"操作提示", msg:_msg.msg, showType:'fade', style:{right:'',bottom:''}});
            if(_msg.code == 0){$.dataGridOperation.toolRefresh();}
        }
    });
}