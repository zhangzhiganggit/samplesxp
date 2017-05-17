<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
    <script type="text/javascript">
    $(document).ready(function(){
    	if('${org.prov}' != ''){
    		$("#prov").val('${org.prov}');
    		$("#prov").trigger("chosen:updated");
    		fillCitySelect('prov','cityCd','');
    		$("#cityCd").val(${org.cityCd});
    		$("#cityCd").trigger("chosen:updated");
    	}
    })
    </script>
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
                                        创建代理商-信息补全
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="list.html">
                                            <input type="hidden" value="${org.orgUuid }" name="orgUuid">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " name="orgNm"
                                                                   data-content="${org.orgNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgNm }</label>
                                                        </div>
                                                    </div>

                                                    
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >状态<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="orgSts" id="orgSts"
																onchange="changeOrgSts()"
																class="chosen-select form-control width-200px">
																<option value="1" <c:if test="${org.orgSts == 1 }"> selected </c:if> >正常</option>
																<option value="2" <c:if test="${org.orgSts == 2 }"> selected </c:if> >停用</option>
																<option value="9" <c:if test="${org.orgSts == 9 }"> selected </c:if> >注销</option>
															</select>
														</div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构地址<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <input type="text" name="orgAddr" value="${org.orgAddr }" class="form-control input-small width-100 " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >机构电话:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="orgTelNo" value="${org.orgTelNo }" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >联系人邮箱<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="contactMail" value="${org.contactMail }" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    
                                                    


                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >邮政编码:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="orgZip" value="${org.orgZip }" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >传真:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text"  name="orgFax" value="${org.orgFax }" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联系人<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " name="contact"
                                                                   data-content="${org.contact }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.contact }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联系人手机<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " name="contactTelNo"
                                                                   data-content="${org.contactTelNo }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.contactTelNo }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属城市:</label>

                                                        <div class="col-sm-8  no-padding">
															<select id="prov" name="prov"
																class="chosen-select form-control width-48"
																onchange="fillCitySelect('prov','cityCd','');">
																<option value="0">请选择省份</option>
																<c:forEach items="${provs }" var="prov">
																	<option value="${prov.areaId }">${prov.areaNm}</option>
																</c:forEach>
															</select> <select id="cityCd" name="cityCd" 
																class="chosen-select form-control width-48">
																<option value="0">请选择城市</option>
															</select>
														</div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构经营模式:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select name="orgRunProp" id="orgRunProp"
																class="chosen-select form-control width-200px">
																<option value="1">个人</option>
																<option value="2">公司</option>
															</select>
                                                        </div>
                                                    </div>



                                                    <div class="form-group form-group-sm width-300px ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构注册号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgRegistNum" value="${org.orgRegistNum }" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="legalPersonNm" value="${org.legalPersonNm }" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人身份证:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="legalCard" value="${org.legalCard }" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册资本:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="registCapitall" value="${org.registCapitall }" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-100 ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册地址:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <input type="text" name="registAddress" value="${org.registAddress }" class="form-control input-small width-100 " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>



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
                                                            <select data-placeholder="请选择"      class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                <option value="1">总部</option>
                                                                <option value="2">其他</option>

                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 ele2">


                                                    <h3 class="header smaller lighter green">代理区域</h3>
                                                    <div class="col-sm-3 no-padding">
                                                        <label>
                                                            <input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1">
                                                            <span class="lbl">城市1</span>
                                                        </label>
                                                    </div>
                                                    <div class="col-sm-3 no-padding">
                                                        <label>
                                                            <input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1">
                                                            <span class="lbl">城市1</span>
                                                        </label>
                                                    </div>
                                                    <div class="col-sm-3 no-padding">
                                                        <label>
                                                            <input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1">
                                                            <span class="lbl">城市1</span>
                                                        </label>
                                                    </div>
                                                    <div class="col-sm-3 no-padding">
                                                        <label>
                                                            <input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1">
                                                            <span class="lbl">城市1</span>
                                                        </label>
                                                    </div>
                                                    <div class="col-sm-3 no-padding">
                                                        <label>
                                                            <input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1">
                                                            <span class="lbl">城市1</span>
                                                        </label>
                                                    </div>
                                                    <div class="col-sm-3 no-padding">
                                                        <label>
                                                            <input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1">
                                                            <span class="lbl">城市1</span>
                                                        </label>
                                                    </div>
                                                    <div class="col-sm-3 no-padding">
                                                        <label>
                                                            <input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1">
                                                            <span class="lbl">城市1</span>
                                                        </label>
                                                    </div>
                                                    <div class="col-sm-3 no-padding">
                                                        <label>
                                                            <input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1">
                                                            <span class="lbl">城市1</span>
                                                        </label>
                                                    </div>
                                                    <div class="col-sm-3 no-padding">
                                                        <label>
                                                            <input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1">
                                                            <span class="lbl">城市1</span>
                                                        </label>
                                                    </div>



                                                </div>

                                                <div class="col-sm-12">
                                                    <%--<h4 class="header smaller lighter green"></h4>--%>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签约主体<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="name21" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >应收保证金<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjkl积分卡束带结发快乐撒旦" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjkl积分卡束带结发快乐撒旦</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >实收保证金<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="name23" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >保证金到账日*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="name24" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >协议签署日<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="name25" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >协议归档状态<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="name26" id="form-field-select-3" class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                <option value="TRUE">开通</option>
                                                                <option value="FALSE">关闭</option>
                                                                <option value="INIT">待提交</option>
                                                                <option value="WAIT_AUDIT">待审核</option>
                                                                <option value="AUDITING">审核中</option>
                                                                <option value="AUDIT_REJECT">审核拒绝</option>
                                                                <option value="WAIT_OPEN">待开通</option>
                                                                <option id="SUSPEND" value="SUSPEND">挂起</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签约日期<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="name27" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >授权铭牌<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="form-field-select-3" class="chosen-select form-control width-200px">
                                                                <option value="">是</option>
                                                                <option value="TRUE">否</option>

                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商级别<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="form-field-select-3" class="chosen-select form-control width-200px">
                                                                <option value="">是</option>
                                                                <option value="TRUE">否</option>

                                                            </select>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户类型<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="form-field-select-3" class="chosen-select form-control width-200px">
                                                                <option value="">是</option>
                                                                <option value="TRUE">否</option>

                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行名称<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="form-field-select-3" class="chosen-select form-control width-80">
                                                                <option value="">是</option>
                                                                <option value="TRUE">否</option>

                                                            </select>
                                                            <button class="btn btn-minier btn-sm" type="button" id="bank">
                                                                查询
                                                            </button>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行城市:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择"   class="col-sm-8 width-48 chosen-select width-45">
                                                                <option value=""></option>
                                                                <option value="TRUE">开通</option>
                                                                <option value="FALSE">关闭</option>
                                                                <option value="INIT">待提交</option>
                                                                <option value="WAIT_AUDIT">待审核</option>
                                                                <option value="AUDITING">审核中</option>
                                                                <option value="AUDIT_REJECT">审核拒绝</option>
                                                                <option value="WAIT_OPEN">待开通</option>
                                                                <option id="SUSPEND" value="SUSPEND">挂起</option>
                                                            </select>
                                                            <select data-placeholder="请选择"  class="col-sm-6 width-48  chosen-select width-45  ">
                                                                <option value=""></option>
                                                                <option value="TRUE">开通</option>
                                                                <option value="FALSE">关闭</option>
                                                                <option value="INIT">待提交</option>
                                                                <option value="WAIT_AUDIT">待审核</option>
                                                                <option value="AUDITING">审核中</option>
                                                                <option value="AUDIT_REJECT">审核拒绝</option>
                                                                <option value="WAIT_OPEN">待开通</option>
                                                                <option id="SUSPEND" value="SUSPEND">挂起</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行信息<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <input type="text" name="name28" class="form-control input-small width-100 " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联行行号<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="name29" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算账户名<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="name30" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算帐号<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="name31" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>



                                                </div>


                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="submit">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        保存
                                                    </button>
                                                    <button class="btn  btn-sm" type="submit">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
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
    </div><!-- /.main-container -->

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:800px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        查询结算银行
                    </h4>
                </div>
                <div class="modal-body no-padding" style="height:500px">
                    <div class="widget-main ">
                    <form  class="form-inline form-horizontal"  >
                        <div class=" col-xs-12">
                            <div class="form-group form-group-sm width-300px ">
                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属地区:</label>

                                <div class="col-sm-8  no-padding"  >
                                    <select data-placeholder="请选择"   class="col-sm-8 width-48 chosen-select width-45">
                                        <option value=""></option>
                                        <option value="TRUE">开通</option>
                                        <option value="FALSE">关闭</option>
                                        <option value="INIT">待提交</option>
                                        <option value="WAIT_AUDIT">待审核</option>
                                        <option value="AUDITING">审核中</option>
                                        <option value="AUDIT_REJECT">审核拒绝</option>
                                        <option value="WAIT_OPEN">待开通</option>
                                        <option id="SUSPEND" value="SUSPEND">挂起</option>
                                    </select>
                                    <select data-placeholder="请选择"  class="col-sm-6 width-48  chosen-select width-45  ">
                                        <option value=""></option>
                                        <option value="TRUE">开通</option>
                                        <option value="FALSE">关闭</option>
                                        <option value="INIT">待提交</option>
                                        <option value="WAIT_AUDIT">待审核</option>
                                        <option value="AUDITING">审核中</option>
                                        <option value="AUDIT_REJECT">审核拒绝</option>
                                        <option value="WAIT_OPEN">待开通</option>
                                        <option id="SUSPEND" value="SUSPEND">挂起</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm width-300px">
                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行名称<span class="red">*</span>:</label>

                                <div class="col-sm-8  no-padding"  >
                                    <select data-placeholder="请选择"   class="chosen-select form-control width-200px">
                                        <option value="">是</option>
                                        <option value="TRUE">否</option>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm width-300px">
                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银行名称<span class="red">*</span>:</label>

                                <div class="col-sm-8  no-padding"  >
                                    <input type="text" name="name18" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                </div>
                            </div>

                            <div class="form-group form-group-sm width-300px">
                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算银行信息<span class="red">*</span>:</label>

                                <div class="col-sm-8  no-padding "  >
                                    <input type="text" name="name18" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                </div>
                            </div>

                            <button class="btn btn-danger btn-sm" type="submit">
                                <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                查询
                            </button>
                            

                        </div>

                        <div class="col-sm-12 no-padding">
                            <div class="box">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                    <thead class="thin-border-bottom">
                                    <tr>
                                        <th> 联行行号 </th>
                                        <th> 详细信息</th>
                                        <th >所在省</th>
                                        <th>所在市</th>
                                        <th>操作</th>

                                    </tr>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td class="">8614271759</td>

                                        <td> 潮州市万信电池有限公司 </td>
                                        <td >广东潮州市湘桥区</td>
                                        <td>苏礼宣</td>
                                        <td  >
                                            <div class="   action-buttons">
                                                <a href="detail.jsp" class="blue ">
                                                    <i class="ace-icon fa fa-search-plus bigger-130"></i>
                                                </a>
                                                <a href="#" class="green">
                                                    <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                </a>
                                                <a href="#" class="red">
                                                    <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="">8614271759</td>

                                        <td> 潮州市万信电池有限公司 </td>
                                        <td >广东潮州市湘桥区</td>
                                        <td>苏礼宣</td>
                                        <td  >
                                            <div class="   action-buttons">
                                                <a href="detail.jsp" class="blue ">
                                                    <i class="ace-icon fa fa-search-plus bigger-130"></i>
                                                </a>
                                                <a href="#" class="green">
                                                    <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                </a>
                                                <a href="#" class="red">
                                                    <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="">8614271759</td>

                                        <td> 潮州市万信电池有限公司 </td>
                                        <td >广东潮州市湘桥区</td>
                                        <td>苏礼宣</td>
                                        <td  >
                                            <div class="   action-buttons">
                                                <a href="detail.jsp" class="blue ">
                                                    <i class="ace-icon fa fa-search-plus bigger-130"></i>
                                                </a>
                                                <a href="#" class="green">
                                                    <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                </a>
                                                <a href="#" class="red">
                                                    <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="">8614271759</td>

                                        <td> 潮州市万信电池有限公司 </td>
                                        <td >广东潮州市湘桥区</td>
                                        <td>苏礼宣</td>
                                        <td  >
                                            <div class="   action-buttons">
                                                <a href="detail.jsp" class="blue ">
                                                    <i class="ace-icon fa fa-search-plus bigger-130"></i>
                                                </a>
                                                <a href="#" class="green">
                                                    <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                </a>
                                                <a href="#" class="red">
                                                    <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>


                            </div>


                        </div>
                    </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <%--<button type="button" class="btn btn-default"--%>
                            <%--data-dismiss="modal">关闭--%>
                    <%--</button>--%>
                    <%--<button type="button" class="btn btn-primary">--%>
                        <%--提交更改--%>
                    <%--</button>--%>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


