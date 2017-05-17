<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
    <!-- -图片插件css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/viewer/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/viewer/assets/css/viewer.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/contextmenu/jquery.contextmenu.css">
	<style>
		.image_ul{overflow:hidden;width:100%;}
		.image_li{width:20%;float:left;list-style:none;}
	</style>
</head>
<script type="text/javascript">
//下载历史图片
function downloadAll(historyId){
	if(Number(historyId)){
		 location.href="<%=base%>mercIncome/downloadAllHistoryImages?historyId="+historyId;
	 }else{
		//兼容以前的图片下载
		location.href="<%=base%>mercIncome/downloadAllImages.do?taskCode=${mercIncome.orderNo}";
	}
	
}
</script>

<c:if test="${pbCheck ==false }">
<body class="no-skin">
</c:if>
<c:if test="${pbCheck ==true }">
<body class="no-skin" oncopy="alert('本页面内容不允许被复制');return false" >
</c:if>
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
                                        ${taskName}-预览   
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="mercInfoForm" class="form-inline form-horizontal" action="ZZZ" method="post">
                                            	<input type="hidden" name="orgNo" value="${mercIncome.orgNo}">
                                            	<input type="hidden" name="orderNo" id="orderNo" value="${mercIncome.orderNo}">
	                                        	<input type="hidden" name="processInstanceId" value="${mercIncome.processInstanceId}"/>
	                                        	<input type="hidden" name="taskId" value="${mercIncome.taskId}"/>
	                                        	<input type="hidden" name="taskDefKey" value="${mercIncome.taskDefKey}"/>
	                                        	<input type="hidden" name="procDefKey" id="procDefKey" value="${mercIncome.procDefKey}"/>
	                                        	<input type="hidden" name="starterAttrOrgNo" value="${mercIncome.starterAttrOrgNo}"/>
	                                        	<input type="hidden" name="areaInfo" value="${riskControl.areaInfo}"/><!-- 地域信息，用于拼装商户经营概述和本贷本经营概述 -->
	                                        	<input type="hidden" name="industryAbbreviation"/><!-- MCC对应行业简称，用于拼装商户经营概述 -->
	                                        	<input type="hidden" id="type" value="${type}" />
	                                        	<input type="hidden" id="tipsInfo"  name="tipsInfo" value='${mercIncome.tipsInfo }'/>
                                              
                                              	<input type="hidden" id="rootContent"  value="${rootContent }"/>
    											<input type="hidden" id="readImageUrlExpiredBasePath"  value="${readImageUrlExpiredBasePath }"/>
                                             	 <textarea style="display: none;" id="newMccInfo">${mercIncome.newMccInfo}</textarea>
                                                 <textarea style="display: none;" id="preGoodsInfo">${mercIncome.preGoodsInfo}</textarea>
                                                 <input type="hidden" name="isPreference" id="isPreference"  value="${mercIncome.isPreference}"/>
                                                 <input type="hidden" name="ifPosmd" id="ifPosmd"  value="${mercIncome.ifPosMd}"/>
                                                 <input type="hidden" name="posmdstr" id="posmdstr"  value="${mercIncome.posMdStr}"/>
                                                <div class=" col-xs-12">
                                                	<label class="control-label widget-color-normal5">
                                                		流水号:${mercIncome.processInstanceId}&nbsp;&nbsp;任务编号:${mercIncome.orderNo }&nbsp;&nbsp;当前步骤名称: ${taskName }&nbsp;&nbsp;任务状态:${taskSts }
                                                	</label><br />
                                                	<%@include file="../taskEntrust/RequestWorkers.jsp"%>
                                                    <h3 class="header smaller lighter green">基本信息
                                                    <c:if test="${mercIncome.isRecord=='1' }">
                                                     <font color="red" size="2">该商户通过备案商户进件</font>
                                                     </c:if>
                                                    </h3>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户编号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.mercId }" id="mercId" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mercId}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >协议编号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.agreementNo }" id="agreementNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.agreementNo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类型:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="" id="mercTyp" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mercTyp}</label>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件渠道:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="" id="mercTyp" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.dataSourceStr}</label>
                                                        </div>
                                                    </div>
                                                    
                                                    <c:if test="${pbCheck ==false }">
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >小微商户:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="" id="mercCls" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mercCls}</label>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <div id="branchInfo" style="display:none;">
                                                    	<div class="form-group form-group-sm  width-100">
	                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >分店设置:</label>
	                                                        <div class="col-sm-8  no-padding width-85">
	                                                        	<div class="width-48 inline has-feedback">
	                                                 				<input type="hidden" id="branchSetup" value="${mercBranch.branchSetup}"/>
	                                                            	<input type="checkbox" value="1" id="independentModel" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;独立结算</span>
                                                                   	<input type="checkbox" value="1" id="menbersShare" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;会员共享</span>
                                                                  	<input type="checkbox" value="1" id="allowAudit" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;允许查账</span>       	
	                                                        	</div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >隶属商户编号:</label>
	
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   data-content="${mercBranch.parentMercId }" id="mercTyp" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercBranch.parentMercId}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm  width-300px">
	
	                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >隶属商户名称:</label>
	                                                        <div class="col-sm-8  no-padding">
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   data-content="${mercBranch.parentMercNm }" id="mercCls" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercBranch.parentMercNm}</label>
	                                                        </div>
	                                                    </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >经营名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.mercFnm}" id="mercFnm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mercFnm}</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签购单名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.mercSnm}" id="mercSnm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mercSnm}</label>
                                                        </div>
                                                    </div>    
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >经营范围:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.bizScope}" id="bizScope" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.bizScope}</label>
                                                        </div>
                                                    </div>                                                
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >营业地址*:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="" id="mercAddr" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mercProv}-${mercIncome.mercCity}-${mercIncome.mercTown}-${mercIncome.mercAddr}</label>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营业时间*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.bizSdate} - ${mercIncome.bizEdate}" id="bizDate" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.bizSdate} - ${mercIncome.bizEdate}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营业用地面积*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.area}" id="area" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.area}</label>
                                                        </div>
                                                    </div>
                                                    <c:if test="${pbCheck==false}">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经度:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.longitude}" id="longitude" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.longitude}</label>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                     <c:if test="${pbCheck==false}">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >纬度:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.latitude}" id="latitude" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.latitude}</label>
                                                        </div>
                                                    </div>
                                                    </c:if>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联系人姓名*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.contact}" id="contact" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.contact}</label>
                                                        </div>
                                                    </div>

                                                    

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联系人电话*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.telNo}" id="telNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.telNo}</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >客服电话*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.csTelNo}" id="csTelNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.csTelNo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >管理员手机号*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.mercAdminTel}" id="mercAdminTel" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mercAdminTel}</label>
                                                        </div>
                                                    </div>
 													<c:if test="${pbCheck==false}">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >拓展类型*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.mercDevTyp}" id="mercDevTyp" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mercDevTyp}</label>
                                                        </div>
                                                    </div>                                                    
													</c:if>
                                                    
                                                    <c:if test="${not empty mercIncome.busManName}">
                                                    	<div class="form-group form-group-sm width-300px">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >业务员编号*:</label>
	
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   data-content="${mercIncome.busManNo}" id="busManNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.busManNo}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >业务员编号*:</label>
	
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   data-content="${mercIncome.busManName}" id="busManName" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.busManName}</label>
	                                                        </div>
	                                                    </div>
										    		</c:if>
										    		 <c:if test="${pbCheck==false}">
													<div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >一代信息*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${mercIncome.devOfficerNm}" id="devOfficerNm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.devOfficerNm}</label>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >行业大类*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="" id="mcc" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mcc}</label>
                                                        </div>
                                                    </div>
                                                     <c:if test="${mercIncome.newMccInfo == null || mercIncome.newMccInfo eq ''}">
	                                                    <div class="form-group form-group-sm width-300px" >
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >费率(%)*:</label>
	
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   data-content="${mercIncome.feeRate}" id="feeRate" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.feeRate}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px" >
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >封顶值:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <!-- <input type="checkbox" value="1" id="isCap1" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span> -->
	                                                            <label class="form-control input-small width-48   view-control  "
	                                                                   data-content="${mercIncome.capAmt}" id="capAmt" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.capAmt}</label>
	                                                        </div>
	                                                    </div>
                                                    </c:if>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类别*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                    data-content="" id="mcc" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ><c:if test="${mercIncome.mercPreferenceType == '01'}">标准类</c:if>
                                                                    <c:if test="${mercIncome.mercPreferenceType == '02'}">优惠类</c:if>
                                                                    <c:if test="${mercIncome.mercPreferenceType == '03'}">减免类</c:if>
                                                                    <c:if test="${mercIncome.mercPreferenceType == '04'}">特殊优惠类</c:if>
                                                                    </label>
                                                        </div>
                                                    </div>
                                                   
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >功能受理*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="" id="mercFunction" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mercFunction}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >允许信用卡:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        	<input type="hidden" id="isCreditCardFlag" value="${mercIncome.isCreditCard}"/>
                                                            <input type="checkbox" value="1" id="isCreditCard" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px" >
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否星级商户:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        	<c:choose>
                                                                <c:when test="${mercIncome.procDefKey == 'mercInfoUpdate' && mercIncome.taskDefKey == 'centerCheck'}">
                                                        		     <input type="hidden" id="isStarsFlag0" value="${Stars}"/>
                                                                     <input type="checkbox" <c:if test="${Stars=='1'}"> checked="checked"  value="1"</c:if> onclick="return buxuyong()"
                                                                         name="isStars" id="isStars" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>		
                                                        		</c:when>  
                                                                <c:when test="${mercIncome.procDefKey == 'mercInfoUpdate' && mercIncome.taskDefKey == 'headRiskControl'}">
                                                                         <input type="hidden" id="isStarsFlag1" value="${mercIncome.isStars}"/>
                                                                         <input type="checkbox" <c:if test="${mercIncome.isStars =='1'}"> checked="checked"  value="1"</c:if> onclick="return buxuyong()"
                                                                    	     name="isStars" id="isStars" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                        		</c:when>
                                                        		<c:when test="${mercIncome.procDefKey == 'mercIncome' && mercIncome.taskDefKey == 'centerCheck'}">
                                                        			<input type="hidden" id="isStarsFlag2" value="${mercIncome.isStars}"/>
                                                                    <input type="checkbox"  onclick="return buxuyong()"<c:if test="${Stars=='1'}"> checked="checked"  value="1"</c:if>
                                                                     value="1" name="isStars" id="isStars" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>		
                                                        		</c:when>
                                                        		<c:otherwise>
                                                        			<input type="hidden" id="isStarsFlag3" value="${mercIncome.isStars}"/>
                                                                    <input type="checkbox" <c:if test="${mercIncome.isStars =='1'}"> checked="checked"  value="1"</c:if> onclick="return buxuyong()"
                                                                    	  name="isStars" id="isStars" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                        		</c:otherwise>
                                                        	</c:choose>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px" style="display: none;">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否特惠商户:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        	<input type="hidden" id="specialPreferenceFlag" value="${mercIncome.specialPreference}"/>
                                                        	<input type="checkbox" value="1" id="specialPreference" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px" style="display: none;">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户优惠类型:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                            <c:if test="${mercIncome == null || (mercIncome != null && mercIncome.mercPreferentialType == null)}">
                                                        		<input type="hidden" id="mercPreferentialType" value="${mercIncome.mercPreferentialType}"/>
                                                        	</c:if>
                                                        	<c:if test="${mercIncome != null && mercIncome.mercPreferentialType != null}">
                                                        		<input type="hidden" id="mercPreferentialType" value="${mercIncome.mercPreferentialType}"/>
                                                        	</c:if>
                                                            <input type="checkbox" value="1" id="urbanAndRural" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl">&nbsp;县乡</span>
                                                            <input type="checkbox" value="3" id="threeRural" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl">&nbsp;三农</span>
                                                        </div>
                                                    </div>
                                                    <div id="presetFeeRate" style="display:none;">
                                                    	<div class="form-group form-group-sm width-300px" style="display:none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设行业大类*:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                        	<input type="hidden" id="hiddenPrepareMcc"/>
	                                                            <label class="form-control input-small width-200px   view-control  " name="prepareMcc"
	                                                                   data-content="" id="prepareMcc" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.prepareMcc}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px" style="display: none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设费率(%)*:</label>
	                                                        <div class="col-sm-8  no-padding">
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   data-content="${mercIncome.feeRate1}" id="feeRate1" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.feeRate1}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px" style="display: none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >封顶值:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <!-- <input type="checkbox" value="1" id="isCap1" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span> -->
	                                                            <label class="form-control input-small width-48   view-control  "
	                                                                   data-content="${mercIncome.capAmt1}" id="capAmt1" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.capAmt1}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px" style="display: none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设生效日期:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-48   view-control  "
	                                                                   data-content="${mercIncome.feeEffdt1}" id="feeEffdt1" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.feeEffdt1}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px" style="display: none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设县乡优惠:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                        	<input type="hidden" id="preMercPreferentialTypeFlag" value="${mercIncome.mercPreferentialType}"/>
	                                                        	<input type="checkbox" value="1" name="preMercPreferentialType" id="preMercPreferentialType" <c:if test="${mercIncome.preMecFeeTyp=='01'}">checked="checked"</c:if> class="ace ace-switch ace-switch-6 btn-flat" onclick="return false;"/> <span class="lbl">&nbsp;</span>
	                                                        </div>
	                                                    </div>
	                                                     <div class="form-group form-group-sm width-300px" style="display: none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设三农商户:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                        	<input type="hidden" id="preThreeNongFlag" value="${mercIncome.mercPreferentialType}"/>
	                                                        	<input type="checkbox" value="1" name="preThreeNong" id="preThreeNong"  class="ace ace-switch ace-switch-6 btn-flat" <c:if test="${mercIncome.preMecFeeTyp=='03'}">checked="checked"</c:if> onclick="return false;"/> <span class="lbl">&nbsp;</span>
	                                                        </div>
	                                                    </div>
	                                                    <div id="preSetSpecPrefer"  class="form-group form-group-sm width-300px" style="display: none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设特惠商户:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                        	<input type="hidden" value="${mercIncome.isPreference}" name="isPreference" id="isPreference"/>
	                                                        	<input type="checkbox" <c:if test="${mercIncome.isPreference==1}">checked="checked" </c:if>name="isPreferenceFlag" id="isPreferenceFlag" value="${mercIncome.isPreference}"  onclick="return false;" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl">&nbsp;</span>
	                                                        </div>
                                                    	</div>
                                                    </div>
                                                </div>
                                            <c:if test="${mercIncome.newMccInfo != null && mercIncome.newMccInfo ne '' && '00' ne mercIncome.ifPosMd}">
                                                <div  class="col-sm-12">
                 							   		 <h4 class="smaller lighter green">费率信息 </h4>
                 							   		 <div id="newMccInfoDiv"></div>
                 							     </div>
                 							  </c:if>
                 							     <div  class="col-sm-12" style="display: none;" id="preDiv">
                 							   		<h4 class="smaller lighter green">预设费率信息  </h4>
                 							   			<div class="form-group form-group-sm width-300px" >
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设行业大类*:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                        	<input type="hidden" value="${mercIncome.prepareMcc}" id="prepareMccValue">
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   style="color:blue;" data-content="" data-placement="bottom" id="prepareMcc" data-trigger="hover" data-rel="popover"
	                                                                    ><c:if test="${mercIncome.prepareMcc=='1'}">餐娱类</c:if><c:if test="${mercIncome.prepareMcc=='2'}">一般类</c:if><c:if test="${mercIncome.prepareMcc=='3'}">民生类</c:if><c:if test="${mercIncome.prepareMcc=='4'}">房产汽车类</c:if><c:if test="${mercIncome.prepareMcc=='5'}">批发类</c:if><c:if test="${mercIncome.prepareMcc=='6'}">公益类</c:if></label>
	                                                        </div>
	                                                    </div>
                 							   		<div id="preGoodsInfoDiv"></div>
                 							     </div>
                 							     <c:if test="${'00' eq mercIncome.ifPosMd}">
                 							     <div  class="col-sm-12">
	                 							   		 <h4 class="smaller lighter green">费率信息 </h4>
	                 							   		 <div id="ifPosmdDiv"></div>
	                 							     </div>
                 							     </c:if>
                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">POS申请信息</h3>
                                                    <table id="posInfoTable" class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                                        <thead class="thin-border-bottom">
                                                        <tr>
                                                            <th>POS通讯方式</th>
                                                            <th>POS型号</th>
                                                            <th>POS数量(台)</th>
                                                            <th>POS终端租赁费(元/台)</th>
                                                            <th>是否带密码键盘</th>
                                                        </tr>
                                                        </thead>
                                                        <c:forEach var="posInfo" items="${posInfoList }" >
                                                        	<tr>
	                                                            <td width="20%">${posInfo.trmCommMod}</td>
	                                                            <td width="30%">${posInfo.trmMod}</td>
	                                                            <td width="20%">${posInfo.trmQuantity}</td>
	                                                            <td width="20%">${posInfo.trmRentalFee}</td>
	                                                            <td width="10%">
	                                                            	<c:if test="${posInfo.isHavePinPad == 1}">是</c:if>
	                                                            	<c:if test="${posInfo.isHavePinPad != 1}">否</c:if>
	                                                            </td>
	                                                        </tr>
                                                        </c:forEach>
                                                    </table>
                                                    <div class="col-sm-12">
	                                                    <h3 class="header smaller lighter green" style="margin-top:5px;"></h3>
	                                                    <div class="form-group form-group-sm width-100">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >POS信息备注:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-100   view-control  "
	                                                                   data-content="${mercIncome.posComment}" id="posComment" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.posComment}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm  width-100" id="callNos" style="display:none;">
	                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >拨号主叫号码:</label>
	                                                        <div class="col-sm-8  no-padding">
	                                                            <label class="form-control input-small width-100px view-control  "
	                                                                   data-content="${areaCodeAndPhoneNo.areaCode}" id="areaCode" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${areaCodeAndPhoneNo.areaCode}</label>&nbsp;-&nbsp;
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   data-content="${areaCodeAndPhoneNo.callNo}" id="callNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${areaCodeAndPhoneNo.callNo}</label>
	                                                        </div>
	                                                    </div>
	                                                </div>
                                                </div>
                                                <div class="col-xs-12">
                                                    <h3 class="header smaller lighter green">风控控制信息</h3>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >关键字:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                        	data-content="${riskControl.keywords}" id="keywords" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                            >${riskControl.keywords}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户MCC:</label>
                                                        <div class="col-sm-8  no-padding "  >
                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                        	data-content="${riskControl.mccCd}" id="mccCd" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                            >${riskControl.mccCd}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户等级:</label>
                                                        <div class="col-sm-8  no-padding "  >
                                                             <label class="form-control input-small width-200px  view-control "  data-content="" id="mecNormalLevel" data-placement="bottom" data-trigger="hover" data-rel="popover">
                      											<c:if test="${mercIncome.mecNormalLevel=='10'}">一类-法人<br></c:if>
												    			<c:if test="${mercIncome.mecNormalLevel=='11'}">一类-授权<br></c:if>
												    			<c:if test="${mercIncome.mecNormalLevel=='20'}">二类<br></c:if>
												    			<c:if test="${mercIncome.mecNormalLevel=='30'}">三类<br></c:if>
                                                             </label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营概述*:</label>

                                                        <div class="col-sm-8  no-padding "  >
                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                        	data-content="${riskControl.descBiz}" id="descBiz" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                            >${riskControl.descBiz}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-100" style="display:none;">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >本贷本经营概述*:</label>

                                                        <div class="col-sm-8  no-padding "  >
                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                        	data-content="${riskControl.descLoanBiz}" id="descLoanBiz" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                            >${riskControl.descLoanBiz}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户级别:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                        	data-content="${riskControl.mercLevel}" id="mercLevel" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                            >${riskControl.mercLevel}</label>
                                                        </div>
                                                    </div>

                                                   
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >无分公司:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                        	data-content="${riskControl.noBranch}" id="noBranch" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                            >${riskControl.noBranch}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >混业经营:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                        	data-content="${riskControl.mixedOperation}" id="mixedOperation" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                            >${riskControl.mixedOperation}</label>
                                                        </div>
                                                    </div>
                                                     <c:if test="${pbCheck==false}">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >账户授权:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                        	data-content="${riskControl.acountAuth}" id="acountAuth" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                            >${riskControl.acountAuth}</label>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >资料缺失:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                        	data-content="${riskControl.lackOfInformation}" id="lackOfInformation" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                            >${riskControl.lackOfInformation}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >移动POS:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                        	data-content="${riskControl.mobilPos}" id="mobilPos" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                            >${riskControl.mobilPos}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >高风险行业:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                        	data-content="${riskControl.highRiskIndustry}" id="highRiskIndustry" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                            >${riskControl.highRiskIndustry}</label>
                                                        </div>
                                                    </div>
                                                     <c:if test="${pbCheck==false}">
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >例外商户:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                            <input type="hidden" id="isExceptionMercFlag" value="${riskControl.isExceptionMerc}"/>
                                                            <input type="checkbox" value="1" name="riskControl.isExceptionMerc" id="isExceptionMerc" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                </c:if>
                                                
                                                <div class="col-sm-12">
                                                    <div id="recent-box" class="widget-box transparent">
                                                        <div class="widget-header">
                                                            <div class="tabbable no-padding">
                                                                <ul id="recent-tab" class="nav nav-tabs padding-12 tab-color-blue background-blue">
                                                                    <li class="active">
                                                                        <a href="#member-tab1" data-toggle="tab" aria-expanded="true">资质信息</a>
                                                                    </li>
                                                                    <li class="">
                                                                        <a href="#member-tab2" data-toggle="tab" aria-expanded="false">结算信息</a>
                                                                    </li>
                                                                    <li class="">
                                                                        <a href="#member-tab3" data-toggle="tab" aria-expanded="false">费用信息</a>
                                                                    </li>
