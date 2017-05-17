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
                            <div class="widget-box widget-color-normal3" >
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        直属机构
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


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/org/searchAgentLever.do" id="searchForm">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="orgUuid" value="${orgUuid }"/>
												<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
												
<!--                                                 <div class=" col-xs-12 "> -->
                                                    <ul class="breadcrumb">${ceil }的直属机构</ul>
<!--                                                 </div> -->
<%--                                                 <button class="btn btn-danger btn-sm" type="button"  onclick="operationFun('addNextOrg','${orgUuid}')"> --%>
<!--                                                     <span class="ace-icon fa fa-save icon-on-right bigger-110"></span> -->
<!--                                                     添加机构 -->
<!--                                                 </button> -->
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        直属机构查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table style="word-break:break-all; word-wrap:break-all; " class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="5%">  代理商编号 </th>
                                                <th width="8%">  机构编号 </th>
                                                <th width="12%">  机构名称 </th>
                                                <th width="12%">上级机构</th>
                                                <th width="13%">创建时间</th>
                                                <th width="4%">状态</th>
                                                <th width="6%">代理商层级</th>
                                                <th  width="8%">直属机构数量</th>
<!--                                                 <th  width="8%">直属部门数量</th> -->
                                                <th  width="8%">直属人员数量</th>
                                                <th  width="6%">管理员账号</th>
                                                <th  >操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach items="${orgList }" var="org">
                                             <tr>
                                                <td align="center">${org.agentNumber }</td>
                                                <td align="center">${org.orgUuid }</td>
                                                <td >${org.orgNm }</td>
                                                <td >${org.parentNm }</td>
                                                <td align="center">${org.dateCreatedStr }</td>
                                                <td align="center">${org.orgStsStr }</td>
                                                <td align="center">lever${org.leverNo }</td>
                                                <td align="right">${org.orgChildNum }</td>
<%--                                                 <td align="right">${org.deptNum }</td> --%>
                                                <td align="right">${org.empNum }</td>
                                                <td align="center">${org.adminLoginId }</td>
                                                <td  >
                                                    <div class="   action-buttons">
                                                        <a href='/org/getNextOrg.do?orgUuid=${org.orgUuid }' class="blue">直属机构</a>
<%--                                                         <a href='/dept/list.do?orgUuid=${org.orgUuid }' class="blue">直属部门</a> --%>
                                                        <a href='/user/list?orgNo=${org.orgUuid }&isFirstLoad=true' class="blue">直属人员</a>

<%--                                                         <a href="javascript:;"  class="blue" onclick="operationFun('updateNextOrg','${org.orgUuid }')">修改</a> --%>
<%--                                                        	<c:if test="${org.orgSts != '9'}"> --%>
<%--                                                         <a href="/org/changeSts.do?orgUuid=${org.orgUuid }" class="blue" >修改状态</a> --%>
<%--                                                         </c:if> --%>
                                                        <a href="/org/get.do?orgUuid=${org.orgUuid }" class="blue" >详情</a>
                                                        
<%--                                                         <a href="javascript:;" class="blue" onclick="operationFun('updatePwd','${org.adminLoginId }','${org.orgUuid }')">密码</a> --%>
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
    function operationFun(obj,obj1,obj2){
	    	var url="";
	    	var size =620;
	    	if(obj=='addNextOrg'){
	    		url = "/org/toAddOrgNext.do?orgUuid="+obj1;
	    	}else if(obj=='updateNextOrg'){
	    		url = "/org/edit.do?orgUuid="+obj1;
	    	}else if(obj == 'updateNextOrgSts'){
	    		url = "/org/changeSts.do?orgUuid="+obj1;
	    		size = 420;
	    	}else if(obj =='viewNextOrg'){
	    		url = "/org/get.do?orgUuid="+obj1;
	    	}else if(obj =='updatePwd'){
	    		url = "/employee/toUpdatePassword.do?isAdmin=isAdmin&loginId="+obj1+"&orgUuid="+obj2;
	    	}
    		
    	     
    		$.fancybox.open({
			href : url,
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        autoWidth:true,
	        height: size,
	        autoSize: false,
	        closeClick: false
		});
    }
</script>
</body>
</html>











