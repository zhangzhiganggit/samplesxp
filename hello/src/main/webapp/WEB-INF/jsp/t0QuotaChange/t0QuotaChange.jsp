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
                                        <form id="searchForm" class="form-inline form-horizontal" action="submitNext.do" method="post">
                                            <div class="  col-sm-12">
                                            	<input type="hidden" name="orderNo" value="${limitChange.orderNo}"/>
                                            	<input type="hidden" name="processInstanceId" value="${limitChange.processInstanceId}"/>
	                                        	<input type="hidden" name="taskId" value="${limitChange.taskId}"/>
	                                        	<input type="hidden" name="taskDefKey" value="${limitChange.taskDefKey}"/>
	                                        	<input type="hidden" name="mercId" value="${limitChange.mercId}"/>
	                                        	<input type="hidden" name="startUserId" value="${limitChange.startUserId}"/>
	                                        	<input type="hidden" name="starterAttrOrgNo" value="${limitChange.starterAttrOrgNo}"/>
	                                        	<input type="hidden" name="oldDayLimitAmt" value="${limitChange.oldDayLimitAmt}"/>
	                                        	<input type="hidden" name="dayLimitAmt" value="${limitChange.dayLimitAmt}"/>
	                                        	<label class="control-label widget-color-normal5">
                                                    工单流水号:${limitChange.processInstanceId}&nbsp;&nbsp;任务编号:${limitChange.orderNo}&nbsp;&nbsp;
                                                    当前步骤:<c:if test="${limitChange.taskDefKey == 'scDealTask'}">销售公司审批</c:if>
                                                    <c:if test="${limitChange.taskDefKey == 'riskDealTask'}">风险控制部审批</c:if>
                                                    &nbsp;&nbsp;任务状态:${taskSts}
                                                </label>	
                                                <h3 class="header smaller lighter green">商户随意通信息</h3>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                    <div class="col-sm-8  no-padding"  >
                                                    	<label class="form-control input-small width-200px   view-control  "
                                                        	data-content="${limitChange.mercSn}" id="mercSn" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                        >${limitChange.mercSn}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm  width-300px">

                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户名称:</label>
                                                    <div class="col-sm-8  no-padding">
                                                    	<label class="form-control input-small width-200px   view-control  "
                                                        	data-content="${limitChange.mercName}" id="mercName" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                        >${limitChange.mercName}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm  width-300px">

                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >业务状态:</label>
                                                    <div class="col-sm-8  no-padding">
	                                                    <div class="col-sm-8  no-padding">
	                                                    	<input type="hidden" name="stlSts" value="${limitChange.stlSts}">
	                                                    	<label class="form-control input-small width-200px   view-control  "
                                                        		data-content="" id="stlStsName" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                        	></label>
	                                                    </div>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >随意通业务规模</label>

                                                    <div class="col-sm-8  no-padding"  >
                                                    	<label class="form-control input-small width-200px   view-control  "
                                                        	data-content="${limitChange.oldDayLimitAmt}" id="oldDayLimitAmt" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                        >${limitChange.oldDayLimitAmt}</label>
                                                    </div>
                                                </div>

                                                <div class="form-group form-group-sm  width-300px">

                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >申请限额:</label>
                                                    <div class="col-sm-8  no-padding">
                                                    	<label class="form-control input-small width-200px   view-control  "
                                                        	data-content="${limitChange.dayLimitAmt}" id="dayLimitAmt" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                        >${limitChange.dayLimitAmt}</label>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class=" col-sm-12" id="scInfo">
                                                <h3 class="header smaller lighter green">销售公司审批意见</h3>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否审批通过:</label>
                                                    <div class="col-sm-8  no-padding "  >
                                                    	<c:if test="${limitChange.taskDefKey == 'scDealTask'}">
                                                    		<select data-placeholder="请选择" id="form-field-select-3" name="scIsSatisfied" class="chosen-select form-control width-48">
	                                                            <option value="1">是</option>
																<option value="0">否</option>
	                                                        </select>
                                                    	</c:if>
                                                        <c:if test="${limitChange.taskDefKey != 'scDealTask'}">
                                                    		<label class="form-control input-small width-200px   view-control  "
	                                                        	data-content="<c:if test="${limitChange.scIsSatisfied == 1}">是</c:if><c:if test="${limitChange.scIsSatisfied == 0}">否</c:if>" id="dayLimitAmt" data-placement="bottom" data-trigger="hover" data-rel="popover"
		                                                        ><c:if test="${limitChange.scIsSatisfied == 1}">是</c:if><c:if test="${limitChange.scIsSatisfied == 0}">否</c:if></label>
                                                    	</c:if>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-100">
                                                    <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >意见*:</label>
                                                    <div class="col-sm-8 no-padding">
                                                    	<c:if test="${limitChange.taskDefKey == 'scDealTask'}">
                                                    		<textarea id="form-field-9" name="scOpinion" style="height:80px"  class="form-control limited input-small width-100">${limitChange.scOpinion}</textarea>
                                                    	</c:if>
                                                        <c:if test="${limitChange.taskDefKey != 'scDealTask'}">
                                                    		<label class="form-control input-small   view-control  " style="width:540px;"
		                                                               data-content="${limitChange.scOpinion }" data-placement="bottom" data-trigger="hover" data-rel="popover"
		                                                                >${limitChange.scOpinion }</label>
                                                    	</c:if>                                                 
                                                    </div>
                                                </div>
                                            </div>

											<div class=" col-sm-12" id="riskInfo">
                                                <h3 class="header smaller lighter green">风险管理部审批意见</h3>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否审批通过:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                        <select data-placeholder="请选择" id="form-field-select-3" name="riskIsSatisfied" class="chosen-select form-control width-48">
                                                        	<c:if test="${limitChange.taskDefKey == 'scDealTask'}">
                                                        		<option value="" selected="selected"></option>
                                                        	</c:if>
                                                            <option value="1">是</option>
															<option value="0">否</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-100">
                                                    <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >意见*:</label>

                                                    <div class="col-sm-8 no-padding">
                                                        <textarea id="form-field-9" name="riskOpinion" style="height:80px"  class="form-control limited input-small width-100">${limitChange.riskOpinion}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--我的意见区--%>
                                            <div class=" col-sm-12">
                                                <h3 class="header smaller lighter green">会签意见区</h3>
                                                <div class="form-group form-group-sm width-100">
                                                    <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >意见*:</label>
                                                    <div class="col-sm-8 no-padding">
                                                        <textarea id="form-field-9" name="opinion" style="height:80px"  class="form-control limited input-small width-100"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${limitChange.taskDefKey != 'createForm'}">
                                            	<div class=" col-sm-12">
	                                                <h3 class="header smaller lighter green">会签意见记录</h3>
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
                                            </c:if>
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
                                            <div class="form-actions center widget-color-normal5">
                                            <input type="submit" id="suiyitongSubmit" value="Submit" hidden="hidden">
                                                <button class="btn btn-danger btn-sm" type="button" onclick="submitNext()" >
                                                    <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                    提交下一步
                                                </button>
                                                <!-- <button class="btn  btn-sm" type="submit">
                                                    <span class="ace-icon fa icon-on-right bigger-110"></span>
                                                    关闭
                                                </button> -->
                                            </div>
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
<script type="text/javascript">
	function submitNext(){
		if(!confirm("是否确认下一步")){
			return ;
		}
		$("#suiyitongSubmit").click();
	}

    $('.chosen-select').chosen({});
    $('[data-rel=popover]').popover({container:'body'});
    jQuery(function($) {
    	var stlSts = $("[name='stlSts']").val();
    	var stlStsName = "";
    	if(stlSts == '00')
    		stlStsName = "关闭";
    	else if(stlSts == '01')
    		stlStsName = "正常";
    	else if(stlSts == '02')
    		stlStsName = "暂停";
    	else if(stlSts == '03')
    		stlStsName = "待开通";
    	else if(stlSts == '09')
    		stlStsName = "从未开通过";
    	$("#stlStsName").html(stlStsName);
    	$("#stlStsName").attr('data-content',stlStsName);
    	if('${limitChange.taskDefKey}' == 'scDealTask'){
    		$("#riskInfo").attr("style","display:none;");
    		if('${limitChange.scIsSatisfied}' != null &&'${limitChange.scIsSatisfied}' != '')
    			$("[name='scIsSatisfied']").val('${limitChange.scIsSatisfied}');
    	}else if('${limitChange.taskDefKey}' == 'riskDealTask'){
    		$("[name='scIsSatisfied']").val('${limitChange.scIsSatisfied}');
    		if('${limitChange.riskIsSatisfied}' != null &&'${limitChange.riskIsSatisfied}' != '')
    		$("[name='riskIsSatisfied']").val('${limitChange.riskIsSatisfied}');
    	}
        $('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	scOpinion: {
                    validators: {
                    	notEmpty: {},
                        stringLength: {
                        	max : 200
                        }
                    }
                },
                riskOpinion: {
                    validators: {
                    	notEmpty: {},
                        stringLength: {
                        	max : 200
                        }
                    }
                },
                opinion: {
                    validators: {
                    	notEmpty: {},
                        stringLength: {
                        	max : 200
                        }
                    }
                }
            }
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



    })
</script>
</body>
</html>