<!--                                                                     <li class=""> -->
<!--                                                                         <a href="#member-tab4" data-toggle="tab" aria-expanded="false">功能开通</a> -->
<!--                                                                     </li> -->
                                                                    <li class="">
                                                                        <a href="#member-tab5" data-toggle="tab" aria-expanded="false">图片信息</a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <div class="widget-body">
                                                            <div class="widget-main padding-4">
                                                                <div class="tab-content padding-8">
                                                                    <div class="tab-pane active" id="member-tab1">
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册名称:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercQualInfo.mercRegNm}" id="mercRegNm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.mercRegNm}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册登记号:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercQualInfo.regNo}" id="regNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.regNo}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户性质:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercQualInfo.mercNature}" id="mercNature" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.mercNature}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm  width-100">
					                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册地址:</label>
					                                                        <div class="col-sm-8  no-padding">
					                                                            <label class="form-control input-small width-100   view-control  "
					                                                                   data-content="${mercQualInfo.regAddr}" id="regAddr" data-placement="bottom" data-trigger="hover" data-rel="popover"
					                                                                    >${mercQualInfo.regAddr}</label>
					                                                        </div>
					                                                    </div>
                                                                        
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >执照有效期:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                            	<input type="hidden" id="licenseEffFlg" value="${mercQualInfo.licenseEffFlg }"/>
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercQualInfo.licenseEffStartdate} 至 ${mercQualInfo.licenseEffEnddate}" id="licenseEffDate" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.licenseEffStartdate} 至 ${mercQualInfo.licenseEffEnddate}</label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人名称:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercQualInfo.legalNm}" id="legalNm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.legalNm}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人证件类型:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercQualInfo.legalCredentialsTyp}" id="legalCredentialsType" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.legalCredentialsTyp}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人证件号:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercQualInfo.legalCredentialsNo}" id="legalCredentialsNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.legalCredentialsNo}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >证件有效期:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                            	<input type="hidden" id="legalCredentialsFlg" value="${mercQualInfo.legalCredentialsFlg }"/>
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercQualInfo.legalCredentialsEffStardate} 至 ${mercQualInfo.legalCredentialsEffEnddate}" id="legalCredentialsEffDate" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.legalCredentialsEffStardate} 至 ${mercQualInfo.legalCredentialsEffEnddate}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >税务登记号:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercQualInfo.taxNo}" id="taxNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.taxNo}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构代码证:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercQualInfo.orgCd}" id="orgCd" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.orgCd}</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="tab-pane" id="member-tab2">
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户日切时间:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercStmInfo.changeTime}时" id="changeTime" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.changeTime}时</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否隔日对账</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <input type="hidden" id="isSattleFlg" value="${mercStmInfo.isSattleFlg}"/>
                                                                                <input type="checkbox" value="1" id="isSattle" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算天数:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="T+${mercStmInfo.stmDays}" id="stmDays" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >T+${mercStmInfo.stmDays}</label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >起始结算金额:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercStmInfo.sstmAmt}" id="sstmAmt" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.sstmAmt}</label>
                                                                            </div>
                                                                        </div>
                                                                        <h5 class="header smaller lighter green" style="margin-top:1px;">开通功能</h5>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >随意通结算:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                            	<input type="hidden" id="tZeroStmtFlag" value="${mercStmInfo.tZeroStmt}"/>
                                                                            	<input type="checkbox" value="1" id="tZeroStmt" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >非工作日结算:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                            	<input type="hidden" id="offdayStmtFlag" value="${mercStmInfo.offdayStmt}"/>
                                                                            	<input type="checkbox" value="1" id="offdayStmt" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >即日付:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                            	<input type="hidden" id="nowPayFlag" value="${mercStmInfo.nowPay}"/>
                                                                            	<input type="checkbox" value="1" id="nowPay" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                                            	
                                                                            	<c:if test="${mercStmInfo.nowPay == 1}">
                                                                            		<div id="jrfflDiv" style="position: absolute;left: -100px;top: 33px;">
                                                                            		
                                                                            			<label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >即日付手续费:</label>
                                                                            		<!-- <input type="text" name="mercStmInfo.jrffl" id="jrffl" value="${mercStmInfo.jrffl }" readonly="readonly" onkeyup="validateJrfRate();" onblur="validateJrfRate();" class="form-control input-small width-100px" data-placement="bottom" title="" data-fv-field="feeInfo.jrffl"> -->	
                                                                            	        <label class="form-control input-small width-100px   view-control  " name="mercStmInfo.jrffl" 
	                                                                                       data-content="${mercStmInfo.jrffl }" id="jrffl" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.jrffl }</label>                                                           	
                                                                           	 		</div>
                                                                            	</c:if>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >朝付通:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                            	<input type="hidden" id="zftFlgFlag" value="${mercStmInfo.zftFlg}"/>
                                                                            	<input type="checkbox" value="1" id="zftFlg" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                                            </div>
                                                                        </div>
                                                                        <div id="stmQuotaInfo" style="display:none;">
                                                                        	<div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >随意通限额:</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${mercStmInfo.stmQuota}" id="stmQuota" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.stmQuota}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >随意通手续费:</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-48 view-control  "
	                                                                                       data-content="${mercStmInfo.stmCommissionCharge}%" id="stmCommissionCharge" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.stmCommissionCharge}%</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-100">
						                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >自动结算时间<span style="color:red">*</span>:</label>
						                                                        <div class="col-sm-8  no-padding width-100">
						                                                        	<div class="width-100 inline has-feedback">
						                                                        		<input type="hidden" id="stmTimeOneFlag" value="${mercStmInfo.stmTimeOne}"/>
						                                                        		<input type="hidden" id="stmTimeTwoFlag" value="${mercStmInfo.stmTimeTwo}"/>
						                                                        		<input type="hidden" id="stmTimeThreeFlag" value="${mercStmInfo.stmTimeThree}"/>
						                                                        		<input type="hidden" id="stmTimeFourFlag" value="${mercStmInfo.stmTimeFour}"/>
						                                                        		<input type="hidden" id="stmTimeFiveFlag" value="${mercStmInfo.stmTimeFive}"/>
						                                                        		<input type="hidden" id="stmTimeSixFlag" value="${mercStmInfo.stmTimeSix}"/>
						                                                        		<input type="hidden" id="stmTimeSevenFlag" value="${mercStmInfo.stmTimeSeven}"/>
						                                                        		<input type="hidden" id="stmTimeEightFlag" value="${mercStmInfo.stmTimeEight}"/>
						                                                        		<input type="hidden" id="stmTimeNineFlag" value="${mercStmInfo.stmTimeNine}"/>
						                                                        		<input type="hidden" id="stmTimeTenFlag" value="${mercStmInfo.stmTimeTen}"/>
						                                                            	<input type="checkbox" value="1" name="mercStmInfo.stmTimeOne" id="stmTimeOne" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;9时</span>
		                                                                            	<input type="checkbox" value="1" name="mercStmInfo.stmTimeTwo" id="stmTimeTwo" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;10时</span>
		                                                                            	<input type="checkbox" value="1" name="mercStmInfo.stmTimeThree" id="stmTimeThree" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;11时</span>
		                                                                                <input type="checkbox" value="1" name="mercStmInfo.stmTimeFour" id="stmTimeFour" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;12时</span>
		                                                                                <input type="checkbox" value="1" name="mercStmInfo.stmTimeFive" id="stmTimeFive" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;13时</span>
		                                                                                <input type="checkbox" value="1" name="mercStmInfo.stmTimeSix" id="stmTimeSix" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;14时</span>
		                                                                                <input type="checkbox" value="1" name="mercStmInfo.stmTimeSeven" id="stmTimeSeven" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;15时</span>
		                                                                                <input type="checkbox" value="1" name="mercStmInfo.stmTimeEight" id="stmTimeEight" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;16时</span>
		                                                                                <input type="checkbox" value="1" name="mercStmInfo.stmTimeNine" id="stmTimeNine" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;17时</span>
		                                                                                <input type="checkbox" value="1" name="mercStmInfo.stmTimeTen" id="stmTimeTen" class="ace ace-switch ace-switch-6 btn-flat"/> <span class="lbl">&nbsp;20时</span>
