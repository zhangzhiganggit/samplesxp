<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>
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


                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        直属人员查询条件
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


                                            <form class="form-inline form-horizontal" method="post" action="/user/list" id="searchForm">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
												<input type="hidden" name="orgNo" value="${user.orgNo }" >
												
                                                <div class=" col-xs-12">

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >直属代理商:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <label
																class="form-control input-small width-200px   view-control  "
																data-content="${user.orgName}" data-placement="bottom"
																data-trigger="hover" data-rel="popover">${user.orgName}</label>

                                                        </div>
                                                    </div>

<!--                                                     <div class="form-group form-group-sm width-300px "> -->
<!--                                                         <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >直属部门:</label> -->

<!--                                                         <div class="col-sm-8  no-padding"  > -->
<!-- 															<select data-placeholder="请选择" -->
<!-- 																id="deptUuid" name="deptUuid" -->
<!-- 																class="chosen-select form-control width-200px"> -->
<!-- 																<option value="">请选择</option> -->
<%-- 																<c:forEach items="${deptList }" var="dept"> --%>
<%-- 																	<option value="${dept.deptUuid }" --%>
<%-- 																		<c:if test="${dept.deptUuid==emp.deptUuid }"> selected </c:if> >${dept.deptNm }</option> --%>
<%-- 																</c:forEach> --%>
<!-- 															</select> -->
<!--                                                         </div> -->
<!--                                                     </div> -->

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="remarkName" value="${user.remarkName }" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >登录名:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="loginName" value="${user.loginName }" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>


                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <%@include file="../common/resetForm.jsp"%>
                                                <c:if test='${null != parentUuid and  parentUuid != ""}'>
	                                                <button class="btn btn-default btn-sm" type="button" onclick="location.href='/org/getNextOrg.do?orgUuid=${parentUuid }'">
	                                                    <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>返回机构
	                                                </button>
                                                </c:if>
                                                <c:if test='${null == parentUuid  or  parentUuid == ""}'>
	                                                <button class="btn btn-default btn-sm" type="button" onclick="location.href='/org/list.do'">
	                                                    <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>返回机构
	                                                </button>
                                                </c:if>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table style="word-break:break-all; word-wrap:break-all; " class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                 <th width="7%">  人员编号 </th>
                                                <th width="7%"> 登陆名 </th>
                                                <th width="12%"> 名称 </th>
                                                <th width="12%">所属机构</th>
<!--                                                 <th width="10%">所属部门</th> -->
                                                <th width="10%">手机</th>
                                                <th width="10%" >启用时间</th>
                                                <th  width="6%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${list }" var="emp">
                                            <tr>
                                                <td align="center">${emp.userCode }</td>
                                                <td align="center">${emp.loginName }</td>

                                                <td> ${emp.remarkName } </td>
                                                <td >${emp.orgName }</td>
<%--                                                 <td>${emp.deptNm }</td> --%>
                                                <td align="center">${emp.phone }</td>
                                                <td  align="center" ><fmt:formatDate value="${emp.dateCreated }"  type="date" pattern="yyyy-MM-dd"/></td>
                                                <td >
                                                    <div class="   action-buttons">
                                                    
                                                    	<a href="javascript:;" onclick="viewUser('${emp.id}')" class="blue ">
                                                           查看
                                                        </a>
                                                        
                                                    </div>
                                                </td>
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
                                <label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
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
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
        $('.chosen-select').chosen({});
        function viewUser(userId){
        	var url= "/user/viewUser?id="+userId;
        	$.fancybox.open({
    			href : url,
    			type: 'iframe',
    	        padding: 5,
    	        scrolling: 'no',
    	        fitToView: true,
    	        autoWidth:true,
    	        height: 420,
    	        autoSize: false,
    	        closeClick: false
    		});
        }
</script>
</body>
</html>