<!-- basic scripts -->

    <%@include file="../layout/common.js.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">

    $('.main-content .chosen-select').chosen({});
    $("#select3").chosen({}).change(function(){
        if($("#select3").val()==1)
            $('.ele').show();
        else
            $('.ele').hide()
    });

    $("#select4").chosen({}).change(function(){
        if($("#select4").val()==1)
            $('.ele2').show();
        else
            $('.ele2').hide()
    });

    jQuery(function($) {

        $('#bank').click(function(){
            $('#myModal').modal({
                keyboard: true
            });

        });

        $('#myModal').on('shown.bs.modal', function () {
            $('#myModal .chosen-select').chosen("destroy");
            $('#myModal .chosen-select').chosen({});
        })

        $('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name1: {
                    validators: {
                        notEmpty: {},

                    }
                },
                name2: {
                    validators: {
                        notEmpty: {},

                    }
                },
                name3: {
                    validators: {
                        notEmpty: {},
                        stringLength: {
                            min: 6,
                            max: 20
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/
                        }

                    }
                },
                email: {
                    validators: {
                        notEmpty: {},
                        emailAddress: {}
                    }
                },
                name4: {
                    validators: {
                        notEmpty: {},

                    }
                },
                name5: {
                    validators: {
                        notEmpty: {},

                    }
                },
                age: {
                    validators: {
                        notEmpty: {},
                        digits: {},
                        greaterThan: {
                            value: 18
                        },
                        lessThan: {
                            value: 100
                        }
                    }
                },
                website: {
                    validators: {
                        notEmpty: {},
                        uri: {}
                    }
                },
                phoneNumber: {
                    validators: {
                        notEmpty: {},
                        digits: {},
                        phone: {
                            country: 'US'
                        }
                    }
                },
                name6: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name7: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name8: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name9: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name10: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name11: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name12: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name13: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name14: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name20: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name21: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name22: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name23: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name24: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name25: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name26: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name27: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name28: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name29: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name30: {
                    validators: {
                        notEmpty: {}
                    }
                },
                name31: {
                    validators: {
                        notEmpty: {}
                    }
                },
                'languages[]': {
                    validators: {
                        notEmpty: {}
                    }
                },
                'programs[]': {
                    validators: {
                        choice: {
                            min: 2,
                            max: 4
                        }
                    }
                }
            }
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
//        $('input[name=date-range-picker]').daterangepicker({
//            'applyClass' : 'btn-sm btn-success',
//            'cancelClass' : 'btn-sm btn-default',
//            locale: {
//                applyLabel: 'Apply',
//                cancelLabel: 'Cancel',
//            }
//        })
//            .prev().on(ace.click_event, function(){
//                $(this).next().focus();
//            });
//        $('#timepicker1').timepicker({
//            minuteStep: 1,
//            showSeconds: true,
//            showMeridian: false
//        }).next().on(ace.click_event, function(){
//            $(this).prev().focus();
//        });
//        $('#date-timepicker1').datetimepicker().next().on(ace.click_event, function(){
//            $(this).prev().focus();
//        });




    })
</script>
</body>
</html>











