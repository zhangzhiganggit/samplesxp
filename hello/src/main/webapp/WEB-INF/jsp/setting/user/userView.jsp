<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../../layout/common.css.jsp"%>
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
                                        预览
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="list.html">
                                            <h3 class="header smaller lighter green">基本信息</h3>
                                                <div class=" col-xs-12">
                                                   <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >人员编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.userCode }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.userCode }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >登录账号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.loginName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.loginName }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >身份证姓名:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.idCardName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.idCardName }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >手机号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.phone }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.phone }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >备注名:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.remarkName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.remarkName }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >身份证号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.idCardNo }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.idCardNo }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >出生日期:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.birthDate }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.birthDate }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >性别:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.gender }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >
                                                                    <c:if test='${user.gender==0}'>女</c:if><c:if test='${user.gender==1}'>男</c:if>
                                                                    </label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >邮箱:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.email }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.email }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >QQ:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.qq }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.qq }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >微信号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.wechat }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.wechat }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px"> 

                                                       <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >状态:</label> 
                                                         <div class="col-sm-8  no-padding">
                                                             <label class="form-control input-small width-200px   view-control  " 
                                                                    data-content="<c:if test="${user.status==1 }">正常</c:if><c:if test="${user.status==2 }">注销</c:if><c:if test="${user.status==3 }">暂停</c:if>" data-placement="bottom" data-trigger="hover" data-rel="popover" 
                                                                     ><c:if test="${user.status==1 }">正常</c:if><c:if test="${user.status==2 }">注销</c:if><c:if test="${user.status==3 }">暂停</c:if></label> 
                                                         </div> 
                                                    </div> 
                                                
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >创建日期:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.dateCreated  }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ><fmt:formatDate value="${user.dateCreated }"  type="date" pattern="yyyy-MM-dd"/></label>
                                                        </div>
                                                    </div>
<!--                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >停用时间:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="${emp.outDateStr }" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     >${emp.outDateStr }</label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->

<!--                                                     <div class="form-group form-group-sm  width-300px"> -->

<!--                                                         <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >可登录系统:</label> -->
<!--                                                         <div class="col-sm-8  no-padding"> -->
<!--                                                             <label class="form-control input-small width-200px   view-control  " -->
<%--                                                                    data-content="<c:if test="${emp.isAllowLogin==1 }">允许</c:if><c:if test="${emp.isAllowLogin==0 }">不允许</c:if>" data-placement="bottom" data-trigger="hover" data-rel="popover" --%>
<%--                                                                     ><c:if test="${emp.isAllowLogin==1 }">允许</c:if><c:if test="${emp.isAllowLogin==0 }">不允许</c:if></label> --%>
<!--                                                         </div> -->
<!--                                                     </div> -->




                                                </div>
													
                                                   <!--  <h3 class="header smaller lighter green">权限信息</h3>
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
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >账户名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.accountName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.accountName }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算帐号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.settlementAccount }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.settlementAccount } </label>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联行行号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.cnapsCode}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.cnapsCode }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >开户行名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${user.openbankName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${user.openbankName }</label>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn  btn-sm" type="button" onclick="window.parent.$.fancybox.close();">
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

<!-- basic scripts -->

    <%@include file="../../layout/common.alljs.jsp"%>
</body>
</html>











