$(function () {
    //查看详情
    $("#detailBtn").click(function () {
        var _docid = $.dataGridOperation.getCheckedId();
        if (_docid > 0) {
            var buttons = new Array();
            buttons[0] = {
                iconCls: 'icon-cancel', text: '取消', handler: function () {
                    $.easyuiDialog.close();
                }
            };
            $.easyuiDialog.openSimple('查看详情', 'detail?id=' + _docid, 800, 600, buttons);
        }
    });

})
//格式化状态 (Enum:0禁用1启用)
function formatStatus(value) {
    var result = '';
    do {
        if (value == 0) {
            result = '禁用';
            break;
        }
        if (value == 1) {
            result = '启用';
            break;
        }
        break;
    } while (true);
    return result;
}

function parameterSearch() {
    var queryParams = $('#searchForm').serializeObject();
    $('#dg').datagrid({
        url: 'search.shtml',
        queryParams: queryParams,
        onLoadError: function (msg) {
            $('#dg').datagrid('loadData', {total: 0, rows: []});
        }
    });
}

function _bindUkey(){
    var _docid = $.dataGridOperation.getCheckedId();
    if (_docid > 0) {
        var buttons = new Array();
        buttons[0] = {
            iconCls:'icon-save',text:'确认',handler:function(){
                $.easyuiDialog.submitSimple();
            }
        };
        buttons[1] = {
            iconCls: 'icon-cancel', text: '取消', handler: function () {
                $.easyuiDialog.close();
            }
        };
        $.easyuiDialog.openSimple('绑定UKey', 'bindUKey?id=' + _docid, 800, 600, buttons);
    }

}


function batchUpdateStatus(status){
    var rows = $.dataGridOperation.getCheckeds();
    if(rows){
        var message = '你确定要启用该用户吗?';
        if(status==0){
            message = '你确定要禁用该用户吗?';
        }
        $.messager.confirm('友情提示', message, function(result){
            if (result){
                batchOperation(rows,status);
            }
        });
    }
}

function updateStatus(status){
    var row = $.dataGridOperation.getChecked();
    if(row.userStatus == 1 && status == 1){
      $.messager.alert('错误提示',"请选择禁用用户进行启用!","warning");
      return ;
    }
    if(row.userStatus == 0 && status == 0){
        $.messager.alert('错误提示',"请选择启用用户进行禁用!","warning");
        return ;
    }
    if(row){
        var message = '你确定要启用该用户吗?';
        if(status==0){
            message = '你确定要禁用该用户吗?';
        }
        $.messager.confirm('友情提示', message, function(result){
            if (result){
                operation(row,status);
            }
        });
    }
}

function batchOperation(rows,status){
    var idList = new Array();
    for (var i = 0; i < rows.length; i++) {
        idList.push(rows[i].id);
    }
    $.ajax({
        url : 'onOffUser.shtml',
        type : 'post',
        data : {"idList":idList,"status":status},
        dataType : 'json',
        success : function(data) {
            $.messager.show({title:"操作提示", msg:data.msg, showType:'fade', style:{right:'',bottom:''}});
            if(data.code == 0){	$('#dg').datagrid('reload');}
        },
        error : function(data) {
            $.messager.alert('错误提示', "发生错误", "error");
        }
    });
}

function operation(row,status){
    $.ajax({
        url : 'onOffUser.shtml',
        type : 'post',
        data : {"id":row.id,"status":status},
        dataType : 'json',
        success : function(data) {
            $.messager.show({title:"操作提示", msg:data.msg, showType:'fade', style:{right:'',bottom:''}});
            if(data.code == 0){	$('#dg').datagrid('reload');}
        },
        error : function(data) {
            $.messager.alert('错误提示', "发生错误", "error");
        }
    });
}