<!-- 						                                                        		<input type="checkbox" value="" name="settleCardFunction" id="mercFunction99" class="ace ace-switch ace-switch-6 btn-flat" /> -->
						                                                        	</div>
						                                                        </div>
						                                                    </div>
                                                                        </div>
                                                                        <div id="parentStm1">
                                                                        <h5 class="header smaller lighter green" style="margin-top:1px;">总店结算卡一(默认结算卡)</h5>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户类型:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentActTyp1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行名称:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentBnkCd1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行所在省:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentLbnkProv1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行所在市:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentLbnkCity1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联行行号:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentLbnkNo1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户名:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentActNm1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账号:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentActNo1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div id="parentStmLegalNmDiv" class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >账户法人姓名:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentStmLegalNm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >身份证号:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentIdCardNo1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-100">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行详细信息:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-100   view-control  "
                                                                                       style="color:blue;" data-content="" id="parentLbnkDesc1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        </div>
                                                                        <div id="parentStm2">
																		<h5 class="header smaller lighter green" style="margin-top:1px;">总店结算卡二</h5>  
																		<div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户类型:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentActTyp2" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行名称:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentBnkCd2" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行所在省:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentLbnkProv2" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行所在市:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentLbnkCity2" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联行行号:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentLbnkNo2" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户名:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentActNm2" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账号:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentActNo2" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >身份证号:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="" id="parentIdCardNo2" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-100">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行详细信息:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-100   view-control  "
                                                                                       style="color:blue;" data-content="" id="parentLbnkDesc2" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        ></label>
                                                                            </div>
                                                                        </div>                                                                      
																		</div>
                                                                        <h5 class="header smaller lighter green" style="margin-top:1px;">结算卡一（默认结算卡）</h5>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户类型:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercStmInfo.stmActTyp1}" id="stmActTyp1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.stmActTyp1}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行名称:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercStmInfo.stmBankNm1}" id="stmBankNm1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.stmBankNm1}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行所在省:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercStmInfo.stmBankProvinceN1}" id="stmBankProvince1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.stmBankProvinceN1}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行所在市:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercStmInfo.stmBankCityN1}" id="stmBankCity1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.stmBankCityN1}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联行行号:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercStmInfo.stmLbankNo1}" id="stmLbankNo1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.stmLbankNo1}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户名:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercStmInfo.stmActNm1}" id="stmActNm1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.stmActNm1}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账号:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${vb:account(mercStmInfo.stmAct1) }" id="stmAct1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${vb:account(mercStmInfo.stmAct1) }</label>
                                                                            </div>
                                                                        </div>
                                                                        <div id="stmLegalNmDiv" class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >账户法人姓名:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercStmInfo.stmLegalNm }" id="stmLegalNm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.stmLegalNm }</label>
                                                                            </div>
                                                                        </div>
																		<div class="form-group form-group-sm width-300px">
																			<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证号码:</label>

																			<div class="col-sm-8  no-padding">
																				<label
																					class="form-control input-small width-200px   view-control  "
																					data-content="${mercStmInfo.idCardNo1}"
																					id="idCardNo1" data-placement="bottom"
																					data-trigger="hover" data-rel="popover">${mercStmInfo.idCardNo1}</label>
																			</div>
																		</div>
																		<div class="form-group form-group-sm width-100">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行详细信息:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-100   view-control  "
                                                                                       data-content="${mercStmInfo.stmBankDetails1}" id="stmBankDetails1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.stmBankDetails1}</label>
                                                                            </div>
                                                                        </div>
															    		<c:if test="${mercStmInfo.stmBankDetails2 !=null && mercStmInfo.stmBankDetails2 !='' && mercStmInfo.stmLbankNo2!=null && mercStmInfo.stmLbankNo2!=''}">
															    			<h5 class="header smaller lighter green" style="margin-top:1px;">结算卡二</h5>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户类型:</label>
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control"
	                                                                                       data-content="${mercStmInfo.stmActTyp2}" id="stmActTyp2" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.stmActTyp2}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行名称:</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${mercStmInfo.stmBankNm2}" id="stmBankNm2" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.stmBankNm2}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行所在省:</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${mercStmInfo.stmBankProvinceN2}" id="stmBankProvince2" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.stmBankProvinceN2}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行所在市:</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${mercStmInfo.stmBankCityN2}" id="stmBankCity2" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.stmBankCityN2}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联行行号:</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${mercStmInfo.stmLbankNo2}" id="stmLbankNo2" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.stmLbankNo2}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户名:</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${mercStmInfo.stmActNm2}" id="stmActNm2" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.stmActNm2}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账号:</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${vb:account(mercStmInfo.stmAct2) }" id="stmAct2" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${vb:account(mercStmInfo.stmAct2) }</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <c:if test="${mercStmInfo.stmActTyp2==2}">
	                                                                        <div class="form-group form-group-sm width-300px">
																			<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证号码:</label>

																			<div class="col-sm-8  no-padding">
																				<label
																					class="form-control input-small width-200px   view-control  "
																					data-content="${mercStmInfo.idCardNo2}"
																					id="idCardNo2" data-placement="bottom"
																					data-trigger="hover" data-rel="popover">${mercStmInfo.idCardNo2}</label>
																			</div>
																			</div>
																			</c:if>
	                                                                        <div class="form-group form-group-sm width-100">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行详细信息:</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-100   view-control  "
	                                                                                       data-content="${mercStmInfo.stmBankDetails2}" id="stmBankDetails2" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.stmBankDetails2}</label>
	                                                                            </div>
	                                                                        </div>
															    		</c:if>


                                                                    </div><!-- /.#member-tab -->

                                                                    <div class="tab-pane" id="member-tab3">
                                                                    <!-- begin:新维护通产品需求 -->
																		<!-- 1.begin POS维护费 -->
																		<div class="form-group form-group-sm width-100">
																			<div class="col-sm-8 no-padding">
																				<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">POS维护费</label>
																				<input type="checkbox" id="hasPosMaintainFee"
																					name="feeInfo.hasPosMaintainFee"
																					class="ace ace-switch ace-switch-6 btn-flat" /> <span
																					class="lbl">&nbsp;选择收取</span>
																			</div>
																			<div id="posMaintainFeeTypeDiv" style="display: none;">
																				<div class="col-sm-8  no-padding width-85">
																					<div class="width-48 inline has-feedback" style="padding-left: 100px;">
																						<input type="hidden" value="${feeInfo.posMaintainFeeType }"
																							name="feeInfo.posMaintainFeeType"
																							id="posMaintainFeeType" /> <input type="checkbox"
																							value="1" name="posMaintainFeeType1"
																							id="posMaintainFeeType1" checked="checked"
																							class="ace ace-switch ace-switch-6 btn-flat" /> <span
																							class="lbl">&nbsp;日累计扣费</span> <input
																							type="checkbox" value="2"
																							name="posMaintainFeeType2"
																							id="posMaintainFeeType2"
																							class="ace ace-switch ace-switch-6 btn-flat" /> <span
																							class="lbl">&nbsp;日非累计扣费</span>
																					</div>
																				</div>
																			</div>
																		</div>

																		<div id="posMaintainFeeAmmountDiv"	style="display: block;">
																			<div class="form-group form-group-sm width-300px"
																				style="display: block;"></div>
																			<div class="form-group form-group-sm width-300px">
																				<label
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">收取金额<span
																					style="color: red;">*</span>:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<label class="form-control input-small width-200px   view-control  " data-content="业务员1" data-placement="bottom" data-trigger="hover" data-rel="popover" data-original-title="" title="">${feeInfo.posMaintainFeeAmount}</label>
																				</div>
																			</div>
																		</div>
																		<!-- 1.end POS维护费 -->
																		<!-- end:新维护通产品需求 -->
                                                                        <div class="form-group form-group-sm width-100">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >维护通</label>
                                                                            <div class="col-sm-8 no-padding">
	                                                                            <input type="hidden" id="isMaintenanceFeeFlag" value="${feeInfo.isMaintenanceFee}"/>
	                                                            				<input type="checkbox" value="1" id="isMaintenanceFee" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                            				</div>
                                                                        </div>
                                                                        <div id="mainternanceFeeInfo" style="display:none;">
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收取模式</label>
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.chargingMod}" id="chargingMod" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.chargingMod}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收取方式</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.chargingWay}" id="chargingWay" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.chargingWay}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >免收周期</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.freeCycle-1}个月" id="freeCycle" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.freeCycle-1}个月</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预收金额</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.maintenanceFeeAmt}" id="maintenanceFeeAmt" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.maintenanceFeeAmt}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >免收起点</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.freeStartingPoint}" id="freeStartingPoint" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.freeStartingPoint}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >最低交易笔数</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.minEffectiveTrans}" id="minEffectiveTrans" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.minEffectiveTrans}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >当月是否收取维护费</label>
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                            	<input type="hidden" id="isMaintenanceFeeCurrentFlag" value="${feeInfo.isMaintenanceFeeCurrent}"/>
		                                                            				<input type="checkbox" value="1" id="isMaintenanceFeeCurrent" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
	                                                                            </div>
	                                                                        </div>
	                                                                        <h5 class="header smaller lighter green" style="margin-top:1px;">以太网/拨号-POS</h5>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >单台收取维护费</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.feeAmtEnDial}" id="feeAmtEnDial" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.feeAmtEnDial}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >免收台数</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.freeCountsEnDial}" id="freeCountsEnDial" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.freeCountsEnDial}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <h5 class="header smaller lighter green" style="margin-top:1px;">GPRS-POS</h5>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >单台收取维护费</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.feeAmtGprs}" id="feeAmtGprs" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.feeAmtGprs}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >免收台数</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.freeCountsGprs}" id="freeCountsGprs" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.freeCountsGprs}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-100">
	                                                                            <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >其他说明事项</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-100   view-control  "
	                                                                                       data-content="${feeInfo.comments}" id="comments" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.comments}</label>
	                                                                            </div>
	                                                                        </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-100">
					                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >欢乐租:</label>
					                                                        <div class="col-sm-8 no-padding"  >
					                                                        	<input type="hidden" id="huanLeZu" name="huanLeZu" value="${mercIncome.huanLeZu}"/>
					                                                        	<c:choose>
					                                                        		<c:when test="${mercIncome.huanLeZu == '1'}">
					                                                        			<input type="checkbox" value="1" id="isHuanLeZu" class="ace ace-switch ace-switch-6 btn-flat" checked="checked" onclick="return false;"/> <span class="lbl"></span>
					                                                        		</c:when>
					                                                        		<c:otherwise>
					                                                        			<input type="checkbox" value="0" id="isHuanLeZu" class="ace ace-switch ace-switch-6 btn-flat" onclick="return false;"/> <span class="lbl"></span>
					                                                        		</c:otherwise>
					                                                        	</c:choose>
					                                                        </div>
						                                                 </div>
                                                                        <%-- <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否收取押金</label>
                                                                            <div class="col-sm-8 no-padding">
	                                                                            <input type="hidden" id="isDepositFlag" value="${feeInfo.isDeposit}"/>
	                                                            				<input type="checkbox" value="1" id="isDeposit" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
	                                                            				<label class="form-control input-small width-48 view-control  "
                                                                                	data-content="${feeInfo.deposit}元" id="deposit" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                 	>${feeInfo.deposit}元</label>
                                                            				</div>
                                                                        </div> --%>
                                                                    </div>

