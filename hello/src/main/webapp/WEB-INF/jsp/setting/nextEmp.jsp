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


                                            <form class="form-inline form-horizontal" method="post" action="/employee/list.do" id="searchForm">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
												<input type="hidden" name="orgUuid" value="${user.orgUuid }" >
												
                                                <div class=" col-xs-12">

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >直属代理商:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <label
																class="form-control input-small width-200px   view-control  "
																data-content="${emp.orgNm }" data-placement="bottom"
																data-trigger="hover" data-rel="popover">${emp.orgNm }</label>

                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >直属部门:</label>

                                                        <div class="col-sm-8  no-padding"  >
															<select data-placeholder="请选择"
																id="deptUuid" name="deptUuid"
																class="chosen-select form-control width-200px">
																<option value="">请选择</option>
																<c:forEach items="${deptList }" var="dept">
																	<option value="${dept.deptUuid }"
																		<c:if test="${dept.deptUuid==emp.deptUuid }"> selected </c:if> >${dept.deptNm }</option>
																</c:forEach>
															</select>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="empNm" value="${emp.empNm }" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >登录名:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="loginId" value="${emp.loginId }" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
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
	                                                <button class="btn btn-default btn-sm" type="button" onclick="location.href='/org/searchAgentLever.do'">
	                                                    <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>返回机构
	                                                </button>
                                                </c:if>
                                               <c:if
																test='${null != emp.deptUuid and  emp.deptUuid != ""}'>
                                                <button class="btn btn-default btn-sm" type="button" onclick="location.href='/dept/list.do?orgUuid=${emp.orgUuid }'">
                                                    <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>返回部门
                                                </button>
                                                </c:if>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="operationFun('addEmpNext','${orgUuid}')">
                                                    <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>增加人员
                                                </button>

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
                                                <th width="10%">所属部门</th>
                                                <th width="10%">手机</th>
                                                <th width="10%" >启用时间</th>
                                                <th  >操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${list }" var="emp">
                                            <tr>
                                                <td align="center">${emp.empNo }</td>
                                                <td align="center">${emp.loginId }</td>

                                                <td> ${emp.empNm } </td>
                                                <td >${emp.orgNm }</td>
                                                <td>${emp.deptNm }</td>
                                                <td align="center">${emp.mbNo }</td>
                                                <td  align="center">${emp.joinDateStr }</td>
                                                <td >
                                                    <div class="   action-buttons">
                                                    
                                                    	<a href="javascript:;" onclick="operationFun('viewEmp','${emp.empUuid}')" class="blue ">
                                                           查看
                                                        </a>
                                                        <!--  <a href="javascript:;" onclick="operationFun('updateEmp','${emp.empUuid}','${emp.loginId}')" class="blue">
                                                           修改
                                                        </a>
                                                        <a href="javascript:;" onclick="deleteEmp('${emp.empUuid}')" class="blue">
                                                           删除
                                                        </a>
                                                        <a href="javascript:;" onclick="operationFun('updatePwd','${emp.loginId}')" class="blue">
                                                           修改密码
                                                        </a>-->
                                                        
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
    function myResetForm(){
   	 $("#deptUuid").val('');
	 $("#deptUuid").trigger("chosen:updated");
	}
        $('.chosen-select').chosen({});
        function operationFun(obj,obj1,obj2){
        	var url="";
        	if(obj=='addEmpNext'){
        		url = "/employee/toAddEmpNext.do?orgUuid="+
        				obj1+("${deptUuid}"==""?"":"&deptUuid=${deptUuid}");
        	}else if(obj=='viewEmp'){
        		url = "/employee/get.do?empUuid="+obj1;
        	}else if(obj =='updateEmp'){
        		url = "/employee/edit.do?empUuid="+obj1+"&empNo="+obj2;
        	}else if(obj =='updatePwd'){
        		url = "/employee/toUpdatePassword.do?loginId="+obj1+"&orgUuid=${orgUuid}";
        	}
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
        
        function deleteEmp(obj){
        	if(confirm("确认要删除？")){
    	    	$.ajax({
    	    		type:'post',
    	    		url:"/employee/del.do",
    	    		data:'empUuid='+obj,
    	    		async:false,
    	    		success:function(data){
    					data = eval("(" + data + ")")
    					if(data.message=='ok'){
    						alert('删除成功')
    						location.reload();
    					}else{
    						alert(data.message)
    					}
    	    		},
    	    		error:function(){
    	    			alert('数据提交失败');
    	    		}
    	    	});
        	}
        }
</script>
</body>
</html>











