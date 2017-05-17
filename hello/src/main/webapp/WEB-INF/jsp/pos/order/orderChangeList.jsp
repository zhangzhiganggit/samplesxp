<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title>

    <%@include file="../../layout/common.jsp"%>
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
                                        订单改价查询条件
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


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/orderChange/queryOrderList.do" id="searchForm" method="POST">
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" id="isFirstLoad" name="isFirstLoad" value="false" />
												<input type="hidden" name="begin" id="begin" value="${begin }">
												<input type="hidden" name="end" id="end" value="${end}" >
                                                <div class=" col-xs-12">

													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >订单编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="goodsOrderId" id="goodsOrderId" value="${goodsOrder.goodsOrderId }" class="form-control input-small width-200px" onkeyup="this.value=this.value.replace(/[^+\d]/g,'')" >
                                                        </div>
                                                    </div>
  
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >订单日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="begInputDate" id="begInputDate" value="${goodsOrder.begInputDate }" class="input-small form-control date-picker" onchange="changeDateStart()" readonly>
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="endInputDate" id="endInputDate" value="${goodsOrder.endInputDate }" class="input-small form-control date-picker" onchange="changeDateEnd()" readonly>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit" onclick="return checkForm();" id="searchMobBtn">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="resetSearchForm()">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
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
                                        订单改价查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width:8%">订单编号 </th>
                                                <th style="text-align:center;width:8%">订单应收金额 </th>
                                                <th style="text-align:center;width:8%">订单实收金额 </th>
                                                <th style="text-align:center;width:8%">调整后金额</th>
                                                <th style="text-align:center;width:8%">调整金额</th>
                                                <th style="text-align:center;width:8%">物品数量</th>
                                                <th style="text-align:center;width:8%">订单状态</th>
                                                <th style="text-align:center;width:8%">订单创建日期</th>
                                                <th style="text-align:center;width:8%">收货人</th>
                                                <th style="text-align:center;width:8%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach items="${goodsOrderlist}" var="goodsOrder"  varStatus="status">
												<tr>
													<td style="text-align:center;">${goodsOrder.goodsOrderId}</td>
													<td style="text-align:right;" class="numberPointFormatForText">${goodsOrder.payableAmount}</td>
													<td style="text-align:right;" class="numberPointFormatForText">${goodsOrder.paymentAmount}</td>
													<td style="text-align:right;" class="numberPointFormatForText">${goodsOrder.adjustmentAmount}</td>
													<td style="text-align:right;" class="numberPointFormatForText">${goodsOrder.adjustAmount}</td>
													<td style="text-align:right;">${goodsOrder.totalQuantity}</td>
													<td style="text-align:center;">待支付</td>
													<td style="text-align:center;">${goodsOrder.inputDate}</td>
													<td style="text-align:center;">${goodsOrder.contact}</td>
													<td style="text-align:center;">
									                     <div class="   action-buttons">
									                         <a href="javaScript:openIframe('${goodsOrder.goodsOrderId}')" class="blue">
									                             	修改
									                         </a>
									                     </div>
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
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});

    })    
    function openIframe(goodsOrderId){
    	var href = '<%=request.getContextPath() %>/orderChange/updateOrder.do?goodsOrderId='+goodsOrderId;
    	$.fancybox.open({
			href : href,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width() * 0.9,
            centerOnScroll:true,
            autoSize: true,
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
    
    function reloadParent(){
    	document.getElementById("searchForm").submit();
    }
    function resetSearchForm(){
    	var begin=$("#begin").val();
		var end=$("#end").val();
	   	 $(':input','#searchForm')  
	   	 .not(':button, :submit, :reset, :hidden')  
	   	 .val('')  
	   	 .removeAttr('checked')  
	   	 .removeAttr('selected'); 
		 $("#endInputDate").val(end);
    	 $("#endInputDate").trigger("chosen:updated");
    	 $("#begInputDate").val(begin);
    	 $("#begInputDate").trigger("chosen:updated");
    }
  //校验订单时间规则
   function changeDateStart(){
		 var operTimeStart=Number($("#begInputDate").val().replace(/-/g,''));
		 var operTimeEnd=Number($("#endInputDate").val().replace(/-/g,''));
		 if(operTimeEnd!=0){
			 if(operTimeStart>operTimeEnd){
				 $("#endInputDate").val($("#begInputDate").val());
			 }
		 }
	 }
	 function changeDateEnd(){
		 var operTimeStart=Number($("#begInputDate").val().replace(/-/g,''));
		 var operTimeEnd=Number($("#endInputDate").val().replace(/-/g,''));
		 if(operTimeStart!=0){
			 if(operTimeStart>operTimeEnd){
				 $("#begInputDate").val($("#endInputDate").val());
			 }
		 }
	 }
	 function checkForm(){
		 var start=$("#begInputDate").val();
		 var end=$("#endInputDate").val(); 
		 if (start == null || start == ""){
			 alert("订单日期为必填项！");
			 return false;
		 }
		 if (end == null || end == "") {
			 alert("订单日期为必填项！");
			 return false;
		 }
		 return true;
	 }
</script>
</body>
</html>