<!--                                                                     <div class="tab-pane" id="member-tab4"> -->
<!--                                                                     	<h5 class="header smaller lighter green" style="margin-top:1px;">预付卡信息</h5> -->
<!--                                                                         <div class="form-group form-group-sm width-100"> -->
<!--                                                                             <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否开通</label> -->
<!--                                                                             <div class="col-sm-8 no-padding"> -->
<%-- 	                                                                            <input type="hidden" id="isPrepaidCardFlag" value="${mercIncome.isPrepaidCard}"/> --%>
<!-- 	                                                            				<input type="checkbox" value="1" id="isPrepaidCard" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span> -->
<!--                                                             				</div> -->
<!--                                                                         </div> -->
<!--                                                                         <div id="prepaidCardInfo" style="display:none;"> -->
<!--                                                                         	<div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >功能受理</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${prepaidCard.functionAccepted}" id="functionAcceptedForPC" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${prepaidCard.functionAccepted}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >高汇通商编</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${prepaidCard.mercCd}" id="mercCd" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${prepaidCard.mercCd}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!--                                                                         </div> -->
<!--                                                                         <h5 class="header smaller lighter green" style="margin-top:1px;">北京中行外卡</h5> -->
<!--                                                                         <div class="form-group form-group-sm width-100"> -->
<!--                                                                             <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否开通</label> -->
<!--                                                                             <div class="col-sm-8 no-padding"> -->
<%-- 	                                                                            <input type="hidden" id="foreignCcyCardTyp1Flag" value="${mercIncome.isForeignCcyCard}"/> --%>
<!-- 	                                                            				<input type="checkbox" value="1" id="foreignCcyCardTyp1" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span> -->
<!--                                                             				</div> -->
<!--                                                                         </div> -->
<!--                                                                         <div id="foreighCardInfoOfBocInfo" style="display:none;"> -->
<!--                                                                         	<div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >功能受理</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard1.functionAccepted}" id="functionAcceptedForFC" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard1.functionAccepted}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >Visa费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard1.feeRateVisa}" id="bocFeeRateVisa" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard1.feeRateVisa}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >Master费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard1.feeRateMaster}" id="bocFeeRateMaster" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard1.feeRateMaster}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >AmericanExpress费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard1.feeRateAmericanExpress}" id="bocFeeRateAmericanExpress" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard1.feeRateAmericanExpress}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >Diners费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard1.feeRateDiners}" id="bocFeeRateDiners" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard1.feeRateDiners}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >JCB费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard1.feeRateJcb}" id="bocFeeRateJcb" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard1.feeRateJcb}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!--                                                                         </div> -->
<!--                                                                         <h5 class="header smaller lighter green" style="margin-top:1px;">北京交行外卡</h5> -->
<!--                                                                         <div class="form-group form-group-sm width-100"> -->
<!--                                                                             <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否开通</label> -->
<!--                                                                             <div class="col-sm-8 no-padding"> -->
<!-- 	                                                            				<input type="checkbox" value="1" id="foreignCcyCardTyp2" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span> -->
<!--                                                             				</div> -->
<!--                                                                         </div> -->
<!--                                                                         <div id="foreighCardInfoOfBocomInfo" style="display:none;"> -->
<!--                                                                         	<div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >Visa费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard2.feeRateVisa}" id="bocomFeeRateVisa" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard2.feeRateVisa}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >Master费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard2.feeRateMaster}" id="bocomFeeRateMaster" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard2.feeRateMaster}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >AmericanExpress费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard2.feeRateAmericanExpress}" id="bocomFeeRateAmericanExpress" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard2.feeRateAmericanExpress}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >Diners费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard2.feeRateDiners}" id="bocomFeeRateDiners" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard2.feeRateDiners}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >JCB费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard2.feeRateJcb}" id="bocomFeeRateJcb" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard2.feeRateJcb}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >VISA_DCC费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard2.feeVisaDcc}" id="bocomFeeVisaDcc" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard2.feeVisaDcc}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >MC_DCC费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreignCard2.feeMcDcc}" id="bocomFeeMcDcc" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreignCard2.feeMcDcc}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!--                                                                         </div> -->
<!--                                                                     </div> -->
                                                                    <div class="tab-pane" id="member-tab5">
                                                                    	<!-- 
                                                                    	<button class="btn btn-danger btn-sm" type="button" id="downloadAll">
					                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
					                                                        下载图片信息
					                                                    </button>
					                                                     -->
					                                                     <!-- 历史图片 -->
					                                                  <div class="docs-galley">
					                                                 	<ul class="image_ul">
					                                                    <c:forEach var="item" items="${historyImageList}" varStatus="status">  
					                                                     <p style="color:#F00;text-align:left;clear:both;">第${status.index+1}次上传的图片 
					                                                     <button class="btn btn-danger btn-sm" type="button"
																				style="height: 30px;" onclick="downloadAll('${item[0].historyId}');" >下载图片</button><br/></p>
																		 <div class="docs-pictures ">		
											                            	<c:forEach var="list" items="${item}"  varStatus="p">
																			  <li class="image_li ">
																			  	<div class="contentmenu">
			     																  <img   height="10px;" data-original="${ctx}/salesmanCheck/showImage.do?imageAddr=${list.url}" src="${ctx}/salesmanCheck/showImage.do?imageAddr=${list.url}" alt="${list.type}">
																				  <p>${list.type}</p>
			     																</div>
			     															  </li>
		     																 </c:forEach>  
		     															  </div>
																	     </c:forEach> 
																		</ul>
																		</div>
																	</div>
																	 <!-- 历史图片 -->

					                                                    
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.widget-main -->
                                                        </div><!-- /.widget-body -->
                                                    </div><!-- /.widget-box -->
                                                </div>
                                                <div id="tips"><ul id="showChangeMessage"></ul></div>
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
	                                            <input type="hidden" name="logOrigin" id="logOrigin" value="${task.logOrigin}" >
	                                            <input type="hidden" name="pageNum" id="pageNum" value="${task.pageNum}" >
	                                            
	                                            <div class="form-actions center widget-color-normal5">
                                                    <c:if test="${\"headRiskControl\"==(mercIncome.taskDefKey) and \"已完成\"==(taskSts) }">
	                                                    <button class="btn btn-danger btn-sm" type="button" id="processBackBtn" name="processBackBtn" onclick="processBack()">
	                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
	                                                        回收
	                                                    </button>
                                                    </c:if>
                                                    
                                                        <c:if test="${task.taskSts != '已结束'}">
                                                        <button class="btn btn-danger btn-sm" type="button"  onclick="goback('mercInfoUpdate')">
                                                            <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                            返回
                                                        </button>
                                                        </c:if>
                                                        
	                                                    <c:if test="${task.taskSts == '已结束'}">
	                                                    <button class="btn btn-default btn-sm" type="button"  onclick="goback2TaskEndList()">
                                                            <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                            返回
                                                        </button>
	                                                    </c:if>
	                                                    
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
        
    </div><!-- /.main-container -->

    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/ejs/bootstrap3-validation.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/imageUtil.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/mercIncome/4wht.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/mercIncome/commonMerchant.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/mercIncome/centerCheck.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/ejs/ejs_production.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/ejs/ejs_fulljslint.js"></script>
	 <!-- -图片插件js -->
	<script src="${ctx}/js/viewer/dist/viewer.js"></script>
    <script src="${ctx}/js/viewer/main.js"></script>
    <script src="<%=request.getContextPath() %>/js/contextmenu/jquery.contextmenu.js" ></script>
    <script type="text/javascript">
    $(function (){
    	var isStars=$('#Stars').val();
		
		 if(procDefKey=='mercInfoUpdate'){
			 if(isStars=='0'){
				 var taskDefKey = $("[name='taskDefKey']").val();
			    	var legalNm=$("#legalNm").val().trim();//法人
			    	var stmActNm1=$("#stmActNm1").val().trim();//默认结算户名
			    	var mercRegNm=$("#mercRegNm").html();//注册名称
			    	if(taskDefKey=='centerCheck'){
			    		if(stmActNm1==legalNm||stmActNm1==mercRegNm){
				    	}else{
				    		$("#isStars").val("0");
				    		$("#isStars").checked=false;
				    		$('#isStars').trigger('change');
				    	}
			    	}
			 }
			 if(isStars=='1'){
				 if(getStars(tipsInfo)){
			    		$("#isStars").removeAttr("chencked");
					    var taskDefKey = $("[name='taskDefKey']").val();
				    	var legalNm=$("#legalNm").val().trim();//法人
				    	var stmActNm1=$("#stmActNm1").val().trim();//默认结算户名
				    	var mercRegNm=$("#mercRegNm").html();//注册名称
				    	if(taskDefKey=='centerCheck'){
				    		if(stmActNm1==legalNm||stmActNm1==mercRegNm){
					    		$("#isStars").removeAttr('checked');
					    		$('#isStars').trigger('change');
					    	}else{
					    		$("#isStars").val("0");
					    	}
				    	}
				 }
			 }
		 }
    });
    
    
   
    function downloadAllImages(taskCode){
    		 location.href="${ctx}/mercIncome/downloadAllImages.do?taskCode="+orderNo;
    }
 	function processBack(){
    	if(!confirm("是否确认回收")){
    		return ;
    	}
    	$.ajax({
    		url:"/mercIncome/processBack",
    		async:false,
    		cache: false,
    		type:"POST",
    		data:$("#mercInfoForm").serialize(),
    		success:function(data){
    			data = eval("(" + data + ")")
    			alert(data.message)
    			location.href="<%=request.getContextPath() %>/task/list.do?taskSts=1";
    		}
    	});
    }

    jQuery(function($) {
    	console.info('mercIncomeUpdateView......');
        initPosMaintain('true'=='${feeInfo.hasPosMaintainFee}','${feeInfo.posMaintainFeeType}',false);
        
        $('[data-rel=popover]').popover({container:'body'});
        $('.chosen-select').chosen({});
      	//回填修改提示信息
    	$('#showChangeMessage').html($('#tipsInfo').val());
        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();
            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });
        renderx(); 
        //图片另存为
        $('.contentmenu').contextPopup({
			title: '',
			items: [
				{label:'另存为', action:function(e) {
					var target=e.target;
					
					var path=$(target).children("img").attr("src");
					if(!path){
						path=$(target).parent().children("img").attr("src");
					}
					
					 location.href="${ctx}/mercIncome/downloadHistoryImage?imagePath="+path;
					} 
				},
			]

          });

    });
