<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../../layout/common.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
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
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        缴费流水查询条件
                                    </h5>
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                             <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/simCardPayLog/list.do" id="searchForm" method="POST">
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" id="isFirstLoad" name="isFirstLoad" value="false" />
												<input type="hidden" name="begin" id="begin" value="${begin }">
												<input type="hidden" name="end" id="end" value="${end}" >
                                                <div class=" col-xs-12">

													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >缴费流水号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="onlinePayNo" id="onlinePayNo" value="${simCardPay.onlinePayNo}" class="form-control input-small width-200px"  >
                                                        </div>
                                                    </div>
  
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >缴费日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="payTimeStart" id="payTimeStart" value="${simCardPay.payTimeStart}" class="input-small form-control date-picker" onchange="changeDateStart()" readonly>
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="payTimeEnd" id="payTimeEnd" value="${simCardPay.payTimeEnd}" class="input-small form-control date-picker" onchange="changeDateEnd()" readonly>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit" onclick="return checkForm();" id="searchMobBtn">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="resetSearchForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        缴费流水查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width: 8%">缴费流水编号</th>
                                                <th style="text-align:center;width: 8%">缴费日期</th>
                                                <th style="text-align:center;width: 10%">缴费方式</th>
                                                <th style="text-align:center;width: 7%">缴费金额</th>
                                                <th style="text-align:center;width: 7%">数量</th>
                                                <th style="text-align:center;width: 7%">缴费人</th>
                                                <th style="text-align:center;width: 15%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach items="${payList}" var="simCard" varStatus="status">
													<tr>
														<td style="text-align:left">${simCard.onlinePayNo}</td>
														<td style="text-align:center">${simCard.payTime}</td>
														<td style="text-align:center">
														   <c:if test="${simCard.payType == '01' }">在线支付</c:if>
														</td>
														<td style="text-align:right" class="numberPointFormatForText">${simCard.payAmount}</td>
														<td style="text-align:right" >${simCard.payNum}</td>
														<td style="text-align:left" >${simCard.operatorNm}</td>
														<td>
															<a href="javaScript:openIframe('${simCard.onlinePayNo}')" class="blue">查看</a>
														</td>
													</tr>
												</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row col-sm-12    ">
                            <div class="col-sm-4 hidden-480 left">
                            	<label class="dataTables_info " id="dynamic-table_info"
									role="status" aria-live="polite"></label>
                               </div>

                                <div class="col-sm-8 right">
                                    <%@include file="../../layout/pagination.jsp" %>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- /.main-content -->
    </div><!-- /.main-container -->

    <%@include file="../../layout/common.js.jsp"%>
    
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    $('.chosen-select').chosen({});
        jQuery(function($) {

        $('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                firstName: {
                    validators: {
                        notEmpty: {},
                        stringCase: {
                            'case': 'upper'
                        }
                    }
                }
            }
        });

        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        })
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});

    })
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        
    function openIframe(onlinePayNo){
    	var href = '<%=request.getContextPath() %>/simCardPayLog/detail.do?onlinePayNo='+onlinePayNo;
    	
    	$.fancybox.open({
			href : href,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: 900,
            height: 500,
	        autoSize: false,
            helpers:{
            	overlay:{
            		closeClick:false
            	}
            },
			afterClose:function(){
					reloadParent();
			}
		});
    }
 
    function resetSearchForm(){
    	var begin=$("#begin").val();
		var end=$("#end").val();
      	 $("#onlinePayNo").val('');
      	 $("#onlinePayNo").trigger("chosen:updated");
      	 $("#payTimeStart").val(begin);
     	 $("#payTimeStart").trigger("chosen:updated");
     	 $("#payTimeEnd").val(end);
     	 $("#payTimeEnd").trigger("chosen:updated");
      }
  //校验订单时间规则
    function changeDateStart(){
 		 var operTimeStart=Number($("#payTimeStart").val().replace(/-/g,''));
 		 var operTimeEnd=Number($("#payTimeEnd").val().replace(/-/g,''));
 		 if(operTimeEnd!=0){
 			 if(operTimeStart>operTimeEnd){
 				 $("#payTimeEnd").val($("#payTimeStart").val());
 			 }
 		 }
 	 }
 	 function changeDateEnd(){
 		 var operTimeStart=Number($("#payTimeStart").val().replace(/-/g,''));
 		 var operTimeEnd=Number($("#payTimeEnd").val().replace(/-/g,''));
 		 if(operTimeStart!=0){
 			 if(operTimeStart>operTimeEnd){
 				 $("#payTimeStart").val($("#payTimeEnd").val());
 			 }
 		 }
 	 }
 	function checkForm(){
		 var start=$("#payTimeStart").val();
		 var end=$("#payTimeEnd").val(); 
		 if (start == null || start == ""){
			 alert("缴费日期为必填项！");
			 return false;
		 }
		 if (end == null || end == "") {
			 alert("缴费日期为必填项！");
			 return false;
		 }
		 if(GetDateRegion('payTimeEnd','payTimeStart')  >91){
			 alert("缴费日期查询跨度最长为3个月");
			 return false;
		 }
		 return true;
	 }
 	//计算相差天数
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
</script>
</body>
</html>