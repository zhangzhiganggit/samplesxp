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
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        ${taskName}   
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding">
                                        <div class="widget-main ">
                                            <form id="mercInfoForm" class="form-inline form-horizontal" action="<%=request.getContextPath() %>/${mercIncome.procDefKey}/submitNext.do" method="post">
                                            	<input type="hidden" name="ifHadValidate" id="ifHadValidate">
                                            	<!-- 小微商户进件条件（进件渠道、进件类型）-->
                                               	<input type="hidden" name="jinjianTyp" id="jinjianTyp" value="${mercIncome.jinjianTyp}"/>
                                               	<input type="hidden" name="acMecNormalLevel" id="acMecNormalLevel" value="${mercIncome.mecNormalLevel}"/>
                                              	<input type="hidden" name="dataSource" id="dataSource" value="${mercIncome.dataSource}"/>
                                                <input type="hidden" id="mccCdFlg" value="0"/>
                                            	<input type="hidden" id="orgNo" name="orgNo" value="${mercIncome.orgNo}">
                                            	<input type="hidden" name="orderNo" id="orderNo" value="${mercIncome.orderNo}">
                                            	<input type="hidden" name="mercFnm" value="${mercIncome.mercFnm}">
                                            	<input type="hidden" id="orgBranchAttribution" name="orgBranchAttribution" value="${orgBranchAttribution}">
	                                        	<input type="hidden" name="processInstanceId" value="${mercIncome.processInstanceId}"/>
	                                        	<input type="hidden" name="taskId" value="${mercIncome.taskId}"/>
	                                        	<input type="hidden" name="taskDefKey" id="taskDefKey" value="${mercIncome.taskDefKey}"/>
	                                        	<input type="hidden" name="procDefKey" id="procDefKey" value="${mercIncome.procDefKey}"/>
	                                        	<input type="hidden" id="starterAttrOrgNo" name="starterAttrOrgNo" value="${mercIncome.starterAttrOrgNo}"/>
	                                        	<input type="hidden" name="areaInfo" value="${riskControl.areaInfo}"/><!-- 地域信息，用于拼装商户经营概述和本贷本经营概述 -->
	                                        	<input type="hidden" name="industryAbbreviation"/><!-- MCC对应行业简称，用于拼装商户经营概述 -->
	                                        	<input type="hidden" name="condition" />
	                                        	
	                                        	<input type="hidden" id="tipsInfo" name="tipsInfo" value='${mercIncome.tipsInfo }'/>
	                                        	<input id="centerOperateNum" name="centerOperateNum" type="hidden" value="${mercIncome.centerOperateNum}"/>
												<input id="riskOperateNum" name="riskOperateNum" type="hidden" value="${mercIncome.riskOperateNum}"/>
												<input type="hidden" name="businessAddress" id="businessAddress" value="${mercIncome.businessAddress }"/>
												<input type="hidden" name="zcdz" id="zcdz" value="${mercQualInfo.regAddr}"/>
													<!-- 准备身份校验的法人身份证和法人姓名信息 -->
												<input type="hidden" name="legalNm" id="legalNm" value="${mercQualInfo.legalNm}"/>
												<input type="hidden" name="legalCredentialsNo" id="legalCredentialsNo" value="${mercQualInfo.legalCredentialsNo}"/>
												<!-- 准备校验结算卡一的身份信息 -->
												<input type="hidden" name="stmActNm1" id="stmActNm1" value="${mercStmInfo.stmActNm1}">
												<input type="hidden" name="idCardNo1" id="idCardNo1" value="${mercStmInfo.idCardNo1}"/>
												<input type="hidden" name="stmBankNm" id="stmBankNm" value="${mercStmInfo.stmBankNm1}"/>
												<input type="hidden" name="stmBankCd" id="stmBankCd" value="${mercStmInfo.stmBankCd1}"/>
												
												<input type="hidden" name="stmBankDetails" id="stmBankDetails" value="${mercStmInfo.stmBankDetails1}"/>
												<input type="hidden" id="isNotNext" value="${isNotNext }"/>
												
												<input type="hidden" id="rootContent"  value="${rootContent }"/>
    											<input type="hidden" id="readImageUrlExpiredBasePath"  value="${readImageUrlExpiredBasePath }"/>
												<input type="hidden" id="stmAct1" name="stmAct1" value="${mercStmInfo.stmAct1 }"/>
												<input type="hidden" id="stmAct2" name="stmAct2" value="${mercStmInfo.stmAct2 }"/>
												<input type="hidden" id="feeEffdt1" name="feeEffdt1" value="${mercIncome.feeEffdt1 }"/>
												<input type="hidden" id="isRecord" name="isRecord" value="${mercIncome.isRecord }"/>
												<input type="hidden" id="bapReturnCode" value="${interfaceMsg.bapReturnCode}"/>
												<input type="hidden" id="bankMerchantFlag" name="bankMerchantFlag" value="${mercIncome.bankMerchantFlag}"/>
												<input type="hidden" id="bankMerchantId" name="bankMerchantId" value="${mercIncome.bankMerchantId}"/>
												<input type="hidden" id="Stars" name="Stars" value="${Stars}"/>
												<!-- add by lcf 2016-06-04 预设费率类型-->
                                                <input type="hidden" name="preMecFeeTyp" id="preMecFeeTyp" value="${mercIncome.preMecFeeTyp}" >
                                                <!-- end by lcf -->
                                                <textarea style="display: none;" id="newMccInfo">${mercIncome.newMccInfo}</textarea>
                                                 <textarea style="display: none;" id="preGoodsInfo">${mercIncome.preGoodsInfo}</textarea>
                                                 <input type="hidden" name="isPreference" id="isPreference"  value="${mercIncome.isPreference}"/>
                                                 <input type="hidden" name="ifPosmd" id="ifPosmd"  value="${mercIncome.ifPosMd}"/>
                                                 <input type="hidden" name="posmdstr" id="posmdstr"  value="${mercIncome.posMdStr}"/>
                                                 <input type="hidden" id="Stars" name="Stars" value="${Stars}"/>
												<div style="display: none">
												<textarea id="restrictTimes" name="restrictTimes"></textarea>
												</div>
												<!-- 浮动显示代理商代理区域信息 -->
												<c:if test="${pbCheck==false }">
												<div id="Float" style="text-align: center; width: 100px; height:auto; padding: 10px; border: 1px solid grey; background: #BCEDF5 none repeat scroll 0% 0%; position: absolute; z-index: 9999;  top: 80px;right: 20px;">
												    <span><font color="red">进件商户等级</font></span>
												    <br></br>
												    	<c:if test="${mercIncome.mecNormalLevel=='10'}">一类-法人<br></c:if>
												    	<c:if test="${mercIncome.mecNormalLevel=='11'}">一类-授权<br></c:if>
												    	<c:if test="${mercIncome.mecNormalLevel=='20'}">二类<br></c:if>
												    	<c:if test="${mercIncome.mecNormalLevel=='30'}">三类<br></c:if>
												    	<br></br>
												    <span><font color="red">代理区域</font></span>
												    <br></br>
												    <c:forEach var="area" items="${areas }" >
												       ${area.areaNm}<br>
												    </c:forEach> 	
												</div>
												
												<c:if test="${mercIncome.dataSource=='9'}">
												<div id="Float1" style="text-align: center; width: 100px; height:auto; padding: 10px; border: 1px solid grey; background: #BCEDF5 none repeat scroll 0% 0%; position: absolute; z-index: 9999;  top: 80px;right: 160px;">
												    <span><font color="red">进件渠道标识</font></span>
												    <br></br>
												      <c:if test="${mercIncome.jinjianTyp =='1'}">APP普通商户<br></c:if> 
												      <c:if test="${mercIncome.jinjianTyp =='2'}">APP小微商户<br></c:if>
												      <c:if test="${mercIncome.jinjianTyp =='3'}">PC小微转普通<br></c:if>
												</div>
												</c:if>
												<c:if test="${mercIncome.dataSource=='3'}">
												<div id="Float1" style="text-align: center; width: 100px; height:auto; padding: 10px; border: 1px solid grey; background: #BCEDF5 none repeat scroll 0% 0%; position: absolute; z-index: 9999;  top: 80px;right: 160px;">
												    <span><font color="red">进件渠道标识</font></span>
												    <br></br>
												      <c:if test="${mercIncome.jinjianTyp =='1'}">PC普通商户<br></c:if> 
												      <c:if test="${mercIncome.jinjianTyp =='2'}">PC小微商户<br></c:if>
												      <c:if test="${mercIncome.jinjianTyp =='3'}">PC小微转普通<br></c:if>
												</div>
												</c:if>
												</c:if>
												<!-- 显示完毕 -->

												<div class="col-xs-12">
                                                	<label class="control-label widget-color-normal5">
                                                		<!--流水号:${mercIncome.processInstanceId}&nbsp;&nbsp; -->任务编号:${mercIncome.orderNo }&nbsp;&nbsp;当前步骤名称: ${taskName }&nbsp;&nbsp;任务状态:${taskSts }
                                                	</label><br />
                                                	<c:if test="${fn:length(historyImageList)==0}">
                                                		<h4 class="smaller lighter green">图片下载(用户已上传的图片)</h4>
                                                		<h4>无</h4>
                                                	<br/>
                                                	</c:if>
                                                	
                                                	<c:if test="${fn:length(historyImageList)!=0}">

													<div>
														<!--  
														<div class="col-sm-8  no-padding">
															<button class="btn btn-danger btn-sm" type="button"
																style="height: 30px;" onclick="downloadAllImages('${mercIncome.orderNo }')">下载全部图片</button>
														</div>
														<br/>
														-->
														<!--  
														<div style="width: 80%">
															<c:forEach items="${imageList}" var="ImageInfo">
																	<a class="blue"
																		href='<%=base%>mercIncome/downloadOneImage.do?type=${ImageInfo.uuid }&taskCode=${mercIncome.orderNo }'>${ImageInfo.imageName }</a>&nbsp;&nbsp;
															</c:forEach>
														</div>
														-->
														<!-- 历史图片 -->
					                                                  <div class="docs-galley">
					                                                 	<ul class="image_ul">
					                                                    <c:forEach var="item" items="${historyImageList}" varStatus="status">  
					                                                     <p style="color:#F00;text-align:left;clear:both;">第${status.index+1}次上传的图片 <button class="btn btn-danger btn-sm" type="button"
																style="height: 30px;" onclick="downloadAll('${item[0].historyId}');">下载图片</button><br/></p>
																		 <div class="docs-pictures ">		
											                            	<c:forEach var="list" items="${item}"  varStatus="p">
																			  <li class="image_li">
																			  	<div class="contentmenu">
			     																  <img  height="10px;" data-original="${ctx}/salesmanCheck/showImage.do?imageAddr=${list.url}" src="${ctx}/salesmanCheck/showImage.do?imageAddr=${list.url}" alt="${list.type}">
																				  <p>${list.type}</p>
			     																</div>
			     															  </li>
		     																 </c:forEach>  
		     															  </div>
																	     </c:forEach> 
																		</ul>
																	</div>
																	
																	 <!-- 历史图片 -->

													</div>
													</c:if>
													<!-- 显示委托记录 -->
													<%@include file="../taskEntrust/RequestWorkers.jsp"%>
													
                                                     <h4 class="smaller lighter green">风控控制信息  
                                                     <c:if test="${mercIncome.isRecord=='1' }">
                                                     <font color="red" size="2">该商户通过备案商户进件</font>
                                                     </c:if>
                                                     </h4>
                                                      <div class="form-group form-group-sm width-200px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否星级商户:</label>
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
                                                                    <input type="checkbox"  onclick="return buxuyong()" <c:if test="${Stars=='1'}"> checked="checked"  value="1"</c:if>
                                                                     value="1" name="isStars" id="isStars" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>		
                                                        		</c:when>
                                                        		<c:otherwise>
                                                        			<input type="hidden" id="isStarsFlag3" value="${mercIncome.isStars}"/>
                                                                    <input type="checkbox" <c:if test="${mercIncome.isStars =='1'}"> checked="checked"  value="1"</c:if> onclick="return buxuyong()"
                                                                    	  name="isStars" id="isStars" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                        		</c:otherwise>
                                                        	</c:choose>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >关键字<span style="color:red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="hidden" id="keyw" value="${riskControl.keywords }"/>
                                                            <input type="text" name="riskControl.keywords" id="keywords" class="form-control input-small width-200px " value="${riskControl.keywords }" data-placement="bottom" title=""  
                                                            	onblur="javascript:value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\-\(\)\（\）\、\ ]/g,'');" 
    															onchange="refreshDescBiz('keywords','${mercIncome.taskDefKey}');" style="color:#000000"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户MCC<span style="color:red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding width-200px"  >
                                                        	<c:choose>  
                                                        		<c:when test="${mercIncome.procDefKey == 'mercIncome'}">
                                                        			<input type="hidden" id="mccCd" value="${riskControl.mccCd}"/>
                                                             		<select data-placeholder="请选择" name="riskControl.mccCd" id="mccCdSelect" onchange="refreshDescBiz('mccCd','${mercIncome.taskDefKey}');" class="chosen-select form-control">
                                                             		</select>		
                                                        		</c:when>
                                                        		<c:otherwise>
                                                        			<input type="text" name="riskControl.mccCd" readonly="readonly" id="mccCd" value="${riskControl.mccCd}" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        		</c:otherwise>
                                                        	</c:choose>
                                                        </div>
                                                    </div>
                                                    
                                                   
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营概述<span style="color:red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding "  ><!-- required -->
                                                            <input type="text" name="riskControl.descBiz" onchange="alert('经营概述已变更请修改经营名称！');putMercFnm();" id="descBiz" data-bv-notempty value="${riskControl.descBiz }" class="form-control input-small width-100 " data-placement="bottom" title="" style="color:#000000"  />
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营名称<span style="color:red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding "  ><!-- required -->
                                                            <input type="text" name="mercIncome.mercFnm" id="mercFnm" onchange="checkMercFnmLen();" data-bv-notempty value="${mercIncome.mercFnm}" class="form-control input-small width-100 " data-placement="bottom" title="" style="color:#000000"  />
                                                        </div>
                                                    </div>
                                                    <c:if test="${mercIncome.procDefKey == 'mercInfoUpdate' && mercIncome.isPreference == '1'}">
                                                    	<div class="form-group form-group-sm width-300px">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设MCC<span style="color:red">*</span>:</label>
	
	                                                        <div class="col-sm-8  no-padding width-200px"  >
	                                                            <input type="hidden" id="prepareMccCode" value="${riskControl.prepareMccCode}"/>
                                                             	<select data-placeholder="请选择" name="riskControl.prepareMccCode" id="prepareMccSelect" onchange="refreshDescBiz('mccCd','${mercIncome.taskDefKey}');"  class="chosen-select form-control">
                                                             	</select>
	                                                        </div>
	                                                    </div>
                                                    </c:if>
                                                    <div class="form-group form-group-sm width-100" style="display:none;">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >本贷本经营概述*:</label>

                                                        <div class="col-sm-8  no-padding "  >
                                                            <input type="text" name="riskControl.descLoanBiz" value="${riskControl.descLoanBiz }" class="form-control input-small width-100 " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户级别:</label>
                                                        <div class="col-sm-8  no-padding width-48">
                                                        	<input type="hidden" id="mercLevel" value="${riskControl.mercLevel}"/>
                                                            <select data-placeholder="请选择" name="riskControl.mercLevel" id="mercLevelSelect" class="chosen-select form-control">
                                                            	<option value=""></option>
                                                                <option value="1">一级</option>
                                                                <option value="2">二级</option>
                                                                <option value="3">三级</option>
                                                                <option value="4">四级</option>
                                                                <option value="5">五级</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                   
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >无分公司:</label>
                                                        <div class="col-sm-8  no-padding width-48">
                                                        	<input type="hidden" id="noBranch" value="${riskControl.noBranch}"/>
                                                            <select data-placeholder="请选择" name="riskControl.noBranch" id="noBranchSelect" class="chosen-select form-control">
                                                            	<option value=""></option>
                                                                <option value="1">总对总本地</option>
                                                                <option value="2">总对总异地</option>
                                                                <option value="3">省内有办事处</option>
                                                            </select>
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >混业经营:</label>
                                                        <div class="col-sm-8  no-padding width-48">
                                                        	<input type="hidden" id="mixedOperation" value="${riskControl.mixedOperation}"/>
                                                            <select data-placeholder="请选择" name="riskControl.mixedOperation" id="mixedOperationSelect" class="chosen-select form-control">
                                                            	<option value=""></option>
                                                                <option value="1">正规混业</option>
                                                                <option value="2">高低费率同进</option>
                                                                <option value="3">模糊混业</option>
                                                                <option value="4">非混业</option>
                                                            </select>
                                                            
                                                        </div>
                                                    </div>
                                                    <c:if test="${pbCheck ==false }">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >账户授权:</label>
                                                        <div class="col-sm-8  no-padding width-48">
                                                        	<input type="hidden" id="acountAuth" value="${riskControl.acountAuth}"/>
                                                            <select data-placeholder="请选择" name="riskControl.acountAuth" id="acountAuthSelect" class="chosen-select form-control">
                                                            	<option value=""></option>
                                                                <option value="1">公司核名</option>
							    								<option value="2">个体授权</option>
							    								<option value="3">公对公授权</option>
                                                            </select>
                                                            
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >资料缺失:</label>
                                                        <div class="col-sm-8  no-padding width-48">
                                                        	<input type="hidden" id="lackOfInformation" value="${riskControl.lackOfInformation}"/>
                                                            <select data-placeholder="请选择" name="riskControl.lackOfInformation" id="lackOfInformationSelect" class="chosen-select form-control">
                                                            	<option value=""></option>
                                                                <option value="1">证件补办</option>
							    								<option value="2">照片后补</option>
							    								<option value="3">其他资料缺失</option>
							    								<option value="4">仅核名通知书</option>
							    								<option value="5">核心资料后补</option>
							    								<option value="6">租赁合同进件</option>
                                                            </select>
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >移动POS:</label>
                                                        <div class="col-sm-8  no-padding width-48">
                                                        	<input type="hidden" id="mobilPos" value="${riskControl.mobilPos}"/>
                                                            <select data-placeholder="请选择" id="mobilPosSelect" name="riskControl.mobilPos" class="chosen-select form-control">
                                                            	<option value=""></option>
							    								<option value="1">混业低费率</option>
							    								<option value="2">写字楼办公</option>
							    								<option value="3">民生类</option>
							    								<option value="4">封顶商户</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >高风险行业:</label>
                                                        <div class="col-sm-8  no-padding width-48">
                                                        	<input type="hidden" id="highRiskIndustry" value="${riskControl.highRiskIndustry}"/>
                                                            <select data-placeholder="请选择" name="riskControl.highRiskIndustry" id="highRiskIndustrySelect" class="chosen-select form-control">
                                                            	<option value=""></option>
                                                                <option value="1">中介及咨询服务</option>
							    								<option value="2">小型经贸公司</option>
							    								<option value="3">教育培训类公司</option>
							    								<option value="4">直销公司</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <c:if test="${pbCheck ==false }">
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >例外商户:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                            <input type="hidden" id="isExceptionMercFlag" value="${riskControl.isExceptionMerc}"/>
                                                            <input type="hidden" id="isExceptionFlag" value="${isExceptionMercFlag}"/>
                                                            <input type="checkbox" 
                                                            <c:if test="${isExceptionMercFlag == 'true' }">
                                                            checked 
                                                            </c:if>
                                                             value="1" name="riskControl.isExceptionMerc" id="isExceptionMerc" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <div class="form-group form-group-sm width-300px" style="display: none;">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  style="display: none;">是否特惠商户:</label>
                                                        <div class="col-sm-8  no-padding"  style="display: none;">
                                                        	<input type="hidden" id="specialPreferenceFlag" value="${mercIncome.specialPreference}"/>
                                                        	<input type="checkbox" value="1" id="specialPreference" class="ace ace-switch ace-switch-6 btn-flat" style="display: none;"/> <span class="lbl"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px " style="display: none;">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户优惠类型:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                        	<input type="hidden" id="mercPreferentialType" value="${mercIncome.mercPreferentialType}"/> 
                                                            <input type="checkbox" value="1" name="mercIncome.mercPreferentialType" id="urbanAndRural" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl">&nbsp;县乡</span>
                                                            <input type="checkbox" value="3" name="mercIncome.mercPreferentialType" id="threeRural" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl">&nbsp;三农</span>
                                                        </div>
                                                    </div>
                                                    <c:if test="${mercIncome.jinjianTyp=='2'}">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >每日结算限额<span style="color:red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <input type="hidden" id="limitmoney" value="0"/>
                                                            <select name="limitmoney" id="limitmoneySelect" data-placeholder="无限额"  class="chosen-select form-control">
                                                            	<option value="0">无限额</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                </div>
                                                <div class=" col-xs-12">
                                                	<h4 class="smaller lighter green">商户信息</h4>
                                                	<div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >行业大类*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   style="color:blue;" data-content="" id="mcc" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mcc}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类别*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                    data-content="" id="mcc" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ><c:if test="${mercIncome.mercPreferenceType == '01'||mercIncome.mercPreferenceType == '1'}"><font color="blue" >标准类</font></c:if>
                                                                    <c:if test="${mercIncome.mercPreferenceType == '02'||mercIncome.mercPreferenceType == '2'}"><font color="red" style="font-weight:bold;">优惠类</font></c:if>
                                                                    <c:if test="${mercIncome.mercPreferenceType == '03'||mercIncome.mercPreferenceType == '3'}"><font color="red" style="font-weight:bold;">减免类</font></c:if>
                                                                    <c:if test="${mercIncome.mercPreferenceType == '04'||mercIncome.mercPreferenceType == '4'}"><font color="red" style="font-weight:bold;">特殊优惠类</font></c:if>
                                                                    </label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户等级*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px  view-control "  data-content="" id="mecNormalLevel" data-placement="bottom" data-trigger="hover" data-rel="popover">
                      											<c:if test="${mercIncome.mecNormalLevel=='10'}">一类-法人<br></c:if>
												    			<c:if test="${mercIncome.mecNormalLevel=='11'}">一类-授权<br></c:if>
												    			<c:if test="${mercIncome.mecNormalLevel=='20'}">二类<br></c:if>
												    			<c:if test="${mercIncome.mecNormalLevel=='30'}">三类<br></c:if>
                                                             </label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px" style="display: none;">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >费率(%)*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   style="color:blue;" data-content="${mercIncome.feeRate}" id="feeRate" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.feeRate}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px" style="display: none;">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >封顶值:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                        	
                                                            <!-- <input type="checkbox" value="1" id="isCap" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span> -->
                                                            <label class="form-control input-small width-48   view-control  "
                                                                   style="color:blue;" data-content="${mercIncome.capAmt}" id="capAmt" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.capAmt}</label>
                                                        </div>
                                                    </div>
                                                    
                                                    <c:if test="${mercIncome.procDefKey == 'mercInfoUpdate' && mercIncome.feeRate1 != null && mercIncome.feeEffdt1 != null}">
                                                    	<div class="form-group form-group-sm width-300px" style="display: none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设行业大类<span style="color:red">*</span>:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   style="color:blue;" data-content="" data-placement="bottom" id="prepareMcc1" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.prepareMcc}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px" style="display: none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设费率(%):</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   style="color:blue;" data-content="${mercIncome.feeRate1}" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.feeRate1}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px" style="display: none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设封顶值:</label>
	
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-48   view-control  "
	                                                                   style="color:blue;" data-content="${mercIncome.capAmt1}"  data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.capAmt1}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px"  style="display: none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设生效日期:</label>
	
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-48   view-control  "
	                                                                   style="color:blue;" data-content="${mercIncome.feeEffdt1}"  data-placement="bottom" data-trigger="hover" data-rel="popover"
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
	                                                        	<input type="hidden" name="isPreference" id="isPreference"  value="${mercIncome.isPreference}"/>
	                                                        	<input type="checkbox" <c:if test="${mercIncome.isPreference=='1' }">checked="checked"</c:if> name="isPreferenceFlag" id="isPreferenceFlag" value="${mercIncome.isPreference}" onclick="return false;" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl">&nbsp;</span>
	                                                        </div>
                                                    	</div>
                                                    </c:if>
                                                    
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >实际经营范围:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                        	
                                                            <!-- <input type="checkbox" value="1" id="isCap" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span> -->
                                                            <label class="form-control input-small width-100   view-control  "
                                                                   style="color:blue;" data-content="${mercIncome.bizScope}" id="capAmt" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.bizScope}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-100">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >营业地址*:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-100   view-control  "
                                                                   style="color:blue;" data-content="" id="mercAddr" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mercProv}-${mercIncome.mercCity}-${mercIncome.mercTown}-${mercIncome.mercAddr}</label>
                                                        </div>
                                                    </div>
                                                </div>
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
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <div class="widget-body">
                                                            <div class="widget-main padding-4">
                                                                <div class="tab-content padding-8">
                                                                    <div class="tab-pane active" id="member-tab1">
                                                                        <div class="form-group form-group-sm width-100">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册名称:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                            	<input type="hidden" name="mercRegNm" value="${mercQualInfo.mercRegNm}">
                                                                                <label class="form-control input-small width-100   view-control  "
                                                                                       style="color:blue;" data-content="${mercQualInfo.mercRegNm}" id="mercRegNm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.mercRegNm}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm  width-100">
					                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册地址:</label>
					                                                        <%-- <c:if test="${mercQualInfo.regAddr.split('-').lehgth>2}"> --%>
					                                                        <div class="col-sm-8  no-padding" id="clsh">
					                                                            <label class="form-control input-small width-100   view-control  "
					                                                                   style="color:blue;" data-content="${mercQualInfo.regAddr}" id="regAddr" data-placement="bottom" data-trigger="hover" data-rel="popover"
					                                                                    >${mercQualInfo.regAddr}</label>
					                                                        </div>
					                                                        <div class="col-sm-8  no-padding" id="clsh2" hidden="hidden">
					                                                        
					                                                        </div>
					                                                        <%-- </c:if> --%>
					                                                    </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册登记号:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       style="color:blue;" data-content="${mercQualInfo.regNo}" id="regNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.regNo}</label>
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
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户性质:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercQualInfo.mercNature}" id="mercNature" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.mercNature}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人名称:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       style="color:blue;" data-content="${mercQualInfo.legalNm}" id="legalNm" data-placement="bottom" data-trigger="hover" data-rel="popover"
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
                                                                                       style="color:blue;" data-content="${mercQualInfo.legalCredentialsNo}" id="legalCredentialsNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercQualInfo.legalCredentialsNo}</label>
                                                                                          <input type="button" class="btn btn-minier btn-purple" onclick="checkIdCard()" value="校验" title="校验法人的身份信息"/>
                                                                            </div>
                                                                        </div>
                                                                        <!-- 显示校验结果 -->
                                                                        		<div id="identifyInfo" style="display:none; width:500px;height:485px;padding:10px;background:#fafafa;" > 
																					<div class="easyui-panel" style="width:465px;height:50px;overflow-x:hidden;background:#fafafa;" title="验证信息">
																						<center style="margin-top: 10px"><span id="identifyMessage" style="font-size: medium;font-weight: bold;"></span></center>
																					</div>
																					<br/><br/><br/>
																					<div class="easyui-panel" style="overflow-x:hidden;width:465px;height:300px;background:#fafafa;" title="照片信息">
																						<center style="margin-top: 10px"><img src="" id="identifyImg" style="display:none; "/>
																							<span id="identifyImgDiv" style="font-size: medium;font-weight: bold;"></span>
																						</center>
																					</div>
																				</div>
                                                                        <!-- 显示完毕 -->
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
                                                                        <div class="form-group form-group-sm width-300px" style="display: none;">
                                                                            <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户日切时间:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="${mercStmInfo.changeTime}时" id="changeTime" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.changeTime}时</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px " style="display: none;"> 
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
                                                                            	<c:if test="${mercStmInfo.nowPay == '1' }">
                                                                            		<div style="position: absolute;left: -100px;top: 32px;">
                                                                            			<label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >即日付手续费:</label>
                                                                            	
                                                                            			<label class="form-control input-small width-100px   view-control  "
                                                                                       	style="color:blue;" id="jrffl" data-placement="bottom" data-trigger="hover" data-rel="popover"
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
                                                                        <!-- 扫码支付 -->
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >其它消费:</label>
                                                                            <div class="col-sm-8  no-padding"  >
                                                                            	<input type="hidden" id="qrCodeFlag" value="${mercIncome.qrCodeFlg}"/>
                                                                            	<input type="checkbox" value="1" name="qrCodeFlg" id="qrCodeFlg" class="ace ace-switch ace-switch-6 btn-flat" /><span class="lbl"></span>
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
                                                                                       style="color:blue;" data-content="${mercStmInfo.stmBankNm1}" id="stmBankNm1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.stmBankNm1}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行所在省:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       style="color:blue;" data-content="${mercStmInfo.stmBankProvinceN1}" id="stmBankProvince1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.stmBankProvinceN1}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行所在市:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       style="color:blue;" data-content="${mercStmInfo.stmBankCityN1}" id="stmBankCity1" data-placement="bottom" data-trigger="hover" data-rel="popover"
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
                                                                                       style="color:blue;" data-content="${mercStmInfo.stmActNm1}" id="stmActNm1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.stmActNm1}</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账号:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       style="color:blue;" data-content="${vb:account(mercStmInfo.stmAct1) }" id="stmActs1" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${vb:account(mercStmInfo.stmAct1) }</label>
                                                                            </div>
                                                                        </div>
                                                                        <c:if test="${mercStmInfo.stmActTyp1=='1'}">
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >账户法人姓名:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       style="color:blue;" data-content="${mercStmInfo.stmLegalNm}" id="stmLegalNm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >${mercStmInfo.stmLegalNm}</label>
                                                                            </div>
                                                                        </div>
                                                                        </c:if>
                                                                        <div class="form-group form-group-sm width-300px">
	                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >身份证号码:</label>
	
	                                                                        <div class="col-sm-8  no-padding"  >
	                                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                                   style="color:blue;" data-content="${mercStmInfo.idCardNo1}" id="idCardNo1" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                   >${mercStmInfo.idCardNo1}</label>
	                                                                        </div>
	                                                                    </div>
	                                                                    <input type="button" class="btn btn-minier btn-purple" id="twoElement" onclick="checkIdCard1('${mercIncome.orderNo}')" value="二要素校验" title="校验结算卡一的身份证号"/>
	                                                                    <button class="btn btn-danger btn-sm" type="button"  id="threeElement"    onclick="checkIdCard2('${mercIncome.orderNo}')" title="校验结算卡一的身份证号" >
	                                                                    <span class="ace-icon  icon-on-right bigger-110"></span>
	                                                                    		 三要素校验
	                                                                    </button>
	                                                      
	                                                                    
                                                                        <div class="form-group form-group-sm width-100">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行详细信息:</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-100   view-control  "
                                                                                       style="color:blue;" data-content="${mercStmInfo.stmBankDetails1}" id="stmBankDetails1" data-placement="bottom" data-trigger="hover" data-rel="popover"
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
	                                                                                       style="color:blue;" data-content="${mercStmInfo.stmBankNm2}" id="stmBankNm2" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.stmBankNm2}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行所在省:</label>
	
	                                                                            <div class="col-sm-8  no-padding" >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       style="color:blue;" data-content="${mercStmInfo.stmBankProvinceN2}" id="stmBankProvince2" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.stmBankProvinceN2}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行所在市:</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       style="color:blue;" data-content="${mercStmInfo.stmBankCityN2}" id="stmBankCity2" data-placement="bottom" data-trigger="hover" data-rel="popover"
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
	                                                                                       style="color:blue;" data-content="${mercStmInfo.stmActNm2}" id="stmActNm2" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${mercStmInfo.stmActNm2}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账号:</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       style="color:blue;" data-content="${vb:account(mercStmInfo.stmAct2) }" id="stmActs2" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${vb:account(mercStmInfo.stmAct2) }</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <c:if test="${mercStmInfo.stmActTyp2==2}">
	                                                                        <div class="form-group form-group-sm width-300px">
		                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >身份证号码:</label>
		
		                                                                        <div class="col-sm-8  no-padding"  >
		                                                                            <label class="form-control input-small width-200px   view-control  "
		                                                                                   style="color:blue;" data-content="${mercStmInfo.idCardNo2}" id="idCardNo2" data-placement="bottom" data-trigger="hover" data-rel="popover"
		                                                                                   >${mercStmInfo.idCardNo2}</label>
		                                                                        </div>
	                                                                    	</div>
	                                                                    	</c:if>
	                                                                        <div class="form-group form-group-sm width-100">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行详细信息:</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-100   view-control  "
	                                                                                       style="color:blue;" data-content="${mercStmInfo.stmBankDetails2}" id="stmBankDetails2" data-placement="bottom" data-trigger="hover" data-rel="popover"
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
	                                                                        <div class="form-group form-group-sm width-300px" style="display:none;">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收取模式</label>
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.chargingMod}" id="chargingMod" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.chargingMod}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px" style="display:none;">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收取方式</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.chargingWay}" id="chargingWay" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.chargingWay}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px" style="display:none;">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >免收周期</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.freeCycle-1}个月" id="freeCycle" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.freeCycle-1}个月</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px" style="display:none;">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预收金额</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.maintenanceFeeAmt}" id="maintenanceFeeAmt" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.maintenanceFeeAmt}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px" >
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >维护费金额</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                            	<input type="hidden" id="hiddenMtfee" value="${feeInfo.mtfee}">
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.mtfee}" id="mtfee" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.mtfee}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px"  style="display: none;">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >免收起点</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.freeStartingPoint}" id="freeStartingPoint" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.freeStartingPoint}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px" style="display: none;">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >最低交易笔数</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.minEffectiveTrans}" id="minEffectiveTrans" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.minEffectiveTrans}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px" style="display:none;">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >当月是否收取维护费</label>
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                            	<input type="hidden" id="isMaintenanceFeeCurrentFlag" value="${feeInfo.isMaintenanceFeeCurrent}"/>
		                                                            				<input type="checkbox" value="1" id="isMaintenanceFeeCurrent" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
	                                                                            </div>
	                                                                        </div>
	                                                                        <!-- <h5 class="header smaller lighter green" style="margin-top:1px;" >以太网/拨号-POS</h5> -->
	                                                                        <div class="form-group form-group-sm width-300px" style="display:none;">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >单台收取维护费</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.feeAmtEnDial}" id="feeAmtEnDial" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.feeAmtEnDial}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px" style="display:none;">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >免收台数</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.freeCountsEnDial}" id="freeCountsEnDial" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.freeCountsEnDial}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <!-- <h5 class="header smaller lighter green" style="margin-top:1px;">GPRS-POS</h5> -->
	                                                                        <div class="form-group form-group-sm width-300px" style="display:none;">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >单台收取维护费</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.feeAmtGprs}" id="feeAmtGprs" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.feeAmtGprs}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <div class="form-group form-group-sm width-300px" style="display:none;">
	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >免收台数</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-200px   view-control  "
	                                                                                       data-content="${feeInfo.freeCountsGprs}" id="freeCountsGprs" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.freeCountsGprs}</label>
	                                                                            </div>
	                                                                        </div>
	                                                                        <%-- <div class="form-group form-group-sm width-100">
	                                                                            <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >其他说明事项</label>
	
	                                                                            <div class="col-sm-8  no-padding"  >
	                                                                                <label class="form-control input-small width-100   view-control  "
	                                                                                       data-content="${feeInfo.comments}" id="comments" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                        >${feeInfo.comments}</label>
	                                                                            </div>
	                                                                        </div> --%>
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
<!-- modify by lcf 20170106 隐藏功能开通信息 operation-22003 -->
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
<%-- 	                                                                                       data-content="${foreighCardInfoOfBoc.functionAccepted}" id="functionAcceptedForFC" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBoc.functionAccepted}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >Visa费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreighCardInfoOfBoc.feeRateVisa}" id="bocFeeRateVisa" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBoc.feeRateVisa}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >Master费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreighCardInfoOfBoc.feeRateMaster}" id="bocFeeRateMaster" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBoc.feeRateMaster}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >AmericanExpress费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreighCardInfoOfBoc.feeRateAmericanExpress}" id="bocFeeRateAmericanExpress" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBoc.feeRateAmericanExpress}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >Diners费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreighCardInfoOfBoc.feeRateDiners}" id="bocFeeRateDiners" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBoc.feeRateDiners}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >JCB费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreighCardInfoOfBoc.feeRateJcb}" id="bocFeeRateJcb" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBoc.feeRateJcb}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!--                                                                         </div> -->
<!--                                                                         <h5 class="header smaller lighter green" style="margin-top:1px;">北京交行外卡</h5> -->
<!--                                                                         <div class="form-group form-group-sm width-100"> -->
<!--                                                                             <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否开通</label> -->
<!--                                                                             <div class="col-sm-8 no-padding"> -->
<%--                                                                                 <input type="hidden" id="hideForeignCcyCardTyp2" disabled="disabled" value="${mercIncome.isForeignCcyCard}"/> --%>
<!-- 	                                                            				<input type="checkbox" value="1" id="foreignCcyCardTyp2" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span> -->
<!--                                                             				</div> -->
<!--                                                                         </div> -->
<!--                                                                         <div id="foreighCardInfoOfBocomInfo" style="display:none;"> -->
<!--                                                                         	<div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >Visa费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreighCardInfoOfBocom.feeRateVisa}" id="bocomFeeRateVisa" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBocom.feeRateVisa}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >Master费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreighCardInfoOfBocom.feeRateMaster}" id="bocomFeeRateMaster" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBocom.feeRateMaster}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >AmericanExpress费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreighCardInfoOfBocom.feeRateAmericanExpress}" id="bocomFeeRateAmericanExpress" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBocom.feeRateAmericanExpress}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >Diners费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreighCardInfoOfBocom.feeRateDiners}" id="bocomFeeRateDiners" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBocom.feeRateDiners}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >JCB费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreighCardInfoOfBocom.feeRateJcb}" id="bocomFeeRateJcb" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBocom.feeRateJcb}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >VISA_DCC费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreighCardInfoOfBocom.feeVisaDcc}" id="bocomFeeVisaDcc" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBocom.feeVisaDcc}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!-- 	                                                                        <div class="form-group form-group-sm width-300px"> -->
<!-- 	                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >MC_DCC费率</label> -->
<!-- 	                                                                            <div class="col-sm-8  no-padding"  > -->
<!-- 	                                                                                <label class="form-control input-small width-200px   view-control  " -->
<%-- 	                                                                                       data-content="${foreighCardInfoOfBocom.feeMcDcc}" id="bocomFeeMcDcc" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%-- 	                                                                                        >${foreighCardInfoOfBocom.feeMcDcc}</label> --%>
<!-- 	                                                                            </div> -->
<!-- 	                                                                        </div> -->
<!--                                                                         </div> -->
<!--                                                                     </div> -->
                                                                </div>
                                                            </div><!-- /.widget-main -->
                                                        </div><!-- /.widget-body -->
                                                    </div><!-- /.widget-box -->
                                                </div>
                                                <div id="repeatCount"></div>
                                                ${cityRegInfo }
                                                <c:if test="${'' ne mercIncome.newMccInfo && '00' ne mercIncome.ifPosMd}">
	                                                 <div  class="col-sm-12">
	                 							   		 <h4 class="smaller lighter green">费率信息 </h4>
	                 							   		 <div id="newMccInfoDiv"></div>
	                 							     </div>
	                 							     <div  class="col-sm-12" style="display: none;" id="preDiv">
	                 							   		<h4 class="smaller lighter green">预设费率信息  </h4>
                                                    	<div class="form-group form-group-sm width-300px" >
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设行业大类<span style="color:red">*</span>:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                        	<input type="hidden" value="${mercIncome.prepareMcc}" id="prepareMccValue">
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   style="color:blue;" data-content="" data-placement="bottom" id="prepareMcc" data-trigger="hover" data-rel="popover"
	                                                                    ><c:if test="${mercIncome.prepareMcc=='1'}">餐娱类</c:if><c:if test="${mercIncome.prepareMcc=='2'}">一般类</c:if><c:if test="${mercIncome.prepareMcc=='3'}">民生类</c:if><c:if test="${mercIncome.prepareMcc=='4'}">房产汽车类</c:if><c:if test="${mercIncome.prepareMcc=='5'}">批发类</c:if><c:if test="${mercIncome.prepareMcc=='6'}">公益类</c:if></label>
	                                                        </div>
	                                                    </div>
	                 							   		<div id="preGoodsInfoDiv"></div>
	                 							     </div>
                 							     </c:if>
                 							     <c:if test="${'00' eq mercIncome.ifPosMd}">
                 							     <div  class="col-sm-12">
	                 							   		 <h4 class="smaller lighter green">费率信息 </h4>
	                 							   		 <div id="ifPosmdDiv"></div>
	                 							     </div>
                 							     </c:if>
                                                <div class=" col-xs-12">
                                                   <h4 class="smaller lighter green">基本信息</h4>
                                                   <c:if test="${mercIncome.procDefKey == 'mercInfoUpdate' }">
	                                                   <div class="form-group form-group-sm  width-300px">
	                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户编号:</label>
	                                                        <div class="col-sm-8  no-padding">
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   data-content="${mercIncome.mercId }" id="mercId" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.mercId}</label>
	                                                        </div>
	                                                    </div>
	                                                    <c:if test="${mercIncome.taskDefKey == 'centerCheck' }">
	                                                    	<div class="form-group form-group-sm  width-300px">
		                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户创建日期:</label>
		                                                        <div class="col-sm-8  no-padding">
		                                                            <label class="form-control input-small width-200px   view-control  "
		                                                                   data-content="${mercCreateDate }" id="mercCreateDate" data-placement="bottom" data-trigger="hover" data-rel="popover"
		                                                                    >${mercCreateDate}</label>
		                                                        </div>
		                                                    </div>
	                                                    </c:if>
                                                    </c:if>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " style="color:blue;" 
                                                           		
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
                                             <%--        <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >经营名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   id="mercFnm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mercFnm}</label>
                                                        </div>
                                                    </div> --%>

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
                                                                   style="color:blue;" data-content="${mercIncome.bizScope}" id="bizScope" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.bizScope}</label>
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
													<c:if test="${pbCheck ==false }">

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
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >业务员名称*:</label>
	
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   data-content="${mercIncome.busManName}" id="busManName" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.busManName}</label>
	                                                        </div>
	                                                    </div>
	                                                    <%-- <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >业务员标签 :</label>
														<input type="hidden" id="salesmanLabel" value="${mercIncome.salesmanLabel}" >
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="" id="salesmanLabel" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.salesmanLabel}</label>
                                                        </div>
                                                    	</div> --%>
	                                                    <div class="form-group form-group-sm width-300px">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >自定义分类:</label>
															<input type="hidden" id="customClassify" value="${mercIncome.customClassify}" >
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   data-content="" id="customClassify" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.customClassify}</label>
	                                                        </div>
	                                                    </div>
										    		</c:if>
										    		<c:if test="${pbCheck ==false }">
													<div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >一代信息*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   style="color:blue;" data-content="${mercIncome.devOfficerNm}" id="devOfficerNm" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.devOfficerNm}</label>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >功能受理*:</label>
														<input type="hidden" id="mercFunctionNum" value="${mercIncome.mercFunction}" >
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   style="color:blue;" data-content="" id="mercFunction" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.mercFunction}</label>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行合作:</label>
														<input type="hidden" id="bankTeamwork" value="${mercIncome.bankTeamwork}" >
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="" id="bankTeamworkStr" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.bankTeamworkStr}</label>
                                                        </div>
                                                    </div>
                                                   
                                                    <div class="form-group form-group-sm width-300px" id="bankTeamworkSignDiv" style="display:none;">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行合作标识:</label>
														<input type="hidden" id="bankTeamworkSign" value="${mercIncome.bankTeamworkSign}" >
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="" id="bankTeamworkSign" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.bankTeamworkSign}</label>
                                                        </div>
                                                    </div>
                                                   
                                        <!--         <div id="customerManagerDiv" style="display:inline,none;">--> 
                                                    <div class="form-group form-group-sm width-300px customerManagerDiv" style="display:none;">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所在银行:</label>
														<input type="hidden" id="bankTeamworkSign" value="${mercIncome.customerManagerBank}" >
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="" id="bankTeamworkSign" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.customerManagerBank}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px customerManagerDiv" style="display:none;">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >合作经理:</label>
														<input type="hidden" id="bankTeamworkSign" value="${mercIncome.customerManager}" >
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="" id="bankTeamworkSign" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mercIncome.customerManager}</label>
                                                        </div>
                                                    </div>
                                               <!-- </div>--> 
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >允许信用卡:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        	<input type="hidden" id="isCreditCardFlag" value="${mercIncome.isCreditCard}"/>
                                                            <input type="checkbox" value="1" id="isCreditCard" class="ace ace-switch ace-switch-6 btn-flat" /> <span class="lbl"></span>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                    <div id="presetFeeRate" style="display:none;">
                                                    	<div class="form-group form-group-sm width-300px" style="display:none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设行业大类*:</label>
	
	                                                        <div class="col-sm-8  no-padding"  >
	                                                        	<input type="hidden" id="hiddenPrepareMcc"/>
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   style="color:blue;" data-content="" id="prepareMcc" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.prepareMcc}</label>
	                                                        </div>
	                                                    </div>
	                                                    
	                                                    <div class="form-group form-group-sm width-300px" style="display:none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设费率(%)*:</label>
	                                                        <div class="col-sm-8  no-padding">
	                                                            <label class="form-control input-small width-200px   view-control  "
	                                                                   style="color:blue;" data-content="${mercIncome.feeRate1}" id="feeRate1" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.feeRate1}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px" style="display:none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >封顶值:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-48   view-control  "
	                                                                   style="color:blue;" data-content="${mercIncome.capAmt}"  data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.capAmt}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px" style="display:none;">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预设生效日期:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-48   view-control  "
	                                                                   style="color:blue;" data-content="${mercIncome.feeEffdt1}" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                    >${mercIncome.feeEffdt1}</label>
	                                                        </div>
	                                                    </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <h4 class="smaller lighter green">POS申请信息</h4>
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
                                                <div id="tips"><ul id="showChangeMessage"></ul><ul id="newShowChangeMessage"></ul></div>
                                                <c:if test="${mercIncome.taskDefKey == 'centerCheck' }">
                                                <div class=" col-sm-12">
                                                	<h4 class="smaller lighter green">审核登记信息</h4>
                                                		<div class="form-group form-group-sm width-300px">
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >虚假申请:</label>
                                                        	<div class="col-sm-8  no-padding width-48">
	                                                            <select data-placeholder="请选择" multiple class="chosen-select form-control width-200px " onchange="checkCenterInfo()" id="falseApplication" name="centerTaskCount.falseApplication">
	                                                            	
	                                                            </select>
                                                        	</div>
		                                                </div>
                                                		<div class="form-group form-group-sm width-300px">
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >政策问题:</label>
                                                        	<div class="col-sm-8  no-padding width-48">
	                                                            <select data-placeholder="请选择" multiple class="chosen-select form-control width-200px " id="policyIssues" onchange="checkCenterInfo()" name="centerTaskCount.policyIssues">
	                                                            	
	                                                            </select>
                                                        	</div>
		                                                </div>
                                                		<div class="form-group form-group-sm width-300px">
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件资料缺失:</label>
                                                        	<div class="col-sm-8  no-padding width-48">
	                                                            <select data-placeholder="请选择" multiple class="chosen-select form-control width-200px " onchange="checkCenterInfo()" id="dataMissing" name="centerTaskCount.dataMissing">
	                                                            	
	                                                            </select>
                                                        	</div>
		                                                </div>
                                                		<div class="form-group form-group-sm width-300px">
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >资料不合格:</label>
                                                        	<div class="col-sm-8  no-padding width-48">
	                                                            <select data-placeholder="请选择" multiple class="chosen-select form-control width-200px " onchange="checkCenterInfo()" id="dataNotQualified" name="centerTaskCount.dataNotQualified">
	                                                            	
	                                                            </select>
                                                        	</div>
		                                                </div>
                                                		<div class="form-group form-group-sm width-300px">
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >录入错误:</label>
                                                        	<div class="col-sm-8  no-padding width-48">
	                                                            <select data-placeholder="请选择" multiple class="chosen-select form-control width-200px " onchange="checkCenterInfo()" id="inputError" name="centerTaskCount.inputError">
	                                                            	
	                                                            </select>
                                                        	</div>
		                                                </div>
                                                		<div class="form-group form-group-sm width-300px">
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >填写错误:</label>
                                                        	<div class="col-sm-8  no-padding width-48">
	                                                            <select data-placeholder="请选择" multiple class="chosen-select form-control width-200px " onchange="checkCenterInfo()" id="writingError" name="centerTaskCount.writingError">
	                                                            	
	                                                            </select>
                                                        	</div>
		                                                </div>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >备注:</label>
                                                        <div class="col-sm-8  no-padding "  ><!-- required -->
                                                       		<input type="text" name="centerTaskCount.remarks"   id="remarks" 
                                                       			onblur="getStr(this.value,40)" maxlength="40"
																class="form-control input-small width-100 " 
																data-placement="bottom" title="不得输入超过40个字符">
                                                        </div>
                                                    </div>
                                                </div>
                                                </c:if>
                                                
                                                
                                                <div class=" col-sm-12">
	                                                <h4 class="smaller lighter green">会签意见记录</h4>
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
                                                    <h4 class="smaller lighter green">会签意见区</h4>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >意见<span style="color:red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                      		<textarea  name="opinion" id="opinion" style="height:80px"  class="form-control limited input-small width-100"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row"></div>
                                                <input type="hidden" value="" name="checkCard" id="checkCard" />
                                                <input type="hidden" value="${flagSt }" name="flagSt" id="flagSt" />
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
                                               <!--  重复次数 -->
                                                <input type="hidden" name="authorityNum" id="authorityNum" value="0">
                                                <input type="hidden" name="regNmNum" id="regNmNum" value="0">
                                                <input type="hidden" name="regIdNum" id="regIdNum" value="0">
                                                <input type="hidden" name="actNo1Num" id="actNo1Num"  value="0">
                                                <input type="hidden" name="actNo2Num" id="actNo2Num"  value="0">
                                                <input type="hidden" name="actNm1Num" id="actNm1Num"  value="0">
                                                <input type="hidden" name="actNm2Num" id="actNm2Num" value="0">
                                                <input type="hidden" name="idCardNo1Num" id="idCardNo1Num"  value="0">
                                                <input type="hidden" name="idCardNo2Num" id="idCardNo2Num" value="0">
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm"  type="button" id="btnSubmit" name="submit" onclick="modifyProcessTurnCondition('submit','${mercIncome.procDefKey}','${flowType}')">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        下一步
                                                    </button>
                                                    <c:if test="${\"centerCheck\".equals(mercIncome.taskDefKey) }">
	                                                    <button class="btn btn-danger btn-sm" type="button" id="saveSubmit" name="saveSubmit" onclick="saveRm()">
	                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
	                                                        保存
	                                                    </button>
                                                    </c:if>
                                                    <input type="submit" id="testSubmit" value="Submit" hidden="hidden">
                                                    <button class="btn btn-default btn-sm" type="button" name="back" id="backButton" onclick="modifyProcessTurnCondition('back','${mercIncome.procDefKey}')">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                        回退
                                                    </button>
                                                    <button class="btn btn-danger btn-sm" type="button"
														onclick="toEntrustTask('${mercIncome.taskId}','${mercIncome.procDefKey}','${returnUrlAfterEntrust}','${mercIncome.orderNo}');">
														<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span> 委托
													</button>
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
    </div>
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/ejs/bootstrap3-validation.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/imageUtil.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/mercIncome/tipsModify.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/mercIncome/4wht.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/mercIncome/commonMerchant.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/mercIncome/centerCheck.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/taskEntrust/taskEntrust.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/ejs/ejs_production.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/ejs/ejs_fulljslint.js"></script>
	<!-- -图片插件js -->
	<script src="${ctx}/js/viewer/dist/viewer.js"></script>
    <script src="${ctx}/js/viewer/main.js"></script>
    
    <script src="<%=request.getContextPath() %>/js/contextmenu/jquery.contextmenu.js" ></script>
    
    <script type="text/javascript">
    function downloadAllImages(taskCode){
		 location.href="${ctx}/mercIncome/downloadAllImages.do?taskCode="+orderNo;
	}
    function getStr(val,strLen){
    	var len = 0;
        for (var i = 0; i < val.length; i++) {
            if (val[i].match(/[^\x00-\xff]/ig) != null){//全角
                len += 2;
            } else{
                len += 1;
            }
            if(len > strLen){
            	alert("备注过长，最多40个字符");
            	$("#btnSubmit").attr("class","btn btn-danger btn-sm");
				document.getElementById("btnSubmit").disabled = "disabled";
				$("#backButton").attr("class","btn btn-default btn-sm");
				document.getElementById("backButton").disabled = "disabled";
				return;
            }
        }
         checkCenterInfo(); 
    }
    
    function checkCenterInfo(){
    	var remarks = $("#remarks").val();
    	remarks =remarks.replace(/[ ]/g,""); 
    	//alert(remarks);
    	if(checkCenterInfoBefore() && (remarks==''||remarks==null)){
    		$("#backButton").attr("class","btn btn-default btn-sm");
			document.getElementById("backButton").disabled = "disabled";
			if($("#isNotNext").val()!='goback'){
				$("#btnSubmit").attr("class","btn btn-danger btn-sm");
				document.getElementById("btnSubmit").disabled = undefined;
			 }
			
    	}else{
    		$("#btnSubmit").attr("class","btn btn-danger btn-sm");
			document.getElementById("btnSubmit").disabled = "disabled";
			$("#backButton").attr("class","btn btn-default btn-sm");
			document.getElementById("backButton").disabled = undefined;
    	}
    }
    
    function checkCenterInfoBefore(){
    	var writingError = $("#writingError").val();
    	var policyIssues = $("#policyIssues").val();
    	var dataMissing = $("#dataMissing").val();
    	var dataNotQualified = $("#dataNotQualified").val();
    	var inputError = $("#inputError").val();
    	var falseApplication = $("#falseApplication").val();
    	if((writingError==''||writingError==null)&&(policyIssues==''||policyIssues==null)&&(dataMissing==''||dataMissing==null)
    	&&(dataNotQualified==''||dataNotQualified==null)&&(inputError==''||inputError==null)&&(falseApplication==''||falseApplication==null)){
    		return true;
    	}else{
    		return false;
    	}
    }
    
	$(document).ready(function(){
		var msg= '${msg}';
		if(msg != null && msg !=''){
			alert(msg);
			return;
		}
		
		
		
		console.info('x-admin:mercInfoUpdateEdit......');
        initPosMaintain('true'=='${feeInfo.hasPosMaintainFee}','${feeInfo.posMaintainFeeType}',false);

		//填写上审核登记信息（首先先清空里面的信息）
		$("#falseApplication").find("option").remove();
		$("#policyIssues").find("option").remove();
		$("#dataMissing").find("option").remove();
		$("#dataNotQualified").find("option").remove();
		$("#inputError").find("option").remove();
		$("#writingError").find("option").remove();
		$.ajax({
		    cache: true,
		    type: "POST",
		    url:"/enregisterInfo/getOpenEnregisterInfoRule.do?useType=01",
		    async: false,
		    success: function(data) {
		    	var falseApplication='';
	    		var policyIssues='';
	    		var dataMissing='';
	    		var dataNotQualified='';
	    		var inputError='';
	    		var writingError='';
		    	jQuery.each(data, function(i,item){
		    		if(item.bigItems=='01'){
		    			falseApplication += '<option value="'+item.smallItems+'" >'+item.smallItems+'</option>';
		    		}else if(item.bigItems=='02'){
		    			policyIssues += '<option value="'+item.smallItems+'" >'+item.smallItems+'</option>';
		    		}else if(item.bigItems=='03'){
		    			dataMissing += '<option value="'+item.smallItems+'" >'+item.smallItems+'</option>';
		    		}else if(item.bigItems=='04'){
		    			dataNotQualified += '<option value="'+item.smallItems+'" >'+item.smallItems+'</option>';
		    		}else if(item.bigItems=='05'){
		    			inputError += '<option value="'+item.smallItems+'" >'+item.smallItems+'</option>';
		    		}else if(item.bigItems=='06'){
		    			writingError += '<option value="'+item.smallItems+'" >'+item.smallItems+'</option>';
		    		}
	            }); 
		    	$("#falseApplication").html(falseApplication);
		    	$("#policyIssues").html(policyIssues);
		    	$("#dataMissing").html(dataMissing);
		    	$("#dataNotQualified").html(dataNotQualified);
		    	$("#inputError").html(inputError);
		    	$("#writingError").html(writingError);
		    }
		});
		
		
		
		
		
		
		
		//add by hss 2016-03-31  是否隐藏按钮
		//1.在17家以内 10字符以内 只显示三要素
		//2.在17家以内 10字符以上  都显示
		//3.不在17家以内       只显示二要素	
		//调用 ajax  进行回值  
		$.ajax({
    	   		
    	   cache:true,
			type:"POST",
			        url:'/mercIncome/toAuthBank.do',
					data : {stmBankNm1:$("#stmBankCd").val(),stmBankDetails:$("#stmBankDetails").val(),stmActNm:$("#stmActNm1").val()},
					async:true,
		    	    cache: true,
					error : function(retMap) {
						//data = eval("(" + data + ")")
						alert("初始错误 :error");
					},
					success : function(retMap) {
						//0:鉴权银行 1:非鉴权银行
						// 前提 鉴权银行  0:小于10字符  1：大于10字符
						if( retMap.isAuthFlag=='0' ){
							if( retMap.isTen=='0' ){
								$("#twoElement").hide();
								$("#threeElement").show();	
							}else if( retMap.isTen=='1' ){
								$("#threeElement").show();
								$("#twoElement").show();	
							}
						}else{
							$("#twoElement").show();
							$("#threeElement").hide();
						}
						
					}
    	   	}); 

		//end by hss 2016-03-31
		//刚加载完界面，由于审核登记信息都为空所以限制回退
		var taskDefKey = $("[name='taskDefKey']").val();
		if(taskDefKey == 'centerCheck'){
			$("#backButton").attr("class","btn btn-default btn-sm");
			document.getElementById("backButton").disabled = "disabled";
		}
		//调整地址显示
		var regAddr = $("#zcdz").val();
		var strs= new Array(); //定义一数组
		strs=regAddr.split('-'); //字符分割
		if(strs.length>2){
			//隐藏原div
			$("#clsh").hide();
			for (i=0;i<strs.length ;i++ )
			{
				$("#clsh2").append("<label class='form-control input-small width-20   view-control' style='color:blue;'  data-placement='bottom' data-trigger='hover'  data-content='"+strs[i]+"' data-rel='popover'>"+strs[i]+"</lable>");
				if(i<strs.length-1){
					$("#clsh2").append("-");
				}
			} 
			//显示
			//$("#clsh2").append("<label>"+strs+"</lable>");
			$("#clsh2").show();
		}
		$(window).scroll(function (){
			var offsetTop = $(window).scrollTop() + 80 +"px";
			$("#Float").animate({top : offsetTop },{ duration:500 , queue:false });
			$("#Float1").animate({top : offsetTop },{ duration:500 , queue:false });
		}); 
	}); 
    jQuery(function($) {
        $('[data-rel=popover]').popover({container:'body'});
        $('.chosen-select').chosen({
        	single_backstroke_delete: false,
            allow_single_deselect: true,
            width: "100%"
        });
    	//回填修改提示信息
    	var tipsInfo = $('#tipsInfo').val();
    	if(tipsInfo != undefined && tipsInfo != '' && tipsInfo != 'NaN')
    		$('#showChangeMessage').html($('#tipsInfo').val());
        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();
            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });
        if(isHavePreAuthorization()){
        	alert("该商户开通了预授权功能，请仔细核对信息！");
        }
        
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
  //判断是否有预授权
    function isHavePreAuthorization(){
    	//判断是否有预授权:包括2时，有预授权
    	var flag=false;
        var mercFunctionStr = '${mercIncome.mercFunction}';//结算卡
        var prepaidCardStr = '${prepaidCard.functionAccepted}';//预付卡
        var foreighCardInfoOfBocStr = '${foreighCardInfoOfBoc.functionAccepted}';//中行外卡
        var regex = new RegExp("2");
        var result1 = mercFunctionStr.match (regex);
        var result2 = prepaidCardStr.match (regex);
        var result3 = foreighCardInfoOfBocStr.match (regex);
        if(result1!=null||result2!=null || result3!=null){
    		flag=true;
    	} 
        return flag;
    }
  
    function putMercFnm(){
    		$("#descBiz").trigger('blur');
			$("#mercFnm").val($("#descBiz").val());
			//将$("#mercFnm").trigger('blur'); 注释掉：OPERATION-7733，输入经营概述字段过长时，会弹出2次“经营名称字数不合规”的提示
			//$("#mercFnm").trigger('blur');
			checkMercFnmLen();
    }
    /**校验身份证信息*/
    function checkIdCard(){
    	var name = $("#legalNm").val().trim();
    	var idCard = $("#legalCredentialsNo").val().trim();
    	
    	if(name == '' || idCard == ''){
    		alert('法人姓名和法人证件号码不能为空');
    		//$("#checkIdCard").linkbutton('enable');
    		return false;
    	}
    	
    	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
        if(reg.test(idCard) === false){  
           alert("法人证件号码不合法");  
          // $("#checkIdCard").linkbutton('enable');
           return false;  
    	}
        var url = '<%=request.getContextPath() %>/mercIncome/checkIdCard.do?legalNm='+name+'&legalCredentialsNo='+idCard+'&source='+2;
        url =  encodeURI(url);
        url =  encodeURI(url);
        /**弹出校验结果*/
        $.fancybox.open({
     			href : url,
     			type: 'iframe',
                 padding: 5,
                 scrolling: 'no',
                 width: $(window).width() * 0.6,
                 centerOnScroll:true,
                 autoSize: true,
                 helpers:{
                 	overlay:{
                 		closeClick:false
                 	}
                 }
        });
    }
   
    
    function checkIdCard1(orderNo){
    	var stmActNm1 = $("#stmActNm1").val().trim();//对私账户户名
    	var stmLegalNm=$("#stmLegalNm").html();//对公账户法人姓名
    	var idCardNo1 = $("#idCardNo1").val().trim();//身份证号
    	var stmActTyp1=$("#stmActTyp1").html();//账户类型
    	if(stmActTyp1=='对公'){
    		if((stmLegalNm==''||stmLegalNm==null) || idCardNo1 == ''){
    			alert('账户法人姓名和身份证号码不能为空');
        		return false;
    		}
    		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
            if(reg.test(idCardNo1) == false){  
               alert("法人证件号码不合法");  
              // $("#checkIdCard").linkbutton('enable');
               return false;  
        	}
            var name=stmLegalNm;
    	}
    	if(stmActTyp1=='对私'){
        	if(stmActNm1 == '' || idCardNo1 == ''){
        		alert('结算账户名和身份证号码不能为空');
        		return false;
        	}
        	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
            if(reg.test(idCardNo1) == false){  
               alert("法人证件号码不合法");  
              // $("#checkIdCard").linkbutton('enable');
               return false;  
        	}
            var name=stmActNm1;
    	}
    	
    	$.ajax({
		    cache: true,
		    type: "POST",
		    url:"/mercIncomeEntering/updateIfHadValidate.do?taskCode="+orderNo,
		    async: false,
		    success: function(data) {
		    	if(data=='true'){
		    		$("#ifHadValidate").val(1);
		    	}
		    }
		});
    	
        var url = '<%=request.getContextPath() %>/mercIncome/checkIdCard1.do?name='+name+'&idCardNo1='+idCardNo1+'&flag='+0+'&source='+2+'&orderNo='+orderNo;
        url =  encodeURI(url);
        url =  encodeURI(url);
        /**弹出校验结果*/
        $.fancybox.open({
     			href : url,
     			type: 'iframe',
                 padding: 5,
                 scrolling: 'no',
                 width: $(window).width() * 0.6,
                 centerOnScroll:true,
                 autoSize: true,
                 helpers:{
                 	overlay:{
                 		closeClick:false
                 	}
                 }
        });
        $("#checkCard").val("true");
    }
    //add by hss 2016-03-31 增加三要素校验
    function checkIdCard2(orderNo){
    	var stmActNm1 = $("#stmActNm1").val();//对私账户户名(个人姓名)
    	var stmAct1=$("#stmAct1").val();//银行卡号
    	var idCardNo1 = $("#idCardNo1").val();//身份证号
    	var stmActTyp1=$("#stmActTyp1").html();//账户类型
		var stmLegalNm=$("#stmLegalNm").html();//对公账户法人姓名
    	
        if(stmActNm1 == '' || idCardNo1 == ''){
        	alert('结算账户名和身份证号码不能为空');
        	return false;
        }
        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
        if(reg.test(idCardNo1) == false){  
             alert("身份证号码不合法");  
              // $("#checkIdCard").linkbutton('enable');
      	      return false;  
        }
        
        $.ajax({
		    cache: true,
		    type: "POST",
		    url:"/mercIncomeEntering/updateIfHadValidate.do?taskCode="+orderNo,
		    async: false,
		    success: function(data) {
		    	if(data=='true'){
		    		$("#ifHadValidate").val(1);
		    	}
		    }
		});
        
        
        var name=stmActNm1;
		//三要素校验 flag=1
        var url = '<%=request.getContextPath() %>/mercIncome/checkIdCard1.do?name='+name+'&idCardNo1='+idCardNo1+'&stmAct1='+stmAct1+'&flag='+1+'&source='+2+'&orderNo='+orderNo;
        url =  encodeURI(url);
        url =  encodeURI(url);
        /**弹出校验结果*/
        $.fancybox.open({
     			href : url,
     			type: 'iframe',
                 padding: 5,
                 scrolling: 'no',
                 width: $(window).width() * 0.6,
                 centerOnScroll:true,
                 autoSize: true,
                 helpers:{
                 	overlay:{
                 		closeClick:false
                 	}
                 }
        });
        $("#checkCard").val("true");
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
	
	function buxuyong(){
		return false;
	}
	
	 jQuery(function($) {
		 renderx();
		 var procDefKey=$("#procDefKey").val();
		 var taskDefKey=$("#taskDefKey").val();
		 var tipsInfo = $('#tipsInfo').val();
		 var isStars=$('#Stars').val();
		 if($("#isNotNext").val()=='goback'){
			alert("已开通金牌商户，不允许预设mcc，请回退！");
			$("#btnSubmit").attr("class","btn btn-danger btn-sm");
			document.getElementById("btnSubmit").disabled = "disabled";
			return ;
		 }
		 if(procDefKey=='mercInfoUpdate'){
			 if(isStars=='0'){
				 var taskDefKey = $("[name='taskDefKey']").val();
			    	var legalNm=$("#legalNm").val().trim();//法人
			    	var stmActNm1=$("#stmActNm1").val().trim();//默认结算户名
			    	var mercRegNm=$("#mercRegNm").html();//注册名称
			    	if(taskDefKey=='centerCheck'){
			    		if(stmActNm1==legalNm||stmActNm1==mercRegNm){
				    		alert("结算户名=法人/注册名称，请审单员确定是否可标记为星级商户");
				    		$("#isStars").removeAttr("onclick");
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
					    		alert("结算户名=法人/注册名称，请审单员确定是否可标记为星级商户");
					    		$("#isStars").removeAttr('onclick');
					    		$("#isStars").removeAttr('checked');
					    		$('#isStars').trigger('change');
					    	}else{
					    		$("#isStars").val("0");
					    	}
				    	}
				 }
			 }
		 }else{
			 if(taskDefKey=='centerCheck'){
				    var taskDefKey = $("[name='taskDefKey']").val();
			    	var legalNm=$("#legalNm").val().trim();//法人
			    	var stmActNm1=$("#stmActNm1").val().trim();//默认结算户名
			    	var mercRegNm=$("#mercRegNm").html();//注册名称
			    	if(taskDefKey=='centerCheck'){
			    		if(stmActNm1==legalNm||stmActNm1==mercRegNm){
				    		alert("结算户名=法人/注册名称，请审单员确定是否可标记为星级商户");
				    		$("#isStars").removeAttr('onclick');
				    	}else{
				    		$("#isStars").val("0");
				    	}
			    	}
		      }
	    }
		 
		 
		 showBank();
		 
	 });
	 
	 function downloadAllImages(orderNo){
		 location.href="<%=base%>mercIncome/downloadAllImages.do?taskCode=${mercIncome.orderNo }";
	 }
	 
	 function renderx() {
		isBackOrder("load");
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
	 //费改功能上线前的工单提示请回退工单
	function isBackOrder(condition){
	    if($("#newMccInfo").val() == "" && (condition == 'submit'||condition == 'load')){
			alert("商户费率信息为空，请回退工单！");
			$("#btnSubmit").attr('disabled',true);
			return true;
		}
	    var taskDefKey = $("[name='taskDefKey']").val();
	    if(taskDefKey=="centerCheck" && condition == 'submit'){
		    var remarks = $("#remarks").val();
		    remarks =remarks.replace(/[ ]/g,""); 
	    	if(checkCenterInfoBefore() && (remarks==''||remarks==null)){
		    	$("#backButton").attr("class","btn btn-default btn-sm");
				document.getElementById("backButton").disabled = "disabled";
				if($("#isNotNext").val()!='goback'){
					$("#btnSubmit").attr("class","btn btn-danger btn-sm");
					document.getElementById("btnSubmit").disabled = undefined;
				}
	    	}else{
	    		alert("您已选择了审核登记信息，请回退")
	    		$("#btnSubmit").attr("class","btn btn-danger btn-sm");
				document.getElementById("btnSubmit").disabled = "disabled";
				$("#backButton").attr("class","btn btn-default btn-sm");
				document.getElementById("backButton").disabled = undefined;
				return true;
	    	}
	    }
	    return false;
	    
	 }
	 
	 
	 
	function showBank() {
		var bankTeamworkStr = $("#bankTeamworkStr").html();
		if (bankTeamworkStr == '自主拓展') {
			$("#bankTeamworkSignDiv").show();
		} else if (bankTeamworkStr == '随行付合作') {
			$(".customerManagerDiv").show();
		}
	}
	
	
	

</script>




</body>
</html>
