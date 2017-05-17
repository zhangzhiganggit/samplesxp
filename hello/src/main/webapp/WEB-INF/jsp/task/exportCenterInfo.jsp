<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
</head>

<body class="no-skin ">

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

                <div class="page-content ">

                    <div class="row" >

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        导出审单登记信息页面
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" method="post"  action="<%=base%>task/exportCenterInfo.do">
                                            
                                                <div class="col-sm-12">

                                                    <div class="form-group form-group-sm  width-100 ">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >审核日期:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <div class="input-daterange input-group width-100">
                                                                <input type="text" id="openStartTm" name="dateStart" onchange="dateChange()" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="openEndTm" name="dateEnd"  onchange="dateChange()" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-100  " >

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >任务类型:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<div class=" input-group width-100" style="height: 30px;line-height: 30px;">
	                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="orderType" id="income" onchange="dateChange()" value="0" ><label for="income">商户录入流程</label>
	                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="orderType" id="update" onchange="dateChange()" value="1" ><label for="update">商户信息变更流程</label>
	                                                        </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-sm-12">
                                                    <table class="table">
                                                       
                                                    </table>
                                                </div>


                                                <div class="row"></div>
                                                <button class="btn btn-danger btn-sm" type="submit" id="hiddenSubmit" style="display: none;" >
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        确认
                                                    </button>
                                                </form>
                                                <div class="form-actions center widget-color-normal5">
                                                	
                                                    <button class="btn btn-danger btn-sm" type="button"  id='addButton' onclick="checkbutton()" >
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        确认
                                                    </button>
                                                    <button class="btn  btn-sm" type="button" onclick="window.parent.$.fancybox.close();">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                        关闭
                                                    </button>
                                                </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>



            </div>
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

<!-- basic scripts -->

    <%@include file="../layout/common.js.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    function dateChange(){
    	$("#hiddenSubmit").attr("class","btn btn-danger btn-sm")
		document.getElementById("hiddenSubmit").disabled = undefined;
    	$("#addButton").attr("class","btn btn-danger btn-sm")
		document.getElementById("addButton").disabled = undefined;
    }
    function getDateStr(){
    	var now = new Date();
    	var year = now.getFullYear(); //getFullYear getYear
        var month = now.getMonth()+1;
        var date = now.getDate();
        if (month < 10) month = "0" + month;
        if (date < 10) date = "0" + date;
        return year+"-"+month+"-"+date;
    }
    function GetDateRegion(BeginDate,EndDate){
    	var aDate, oDate1, oDate2, iDays;
    	var sDate1=document.getElementById(BeginDate).value;   
        var sDate2=document.getElementById(EndDate).value;              
       	aDate = sDate1.split("-");
       	oDate1 = new Date(aDate[1] + '/' + aDate[2] + '/' + aDate[0]);   
       	aDate = sDate2.split("-");
       	oDate2 = new Date(aDate[1] + '/' + aDate[2] + '/' + aDate[0]);
       	var i=(oDate1 - oDate2) / 1000 / 60 / 60 /24;
       	if(i<0){
    		i-=1;
	    }else{
	    	i+=1;
	    }
	    iDays = i;   
		return iDays;
	}
    
    $("#openStartTm").val(getDateStr());
    $("#openEndTm").val(getDateStr());
    $("#income").attr("checked",'true');
    $("#update").attr("checked",'true');

    $('.main-content .chosen-select').chosen({});
    
    function checkbutton(){
    	if($("#openStartTm").val()=='' || $("#openEndTm").val()=='' ){
    		alert("审核日期不能为空");
    	}else if(GetDateRegion('openEndTm','openStartTm')  >31){
    		alert("审核日期查询跨度最长为31天");
    	}else if(!document.getElementById("income").checked  && !document.getElementById("update").checked ){
			alert("至少选择一种流程")
		}else{
			$("#hiddenSubmit").click();
			$("#addButton").attr("class","btn btn-danger btn-sm disabled")
			document.getElementById("addButton").disabled = disabled;
			/* window.parent.$.fancybox.close(); */
		} 
    }
    
    jQuery(function($) {
		$('#searchForm').formValidation({
			message : 'This value is not valid',
			container : 'popover',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
			}
		}).on('success.form.fv', function(e) {
           
       });

        $('.easy-pie-chart.percentage').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size/10),
                animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
                size: size
            });
        })

        $('.sparkline').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
            $(this).sparkline('html',
                {
                    tagValuesAttribute:'data-values',
                    type: 'bar',
                    barColor: barColor ,
                    chartRangeMin:$(this).data('min') || 0
                });
        });
        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        })
        $('.input-daterange').datepicker({autoclose:true});
        $(".fancybox-manual-b").click(function() {
            $.fancybox.open({
                href : 'detail.html',
                type : 'iframe',
                scrolling:'no',
                scrollOutside:false,
                model :true,
                minWidth:400,
                width:900,
                height:400,
                autoHeight:true,
                autoWidth:true,
                closeBtn:true,
                padding : 5
            });
        });
    })
</script>
</body>
</html>











