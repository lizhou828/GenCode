
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
function ajax(url,data){
    $.ajax({url:url,type:'post',dataType:'json', data:data,
        success: function(_msg){
            $.messager.show({title:"操作提示", msg:_msg.msg, showType:'fade', style:{right:'',bottom:''}});
            if(_msg.code == 0){$.dataGridOperation.toolRefresh();}
        }
    });
}