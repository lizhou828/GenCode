;(function(){
    $.fn.fileupload = function(){
        $(this).each(function(i, item){
            var $item = $(item);
            var input = $item.find('.filebox-input');
            var fileItems =  $item.find('.file-list');

            input.filebox({
                onChange: function(){
                    fileUpload($(this), input, fileItems);
                }
            });
            bindFn($item);
        });
    }

    function fileUpload(uploadEl, input, fileItems){
        var fileInput = uploadEl.next().find('.textbox-value');
        var name = input.data('name');
        var files = fileInput[0].files;
        if(!files.length) return;

        var formData = new FormData();
        formData.append('fsFile', files[0])

        $.ajax({
            url: '${propertie.system.fs}/fastdfs/upload',
            method: 'post',
            data: formData,
            processData: false,
            contentType: false,
            dataType: 'JSON',
            success: function(res){
                if($.isArray(res) || res.length && res[0].url){
                    renderFileImte(name, fileItems, res[0].url);
                }
            },
            error: function(){
              alert("上传失败")
            },
            completed: function(){
                alert("上传成功")
            }
        })
    }

    function renderFileImte(name, el, url){
        var itemTpl = '<div class="file-item">' +
            '<span class="file-fn">' +
            '<a target="_blank" href="' + url + '">查看</a>' +
            '<a class="file-remove" href="javascript:void(0);">删除</a>' +
            '</span>' +
            '<span class="file-icon">' +
            '<input type="hidden" name="' + name + '" value="' + url + '">' +
            '<img src="' + url + '">' +
            '</span>' +
            '</div>';

        el.append(itemTpl);
    }

    function bindFn($item){
        $item.on('click', '.file-remove', function(){
           $(this).closest('.file-item').remove();
        });
    }
})();