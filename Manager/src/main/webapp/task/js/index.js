$(function () {
    loadData(1);
});

// 时间控件初始化
$('.datepicker').each(function () {
    $(this).datepicker({
        autoHide: true,
        format: 'yyyy-mm-dd',
        yearSuffix: '年',
        daysMin: ['日', '一', '二', '三', '四', '五', '六'],
        daysShort: ['日', '一', '二', '三', '四', '五', '六'],
        days: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
        months: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
        monthsShort: ['一', '二', '三', '四', '五', '六', '七', '八', '九', '十', '十一', '十二']
    });
});

function loadData(pageNum) {
    if(null == pageNum || "" == pageNum ||  pageNum <= 0  || typeof pageNum == "undefined" ){
        pageNum = 1
    }
    var title = $("#filter_title").val();
    var fromCompanyName = $("#filter_fromCompanyName").val();
    var toCompanyName = $("#filter_toCompanyName").val();
    var productName = $("#filter_productName").val();

    var status = $("#filter_status").val();
    if (status == -9) {
        status = null;
    }
    var startTime = $("#filter_startTime").datebox("getValue");
    var endTime = $("#filter_endTime").datebox("getValue");
    var filterVo = {
        pageNum: pageNum, title: title,
        toCompanyName:toCompanyName,productName:productName,
        fromCompanyName: fromCompanyName, status: status,
        startTime: startTime, endTime: endTime
    }
    $.ajax({
        url: ctx + '/task/page',
        contentType: 'application/json; charset=utf-8',
        type: 'POST',
        data: JSON.stringify(filterVo),
        traditional: true
    }).success(function (data) {
        $("#page_table_div").html(data);
    }).error(function () {

    });
}