</script>
<script type="text/javascript">
var stmActTyp1 = '${mercStmInfo.stmActTyp1}';
if(stmActTyp1=='2'){
	$("#stmLegalNmDiv").hide();
}
</script>

<script type="text/javascript">
var data = '${result}';//接口传回的String值
//总店结算卡的结算银行名称、所在省以及所在市
var bnkCd1='${bnkCd1}';
var lbnkProv1='${lbnkProv1}';
var lbnkCity1='${lbnkCity1}';
var bnkCd2='${bnkCd2}';
var lbnkProv2='${lbnkProv2}';
var lbnkCity2='${lbnkCity2}';
if(data!=null && data!='' && data!=undefined){
	data = JSON.parse(data);//将String值转为json格式
	var stmBnks = data.retMercIfPo.stmBnks;//取出所有结算信息
	
	if (stmBnks != null && stmBnks != undefined && stmBnks.length > 0) {
		var defaultSettleCardIndex = 0;
		for (var i = 0; i < stmBnks.length; i++) {
			var stmBank = stmBnks[i];
			if (stmBank.stmMetNo != undefined && stmBank.stmMetNo == '01') {//结算卡一
				defaultSettleCardIndex = i;
				var actTyp1 = stmBnks[defaultSettleCardIndex].actTyp;//总店结算卡一账户类型
				if(actTyp1=='00'){
					$("#parentActTyp1").html("对公");
					$("#parentStmLegalNmDiv").show();
					$("#parentStmLegalNm").html(stmBnks[defaultSettleCardIndex].legPerNm);//总店结算卡一结算账户
					
				}else if(actTyp1=='01'){
					$("#parentActTyp1").html("对私");
					$("#parentStmLegalNmDiv").hide();
				}
				$("#parentIdCardNo1").html(stmBnks[defaultSettleCardIndex].idCardNo);
				$("#parentBnkCd1").html(bnkCd1);//总店结算卡一结算银行名称
				$("#parentLbnkProv1").html(lbnkProv1);//总店结算卡一结算银行所在省
				$("#parentLbnkCity1").html(lbnkCity1);//总店结算卡一结算银行所在市
				$("#parentLbnkDesc1").html(stmBnks[defaultSettleCardIndex].lbnkDesc);//总店结算卡一结算银行详细信息
				$("#parentLbnkNo1").html(stmBnks[defaultSettleCardIndex].lbnkNo);//总店结算卡一联行行号
				$("#parentActNm1").html(stmBnks[defaultSettleCardIndex].actNm);//总店结算卡一结算账户名
				$("#parentActNo1").html(stmBnks[defaultSettleCardIndex].actNo);//总店结算卡一结算账户
			}
		}
		//如果存在两张结算卡，需要获取非默认结算卡的下标 
		if(stmBnks.length == 2){
			var secondSettleCardIndex = 1;
			if(defaultSettleCardIndex == 1)
				secondSettleCardIndex = 0;
			var actTyp2=stmBnks[secondSettleCardIndex].actTyp;//结算账户类型2
 			if(actTyp2=='00'){
 				$("#parentActTyp2").html("对公");
 			}else{
 				$("#parentActTyp2").html("对私");
 			}
 			$("#parentIdCardNo2").html(stmBnks[secondSettleCardIndex].idCardNo);
 			$("#parentBnkCd2").html(bnkCd2);//总店结算卡二结算银行名称
			$("#parentLbnkProv2").html(lbnkProv2);//总店结算卡二结算银行所在省
			$("#parentLbnkCity2").html(lbnkCity2);//总店结算卡二结算银行所在市
			$("#parentLbnkDesc2").html(stmBnks[secondSettleCardIndex].lbnkDesc);//总店结算卡二结算银行详细信息
			$("#parentLbnkNo2").html(stmBnks[secondSettleCardIndex].lbnkNo);//总店结算卡二联行行号
			$("#parentActNm2").html(stmBnks[secondSettleCardIndex].actNm);//总店结算卡二结算账户名
			$("#parentActNo2").html(stmBnks[secondSettleCardIndex].actNo);//总店结算卡二结算账户
		}
	}
	if(stmBnks != undefined && stmBnks.length>0){
		$("#parentStm1").show();
		$("#parentStm2").hide();
		if(stmBnks.length>1){
			$("#parentStm1").show();
			$("#parentStm2").show();
		}
	}else{
		$("#parentStm1").hide();
		$("#parentStm2").hide();
	}
}else{
	$("#parentStm1").hide();
	$("#parentStm2").hide();
}

