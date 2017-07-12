/**
 * 侧边栏
 */
function hideSidebar() {
    $(".page-content-wrapper .page-content").css("margin-left", "0");
    $("div.page-sidebar > ul").hide();
    // $('body').removeClass('page-sidebar-fixed'); //解除侧边栏固定
    $("body").attr("class", "page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md");
}

function showSidebar() {
    $(".page-content-wrapper .page-content").css("margin-left", "235px");
    $("div.page-sidebar > ul").show();
    // $('body').addClass('page-sidebar-fixed');// 侧边栏固定
    $("body").attr("class", 'page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md');
}