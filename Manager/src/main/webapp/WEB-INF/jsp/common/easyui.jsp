<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="<%=ctx%>/js/common/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=ctx%>/js/common/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="<%=ctx%>/js/common/jh.common.js"></script>
<link type="text/css" rel="stylesheet" href="<%=ctx%>/css/common/style.css"/>

<link type="text/css" rel="stylesheet" href="<%=ctx%>/js/easyui/themes/jhui/icon.css"/>
<link type="text/css" rel="stylesheet" href="<%=ctx%>/js/easyui/themes/jhui/style.css"/>
<link type="text/css" rel="stylesheet" href="<%=ctx%>/js/easyui/themes/jhui/styleExtend.css"/>
<script src="<%=ctx%>/js/easyui/jquery.easyui.min.js"></script>
<script src="<%=ctx%>/js/easyui/extension/datagrid-cellediting.js"></script>
<script src="<%=ctx%>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=ctx%>/js/easyui/jh.easyui.js"></script>
<script src="<%=ctx%>/js/easyui/jh.easyui.validate.js"></script>
<script src="<%=ctx%>/js/common/formatter-defined.js"></script>


<script type="text/javascript">


    //根据图片的url 获取缩略图url（图片上传后，默认的缩略图大小为100x100）
    function getDefaultThumbnail(_url){
        var defaultThumbnail = "/img/pdf.png";
        if(null == _url || "" == _url || typeof _url == "undefined"){
            return defaultThumbnail;
        }
        var picArray = new Array(".jpg",".JPG",".jpeg",".JPEG",".png",".PNG",".bmp","BMP");
        for(var i = 0 ;i < picArray.length ;i++){
            if(_url.lastIndexOf(picArray[i]) > 0 ){
                _url =  _url.substr(0,_url.lastIndexOf(".")) + "_100x100" + _url.substr(_url.lastIndexOf("."),_url.length);
                return _url;
            }
        }
        return defaultThumbnail;
    }

    //根据图片的url 获取缩略图url（图片上传后，默认的缩略图大小为100x100）
    function getDefaultThumbnail(_url,_this){
        if(null == _url || "" == _url || typeof _url == "undefined" || _url.lastIndexOf("/img/pdf.png") > 0 || _url.lastIndexOf(".docx") > 0 || _url.lastIndexOf(".doc") > 0 || _url.lastIndexOf(".pdf") > 0){
            $(_this).attr("src","/img/pdf.png") ;
            return;
        }
        var picArray = new Array(".jpg",".JPG",".jpeg",".JPEG",".png",".PNG",".bmp","BMP");
        for(var i = 0 ;i < picArray.length ;i++){
            if(_url.lastIndexOf(picArray[i]) > 0 ){
                _url =  _url.substr(0,_url.lastIndexOf(".")) + "_100x100" + _url.substr(_url.lastIndexOf("."),_url.length);
                $(_this).attr("src",_url) ;
                return;
            }
        }

        $(_this).attr("src","/img/pdf.png") ;

    }
</script>