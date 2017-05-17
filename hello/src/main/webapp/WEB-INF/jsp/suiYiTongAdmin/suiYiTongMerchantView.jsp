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
                                    商户随意通业务限额修改
                                </h5>

                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form id="searchForm" class="form-inline form-horizontal" action="submitNext.do">
                                            <div class="  col-sm-12">
	                                        	<label class="control-label widget-color-normal5">
                                                    任务编号 : ${suiYiTongMerchantDetail.flowNo}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    当前状态 : <c:if test="${suiYiTongMerchantDetail.flowStatus == '1' }">待审核</c:if>
                                                    <c:if test="${suiYiTongMerchantDetail.flowStatus == '2' }">审核通过</c:if>
                                                    <c:if test="${suiYiTongMerchantDetail.flowStatus == '3' }">审核不通过</c:if>
                                                </label>
                                                <h3 class="header smaller lighter green">商户随意通信息</h3>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                    	<label class="form-control input-small width-200px   view-control  "
                                                               data-content="${suiYiTongMerchantDetail.merchantCode}" id="mercSn" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${suiYiTongMerchantDetail.merchantCode }</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm  width-300px">

                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >签购单名称:</label>
                                                    <div class="col-sm-8  no-padding">
                                                    	<label class="form-control input-small width-200px   view-control  "
                                                              data-content="${suiYiTongMerchantDetail.receiptsName }" id="mercName" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                               >${suiYiTongMerchantDetail.receiptsName }</label>
                                                    </div>
                                                </div>
                                              
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >当前额度</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                    	<label class="form-control input-small width-200px   view-control  "
                                                               data-content="${suiYiTongMerchantDetail.currentAmount}" id="oldDayLimitAmt" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${suiYiTongMerchantDetail.currentAmount }</label>
                                                    </div>
                                                </div>

                                                <div class="form-group form-group-sm  width-300px">
                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >申请限额:</label>
                                                    <div class="col-sm-8  no-padding">
                                                    	<label class="form-control input-small width-200px   view-control  "
                                                               data-content="${suiYiTongMerchantDetail.applyAmount}" id="dayLimitAmt" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${suiYiTongMerchantDetail.applyAmount}</label>
                                                    </div>
                                                </div>

                                            </div>

                                            <c:if test="${suiYiTongMerchantDetail.flowStatus == '2' || suiYiTongMerchantDetail.flowStatus == '3' }">
                                            	<div class=" col-sm-12">
	                                                <h3 class="header smaller lighter green">会签意见</h3>
	                                                <%-- <c:forEach var="fb" items="${feedbackList}"> --%>
		                                                <div class="form-group form-group-sm  width-300px">
		                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >办理人:</label>
		                                                    <div class="col-sm-8  no-padding">
		                                                        <label class="form-control input-small width-200px   view-control  "
		                                                               data-content="${suiYiTongMerchantDetail.transactor }" data-placement="bottom" data-trigger="hover" data-rel="popover"
		                                                                >${suiYiTongMerchantDetail.transactor }</label>
		                                                    </div>
		                                                </div>
		                                                <div class="form-group form-group-sm  width-300px">
		                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >办理时间:</label>
		                                                    <div class="col-sm-8  no-padding">
		                                                        <label class="form-control input-small width-200px   view-control  "
		                                                               data-content="<fmt:formatDate value="${suiYiTongMerchantDetail.updateTime}" pattern="yyyy/MM/dd HH:mm:ss"/>" 
		                                                               data-placement="bottom" data-trigger="hover" data-rel="popover">
		                                                               <fmt:formatDate value="${suiYiTongMerchantDetail.updateTime}" pattern="yyyy/MM/dd HH:mm:ss"/></label>
		                                                    </div>
		                                                </div>
		                                                <div class="form-group form-group-sm  width-100">
		                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >处理意见:</label>
		                                                    <div class="col-sm-8  no-padding">
		                                                        <label class="form-control input-small   view-control  " style="width:540px;"
		                                                               data-content="${suiYiTongMerchantDetail.processingOpinion }" data-placement="bottom" data-trigger="hover" data-rel="popover"
		                                                                >${suiYiTongMerchantDetail.processingOpinion}</label>
		                                                    </div>
		                                                </div>
	                                                <%-- </c:forEach> --%>
	                                            </div>
                                            </c:if>
                                            <div class="row"></div>
	                                            <!-- <div class="form-actions center widget-color-normal5">
                                                     <button class="btn btn-danger btn-sm" type="button"  onclick="goback()">
	                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
	                                                        返回
	                                                    </button>
                                                </div> -->
                                            <!-- <div class="form-actions center widget-color-normal5">
                                                <button class="btn  btn-sm" type="button">
                                                    <span class="ace-icon fa icon-on-right bigger-110"></span>
                                                    关闭
                                                </button>
                                            </div> -->
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->
<%@include file="../layout/common.js.jsp"%>
<!-- inline scripts related to this page -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
<script type="text/javascript">

    jQuery(function($) {
    	
        })

      
</script>
</body>
</html>