function renderx() {
	var resultJson = $("#newMccInfo").val();
	var ifPosmd = $("#ifPosmd").val();
	var posmdstr = $("#posmdstr").val();
	if(resultJson != "" && $('#procDefKey').val() == 'mercIncome' && ifPosmd != '00'){
		resultJson = eval('('+resultJson+')');
    	resultJson.current.justView = true;
    	resultJson.current.preset = false;
    	resultJson.current.effDt = '';
		var template = $('#template').val();
		//{url : '/js/ejs/goods.ejs'}
		var innerHtml = new EJS({
			//text : template,
			url : '<%= request.getContextPath()%>/js/ejs/goods.txt'
		}).render(resultJson.current);
		 $('#newMccInfoDiv').html(innerHtml);
	}else if(resultJson != "" && $('#procDefKey').val() != 'mercIncome' && ifPosmd != '00'){
		resultJson = eval('('+resultJson+')');
    	resultJson.data.justView = true;
    	resultJson.data.preset = false;
    	resultJson.data.effDt = '';
		var template = $('#template').val();
		//{url : '/js/ejs/goods.ejs'}
		var innerHtml = new EJS({
			//text : template,
			url : '<%= request.getContextPath()%>/js/ejs/goods.txt'
		}).render(resultJson.data);
		 $('#newMccInfoDiv').html(innerHtml);
	}
	 //获取预设费率信息
	 if($('#isPreference').val() == '1' && ifPosmd != '00'){
		 var preJson = $("#preGoodsInfo").val();
		 preJson = eval('('+preJson+')');
		 preJson.current.justView = true;
		 preJson.current.preset = true;
			var template = $('#template').val();
			//{url : '/js/ejs/goods.ejs'}
			var innerHtml = new EJS({
				//text : template,
				url : '<%= request.getContextPath()%>/js/ejs/goods.txt'
			}).render(preJson.current);
			 	$('#preGoodsInfoDiv').html(innerHtml);
			 	$('#preDiv').show();
	 }
	//审单秒到展示费率信息
	 if(ifPosmd == '00' && posmdstr != ""){
		 var posmdjson = '{}';
		 posmdjson = eval('('+posmdjson+')');
		 posmdjson.posmdstrAry = posmdstr.split(",");
			//{url : '/js/ejs/goods.ejs'}
			var innerHtml = new EJS({
				//text : template,
				url : '<%= request.getContextPath()%>/js/ejs/posmdGoods.txt'
			}).render(posmdjson);
			 	$('#ifPosmdDiv').html(innerHtml);
			 	
	 }
}

</script>
</body>
</html>











