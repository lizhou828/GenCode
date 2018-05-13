/**
 * 使用须知：
 *    1.调用页，需定义加载数据方法loadData(pageNum),pageNum是要加载的页码数;
 */

function firstPage() {
    loadData(1);
}

/**
 * 上一页
 */
function prePage() {
    var page = $("#page-pageNum").val();
    page = parseInt(page);
    if(page > 1){
        loadData(page - 1);
    }
}

/**
 * 下一页
 */
function nextPage() {
    var page = parseInt($("#page-pageNum").val()) ;
    var totalPage = parseInt($("#page-totalPage").val());
    if(page < totalPage){
        loadData(+page + 1);
    }
}

function lastPage() {
    var totalPage = parseInt($("#page-totalPage").val());
    loadData(totalPage);
}

/**
 * 跳页
 */
function jumpPage() {
    var page = $("#page-jumpPage").val();
    page = parseInt(page);
    var totalPage = $("#page-totalPage").val();
    totalPage = parseInt(totalPage);
    if(page <= 1){
        loadData(1);
    } else if(page >= totalPage) {
        loadData(totalPage);
    } else {
        loadData(page);
    }
}

