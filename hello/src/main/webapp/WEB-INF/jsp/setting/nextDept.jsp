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
                                        直属部门
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


                                            <form class="form-inline form-horizontal" action="/dept/list.do?orgUuid=${orgUuid }" id="searchForm">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
                                                <div class=" col-xs-12">
                                                    <ul class="breadcrumb">
                                                        ${ceil }的直属部门
                                                    </ul><!-- /.breadcrumb -->


                                                    <hr>
                                                </div>

                                                <button class="btn btn-danger btn-sm" type="button" onclick="operationFun('addDept','${orgUuid}')">
                                                    <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                    添加部门
                                                </button>
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
                                                

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        直属部门查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table style="word-break:break-all; word-wrap:break-all; " class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="25%">  部门名称 </th>
                                                <th width="25%">创建时间</th>

                                                <th width="10%">直属人员数量</th>
                                                <th  >操作</th>
                                            </tr>
                                            </thead>
                                            <c:forEach items="${deptList }" var="dept">
                                            <tbody>
                                            <tr>

                                                <td> ${dept.deptNm } </td>
                                                <td align="center">${dept.dateCreatedStr }</td>
                                                <td align="right">${dept.empNum}</td>
                                                <td  >
                                                    <div class="   action-buttons">
                                                        <a class="blue" href='/employee/list.do?orgUuid=${orgUuid }&deptUuid=${dept.deptUuid}&isFirstLoad=true'>直属人员</a>
                                                        <a class="blue" href="javascript:;" onclick="operationFun('updateDept','${dept.deptUuid }')">修改</a>
                                                        <a class="blue" href="javascript:;" onclick="deleteDept('${dept.deptUuid }')">删除</a>
                                                        <a class="blue" href="javascript:;" onclick="operationFun('viewDept','${dept.deptUuid }')">详情</a>
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
function operationFun(obj,obj1){
	var url="";
	if(obj=='addDept'){
		url = "/dept/toAddDept.do?orgUuid="+obj1;
	}else if(obj=='updateDept'){
		url = "/dept/edit.do?deptUuid="+obj1;
	}else if(obj=='viewDept'){
		url = "/dept/get.do?deptUuid="+obj1;
	}
	$.fancybox.open({
		href : url,
		type: 'iframe',
        padding: 5,
        scrolling: 'no',
        fitToView: true,
        autoWidth:true,
        height: 320,
        autoSize: false,
        closeClick: false
	});
}

function deleteDept(obj){
	if(confirm("确认要删除？")){
    	$.ajax({
    		type:'post',
    		url:"/dept/del.do",
    		data:'deptUuid='+obj,
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











