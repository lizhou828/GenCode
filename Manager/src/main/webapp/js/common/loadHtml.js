/**
 * 加载HTML
 * Created by TonyZeng on 2017/8/2.
 */
/**
 * 加载HTML
 * @param url 加载HTML的地址
 * @param containerId 容器ID
 * @param callback 回调函数
 */
function loadHtml(url, containerId, callback) {
    $.ajax({
            type: "GET",
            url: url,
            contentType: "text/html", //必须有
            async: false,
            cache: false,
            success: function (html) {
                if (html) {
                    $("#" + containerId).html("");
                    $("#" + containerId).append(html);
                    if (callback) {
                        callback();
                    }
                }
            },
            error: function (e) {
            }
        }
    );
}