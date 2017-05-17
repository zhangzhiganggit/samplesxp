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
                                    信用卡限额修改-预览
                                </h5>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form id="searchForm" class="form-inline form-horizontal" action="startWrokFlow.do" method="post">
                                     		<input type="hidden" name="orderNo" value="${creditCardQuota.orderNo}">
                                     		<input type="hidden" name="sinQuNew" value="${creditCardQuota.sinQuNew}">
                                     		<input type="hidden" name="dayPubQuNew" value="${creditCardQuota.dayPubQuNew}">
                                     		<input type="hidden" name="industryCategories" value="${creditCardQuota.industryCategories}">
                                            <div class="  col-sm-12">
												<label class="control-label widget-color-normal5">
                                                    工单流水号:${creditCardQuota.processInstanceId}&nbsp;&nbsp;任务编号:${creditCardQuota.orderNo}&nbsp;&nbsp;当前步骤:${taskName}&nbsp;&nbsp;任务状态:${taskSts}
                                                </label>
                                                <h3 class="header smaller lighter green">商户信息</h3>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                    <div class="col-sm-8  no-padding"  >
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.mercId}" id="mercId" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.mercId}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户经营名称:</label>

                                                    <div class="col-sm-8  no-padding"  >
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.cprOperNm}" id="cprOperNm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.cprOperNm}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm  width-300px">

                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户注册名称:</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.cprRegNm}" id="cprRegNm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.cprRegNm}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm  width-300px">

                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户所属机构:</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.attrOrgNm}" id="attrOrgNm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.attrOrgNm}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >行业大类:</label>

                                                    <div class="col-sm-8  no-padding"  >
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.industryCategories}" id="industryCategories" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.industryCategories}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户MCC:</label>

                                                    <div class="col-sm-8  no-padding"  >
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.mccCd}" id="mccCd" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.mccCd}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm  width-300px">

                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户性质:</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.mercNature}" id="mercNature" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.mercNature}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm  width-300px">

                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >结算周期:</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.stmDay}" id="stmDay" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.stmDay}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >租凭合同进件:</label>

                                                    <div class="col-sm-8  no-padding"  >
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.leaseContractIncome}" id="leaseContractIncome" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.leaseContractIncome}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户拓展类型:</label>

                                                    <div class="col-sm-8  no-padding"  >
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.devType}" id="devType" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.devType}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >终端类型:</label>

                                                    <div class="col-sm-8  no-padding"  >
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.posType}" id="posType" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.posType}</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class=" col-sm-12">
                                                <h3 class="header smaller lighter green">原信用卡交易限额信息</h3>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >单笔交易限额:</label>

                                                    <div class="col-sm-8  no-padding"  >
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.sinQuCur}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.sinQuCur}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm  width-300px">

                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >日交易限额:</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.dayPubQuCur}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.dayPubQuCur}</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class=" col-sm-12">

                                                <h3 class="header smaller lighter green">新信用卡交易限额信息</h3>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >单笔交易限额:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.sinQuNew}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.sinQuNew}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm  width-300px">

                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >日交易限额:</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${creditCardQuota.mercId}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${creditCardQuota.dayPubQuNew}</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class=" col-sm-12">
                                                <h3 class="header smaller lighter green">图片信息</h3>
                                                <button class="btn btn-danger btn-sm" type="button" id="downloadAll">
					                            	<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
					                                	下载图片信息
					                            </button>
                                            </div>
                                            <%--我的意见区--%>
                                            <div class="col-sm-12">
                                            	<h3 class="header smaller lighter green">会签意见区</h3>
                                                <c:forEach var="fb" items="${feedbackList}">
                                                	<div class="form-group form-group-sm width-300px">
	                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >步骤名称:</label>
	
	                                                    <div class="col-sm-8  no-padding"  >
	                                                        <label class="form-control input-small width-200px   view-control  "
	                                                               data-content="${fb.taskName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                >${fb.taskName }</label>
	                                                    </div>
	                                                </div>
	                                                <div class="form-group form-group-sm  width-300px">
	
	                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >办理人:</label>
	                                                    <div class="col-sm-8  no-padding">
	                                                        <label class="form-control input-small width-200px   view-control  "
	                                                               data-content="${fb.userName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                >${fb.userName }</label>
	                                                    </div>
	                                                </div>
	
	                                                <div class="form-group form-group-sm  width-300px">
	
	                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >办理时间:</label>
	                                                    <div class="col-sm-8  no-padding">
	                                                        <label class="form-control input-small width-200px   view-control  "
	                                                               data-content="<fmt:formatDate value="${fb.editTime}" pattern="yyyy/MM/dd HH:mm:ss"/>" 
	                                                               data-placement="bottom" data-trigger="hover" data-rel="popover">
	                                                               <fmt:formatDate value="${fb.editTime}" pattern="yyyy/MM/dd HH:mm:ss"/></label>
	                                                    </div>
	                                                </div>
	
	                                                <div class="form-group form-group-sm  width-100">
	
	                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >处理意见:</label>
	                                                    <div class="col-sm-8  no-padding">
	                                                        <label class="form-control input-small   view-control  " style="width:540px;"
	                                                               data-content="${fb.content }" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                >${fb.content }</label>
	                                                    </div>
	                                                </div>
                                                </c:forEach>
                                            </div>
                                            <div class="row"></div>
                                                <input type="hidden" name="businessKey" id="businessKey" value="${task.businessKey }" >
	                                            <input type="hidden" name="procDefId" id="procDefId" value="${task.procDefId}" >
	                                            <input type="hidden" name="startDate" id="startDate" value="${task.startDate }" >
	                                            <input type="hidden" name="startDateDeadline" id="startDateDeadline" value="${task.startDateDeadline }" >
	                                            <input type="hidden" name="branchOrgUuid" id="branchOrgUuid" value="${task.branchOrgUuid }" >
	                                            <input type="hidden" name="starterAttrOrgNoB" id="starterAttrOrgNoB" value="${task.starterAttrOrgNo}" > 
	                                            <input type="hidden" name="agentLevel" id="agentLevel" value="${task.agentLevel }" >
	                                            <input type="hidden" name="agentRegionProv" id="agentRegionProv" value="${task.agentRegionProv}" >
	                                            <input type="hidden" name="agentRegionCity" id="agentRegionCity" value="${task.agentRegionCity}" >
	                                            <input type="hidden" name="taskStsB" id="taskStsB" value="${task.taskSts}" >
	                                            
	                                           
                                            <c:if test="${type == 'confirm'}">
                                            	<div class="form-actions center widget-color-normal5">
	                                                <button class="btn btn-danger btn-sm" type="submit">
	                                                    <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
	                                                    确认
	                                                </button>
	                                                <button class="btn  btn-sm" type="submit" onclick="returnEdit();">
	                                                    <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
	                                                    返回修改
	                                                </button>
                                            	</div>
                                            </c:if>
                                            <c:if test="${type != 'confirm'}">
                                                <div class="form-actions center widget-color-normal5">
                                                     <button class="btn btn-danger btn-sm" type="button"  onclick="goback()">
	                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
	                                                        返回
	                                                    </button>
                                                </div>
                                            </c:if>
                                        </form>
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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/imageUtil.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/creditCardQuota/creditCardQuota.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
<script type="text/javascript">
	
    $('.chosen-select').chosen({});
    $('[data-rel=popover]').popover({container:'body'});
    jQuery(function($) {
    	if(${type != 'confirm'}){
    		ajaxMercInfoForView();
    	}
        

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
        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });



        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        })
//show datepicker when clicking on the icon
                .next().on(ace.click_event, function(){
                    $(this).prev().focus();
                });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true});
//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
        /* $('input[name=date-range-picker]').daterangepicker({
            'applyClass' : 'btn-sm btn-success',
            'cancelClass' : 'btn-sm btn-default',
            locale: {
                applyLabel: 'Apply',
                cancelLabel: 'Cancel',
            }
        })
                .prev().on(ace.click_event, function(){
                    $(this).next().focus();
                }); */
        /* $('#timepicker1').timepicker({
            minuteStep: 1,
            showSeconds: true,
            showMeridian: false
        }).next().on(ace.click_event, function(){
            $(this).prev().focus();
        });
        $('#date-timepicker1').datetimepicker().next().on(ace.click_event, function(){
            $(this).prev().focus();
        }); */


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
        //$('#sidebar').addClass('compact');
    });
    function returnEdit(){
    	$('#searchForm').attr('action','creditCardIndex.do?type=update');
    	return true;
    }
</script>
</body>
</html>











