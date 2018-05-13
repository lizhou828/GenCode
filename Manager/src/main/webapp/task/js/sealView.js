$(function(){

    var clientHeight = document.body.clientHeight;
    var clientWidth = document.body.clientWidth;

    // PDF签章文档预览
    $('body').on('click', '.seal-view-link', function(){
        var src = $(this).data('src');
        if(!src) return;

        //预览PDF文件
        if(src.indexOf(".pdf") > -1 ){
            $.modal({
                size: 'full',
                content: '<OBJECT ID=TZPdfViewer align=middle width=100% height=' + (clientHeight - 50) +
                ' CLASSID="CLSID:8537D1E8-73B4-4060-8AC5-8817E3344C8E"></OBJECT>'
            });
            try{
                initPdfViewer(TZPdfViewer, src);
            }catch(err){
                console.error("打开PDF文件失败:"+ err.message);
                if(err.message.indexOf("is not a function") > -1 ){
                    alert("当前浏览器不支持签章插件!");
                }else if(err.message.indexOf("对象不支持") > -1 && err.message.indexOf("属性或方法") > -1){
                    alert("签章插件尚未安装或未安装成功!");
                }else{
                    alert("预览PDF文件失败！");
                }
            }
        }else{
            //预览其他文件
            preview(src);
        }


    });

    function initPdfViewer(TZPdfViewer, src) {
        TZPdfViewer.ShowToolBarButton(0, false);  //隐藏打开按钮
        TZPdfViewer.ShowToolBarButton(1, false);  //隐藏关闭按钮
        TZPdfViewer.ShowToolBarButton(2, false);  //隐藏另存按钮

        TZPdfViewer.ShowToolBarButton(3, false); //隐藏放大按钮
        TZPdfViewer.ShowToolBarButton(4, false); //隐藏缩小按钮
        TZPdfViewer.ShowToolBarButton(5, false); //隐藏右旋按钮
        TZPdfViewer.ShowToolBarButton(6, false); //隐藏左旋按钮

        TZPdfViewer.ShowToolBarButton(7, false); //隐藏首页按钮
        TZPdfViewer.ShowToolBarButton(8, false); //隐藏上一页按钮
        TZPdfViewer.ShowToolBarButton(9, false); //隐藏下一页按钮
        TZPdfViewer.ShowToolBarButton(10,false); //隐藏尾页按钮

        TZPdfViewer.ShowToolBarButton(11, false); //隐藏书签按钮
        TZPdfViewer.ShowToolBarButton(12, false); //隐藏查找按钮
        TZPdfViewer.ShowToolBarButton(13, false); //隐藏关于按钮
        TZPdfViewer.ShowToolBarButton(14, false); //隐藏跳页框

        TZPdfViewer.ShowToolBarButton(21, false); //隐藏单页签章按钮
        TZPdfViewer.ShowToolBarButton(22, false); //隐藏多页签章按钮
        TZPdfViewer.ShowToolBarButton(23, false); //隐藏骑缝签章按钮
        TZPdfViewer.ShowToolBarButton(24, false); //隐藏手写签名按钮
        TZPdfViewer.ShowToolBarButton(25, false); //隐藏批量验证按钮
        TZPdfViewer.ShowToolBarButton(26, false); //隐藏文档打印按钮
        TZPdfViewer.ShowToolBarButton(27, false); //隐藏参数设置按钮

        setTimeout(function(){
            TZPdfViewer.TZOpenPdfByPath(src, 1);
        }, 500);
    }

    function preview(data) {
        var srcArr = data.split(',');
        var src = srcArr[0];
        var currIndex = srcArr.indexOf(src) + 1;
        var total = srcArr.length;

        if (srcArr.length === 1) {
            window.open(src);
            return;
        }

        $('body').append('<div class="preview-box"><div class="preview-mask">'
            + '</div><div class="preview-body"><a href="javascript:;">'
            + '<img src="' + src + '"></a><div class="preview-close">×</div>'
            + '<div class="preview-index"><i class="p-currIndex">'
            + currIndex + '</i>/<i class="p-total">' + total + '</i></div></div></div>'
        );
        $('.preview-close').on('click', function() {$('.preview-box').remove();});
        if (srcArr.length > 1) {
            $('.preview-body').append('<div class="preview-btn">'
                + '<span class="preview-previous">&lt;</span>'
                + '<span class="preview-next">&gt;</span></div>'
            );
            var previous = $('.preview-previous');
            var next = $('.preview-next');
            previous.hide();

            $('.preview-btn span').on('click', function(e) {
                var img = $('.preview-body img');
                var currentSrc = img.attr('src');
                var index = srcArr.indexOf(currentSrc);
                switch (e.target.className) {
                    case 'preview-previous':
                        next.show();
                        img.attr('src', srcArr[index - 1]);
                        $('.p-currIndex').text(index);
                        if (index === 1) previous.hide();
                        break;
                    case 'preview-next':
                        previous.show();
                        img.attr('src', srcArr[index + 1]);
                        $('.p-currIndex').text(index + 2);
                        if (index === srcArr.length - 2) next.hide();
                        break;
                }
            });
        }
    }
});