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
                                        创建代理商-预览
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" method="post" action="<%=request.getContextPath()%>/org/list.do">
                                                <input type="hidden" value="2" name ="orgProp"/>
                                                <input type="hidden" value="10" name ="pageSize"/>
                                                <input type="hidden" value="1" name ="pageNum"/>
                                           <h3 class="header smaller lighter green">机构基本信息</h3>
                                                <div class=" col-xs-12">
                                               <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.branchAttributionName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.branchAttributionName }</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >合作经理<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.empCooperateManagerNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.empCooperateManagerNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgNm }</label>
                                                        </div>
                                                    </div>
						<c:if test="${pbCheck==false }">							<div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商类型<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.mercAgentTypes }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.mercAgentTypes }</label>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >状态<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgStsStr }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgStsStr }</label>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构详细地址<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.provNm }${org.cityNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.provNm }${org.cityNm }</label>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                         <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-300px  view-control  "
                                                                   data-content="${org.orgAddr }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgAddr }</label>
                                                        </div>
                                                    </div>
                                                    
<!--                                                     <div class="form-group form-group-sm width-100"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构详细地址<span class="red">*</span>:</label> -->
<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.provNm }${org.cityNm }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.provNm }${org.cityNm }</label> --%>
<!--                                                         </div> -->
<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-100   view-control  " -->
<%--                                                                    data-content="${org.orgAddr }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.orgAddr }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->
														<div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >邮政编码:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgZip }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgZip }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >机构电话:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgTelNo }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgTelNo }</label>
                                                        </div>
                                                    </div>
<!--  													 <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构经营模式:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.orgRunPropStr }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.orgRunPropStr }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->
													<div class="form-group form-group-sm width-300px ele">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人身份证姓名:</label>

														<div class="col-sm-8  no-padding">
									
																<label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.legalPersonNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.legalPersonNm }</label>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人身份证号:</label>

														<div class="col-sm-8  no-padding">
																<label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.legalCard }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.legalCard }</label>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构注册号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgRegistNum }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgRegistNum }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册资本:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.registCapitall }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.registCapitall }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-100 ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构注册地址:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <label class="form-control input-small width-100   view-control  "
                                                                   data-content="${org.registAddress }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.registAddress }</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 ele2">


<%--                                                     <c:if test="${not empty citys }"> --%>
<!--                                                     <h3 class="header smaller lighter green">代理区域</h3> -->
<%--                                                     <c:forEach items="${citys }" var="city"> --%>
<!-- 	                                                     <div class="col-sm-3 no-padding"> -->
<!-- 	                                                        <label> -->
<%-- 	                                                            <span class="lbl">${city}</span> --%>
<!-- 	                                                        </label> -->
<!-- 	                                                     </div> -->
<%--                                                     </c:forEach></c:if> --%>
                                                    
                                                   


                                                </div>
										<h3 class="header smaller lighter green">机构管理者信息</h3>
                                           		  <div class=" col-xs-12">
                                           		  	<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证姓名<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.idCardName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.idCardName }</label></div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">手机号<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.phone }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.phone }</label></div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">备注名<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.remarkName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.remarkName }</label></div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证号<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.idCardNo }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.idCardNo }</label></div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">出生日期:</label>
														<div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.birthDate }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.birthDate }</label></div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">性别:</label>
													<div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.gender }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ><c:if test='${user.gender==0}'>女</c:if><c:if test='${user.gender==1}'>男</c:if></label></div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">邮箱:</label>
 														<div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.email}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.email}</label>
                                                        </div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">QQ号:</label>
														<div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.qq}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.qq}</label>
                                                        </div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">微信:</label>
														<div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.wechat}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.wechat}</label></div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">传真:</label>
															<div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgFax}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgFax}</label></div>
													</div>
													</div>
													<!-- <h3 class="header smaller lighter green">权限信息</h3>
												<div class="col-sm-12">
													<div id="authorityDiv"  >
														<c:forEach items="${permission }" var="city">
	                                                    <div class="col-sm-3 no-padding">
	                                                        <label>
	                                                            <span class="lbl">${city.name }</span>
	                                                        </label>
	                                                    </div>
                                                    
                                                    </c:forEach>
                                                    </div>
												</div> -->
												<h3 class="header smaller lighter green">个人结算信息</h3>
                                                <div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >账户名称<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.accountName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.accountName }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算帐号<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.settlementAccount }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.settlementAccount } </label>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联行行号<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.cnapsCode}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.cnapsCode }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >开户行名称<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.openbankName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.openbankName }</label>
                                                        </div>
                                                    </div>
                                                </div>
												<h3 class="header smaller lighter green">对公结算信息</h3>
                                           		  <div class=" col-xs-12">

													<div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户名<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.accNumber }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.accNumber }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算帐号<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.bankAccount }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.bankAccount } </label>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联行行号<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.backCardNum }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.backCardNum }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行名称<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.bankName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.bankName }</label>
                                                        </div>
                                                    </div>

                                                   <!--   <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行城市:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.accProvince }${org.accountCity}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.accProvince }${org.accountCity}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行信息<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding "  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.accOpenBranch }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.accOpenBranch }</label>
                                                        </div>
                                                    </div>-->
                                                    </div>
                                                    <h3 class="header smaller lighter green">签约信息</h3>
                                                <div class="col-sm-12">
                                                    <%--<h4 class="header smaller lighter green"></h4>--%>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签约主体<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.mainContract }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.mainContract }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >应收保证金<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.depositmarginReceivable }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.depositmarginReceivable }</label>
                                                        </div>
                                                    </div>

                                                    <%-- <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >实收保证金<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.paidDeposit }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.paidDeposit }</label>
                                                        </div>
                                                    </div> --%>

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >保证金到账日<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.depositTime }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.depositTime }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >协议签署日<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.agreementDate }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.agreementDate }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->
													<div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签约日期<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.signDate }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.signDate }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归档状态<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.filingProtocolStateStr }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.filingProtocolStateStr }</label>
                                                        </div>
                                                    </div>
