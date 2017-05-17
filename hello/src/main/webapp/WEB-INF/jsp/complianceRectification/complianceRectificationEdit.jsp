<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Front</title>

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
                                        ${taskName }
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="compRecForm" class="form-inline form-horizontal" action="submitNext.do" method="post">
                                            	<input type="hidden" name="orderNo" value="${compRec.orderNo}">
	                                        	<input type="hidden" name="processInstanceId" value="${compRec.processInstanceId}"/>
	                                        	<input type="hidden" name="taskId" value="${compRec.taskId}"/>
	                                        	<input type="hidden" name="taskDefKey" id="taskDefKey" value="${compRec.taskDefKey}"/>
	                                        	<input type="hidden" name="starterAttrOrgNo" value="${compRec.starterAttrOrgNo}"/>
                                                <div class=" col-xs-12">
                                                	<label class="control-label widget-color-normal5">
                                                		流水号:${compRec.processInstanceId}&nbsp;&nbsp;任务编号:${compRec.orderNo }&nbsp;&nbsp;当前步骤名称: ${taskName }&nbsp;&nbsp;任务状态:${taskSts }
                                                	</label><br />
                                                    <h3 class="header smaller lighter green">基本信息</h3>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.mercId}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.mercId}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户名称*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.mercBusName}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.mercBusName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户类型*:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  " id="mercType"
                                                                   data-content="${compRec.mercType}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.mercType}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册名称*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.mercRegNm}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.mercRegNm}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册登记号*:</label>
														<div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.regNo}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.regNo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册地址*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.regAddr}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.regAddr}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >经营概述*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.descBiz}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.descBiz}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营业地址*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.busAddr}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.busAddr}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联系电话*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.telNo}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.telNo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >业务员名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.busManName}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.busManName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >MCC*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.mccCd}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.mccCd}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属机构*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.mercAttrOrgName}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.mercAttrOrgName}</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">

                                                    <h3 class="header smaller lighter green">商户违规信息</h3>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >违规类型*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.lllegalType}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.lllegalType}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >回复时间*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.repeatTime}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.repeatTime}</label>
                                                        </div>
                                                    </div>

                                                    <%-- <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易笔数*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.dealCount}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.dealCount}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易金额总额*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${compRec.dealAmountCount}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${compRec.dealAmountCount}</label>
                                                        </div>
                                                    </div> --%>
                                                </div>
                                                <div class="col-sm-12">

                                                    <h3 class="header smaller lighter green">代理商处理结果</h3>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >合规整改结果*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                                  data-content="" id="crResult" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                   >${compRec.crResult}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-100">
	                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >备注*:</label>
	                                                    <div class="col-sm-8  no-padding">
	                                                        <label class="form-control input-small   view-control  " style="width:540px;"
	                                                               data-content="${compRec.remarkAgent}" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                >${compRec.remarkAgent}</label>
	                                                    </div>
	                                                </div>
                                                </div>
                                                <div class="col-sm-12" style="display:none" id="downloadImageDiv">
                                                	<h3 class="header smaller lighter green">图片信息</h3>
                                                    <button class="btn btn-danger btn-sm" type="button" id="downloadAll">
                   					                    <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                   						下载图片信息
				                                    </button>
                                                </div>
                                                <div id="cityRemark">
                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">城市处理</h3>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left">备注*:</label>
                                                        <div class="col-sm-8 no-padding">
                                                            <textarea name="remarkCity" id="form-field-9" style="height:80px" class="form-control limited input-small width-100">${compRec.remarkCity}</textarea>
                                                        </div>
                                                    </div>

                                                </div>
                                                </div>
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
                                                <%--我的意见区--%>
                                                <div class=" col-sm-12">
                                                    <h3 class="header smaller lighter green">会签意见区</h3>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >意见<span style="color:red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                      		<textarea  name="opinion" id="form-field-9" style="height:80px"  class="form-control limited input-small width-100"></textarea>
                                                        </div>
                                                    </div>
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
                                                <div class="form-actions center widget-color-normal5">
                                                <input type="submit" id="rectificatSubmit" value="Submit" hidden="hidden">
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="rectificatNext()">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        下一步
                                                    </button>
                                                    <!-- <button class="btn  btn-sm" type="submit">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
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
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

<!-- basic scripts -->
    <%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/complianceRectification/compRec.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/imageUtil.js"></script>
    <script type="text/javascript">
	function rectificatNext(){
		if(!confirm("是否确认下一步")){
			return ;
		}
		$("#rectificatSubmit").click();
	}
    $('.chosen-select').chosen({});
    $('[data-rel=popover]').popover({container:'body'});
</script>
</body>
</html>











