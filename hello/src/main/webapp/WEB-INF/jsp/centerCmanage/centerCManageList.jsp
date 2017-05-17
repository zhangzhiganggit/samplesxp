<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
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
                                        审单人员管理查询条件
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form class="form-inline form-horizontal" action="list.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >审单员名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="empNm" name="empNm" value="${employee.empNm }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >审单员账号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="loginId" name="loginId" value="${employee.loginId}" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                   	  								<div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >审单员状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="empSts"   id="empSts" class="chosen-select form-control width-200px">
                                                            	<option value="" >全部</option>
                                                            	<option value="0" <c:if test="${employee.empSts==0 }">selected</c:if>>离职</option>
                                                            	<option value="1" <c:if test="${employee.empSts==1 }">selected</c:if>>正常</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    查询
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="resetMecForm()">
<!--                                                     <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span> -->
                                                    重置
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="getEmpList()">
<!--                                                     <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span> -->
                                                    离职
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
                                        审单人员管理查询结果
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                             <tr>
                                                <th style="text-align: center;width: 5%">
                                                	<input type="checkbox" class="ace "  id="ckAll" name="ckAll">
			                                       <span class="lbl middle">全选</span>
                                                </th>
                                                <th style="text-align: center;width: 10%">审单员名称</th>
                                                <th style="text-align: center;width: 10%"> 审单员账号 </th>
                                                <th style="text-align: center;width: 10%">邮箱</th>
                                                <th style="text-align: center;width: 10%">手机号</th>
                                                <th style="text-align: center;width: 15%">修改时间</th>
                                                <th style="text-align: center;width: 10%">状态</th>
                                                <th style="text-align: center;width: 20%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	   <c:forEach items="${employeeList}" var="de"  varStatus="status">
													<tr>
														<td style="text-align: center;"> 
															<input type="checkbox" class="ace abc" value="${de.empNo }" id="changedEmp" name="changedEmp">
							                                 <span class="lbl middle"></span>
														</td>
														<td style="text-align: center;">${de.empNm }</td>
														<td style="text-align: center;">${de.loginId }</td>
														<td style="text-align: center;">${de.mail }</td>
														<td style="text-align: center;">${de.mbNo }</td>
														<td style="text-align: center;"><fmt:formatDate value="${de.lastUpdated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
														<td style="text-align: center;">
														<c:if test="${de.empSts==0}">离职</c:if><c:if test="${de.empSts==1}">正常</c:if>
														</td>
														<td style="text-align: left;">
															<a href="javascript:;" onclick="operationFun('updateEmp','${de.empNo}')" class="blue ">使用人维护</a> &nbsp;&nbsp;
															<a href="javascript:;" onclick="operationFun('updatePwd','${de.empNo}')" class="blue ">重置密码</a>&nbsp;&nbsp;
															<a href="javascript:;" onclick="operationFun('viewEmpChange','${de.empNo}')" class="blue ">查看维护记录</a>
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
    <%@include file="../layout/common.js.jsp"%>
   
    <script type="text/javascript">
     $("#ckAll").click(function() {
        $("input[name='changedEmp']").prop("checked", this.checked);
      });
      
      $("input[name='changedEmp']").click(function() {
    	    var $subs = $("input[name='changedEmp']");
    	    $("#ckAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
      });
      
      function getEmpList(){
    	  var id = "";
    	  var flag = false;
    	  $("input[name='changedEmp']:checkbox:checked").each(function(){
    		  id = id + ","+$(this).val();
    		  flag =true ;
    	  })
    	  if(flag){
    		  updateEmpSts(id.substr(1));
    	  }else{
    		  alert("至少勾选一条记录")
    	  }
    	  
      }
      
       function updateEmpSts(id){
    	 $.ajax({
	        url:'/centerCManage/updateEmpSts.do',
			data : {
        			empNos : id
        		    },
        	cache: true,
			async : false,
			success : function(data) {
				data = eval("(" + data + ")")
				alert(data.message);
				if (data.result == 1) {
					window.location.reload();
				}
			}
		});
      }
     
       function operationFun(obj,obj1){
    	var url="";
    	if(obj=='viewEmpChange'){//查看信息维护记录
    		url = "/centerCManage/changeHistory.do?targetUuid="+obj1;
    	}else if(obj =='updateEmp'){//信息维护
    		url = "/centerCManage/edit.do?empNo="+obj1;
    	}else if(obj =='updatePwd'){//重置密码
    		url = "/centerCManage/toUpdatePassword.do?empNo="+obj1;
    	}
    	$.fancybox.open({
			href : url,
			type: 'iframe',
	        padding: 4,
	        scrolling: 'no',
	        fitToView: true,
	        autoWidth:true,
	        height: 600,
	        autoSize: false,
	        closeClick: false
		});
    }
    function resetMecForm(){
    	 $(':input','#searchForm')  
    	 .not(':button, :submit, :reset, :hidden')  
    	 .val('')  
    	 .removeAttr('checked')  
    	 .removeAttr('selected'); 
    	 $("#empSts").val('');
 		 $("#empSts").trigger("chosen:updated");
 		 $("#empNm").val('');
		 $("#empNm").trigger("chosen:updated");
		 $("#loginId").val('');
 		 $("#loginId").trigger("chosen:updated");
     }
	</script>
</body>
</html>