<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >授权铭牌<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.authorizedNameplateStr }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.authorizedNameplateStr }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商级别<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.agentLeverStr }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.agentLeverStr }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->


                                                   
<!-- 													<div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >授权区域类型<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.authorizationAreaType }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.authorizationAreaType }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->
													<div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否提供发票:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.isOfferInvoice }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.isOfferInvoice }</label>
                                                        </div>
                                                    </div>

                                                </div>
                                                    
<!--                                                 <div class="col-sm-12"> -->
<%--                                                     <h4 class="header smaller lighter green"></h4> --%>

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签约主体<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.mainContract }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.mainContract }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >应收保证金<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.depositmarginReceivable }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.depositmarginReceivable }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >实收保证金<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.paidDeposit }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.paidDeposit }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >保证金到账日<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.depositTime }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.depositTime }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >协议签署日<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.agreementDate }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.agreementDate }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >协议归档状态<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.filingProtocolStateStr }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.filingProtocolStateStr }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签约日期<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.signDate }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.signDate }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >授权铭牌<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.authorizedNameplateStr }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.authorizedNameplateStr }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商级别<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.agentLeverStr }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.agentLeverStr }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->


<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户类型<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.settlementAccountTypeStr }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.settlementAccountTypeStr }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行名称<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.bankName }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.bankName }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px "> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行城市:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.accProvince }${org.accountCity}" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.accProvince }${org.accountCity}</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-100"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行信息<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding width-85"  > -->
<!--                                                             <label class="form-control input-small width-100   view-control  " -->
<%--                                                                    data-content="${org.accOpenBranch }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.accOpenBranch }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联行行号<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.backCardNum }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.backCardNum }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >身份证号<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.idNumber }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.idNumber }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户名<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.accNumber }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.accNumber }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算帐号<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.bankAccount }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.bankAccount } </label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->
                                                    
<!-- 													<div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >授权区域类型<span class="red">*</span>:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.authorizationAreaType }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.authorizationAreaType } </label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->
<!-- 													<div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否提供发票:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${org.isOfferInvoice }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${org.isOfferInvoice } </label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                 </div> -->


                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn  btn-sm" type="submit">
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                        关闭
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
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>

    <%@include file="../layout/common.alljs.jsp"%>
</body>
</html>











