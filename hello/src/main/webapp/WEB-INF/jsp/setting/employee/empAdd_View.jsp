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
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >人员名称<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${emp.empNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${emp.empNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >身份证号<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${emp.idNumber }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${emp.idNumber }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >所属机构:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${emp.orgNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${emp.orgNm }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >上级部门:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${emp.deptNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${emp.deptNm }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >手机:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${emp.mbNo }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${emp.mbNo }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >邮箱:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${emp.mail }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${emp.mail }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >启用时间:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${emp.joinDateStr }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${emp.joinDateStr }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >停用时间:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${emp.outDateStr }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${emp.outDateStr }</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >状态:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="<c:if test="${emp.empSts==1 }">在职</c:if><c:if test="${emp.empSts==0 }">离职</c:if>" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ><c:if test="${emp.empSts==1 }">在职</c:if><c:if test="${emp.empSts==0 }">离职</c:if></label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >可登录系统:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="<c:if test="${emp.isAllowLogin==1 }">允许</c:if><c:if test="${emp.isAllowLogin==0 }">不允许</c:if>" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ><c:if test="${emp.isAllowLogin==1 }">允许</c:if><c:if test="${emp.isAllowLogin==0 }">不允许</c:if></label>
                                                        </div>
                                                    </div>




                                                </div>
													
														<!-- <div class="col-sm-12" >
															<h3 class="header smaller lighter green ">
																数据权限分配
															</h3>
															<div class=" no-padding">
	                                                        <label>
	                                                            <span class="lbl">
	                                                            <c:forEach items="${permission }" var="per" >
	                                                            	<c:if test="${per.roleUuid=='SMS_ADMIN'}">
	                                                            		<c:set value="1" var="test" />
	                                                            		查看全机构数据（包含本机构及下级销售组全部商户数据）
	                                                            	</c:if>
	                                                            </c:forEach>
	                                                            <c:if test="${test!='1' }">
	                                                            	仅查看自己所属商户数据
	                                                            </c:if>
	                                                            </span>
	                                                        </label>
	                                                    	</div>
														</div> -->

                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green ">
                                                        权限分配
                                                    </h3>
													<c:forEach items="${permission }" var="per">
														<c:if test="${per.roleUuid != 'SMS_ADMIN' }">
													
	                                                    <div class="col-sm-3 no-padding">
	                                                        <label>
	                                                            <span class="lbl">${per.roleNm }</span>
	                                                        </label>
	                                                    </div>
	                                                    </c:if>
                                                    </c:forEach>
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











