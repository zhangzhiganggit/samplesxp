<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.css.jsp"%>
</head>
<c:if test="${pbCheck ==false }">
<body class="no-skin ">
</c:if>
<c:if test="${pbCheck ==true }">
<body class="no-skin " oncopy="alert('本页面内容不允许被复制'); return false;">
</c:if>
  <%--   <%@include file="../layout/header.jsp"%> --%>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
       <%--  <%@include file="../layout/menu.jsp"%> --%>

        <div class="main-content ">
            <div class="main-content-inner ">

               
                <div class="page-content ">

                    <div class="row" >


                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        交易明细查询条件
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


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIfTrade/list.do" id="searchForm" method="post" >
                                              <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                                <div class=" col-xs-12">
                                                <input id="flg" name="flg" value="1" style="display: none">
													<c:if test="${pbCheck ==false }">                                                
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mercSn"  name="mercSn" value="${mecIfTrade.mercSn }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册名称:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mercCnm" name="mercCnm" value="${mecIfTrade.mercCnm }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mercAbbr" name="mercAbbr" value="${mecIfTrade.mercAbbr }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >终端号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="trmNo" name="trmNo" value="${mecIfTrade.trmNo }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >交易时间段:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="dateStart" name="dateStart" onchange="revalidateDate();" value="${mecIfTrade.dateStart }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="dateEnd" name="dateEnd"  onchange="revalidateDate();" value="${mecIfTrade.dateEnd }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >卡类型:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select   data-placeholder="请选择" id="crdTyp" name="crdTyp" class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                 <option value="">全部</option>
                                                                <option value="00" <c:if test="${mecIfTrade.crdTyp == '00' }">selected</c:if>>借记</option>
																<option value="01" <c:if test="${mecIfTrade.crdTyp == '01' }">selected</c:if>>贷记</option>
																<option value="02" <c:if test="${mecIfTrade.crdTyp == '02' }">selected</c:if>>准贷记</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易类型:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="tranCd" name="tranCd" class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                <option value="">全部</option>
                                                                    <option value="10110001"
																		<c:if test="${mecIfTrade.tranCd == '10110001' }">selected</c:if>>消费</option>
																	<option value="10110002"
																		<c:if test="${mecIfTrade.tranCd == '10110002' }">selected</c:if>>消费撤消</option>
																	<option value="10110003"
																		<c:if test="${mecIfTrade.tranCd == '10110003' }">selected</c:if>>预授权</option>
																	<option value="10110004"
																		<c:if test="${mecIfTrade.tranCd == '10110004' }">selected</c:if>>预授权撤销</option>
																	<option value="10110005"
																		<c:if test="${mecIfTrade.tranCd == '10110005' }">selected</c:if>>预授权完成</option>
																	<option value="10110006"
																		<c:if test="${mecIfTrade.tranCd == '10110006' }">selected</c:if>>预授权完成撤销</option>
																	<option value="10110008"
																		<c:if test="${mecIfTrade.tranCd == '10110008' }">selected</c:if>>退货</option>
																	<option value="10110010"
																		<c:if test="${mecIfTrade.tranCd == '10110010' }">selected</c:if>>预付费卡消费</option>
																	<option value="10110011"
																		<c:if test="${mecIfTrade.tranCd == '10110011' }">selected</c:if>>预付费卡消费撤销</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="tranSts" name="tranSts" class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                <option value="">全部</option>
                                                              <option value="S" <c:if test="${mecIfTrade.tranSts == 'S' }">selected</c:if>>成功</option>
															  <option value="F" <c:if test="${mecIfTrade.tranSts == 'F' }">selected</c:if>>失败</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                 <!--add by hss 2016-04-26 归属分公司  and  维护商户类型  -->
                                                 <c:if test=""></c:if>
                                                <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>
                                                          <div class="col-sm-8  no-padding"  >
                                                       	 <select id="branchOrgNo" name="branchOrgNo"   data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                                <option value="" selected="selected">全部</option>
                                                                <!--  <option value="">全部</option> -->
                                                                <c:forEach items="${orgAllList }" var="org" >
                                                                	<option value="${org.orgUuid }"
                                                                	<c:if test="${mecIfTrade.branchOrgNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select> 
                                                        </div>
                                                 </div>
                                                <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >
                                                        <c:choose>
                                                        	<c:when test="${pbCheck==true }">
                                                        	机构名称:
                                                        	</c:when>
                                                        	<c:otherwise>所属一代:</c:otherwise>
                                                        </c:choose>
                                                        	
                                                        </label>

                                                       <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="rootAgentOrgNo" name="rootAgentOrgNo" value="${mecIfTrade.rootAgentOrgNo }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                 </div>
                                                 <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >维护商户类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                         <c:if test="${isZongBu=='0' }">
                                                            <select id="maintainMecType" name="maintainMecType" data-placeholder="全部" disabled="disabled" class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="1001" <c:if test="${mecIfTrade.maintainMecType=='1001' }">selected</c:if>>本地商户</option>
                                                               <option value="1002" <c:if test="${mecIfTrade.maintainMecType=='1002' }">selected</c:if>>流出商户</option>
                                                               <option value="1003" <c:if test="${mecIfTrade.maintainMecType=='1003' }">selected</c:if>>流入商户</option>      
                                                            </select> 
                                                          </c:if>
                                                         <c:if test="${isZongBu!='0' }">
                                                         <select id="maintainMecType" name="maintainMecType" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="1001" <c:if test="${mecIfTrade.maintainMecType=='1001' }">selected</c:if>>本地商户</option>
                                                               <option value="1002" <c:if test="${mecIfTrade.maintainMecType=='1002' }">selected</c:if>>流出商户</option>
                                                               <option value="1003" <c:if test="${mecIfTrade.maintainMecType=='1003' }">selected</c:if>>流入商户</option>      
                                                            </select> 
                                                         </c:if>  
                                                   
                                                        </div>
												

                                                 </div>
                                                <!--end by hss 2016-04-26  --> 
	</c:if>
 				   <c:if test="${pbCheck ==true }">
 				                                       <c:if test="${currentNum=='T00356' }" >           
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mercSn" pbcheck="mno" name="mercSn" value="${mecIfTrade.mercSn }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >交易时间段:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="dateStart" name="dateStart" onchange="revalidateDate();" value="${mecIfTrade.dateStart }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="dateEnd" name="dateEnd"  onchange="revalidateDate();" value="${mecIfTrade.dateEnd }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    
                                                    <c:if test='${currentNum!="T00356" }'>
                                                    
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mercSn"  name="mercSn" value="${mecIfTrade.mercSn }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册名称:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mercCnm" name="mercCnm" value="${mecIfTrade.mercCnm }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mercAbbr" name="mercAbbr" value="${mecIfTrade.mercAbbr }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >终端号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="trmNo" name="trmNo" value="${mecIfTrade.trmNo }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >交易时间段:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="dateStart" name="dateStart" onchange="revalidateDate();" value="${mecIfTrade.dateStart }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="dateEnd" name="dateEnd"  onchange="revalidateDate();" value="${mecIfTrade.dateEnd }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >卡类型:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select   data-placeholder="请选择" id="crdTyp" name="crdTyp" class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                 <option value="">全部</option>
                                                                <option value="00" <c:if test="${mecIfTrade.crdTyp == '00' }">selected</c:if>>借记</option>
																<option value="01" <c:if test="${mecIfTrade.crdTyp == '01' }">selected</c:if>>贷记</option>
																<option value="02" <c:if test="${mecIfTrade.crdTyp == '02' }">selected</c:if>>准贷记</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易类型:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="tranCd" name="tranCd" class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                <option value="">全部</option>
                                                                    <option value="10110001"
																		<c:if test="${mecIfTrade.tranCd == '10110001' }">selected</c:if>>消费</option>
																	<option value="10110002"
																		<c:if test="${mecIfTrade.tranCd == '10110002' }">selected</c:if>>消费撤消</option>
																	<option value="10110003"
																		<c:if test="${mecIfTrade.tranCd == '10110003' }">selected</c:if>>预授权</option>
																	<option value="10110004"
																		<c:if test="${mecIfTrade.tranCd == '10110004' }">selected</c:if>>预授权撤销</option>
																	<option value="10110005"
																		<c:if test="${mecIfTrade.tranCd == '10110005' }">selected</c:if>>预授权完成</option>
																	<option value="10110006"
																		<c:if test="${mecIfTrade.tranCd == '10110006' }">selected</c:if>>预授权完成撤销</option>
																	<option value="10110008"
																		<c:if test="${mecIfTrade.tranCd == '10110008' }">selected</c:if>>退货</option>
																	<option value="10110010"
																		<c:if test="${mecIfTrade.tranCd == '10110010' }">selected</c:if>>预付费卡消费</option>
																	<option value="10110011"
																		<c:if test="${mecIfTrade.tranCd == '10110011' }">selected</c:if>>预付费卡消费撤销</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="tranSts" name="tranSts" class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                <option value="">全部</option>
                                                              <option value="S" <c:if test="${mecIfTrade.tranSts == 'S' }">selected</c:if>>成功</option>
															  <option value="F" <c:if test="${mecIfTrade.tranSts == 'F' }">selected</c:if>>失败</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                 <!--add by hss 2016-04-26 归属分公司  and  维护商户类型  -->
                                              
                                                 
                                                <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >
                                                      <%--   <c:choose>
                                                        	<c:when test="${pbCheck==true }">
                                                        	机构名称:
                                                        	</c:when>
                                                        	<c:otherwise>所属一代:</c:otherwise>
                                                        </c:choose> --%>
                                                        	所属一代
                                                        </label>

                                                       <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="rootAgentOrgNo" name="rootAgentOrgNo" value="${mecIfTrade.rootAgentOrgNo }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                 </div>
                                                 <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >维护商户类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                         <c:if test="${isZongBu=='0' }">
                                                            <select id="maintainMecType" name="maintainMecType" data-placeholder="全部" disabled="disabled" class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="1001" <c:if test="${mecIfTrade.maintainMecType=='1001' }">selected</c:if>>本地商户</option>
                                                               <option value="1002" <c:if test="${mecIfTrade.maintainMecType=='1002' }">selected</c:if>>流出商户</option>
                                                               <option value="1003" <c:if test="${mecIfTrade.maintainMecType=='1003' }">selected</c:if>>流入商户</option>      
                                                            </select> 
                                                          </c:if>
                                                         <c:if test="${isZongBu!='0' }">
                                                         <select id="maintainMecType" name="maintainMecType" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="1001" <c:if test="${mecIfTrade.maintainMecType=='1001' }">selected</c:if>>本地商户</option>
                                                               <option value="1002" <c:if test="${mecIfTrade.maintainMecType=='1002' }">selected</c:if>>流出商户</option>
                                                               <option value="1003" <c:if test="${mecIfTrade.maintainMecType=='1003' }">selected</c:if>>流入商户</option>      
                                                            </select> 
                                                         </c:if>  
                                                   
                                                        </div>
												

                                                 </div>
                                                    
                                                    </c:if>
                                                    
                                                    </c:if>
                                                </div>
                                                <c:if test='${pbCheck ==true }'>
                                                <button class="btn btn-normal btn-sm" type="submit" onclick="return checkSubmit();">
                                                     <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                </c:if>
                                                <c:if test="${pbCheck ==false }">
                                                 <button class="btn btn-normal btn-sm" type="submit">
                                                     <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                </c:if>
                                                 <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
                                                </button> 
                                                <!-- <button class="btn btn-danger btn-sm" type="submit">
                                                    <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    Excel
                                                </button> -->
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        <!-- 展示 -->
                                       交易明细查询结果 <%--  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <c:if test="${showFlg=='show' }">
              交易金额:${amtSum };&nbsp;&nbsp;&nbsp;&nbsp;交易手续费:${feeSum };&nbsp;&nbsp;&nbsp;&nbsp;清分金额:${tranQfSum }
             </c:if>     --%>                          
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center; width: 9%">商户编号 </th>
                                                <th style="text-align: center; width: 8%">注册名称</th>
                                                <th style="text-align: center; width: 8%">经营名称</th>
                                                <th style="text-align: center; width: 6%">终端号</th>
                                                <th style="text-align: center; width: 7%">POS流水号</th>
                                                <th style="text-align: center; width: 6%">交易类型</th>
                                                <th style="text-align: center; width: 6%">交易状态</th>
                                                <th style="text-align: center; width: 5%">卡类型</th>
                                                <th style="text-align: center; width: 9%">卡号</th>
                                                <th style="text-align: center; width: 6%">交易金额</th>
                                                <th style="text-align: center; width: 7%">交易手续费</th>
                                                <th style="text-align: center; width: 6%">清分金额</th>
                                                <th style="text-align: center; width: 7%">银行名称</th>
                                                <th style="text-align: center; ">交易时间</th>
                                                
                                            </tr>
                                            </thead>
                                            <tbody>
                                           <c:forEach items="${mecIfTradeList}" var="de"  varStatus="status">
													<tr>
														<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
														<td style="text-align: center;">${de.mercSn }</td>
														<td style="text-align: left;">${de.mercCnm }</td>
														<td style="text-align: left;">${de.mercAbbr }</td>
														<td style="text-align: center;">${de.trmNo }</td>
														<td style="text-align: center;">${de.posSeqNo }</td>
														<td style="text-align: center;">${de.tranCdString }</td>
														<td style="text-align: center;">${de.tranStString }</td>
														<td style="text-align: center;">${de.crdTypString }</td>
														<td style="text-align: left;">${de.crdNo }</td>
														<td style="text-align: right;">${de.tranAmt }</td>
														<td style="text-align: right;">${de.recFeeAmt }</td>
														<td style="text-align: right;">${de.tranQf }</td>
														<td style="text-align: left;">${de.bnkNm }</td>
														<td style="text-align: center;">${de.tranDtString }</td>
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
								<%@include file="../layout/pagination.jsp" %>
							</div>

						</div>
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

   <%@include file="../layout/common.alljs.jsp"%>
    <script type="text/javascript">
    function checkSubmit(){
    	//e.preventDefault();
    	//e.stopPropagation();
    	if($("#mercSn").attr("pbcheck")=='mno'){
    		console.log("巡检");
    		if($("#mercSn").val()=='' || $("#mercSn").val()==null){
    			alert("请输入商编");
    			return false;
    		}else{
    			//$("#searchForm").submit();
    				return true;
    		}
    		}
    }
    function resetMecForm(){
   	 $(':input','#searchForm')  
   	 .not(':button, :submit, :reset, :hidden')  
   	 .val('')  
   	 .removeAttr('checked')  
   	 .removeAttr('selected'); 
   	     $("#mecTyp").val('00');
		 $("#mecTyp").trigger("chosen:updated");
		 $("#tranSts").val('');
		 $("#tranSts").trigger("chosen:updated");
		 $("#tranCd").val('');
		 $("#tranCd").trigger("chosen:updated");		 
		 $("#crdTyp").val('');
		 $("#crdTyp").trigger("chosen:updated");
		 //add by hss 2016-04-29  
		 $("#branchOrgNo").val('');
		 $("#branchOrgNo").trigger("chosen:updated");
		 $("#maintainMecType").val('');
		 $("#maintainMecType").trigger("chosen:updated");
		 $("#rootAgentOrgNo").val('');
		 //end by hss 
		 
		 
		 $("#dateEnd").val(getFormatDate());
		 $("#dateEnd").trigger("chosen:updated");	
		 $("#dateStart").val(getFormatDate());
		 $("#dateStart").trigger("chosen:updated");	
    }
    
    
    //校验日期合法
    function revalidateDate(){
    	revalidateFieldByFieldName('searchForm','dateStart');
    	revalidateFieldByFieldName('searchForm','dateEnd');
    }

        $('.chosen-select').chosen({});
        jQuery(function($) {

        $('#searchForm').formValidation({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                dateStart: {
                    validators: {
                        notEmpty: {},
                        dateCompare: {
                        	dayLength:31
                        }
                    }
                },
                dateEnd: {
                    validators: {
                        notEmpty: {},
                        dateCompare: {
                        	dayLength:31
                        }
                    }
                }
            }
        });
        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        }).next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});


    })
</script>
</body>
</html>











