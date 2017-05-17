<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta charset="utf-8" />
  <title>高阳 Admin</title>
  <%@include file="layout/common.jsp"%>
  <script src="<%=request.getContextPath() %>/js/task/task.js"></script>
   <script type="text/javascript">
            jQuery(function($) {
                //刷新首页待办事项
                refreshTask();
                //获取公告列表
                $.ajax({
                  url: 'notice/mainList.do',
                  async:true,
                  cache: false,
                  success : function(data) {
                     $("#noticeMsg").html(data)
                  }
                });
                $.ajax({
                      url: 'tradeDaySumMec/frontList.do',
                      async:true,
                      cache: false,
                      success : function(data) {
                         $("#tradeSum").html(data);
                      }
                });
            
           }) 

        </script>
</head>

<body class="no-skin">
    <%@include file="layout/header.jsp"%>
    <div class="main-container" id="main-container" >
          <%--<script type="text/javascript">--%>
            <%--try{ace.settings.check('main-container' , 'fixed')}catch(e){}--%>
          <%--</script>--%>
          <%@include file="layout/menu.jsp"%>
          <div class="main-content">
              <div class="main-content-inner">

                <div id="breadcrumbs" class="breadcrumbs">
                  <script type="text/javascript">
                    try{
                      ace.settings.check('breadcrumbs' , 'fixed');
                      ace.settings.breadcrumbs_fixed(null, true);

                    }catch(e){}
                  </script>

                  <ul id="mainTab" class="nav nav-tabs padding-12 tab-color-blue background-blue">
                    <li class="active">
                      <a href="#tab0" data-toggle="tab" aria-expanded="true">首页</a>
                    </li>
                  </ul>
                </div>

                <div class="page-content  ">
                  <div id="myTabContent" class="tab-content no-padding no-border">
                    <div class="tab-pane active" id="tab0">
                       <%@include file="_main.jsp"%>  
                     <H1>欢迎登录</H1>
                    </div>

                  </div>




              </div><!-- /.page-content -->

              </div><!-- /.main-content -->


          </div>
            <%@include file="layout/footer.jsp"%>
    </div><!-- /.main-container -->

    <!-- basic scripts -->

    <%@include file="layout/common.js.jsp"%>

  <!-- inline scripts related to this page -->
  <script type="text/javascript">

  jQuery(function($) {




    //flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
    //but sometimes it brings up errors with normal resize event handlers
    $.resize.throttleWindow = false;







    var d1 = [];
    for (var i = 0; i < Math.PI * 2; i += 0.5) {
      d1.push([i, Math.sin(i)]);
    }

    var d2 = [];
    for (var i = 0; i < Math.PI * 2; i += 0.5) {
      d2.push([i, Math.cos(i)]);
    }




    var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
    $.plot("#sales-charts", [
      { label: "交易量1", data: d1 },
      { label: "交易量2", data: d2 }
    ], {
      hoverable: true,
      shadowSize: 0,
      series: {
        lines: { show: true },
        points: { show: true }
      },
      xaxis: {
        tickLength: 0
      },
      yaxis: {
        ticks: 10,
        min: -2,
        max: 2,
        tickDecimals: 3
      },
      grid: {
        backgroundColor: { colors: [ "#fff", "#fff" ] },
        borderWidth: 1,
        borderColor:'#555'
      }
    });





    $('.dialogs,.comments').ace_scroll({
      size: 300
    });

    var count = 0;

    $(".hover a").click(function(e){

      var a = this ;
      var b ;
      
      if($(a).attr('class') &&  $(a).attr('class').indexOf('dropdown-toggle') >=0){
          return false ;
      }
      
      $($("#mainTab a").each(function(){
          console.info($(this).html());
          console.info($(a).html());
          if($(this).html().indexOf($(a).html()) >=0 ) b = this ;
      }));

      if(b) {
        $(b).click();
        return false ;
      }
      count++;
      if($(this).attr("id")=='noticeMore'){
          var notice=0;
          $("a[data-toggle='tab']").each(function(){
              if($(this).attr("id")=='公告管理'){
                 notice+=1;
              }
          });
          if(notice<1){
              var li = $('<li > <a href="#tab'+count+'" data-toggle="tab" aria-expanded="false" id="公告管理">'+
                      '公告管理'+'<i class="ace-icon fa fa-times close " style="cursor:pointer"></i></a></li>');  
          }
      }else{
          var li = $('<li > <a href="#tab'+count+'" data-toggle="tab" aria-expanded="false">'+
                  $(this).html()+'<i class="ace-icon fa fa-times close " style="cursor:pointer"></i></a></li>');
      }
      
      $("#mainTab").append(li);

      if($("#mainTab").height() != 34 && $("#mainTab").height() != 37){
        li.remove();
        return false;
      }

      var html = $('<div class="tab-pane  no-padding" id="tab'+count +'"><iframe  class="col-sm-12 no-border no-padding" src=""></iframe> </div>');
      html.find("iframe").height($(window).height() *0.8);
      $("#myTabContent").append(html);
      html.find("iframe").attr("src",this.href);
      li.find(".close").click(function(){
        li.remove();
        html.remove();
        $($("#mainTab a")[$("#mainTab li").length -1]).click();
      });
      $($("#mainTab a")[$("#mainTab li").length -1]).click();
      console.info($(this).html());
      return false ;
    });







    //Android's default browser somehow is confused when tapping on label which will lead to dragging the task
    //so disable dragging when clicking on label
    var agent = navigator.userAgent.toLowerCase();
//    if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
//      $('#tasks').on('touchstart', function(e){
//        var li = $(e.target).closest('#tasks li');
//        if(li.length == 0)return;
//        var label = li.find('label.inline').get(0);
//        if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
//      });
//
//    $('#tasks').sortable({
//              opacity:0.8,
//              revert:true,
//              forceHelperSize:true,
//              placeholder: 'draggable-placeholder',
//              forcePlaceholderSize:true,
//              tolerance:'pointer',
//              stop: function( event, ui ) {
//                //just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
//                $(ui.item).css('z-index', 'auto');
//              }
//            }
//    );
//    $('#tasks').disableSelection();
//    $('#tasks input:checkbox').removeAttr('checked').on('click', function(){
//      if(this.checked) $(this).closest('li').addClass('selected');
//      else $(this).closest('li').removeClass('selected');
//    });


    //show the dropdowns on top or bottom depending on window height and menu position
//    $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
//      var offset = $(this).offset();
//
//      var $w = $(window)
//      if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
//        $(this).addClass('dropup');
//      else $(this).removeClass('dropup');
//    });




  })
</script>
</body>
</html>

