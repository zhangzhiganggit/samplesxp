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

<c:if test="${pbCheck == false }">
<body class="no-skin ">
</c:if>
<c:if test="${pbCheck == true }">
<body class="no-skin " oncopy="alert('本页面数据不允许被复制'); return false">'
</c:if>
   <%--  <%@include file="../layout/header.jsp"%> --%>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
       <%--   <%@include file="../layout/menu.jsp"%>  --%>

        <div class="main-content ">
            <div class="main-content-inner ">

               
                <div class="page-content ">

                    <div class="row" >


                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       		 商户查询条件
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

		
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIf/list.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	
                                            	
                                            	<input type="hidden" id="prov" name="prov" value="${mecIf.mecProvCd}">
                                            	<input type="hidden" id="city" name="city" value="${mecIf.mecCityCd}">
                                            <c:if test="${pbCheck == false }">
                                            	
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mno"  name="mno" value="${mecIf.mno }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户注册名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="cprRegNmCn" name="cprRegNmCn" value="${mecIf.cprRegNmCn }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="mecSts" name="mecSts" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                                 <option value="">全部</option>
                                                                <option value="01" <c:if test="${mecIf.mecSts=='01' }">selected</c:if>>正常</option>
                                                                <option value="02" <c:if test="${mecIf.mecSts=='02' }">selected</c:if>>销户</option>
                                                                <option value="03" <c:if test="${mecIf.mecSts=='03' }">selected</c:if>>冻结</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                  
                                                    <c:if test="${pbCheck==false }">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属销售:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="empNm" value="${mecIf.empNm }" id="empNm" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <%-- <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >开通时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="openStartTm" name="openStartTm" value="${mecIf.openStartTm }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="openEndTm" name="openEndTm" value="${mecIf.openEndTm }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div> --%>
                                                    <c:if test="${pbCheck==false }">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属地区:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="mecProvCd" name="mecProvCd" data-placeholder="请选择" onchange="fillCitySelect('mecProvCd','mecCityCd','${mecIf.mecCityCd}')"    class="col-sm-8 width-48 chosen-select width-45">
                                                               <%--  <option value=""></option>
                                                                <c:forEach items="${provs }" var="prov">
																		<option value="${prov.areaId }"  <c:if test="${prov.areaId==mecIf.mecProvCd }">selected</c:if>>${prov.areaNm}</option>
																		</c:forEach> --%>
                                                            </select>
                                                            <select id="mecCityCd" name="mecCityCd" data-placeholder="请选择"  class="col-sm-6 width-48  chosen-select width-45  ">
                                                                <!-- <option value=""></option>
                                                                 -->
                                                            </select>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <%-- <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签约费率:</label>

                                                        <div class="col-sm-6  no-padding"  >
                                                            <input type="text" id="rat1" name="rat1" value="${mecIf.rat1 }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div> --%>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >创建时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="creStartTm" name="creStartTm" value="${mecIf.creStartTm }" class="input-small form-control" onchange="changeDateStart()">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="creEndTm" name="creEndTm" value="${mecIf.creEndTm }" class="input-small form-control" onchange="changeDateEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input id="mecTyp" name="mecTyp" value="00" hidden="hidden">
                                                <!-- 添加过滤条件 POS商户 手刷商户 -->
                                                    <%-- <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类别:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="mecTyp" name="mecTyp" data-placeholder="POS商户"  class="chosen-select form-control width-200px" 
                                                           onchange="switchTelField('${mecIf.mecTyp}')"> 
                                                                <option value="00" <c:if test="${mecIf.mecTyp=='00' }">selected</c:if>>POS商户</option>
                                                                <option value="02" <c:if test="${mecIf.mecTyp=='02' }">selected</c:if>>手刷商户</option>
                                                            </select>
                                                        </div>
                                                    </div> --%>
                                                <!-- 添加完毕 -->
                                                <!-- 添加手机号过滤 -->
													<%-- <div id="div_switch_tel" class="form-group form-group-sm width-300px" 
													<c:if test="${mecIf.mecTyp=='02' }">style="display:;"</c:if>
													<c:if test="${mecIf.mecTyp!='02' }">style="display:none;"</c:if>
													>
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left ">手机号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="mercOprMbl" name="mercOprMbl" onkeyup="this.value=this.value.replace(/\D/g,'')"
																value="${mecIf.mercOprMbl }"
																title="不能超过11个字符"
																maxlength=11
																class="form-control input-small width-200px "
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!">
														</div>
													</div> --%>
													<!-- 添加手机号过滤end -->
 												
                                                 <c:if test="${pbCheck ==false }">
                                                 <div class="form-group form-group-sm width-300px">
                                                     <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属机构:</label>
 
                                                     <div class="col-sm-8  no-padding"  >
                                                         <input type="text" name="orgNm" value="${mecIf.orgNm }" id="orgNm" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                     </div>
                                                 </div>
                                                 </c:if>
                                                    <c:if test="${pbCheck ==true }">
                                                 <div class="form-group form-group-sm width-300px">
                                                     <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属机构:</label>
 
                                                     <div class="col-sm-8  no-padding"  >
                                                         <input type="text" name="managerNm" value="${mecIf.managerNm }" id="managerNm" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
	
                                                     </div>
                                                 </div>
                                                 </c:if>
                                                	<div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >行业大类:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="mercTrdDesc" name="mercTrdDesc" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="1001" <c:if test="${mecIf.mercTrdDesc=='1001' }">selected</c:if>>餐娱类</option>
                                                               <option value="1002" <c:if test="${mecIf.mercTrdDesc=='1002' }">selected</c:if>>房产汽车类</option>
                                                               <option value="3001" <c:if test="${mecIf.mercTrdDesc=='3001' }">selected</c:if>>一般类</option>
                                                               <option value="3002" <c:if test="${mecIf.mercTrdDesc=='3002' }">selected</c:if>>批发类</option>
                                                               <option value="2001" <c:if test="${mecIf.mercTrdDesc=='2001' }">selected</c:if>>民生类</option>
                                                               <option value="4001" <c:if test="${mecIf.mercTrdDesc=='4001' }">selected</c:if>>公益类</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签购单名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mecDisNm"  name="mecDisNm" value="${mecIf.mecDisNm}" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="">
                                                        </div>
                                                    </div>
                                                    
                                                 <!--add by hss 2016-04-26 归属分公司  and  维护商户类型  -->
                                                 <c:if test="${pbCheck==true }">
                                                <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>
                                                          <div class="col-sm-8  no-padding"  >
                                                         	<select id="branchOrgNo" name="branchOrgNo"   data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                                <option value="" selected="selected">全部</option>
                                                                <!--  <option value="">全部</option> -->
                                                                <c:forEach items="${orgAllList }" var="org" >
                                                                	<option value="${org.orgUuid }" 
                                                                	<c:if test="${mecIf.branchOrgNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                 </div>
                                                 </c:if>
                                                 <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >维护商户类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        <c:if test="${isZongBu=='0' }">
                                                            <select id="maintainMecType" name="maintainMecType" data-placeholder="全部"  disabled="disabled" class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="1001" <c:if test="${mecIf.maintainMecType=='1001' }">selected</c:if>>本地商户</option>
                                                               <option value="1002" <c:if test="${mecIf.maintainMecType=='1002' }">selected</c:if>>流出商户</option>
                                                               <option value="1003" <c:if test="${mecIf.maintainMecType=='1003' }">selected</c:if>>流入商户</option>      
                                                            </select>
                                                         </c:if> 
                                                         <c:if test="${isZongBu!='0' }">  
                                                            <select id="maintainMecType" name="maintainMecType" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="1001" <c:if test="${mecIf.maintainMecType=='1001' }">selected</c:if>>本地商户</option>
                                                               <option value="1002" <c:if test="${mecIf.maintainMecType=='1002' }">selected</c:if>>流出商户</option>
                                                               <option value="1003" <c:if test="${mecIf.maintainMecType=='1003' }">selected</c:if>>流入商户</option>      
                                                            </select>
                                                         </c:if>   
                                                        </div>
                                                 </div>
                                 <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否星级商户:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="isStar" name="isStar" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="1" <c:if test="${mecIf.isStar=='1' }">selected</c:if>>是</option>
                                                               <option value="0" <c:if test="${mecIf.isStar=='0' }">selected</c:if>>否</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 微信绑定状态 -->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >微信绑定状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="weChatStatus" name="weChatStatus"  class="chosen-select form-control width-200px">
                                                               <option value="" selected="selected">全部</option>
                                                               <option value="-1" <c:if test="${mecIf.weChatStatus == '-1'}">selected</c:if>>未绑定</option>
                                                               <option value="0" <c:if test="${mecIf.weChatStatus == '0' }">selected</c:if>>有效绑定</option>
                                                               <option value="1" <c:if test="${mecIf.weChatStatus == '1'}">selected</c:if>>无效绑定</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 微信绑定时间 -->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >微信绑定时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="weChatStartTime" name="weChatStartTime" value="${mecIf.weChatStartTime }" class="input-small form-control" onchange="changeWeChatDateStart()">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="weChatEndTime" name="weChatEndTime" value="${mecIf.weChatEndTime }"  class="input-small form-control" onchange="changeWeChatDateEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
				 		    <c:if test="${pbCheck==false }">
                                                    <!-- 进件类型 -->
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="isXwMec" name="isXwMec" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="00" <c:if test="${mecIf.isXwMec=='00' }">selected</c:if>>普通商户</option>
                                                               <option value="01" <c:if test="${mecIf.isXwMec=='01' }">selected</c:if>>小微商户</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 进件渠道 -->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件渠道:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="sysId" name="sysId" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="00" <c:if test="${mecIf.sysId=='00' }">selected</c:if>>APP端</option>
                                                               <option value="01" <c:if test="${mecIf.sysId !='00' and mecIf.sysId !=null and mecIf.sysId !='' }">selected</c:if>>PC端</option>
                                                            </select>
                                                        </div>
                                                    </div>
						</c:if>
                                                <c:if test="${pbCheck!=false }">
                                                    <!-- 进件类型 -->
                                                    <div class="form-group form-group-sm width-300px hidden">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="isXwMec" name="isXwMec"  class="chosen-select form-control width-200px">
                                                                <option value="00" <c:if test="${mecIf.isXwMec=='00' }">selected</c:if>>普通商户</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 进件渠道 -->
                                                    <div class="form-group form-group-sm width-300px hidden">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件渠道:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="sysId" name="sysId" class="chosen-select form-control width-200px">
                                                                <option value="01" <c:if test="${mecIf.sysId !='00' and mecIf.sysId !=null and mecIf.sysId !='' }">selected</c:if>>PC端</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                       </c:if> 
                                        <c:if test="${pbCheck == true && currentNum=='T00356'}">
                                               <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mno" pbCheck="mno"  name="mno" value="${mecIf.mno }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >创建时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="creStartTm" name="creStartTm" value="${mecIf.creStartTm }" class="input-small form-control" onchange="changeDateStart()">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="creEndTm" name="creEndTm" value="${mecIf.creEndTm }" class="input-small form-control" onchange="changeDateEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                     
                                            </c:if>
                                            
                                                <c:if test="${pbCheck == true && currentNum!='T00356'}">
                                                  <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mno"  name="mno" value="${mecIf.mno }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户注册名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="cprRegNmCn" name="cprRegNmCn" value="${mecIf.cprRegNmCn }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="mecSts" name="mecSts" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                                 <option value="">全部</option>
                                                                <option value="01" <c:if test="${mecIf.mecSts=='01' }">selected</c:if>>正常</option>
                                                                <option value="02" <c:if test="${mecIf.mecSts=='02' }">selected</c:if>>销户</option>
                                                                <option value="03" <c:if test="${mecIf.mecSts=='03' }">selected</c:if>>冻结</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                   
                                                    <%-- <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >开通时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="openStartTm" name="openStartTm" value="${mecIf.openStartTm }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="openEndTm" name="openEndTm" value="${mecIf.openEndTm }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div> --%>
                             
                                                    <%-- <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签约费率:</label>

                                                        <div class="col-sm-6  no-padding"  >
                                                            <input type="text" id="rat1" name="rat1" value="${mecIf.rat1 }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div> --%>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >创建时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="creStartTm" name="creStartTm" value="${mecIf.creStartTm }" class="input-small form-control" onchange="changeDateStart()">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="creEndTm" name="creEndTm" value="${mecIf.creEndTm }" class="input-small form-control" onchange="changeDateEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input id="mecTyp" name="mecTyp" value="00" hidden="hidden">
                                                <!-- 添加过滤条件 POS商户 手刷商户 -->
                                                    <%-- <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类别:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="mecTyp" name="mecTyp" data-placeholder="POS商户"  class="chosen-select form-control width-200px" 
                                                           onchange="switchTelField('${mecIf.mecTyp}')"> 
                                                                <option value="00" <c:if test="${mecIf.mecTyp=='00' }">selected</c:if>>POS商户</option>
                                                                <option value="02" <c:if test="${mecIf.mecTyp=='02' }">selected</c:if>>手刷商户</option>
                                                            </select>
                                                        </div>
                                                    </div> --%>
                                                <!-- 添加完毕 -->
                                                <!-- 添加手机号过滤 -->
													<%-- <div id="div_switch_tel" class="form-group form-group-sm width-300px" 
													<c:if test="${mecIf.mecTyp=='02' }">style="display:;"</c:if>
													<c:if test="${mecIf.mecTyp!='02' }">style="display:none;"</c:if>
													>
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left ">手机号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="mercOprMbl" name="mercOprMbl" onkeyup="this.value=this.value.replace(/\D/g,'')"
																value="${mecIf.mercOprMbl }"
																title="不能超过11个字符"
																maxlength=11
																class="form-control input-small width-200px "
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!">
														</div>
													</div> --%>
													<!-- 添加手机号过滤end -->
 												
                                                	<div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >行业大类:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="mercTrdDesc" name="mercTrdDesc" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="1001" <c:if test="${mecIf.mercTrdDesc=='1001' }">selected</c:if>>餐娱类</option>
                                                               <option value="1002" <c:if test="${mecIf.mercTrdDesc=='1002' }">selected</c:if>>房产汽车类</option>
                                                               <option value="3001" <c:if test="${mecIf.mercTrdDesc=='3001' }">selected</c:if>>一般类</option>
                                                               <option value="3002" <c:if test="${mecIf.mercTrdDesc=='3002' }">selected</c:if>>批发类</option>
                                                               <option value="2001" <c:if test="${mecIf.mercTrdDesc=='2001' }">selected</c:if>>民生类</option>
                                                               <option value="4001" <c:if test="${mecIf.mercTrdDesc=='4001' }">selected</c:if>>公益类</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签购单名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mecDisNm"  name="mecDisNm" value="${mecIf.mecDisNm}" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="">
                                                        </div>
                                                    </div>
                                                    
                                                 <!--add by hss 2016-04-26 归属分公司  and  维护商户类型  -->
                                                 <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >维护商户类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        <c:if test="${isZongBu=='0' }">
                                                            <select id="maintainMecType" name="maintainMecType" data-placeholder="全部"  disabled="disabled" class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="1001" <c:if test="${mecIf.maintainMecType=='1001' }">selected</c:if>>本地商户</option>
                                                               <option value="1002" <c:if test="${mecIf.maintainMecType=='1002' }">selected</c:if>>流出商户</option>
                                                               <option value="1003" <c:if test="${mecIf.maintainMecType=='1003' }">selected</c:if>>流入商户</option>      
                                                            </select>
                                                         </c:if> 
                                                         <c:if test="${isZongBu!='0' }">  
                                                            <select id="maintainMecType" name="maintainMecType" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="1001" <c:if test="${mecIf.maintainMecType=='1001' }">selected</c:if>>本地商户</option>
                                                               <option value="1002" <c:if test="${mecIf.maintainMecType=='1002' }">selected</c:if>>流出商户</option>
                                                               <option value="1003" <c:if test="${mecIf.maintainMecType=='1003' }">selected</c:if>>流入商户</option>      
                                                            </select>
                                                         </c:if>   
                                                        </div>
                                                 </div>
                                 <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否星级商户:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="isStar" name="isStar" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="1" <c:if test="${mecIf.isStar=='1' }">selected</c:if>>是</option>
                                                               <option value="0" <c:if test="${mecIf.isStar=='0' }">selected</c:if>>否</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 微信绑定状态 -->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >微信绑定状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="weChatStatus" name="weChatStatus"  class="chosen-select form-control width-200px">
                                                               <option value="" selected="selected">全部</option>
                                                               <option value="-1" <c:if test="${mecIf.weChatStatus == '-1'}">selected</c:if>>未绑定</option>
                                                               <option value="0" <c:if test="${mecIf.weChatStatus == '0' }">selected</c:if>>有效绑定</option>
                                                               <option value="1" <c:if test="${mecIf.weChatStatus == '1'}">selected</c:if>>无效绑定</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 微信绑定时间 -->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >微信绑定时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="weChatStartTime" name="weChatStartTime" value="${mecIf.weChatStartTime }" class="input-small form-control" onchange="changeWeChatDateStart()">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="weChatEndTime" name="weChatEndTime" value="${mecIf.weChatEndTime }"  class="input-small form-control" onchange="changeWeChatDateEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
				 		    <c:if test="${pbCheck==false }">
                                                    <!-- 进件类型 -->
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="isXwMec" name="isXwMec" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="00" <c:if test="${mecIf.isXwMec=='00' }">selected</c:if>>普通商户</option>
                                                               <option value="01" <c:if test="${mecIf.isXwMec=='01' }">selected</c:if>>小微商户</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 进件渠道 -->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件渠道:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="sysId" name="sysId" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="00" <c:if test="${mecIf.sysId=='00' }">selected</c:if>>APP端</option>
                                                               <option value="01" <c:if test="${mecIf.sysId !='00' and mecIf.sysId !=null and mecIf.sysId !='' }">selected</c:if>>PC端</option>
                                                            </select>
                                                        </div>
                                                    </div>
						</c:if>
                                                <c:if test="${pbCheck!=false }">
                                                    <!-- 进件类型 -->
                                                    <div class="form-group form-group-sm width-300px hidden">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="isXwMec" name="isXwMec"  class="chosen-select form-control width-200px">
                                                                <option value="00" <c:if test="${mecIf.isXwMec=='00' }">selected</c:if>>普通商户</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 进件渠道 -->
                                                    <div class="form-group form-group-sm width-300px hidden">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件渠道:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="sysId" name="sysId" class="chosen-select form-control width-200px">
                                                                <option value="01" <c:if test="${mecIf.sysId !='00' and mecIf.sysId !=null and mecIf.sysId !='' }">selected</c:if>>PC端</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                             
                                             
                                            </c:if>    
                                                
                                                 <br/>
                                                <!--end by hss 2016-04-26  --> 

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
												<!-- <button  type="button" id="exportDown">
					                                <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
					                                                                                                             商户导出
					                            </button>
                                                <button class="btn btn-danger btn-sm" type="submit" >
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
                                        	商户查询结果
                                    </h5>


                                </div>
                                <c:if test="${mecIf.mecTyp!='02' }">
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <!-- <th align="center">序号</th> -->
                                                <th style="text-align: center;width: 8%">商户编号</th>
                                                <th style="text-align: center;width: 9%">商户注册名称</th>
                                                <th style="text-align: center;width: 6%">签购单名称</th>
                                                	<c:if test="${pbCheck==true}">
                                                <%-- 	<c:if test="${currentNum=='T00356'}">
                                                		</c:if>
                                                		<c:if test="${currentNum!='T00356'}">
                                                		     <th style="text-align: center;width: 6%">所属地区</th>
                                                		</c:if> --%>
                                                </c:if>
                                                <c:if test='${pbCheck==false }'>
                                                <th style="text-align: center;width: 6%">所属地区</th>
                                                </c:if>
                                                <th style="text-align: center;width: 5%">联系人</th>
                                               <c:if test="${pbCheck==false }"> <th style="text-align: center;width: 8%">所属销售</th></c:if>
                                                
                                                <c:choose>
                                                	<c:when test="${pbCheck==true}">
                                                		<%-- <c:if test="${currentNum!='T00356'}">
                                                		<th style="textalign: center;width: 8%">机构名称</th>
                                                		</c:if>
                                                		<c:if test="${currentNum=='T00356'}">
                                                </c:if> --%>
                                                	</c:when>
                                                	<c:otherwise>
		                                                <th style="text-align: center;width: 8%">所属一代</th>
                                                	</c:otherwise>
                                                </c:choose>
                                              <c:if test="${pbCheck==false}">  <th style="text-align: center;width: 7%">所属分公司</th></c:if>
                                               <c:if test="${pbCheck==false}">
                                                <th style="text-align: center;width: 7%">维护分公司</th>
                                               </c:if>
                                                <!-- <th style="text-align: center;width: 5%">费率</th> -->
                                                <th style="text-align: center;width: 7%">开通日期</th>
                                                <th style="text-align: center;width: 7%">创建时间</th>
                                                <th style="text-align: center;width: 5%">状态</th>
                                                <th style="text-align: center;width: 5%">微信绑定状态</th>
                                                <th style="text-align: center;width: 7%">微信绑定时间</th>
                                                
                                                <th  style="text-align: center;width: 9%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${mecIfList}" var="de"  varStatus="status">
													<tr>
														<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
														<td style="text-align: center;">${de.mno }</td>
														<td style="text-align: left;">${de.cprRegNmCn }</td>
														<td style="text-align: left;">${de.mecDisNm }</td>
														<c:if test="${pbCheck==true}">
                                                	<%-- <c:if test="${currentNum=='T00356'}">
                                                		</c:if>
                                                		<c:if test="${currentNum!='T00356'}">
                                                		<td style="text-align: left;">${de.areaNm }</td>
                                                		</c:if> --%>
                                                </c:if>
															<c:if test="${pbCheck==false}">
														<td style="text-align: left;">${de.areaNm }</td>
														</c:if>
														<td style="text-align: left;">${de.contNmCn }</td>
														<c:if test="${pbCheck ==false }"><td style="text-align: left;">${de.empNm}</td></c:if>
														<c:if test="${pbCheck ==false }">
 														<td style="text-align: left;">${de.firstNm}</td>
 														</c:if>
 														<!-- 	检查的时候取合作经理 -->
 														<c:if test="${pbCheck ==true }">
 													<%-- 	<c:if test="${currentNum=='T00356'}">
                                                </c:if>
                                                
                                                <c:if test="${currentNum!='T00356'}">
                                                	<td style="text-align: left;">${de.managerNm }</td>
                                                </c:if> --%>
 													
 														</c:if>
 														
														<c:if test="${pbCheck==false}"><td style="text-align: center;">${de.branchNm}</td></c:if>
                                                        <c:if test="${pbCheck==false}">
														<td style="text-align: center;">${de.branchOrgNm}</td>
                                                        </c:if>
														<%-- <td style="text-align: center;">${de.rat1 }%</td> --%>
														<td style="text-align: center;">${de.signDt }</td>
														<td style="text-align: center;">${de.dtCte }</td>
														<td style="text-align: center;">${de.mercStss }</td>
														<td style="text-align: center;">
															<c:choose>
																<c:when test="${de.weChatStatus == '0'}">有效绑定</c:when>
																<c:when test="${de.weChatStatus == '1'}">无效绑定</c:when>
																<c:otherwise>未绑定</c:otherwise>
															</c:choose>
														</td>
														<td style="text-align: center;">${de.weChatTime }</td>
														
														<td   style="text-align: center;">
										                     <div class="   action-buttons">
										                         <a href="#" onclick="mecIfdetailShow('${de.inMno}')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
										                         </a>
										                     </div>
										                 </td>
													</tr>
												</c:forEach> 
                                         
                                            </tbody>
                                        </table>


                                    </div>

                                </div>
                                </c:if>
                                <%-- <c:if test="${mecIf.mecTyp=='02' }">
                                                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <!-- <th align="center">序号</th> -->
												<th style="text-align: center;width: 10%">  商户编号 </th>
                                                <th style="text-align: center;width: 13%">  商户注册名称</th>
                                                <th style="text-align: center;width: 13%">商户经营名称</th>
                                                <th style="text-align: center;width: 8%">手机号</th>
                                                <th style="text-align: center;width: 6%">所属地区</th>
                                                <th style="text-align: center;width: 9%">所属销售</th>
                                                <th style="text-align: center;width: 9%">归属机构</th>
                                                <th style="text-align: center;width: 8%">所属一代</th>
                                                <th style="text-align: center;width: 9%">创建时间</th>
                                                <th style="text-align: center;width: 6%">状态</th>
                                                <th  style="text-align: center;width: 9%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${mecIfList}" var="de"  varStatus="status">
													<tr>
														<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
														<td style="text-align: center;">${de.mno }</td>
														<td style="text-align: left;">${de.cprRegNmCn }</td>
														<td style="text-align: left;">${de.cprOperNmCn }</td>
														<td style="text-align: left;">${de.mercOprMbl }</td>
														<td style="text-align: left;">${de.areaNm }</td>
														<td style="text-align: center;">${de.empNm}</td>
														<td style="text-align: center;">${de.orgNm}</td>
														<td style="text-align: center;">${de.firstOrgNm}</td>
														<td style="text-align: center;">${de.dtCte }</td>
														<td style="text-align: center;">${de.mercStss }</td>
														<td   style="text-align: center;">
										                     <div class="   action-buttons">
										                         <a href="#" onclick="mecIfdetailShow('${de.inMno}')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-search blue bigger-130"><font size="2">查看详情</font></i>
										                         </a>
										                     </div>
										                 </td>
													</tr>
												</c:forEach> 
                                         
                                            </tbody>
                                        </table>


                                    </div>

                                </div>
                                </c:if> --%>
                                <!-- 显示手刷结果 -->
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

    <%-- <%@include file="../layout/footer.jsp"%> --%>
    <%@include file="../layout/common.alljs.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
       var proValue = $("#prov").val();
       fillProvSelect('mecProvCd',proValue);
       var cityValue = $("#city").val();
       fillCitySelect('mecProvCd','mecCityCd',cityValue);
     
     </script>
    
    <script type="text/javascript">
    function checkSubmit(){
    	if($("#mno").attr("pbcheck")=='mno'){
    		console.log("巡检");
    		if($("#mno").val()=='' || $("#mno").val()==null){
    			alert("请输入商编");
    			return false;
    		}else{
    			//$("#searchForm").submit();
    			return true;
    		}
    		}
    }
      function mecIfdetailShow(id){
    	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/mecIf/detail.do?mno='+id,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 900,
	        height: 800,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
				}
			});
    	  
      }
      
      function changeDateStart(){
 		 var creStartTm=Number($("#creStartTm").val().replace(/-/g,''));
 		 var creEndTm=Number($("#creEndTm").val().replace(/-/g,''));
 		 if(creEndTm!=0){
 			 if(creStartTm>creEndTm){
 				 $("#creEndTm").val($("#creStartTm").val());
 			 }
 		 }
 	 }
 	 function changeDateEnd(){
 		 var creStartTm=Number($("#creStartTm").val().replace(/-/g,''));
 		 var creEndTm=Number($("#creEndTm").val().replace(/-/g,''));
 		 if(creStartTm!=0){
 			 if(creStartTm>creEndTm){
 				 $("#creStartTm").val($("#creEndTm").val());
 			 }
 		 }
 	 }
    
 	 
 	function changeWeChatDateStart(){
		 var creStartTm=Number($("#weChatStartTime").val().replace(/-/g,''));
		 var creEndTm=Number($("#weChatEndTime").val().replace(/-/g,''));
		 if(creEndTm!=0){
			 if(creStartTm>creEndTm){
				 $("#weChatEndTime").val($("#weChatStartTime").val());
			 }
		 }
	 }
	 function changeWeChatDateEnd(){
		 var creStartTm=Number($("#weChatStartTime").val().replace(/-/g,''));
		 var creEndTm=Number($("#weChatEndTime").val().replace(/-/g,''));
		 if(creStartTm!=0){
			 if(creStartTm>creEndTm){
				 $("#weChatStartTime").val($("#weChatEndTime").val());
			 }
		 }
	 }
 	 
    
        jQuery(function($) {
        	$('.chosen-select').chosen({});


        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        }).next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});


    })
    
   
    
     function resetMecForm(){
    	 $(':input','#searchForm')  
    	 .not(':button, :submit, :reset, :hidden')  
    	 .val('')  
    	 .removeAttr('checked')  
    	 .removeAttr('selected'); 
    	 $("#mecSts").val('');
 		 $("#mecSts").trigger("chosen:updated");
 		 $("#mecProvCd").val('');
		 $("#mecProvCd").trigger("chosen:updated");
		 $("#mecCityCd").val('');
 		 $("#mecCityCd").trigger("chosen:updated");		 
 		 $("#mecDisNm").val('');
		 $("#mecDisNm").trigger("chosen:updated");
 		 $("#mecTyp").val('00').trigger("chosen:updated").trigger("onchange");
		 $("#orgNo").val('').trigger("chosen:updated").trigger("onchange");
		 $("#isStars").val('');
 		 $("#isStars").trigger("chosen:updated");
		 $("#weChatStatus").val('');
 		 $("#weChatStatus").trigger("chosen:updated");
		 
		 $("#creEndTm").val(getFormatDate());
 		 $("#creEndTm").trigger("chosen:updated");	
 		 $("#creStartTm").val(getFormatDateBefore('3'));
		 $("#creStartTm").trigger("chosen:updated");
		 $("#weChatEndTime").val('');
 		 $("#weChatEndTime").trigger("chosen:updated");	
 		 $("#weChatStartTime").val('');
		 $("#weChatStartTime").trigger("chosen:updated");
		 $("#mercTrdDesc").val('').trigger("chosen:updated").trigger("onchange");
		 //add by hss 2016-05-17 增加归属 分公司 与 维护商户类型 条件
		 $("#maintainMecType").val('').trigger("chosen:updated").trigger("onchange");
		 $("#branchOrgNo").val('').trigger("chosen:updated").trigger("onchange");
		 $("#isXwMec").val('');
 		 $("#isXwMec").trigger("chosen:updated");
 		 $("#sysId").val('');
 		 $("#sysId").trigger("chosen:updated");
		 
     }
        
        function getFormatDateBefore(beforeMonth){
        	var beforeMonth = parseInt(beforeMonth);
        	var datetime=new Date();
        	var yearNow = datetime.getFullYear();
    	    var monthNow = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    	    if(parseInt(monthNow)<4){
    	    	var month=parseInt(monthNow)+12-beforeMonth<10 ? "0"+ (parseInt(monthNow)+12-beforeMonth) : parseInt(monthNow)+12-beforeMonth;
    	    }else{
    	    	var month=parseInt(monthNow)-beforeMonth<10 ? "0"+(parseInt(monthNow)-beforeMonth): parseInt(monthNow)-beforeMonth;
    	    }
    	    if(parseInt(monthNow) < parseInt(month)){
    	    	var year = parseInt(yearNow)-1;
    	    }else{
    	    	var year=yearNow;
    	    }
    	    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    	    return year+"-"+month+"-"+date;
        }
     
     function switchTelField(  ){
 		var mecTyp = $('#mecTyp').val();
 		
 		if( mecTyp == "02" ){
			//手刷商户
 			$("#div_switch_tel").css("display","");
 		}else{
 			//POS机商户
 			$("#div_switch_tel").css("display","none");
		}
     }
	 
	 
	 
	 
	 jQuery(function($){
		 
		 $('#searchForm').formValidation({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	
				mercOprMbl : {
					validators : {
						
						regexp: {
	                        regexp: /^1\d{10}$/g,
	                        message:'请输入正确的手机号'
	                    }

					}
				}
            }
        });
		 
		 
	 })
	 
	 
	 
	 
	 
	 
	 
	 
</script>
</body>
</html>











