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
                                        代理商快速创建-预览
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="list.html">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgNm }</label>
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
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.empCooperateManagerNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.empCooperateManagerNm }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >状态<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgStsStr }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgStsStr }</label>
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
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商类型<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.mercAgentTypes }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.mercAgentTypes }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >身份证姓名<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.idCardName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.idCardName }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >手机号<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.phone }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.phone }</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >备注名<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.remarkName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.remarkName }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >身份证号<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.idCardNo }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.idCardNo }</label>
                                                        </div>
                                                    </div>

                                                   

                                                    



                                                </div>
                                                <!--<div class="col-sm-12 ele2">

                                               <h3 class="header smaller lighter green">权限信息</h3>
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
												</div> 
                                                    
                                                    
                                                </div>-->




                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn  btn-sm" type="button" onclick="location.href='/org/list.do?orgProp=2'">
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
    </div><!-- /.main-container -->

    <%@include file="../layout/common.alljs.jsp"%>
</body>
</html>











