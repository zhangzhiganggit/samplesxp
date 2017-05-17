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
                                        调单流程处理
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="obtainingBillForm" class="form-inline form-horizontal" action="submitNext.do" method="post">
                                            	<input type="hidden" name="processInstanceId" value="${obtainingBill.processInstanceId}"/>
	                                        	<input type="hidden" name="orderNo" value="${obtainingBill.orderNo}"/>
	                                        	<input type="hidden" name="taskId" value="${obtainingBill.taskId}"/>
	                                        	<input type="hidden" name="taskDefKey" value="${obtainingBill.taskDefKey}"/>
	                                        	<input type="hidden" name="promoter" value="${obtainingBill.promoter}"/>
                                                <div class=" col-sm-12">
                                                	<label class="control-label widget-color-normal5">
	                                                    工单流水号:${obtainingBill.processInstanceId}&nbsp;&nbsp;任务编号:${obtainingBill.orderNo}&nbsp;&nbsp;当前步骤:${taskName}&nbsp;&nbsp;任务状态:${taskSts}
	                                                </label>
                                                    <h3 class="header smaller lighter green">工单信息</h3>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.orderNo}" id="orderNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.orderNo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >提出时间:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.startDate}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.startDate}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >提出人:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.promoter}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.promoter}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单业务类型:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="调单流程" id="busType" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >调单流程</label>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class=" col-sm-12">

                                                    <h3 class="header smaller lighter green">商户交易基本信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户编号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.mercSn}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.mercSn}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.mercName}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.mercName}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >对外经营名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.busName}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.busName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营业地址:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.busAddr}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.busAddr}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户电话:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.mercTel}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.mercTel}</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >拓展员名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.devOfficerName}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.devOfficerName}</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >拓展员编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.devOfficerNo}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.devOfficerNo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属机构:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.attrOrg}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.attrOrg}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属城市:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.attrCity}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.attrCity}</label>
                                                        </div>
                                                    </div>

                                                    <%-- <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属大区:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.attrRegional}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.attrRegional}</label>
                                                        </div>
                                                    </div> --%>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否直营:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${commonInfo.isStraightBattalion}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${commonInfo.isStraightBattalion}</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >批次号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.batchNo}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.batchNo}</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >流水号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.serialNo}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.serialNo}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >终端号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.trmSn}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.trmSn}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签购单名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.salesSlipName}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.salesSlipName}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户当前余额:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.mercBalance}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.mercBalance}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户账户状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.mercAccountState}" id="mercAccountState" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.mercAccountState}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.transactionState}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.transactionState}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否重复清算:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.isRepeatLiquidation}" id="isRepeatLiquidation" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.isRepeatLiquidation}</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">外部数据</h3>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >接收日期:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.receiveDate}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.receiveDate}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >类别:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.sort}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.sort}</label>
                                                        </div>
                                                    </div>
													<!--  
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >来源:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.source}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.source}</label>
                                                        </div>
                                                    </div>
                                                    -->

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >差错编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.errorNo}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.errorNo}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易卡号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.transCardNo}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.transCardNo}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易时间:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.transTime}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.transTime}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易金额:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.transAmount}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.transAmount}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易日期:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.transDate}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.transDate}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易类型:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.transType}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.transType}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >回复时限:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.replyLimit}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.replyLimit}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >要求:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.require}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.require}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >原因码:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${obtainingBill.reasonCode}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${obtainingBill.reasonCode}</label>
                                                        </div>
                                                    </div>




                                                </div>

                                                <%--我的意见区--%>
                                                <div class=" col-sm-12">
                                                    <h3 class="header smaller lighter green">城市/代理会签意见区</h3>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >意见*:</label>

                                                        <div class="col-sm-8 no-padding ">
                                                        	<label class="form-control input-small width-100   view-control  "
                                                               data-content="" id="cityAgentSign" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                ></label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class=" col-sm-12">
                                                    <h3 class="header smaller lighter green">提供资料类型</h3>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >意见*:</label>

                                                        <div class="col-sm-8 no-padding width-85">
                                                            <label>
                                                                <input type="checkbox" class="ace ace-checkbox-2" name="form-field-checkbox">
                                                                <span class="lbl"> 签购单</span>
                                                            </label>
                                                            <label>
                                                                <input type="checkbox" class="ace ace-checkbox-2" name="form-field-checkbox">
                                                                <span class="lbl"> 协查登记表</span>
                                                            </label>
                                                            <label>
                                                                <input type="checkbox" class="ace ace-checkbox-2" name="form-field-checkbox">
                                                                <span class="lbl"> 持卡人不拒付声明</span>
                                                            </label>
                                                            <label>
                                                                <input type="checkbox" class="ace ace-checkbox-2" name="form-field-checkbox">
                                                                <span class="lbl"> 录像</span>
                                                            </label>
                                                            <label>
                                                                <input type="checkbox" class="ace ace-checkbox-2" name="form-field-checkbox">
                                                                <span class="lbl"> 商户资料</span>
                                                            </label>

                                                            <label>
                                                                <input type="checkbox" class="ace ace-checkbox-2" name="form-field-checkbox">
                                                                <span class="lbl"> 其他交易凭证</span>
                                                            </label>

                                                            <label>
                                                                <input type="checkbox" class="ace ace-checkbox-2" name="form-field-checkbox">
                                                                <span class="lbl"> 未提供任何资料</span>
                                                            </label>

                                                            <label>
                                                                <input type="checkbox" class="ace ace-checkbox-2" name="form-field-checkbox">
                                                                <span class="lbl"> 持卡人交易银行卡正反面</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row"></div>
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
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/obtainingBill/obtainingBill.js"></script>
    <script type="text/javascript">

    $('.chosen-select').chosen({});
    $('[data-rel=popover]').popover({container:'body'});
</script>
</body>
</html>











