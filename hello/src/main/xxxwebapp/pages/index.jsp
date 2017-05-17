<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta charset="utf-8" />
  <title>随行付 Admin</title>
  <%@include file="layout/common.jsp"%>
  <!--  <script src="js/task/task.js"></script>-->
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
    var agent = navigator.userAgent.toLowerCase();
  })











/**<body>
   <P> HELLO WORLD </P>
   <table>
   <c:forEach items="${PersionList}" var="unIn"  varStatus="status">
    <tr>
        <td style="text-align:center;">${unIn.id}</td>
        <td style="text-align:center;">${unIn.name}</td>
        <td style="text-align:center;">${unIn.sex}</td>
        <td style="text-align:center;">${unIn.fav}</td>
    </tr>
    </table>
</c:forEach> 
</body>
</html>*/