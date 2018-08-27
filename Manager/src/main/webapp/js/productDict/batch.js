/**
 * 开始文件上传
 */
var isFinished;
function startUploadNormalFile(){
    var url = $('#url').val();
    var fileName = $('#uploadFile').val();
    if(fileName==''){
        $.messager.alert('友情提示', '请选择需要上传的文件,如果已选择，请刷新当前页面重新上传', "warning");
        return;
    }

    if (fileName.lastIndexOf(".xls") == -1){
        $.messager.alert('友情提示', '文件格式不正确，请使用模板上传(.xls)', "warning");
        $('#uploadFile').val('');
        return;
    }
    isFinished = false;

    var formdata = new FormData();
    formdata.append('file', $('#uploadFile')[0].files[0]);

    $.ajax({
        url: url,
        type: 'post',
        data: formdata,
        processData: false,
        contentType: false,
        dataType: 'json',
        success: function(data){
            if(data.code==0) {
                $.messager.confirm('提示', data.msg, function(r){
                    if (r){
                        $.dataGridOperation.toolReload();
                    }
                });
            }else {
                $.messager.alert('提示',data.msg,"warning");
                isFinished = true;
            }
        }
    })
    $('#progressbar').progressbar('setValue',0);
    updateProgressNormal();
}

/**
 * 更新文件上传进度
 */
function updateProgressNormal() {
    var value = $('#progressbar').progressbar('getValue');
    if (value < 100 && !isFinished){
        $.post('/productDict/ignfileProgress',function(data){
            var value = parseInt(data);
            $('#progressbar').progressbar('setValue', value);
        });
        setTimeout(updateProgressNormal, 200);
    }
}

var $dialogIdArray = new Array();
/**
 * 改进打开窗口方法，支持定义回调函数和在窗口上面打开新窗口
 * @param title     窗口标题，必须参数
 * @param url	    请求地址，必须参数
 * @param width     窗口宽度，可选参数，默认600
 * @param height    窗口高度，可选参数，默认400
 * @param button    自定义按钮，可选参数，hide为隐藏，print为打印，默认按钮为“确认”和“取消”
 * @param callBack  自定义回调函数，可选参数，默认为提交表单
 */
function openDialog(title,url, width, height,button,callBack) {
    if(!width){
        width = 600;
    }
    if(!height){
        height = 400;
    }
    var date = new Date();
    var $dialogId = "_dynamic_uiDialogId_"+date.getMinutes()+"_"+date.getSeconds()+"_"+date.getMilliseconds();
    $dialogIdArray.push($dialogId);
    if ($iframeTop.$("#"+$dialogId).length < 1) {
        $iframeTop.$("body").append("<div id='"+$dialogId+"'></div>");
    }
    var buttons =  new Array();
    if(button instanceof Array){
        buttons = button;
    }else if(button == 'hide'){
        buttons = [];
    }else if(button == 'print'){
        buttons[0] = {iconCls:'icon-print',text:'打印',handler:function(){
            $iframeTop.$('#'+$dialogId +"  .print_area_css").printArea();
        }};
        buttons[1] = {iconCls:'icon-cancel',text:'取消',handler:function(){
            closeDialog();
        }};
    }else{
        buttons[0] = {iconCls:'icon-save',text:'确认',handler:function(){
            if(callBack){
                callBack();
            }else {
                submitForm();
            }
        }};
        buttons[1] = {iconCls:'icon-cancel',text:'取消',handler:function(){
            closeDialog();
        }};
    }


    $('#' + $dialogId).dialog({
        title 	: title,
        href 	: url,
        width 	: width,
        height 	: height,
        buttons : buttons,
        closed 	: false,
        cache 	: false,
        modal 	: true,
        onClose:function(){
            closeDialog();
        }
    });
}

/**
 * 关闭窗口
 */
function closeDialog(){
    //关闭最新窗口
    if($dialogIdArray.length>0){
        //不能用close,有缓存问题
        $iframeTop.$('#'+$dialogIdArray[$dialogIdArray.length-1]).dialog('destroy');
        //移除最后一个元素
        $dialogIdArray.pop();
    }
}

function getTopDialogId(){
    if($dialogIdArray.length>0){
        return $dialogIdArray[$dialogIdArray.length-1];;
    }
    return null;
}
/**
 * 提交表单
 */
function submitForm(){
    if($dialogIdArray.length>0){
        var $dialogId =getTopDialogId();
        if($('#'+$dialogId+' form').length<=0){
            closeDialog();
            return;
        }
        $iframeTop.$('#'+$dialogId+' form').form('submit',{
            url: $iframeTop.$('#'+$dialogId+' form').attr('action'),
            onSubmit: function() {
                return $iframeTop.$('#'+$dialogId+' form').form('enableValidation').form('validate');
            },success: function(_msg) {
                _msg = $.parseJSON(_msg);
                $iframeTop.$.messager.show({title:"操作提示", msg:_msg.msg, showType:'fade', style:{right:'',bottom:''}});
                if(_msg.code == 0) {
                    //刷新父类窗口
                    if($dialogIdArray.length>1){
                        $('#'+$dialogIdArray[$dialogIdArray.length-2]+' .easyui-datagrid').datagrid('reload');
                    }
                    closeDialog();
                }
            }
        });
    }
}