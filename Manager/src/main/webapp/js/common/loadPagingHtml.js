/**
 * 加载分页数据
 * Created by TonyZeng on 2017/8/2.
 */

/**
 * 当前页码
 * @type {number}
 */
var pageIndex = 1;
/**
 * 是否还有下一页
 * @type {boolean}
 */
var hasNext = true;
/**
 * 是否加载完毕
 * 此变量用于给ajax加控制，防止多次调用
 * （因为虽然已经将ajax的async设置成了false，但是只能防止多个ajax之间的异步，并不能防止防止ajax的多次调用）
 * @type {boolean}
 */
var loadPagingHtmlCompleted = true;
/**
 * 加载分页数据的URL,不用包含page参数
 * @type {string}
 */
var loadPagingHtmlDataUrl = "";
/**
 * 分页数据容器ID
 * @type {string}
 */
var loadPagingHtmlContainerId = "";
/**
 * 加载分页数据
 */
function loadPagingHtml(callback) {
    if (hasNext) {
        loadPagingHtmlCompleted = false;
        var url = loadPagingHtmlDataUrl + "&pageNum=" + pageIndex;
        //console.log("请求：" + url);
        $.ajax({
                type: "GET",
                url: url,
                contentType: "text/html", //必须有
                async: false,
                cache: false,
                success: function (html) {
                    console.info(html);
                    if (html) {
                        if ($.trim(html) != "" && html.indexOf("nodata") < 0) {
                            console.log("请求成功：" + url);
                            document.getElementById(loadPagingHtmlContainerId).innerHTML = html;
                        } else {
                            hasNext = false;
                        }
                        if (callback) {
                            callback();
                        }
                    }
                    else {
                        hasNext = false;
                    }
                    loadPagingHtmlCompleted = true;
                },
                error: function (e) {
                }
            }
        );
    }
}
/**
 * 下一页
 */
function nextPage() {
    // if (hasNext) {
    hasNext = true;
    pageIndex++;
    loadPagingHtml(function () {
        if (!hasNext) {
            pageIndex--;
        }
    });
    // }
}
/**
 * 前一页
 */
function previousPage() {
    //当前页码必须>1才能点击前一页
    if (pageIndex > 1) {
        //如果之前调用过nextPage，则hasNext标识有可能被设置为false，所以当请求前一页数据时，得打开hasNext标识，好让loadPagingHtml工作
        hasNext = true;
        pageIndex--;
        loadPagingHtml();
    }
}