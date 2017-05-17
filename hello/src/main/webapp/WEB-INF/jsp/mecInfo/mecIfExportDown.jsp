<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../layout/common.jsp"%>
	<script type="text/javascript">
	function exportDown(){
		
		var dateStart=$("#dateStart").val();
		var dateEnd=$("#dateEnd").val();
		var b = dateEnd.split("-");
   	   	var c = dateStart.split("-");
   	   	var endTime = new Date(b[0], b[1]-1, b[2]);
   	   	var startTime=new Date(c[0], c[1]-1, c[2]);
   	   	var dt = (endTime-startTime)/(1000*60*60*24);
   	   	if(dt>90-1){
   		 	alert("时间段不能超过90天");
   		 	return;
   	   	}
		location.href='<%=request.getContextPath()%>/mecIf/exportDown.do?dateStart='+dateStart+'&dateEnd='+dateEnd;
	}
	</script>
</head>
<body class="no-skin ">
	<div class="main-container" id="main-container">
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>商户信息导出 
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
											<form  class="form-inline form-horizontal" >
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">创建时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="dateStart" name="dateStart"  class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" id="dateEnd" name="dateEnd" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
												</div>
												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
					                            	<button class="btn btn-danger btn-sm" type="button" onclick="exportDown();">
													<span
														class="ace-icon fa fa-search icon-on-right bigger-110"></span>
													导出
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
		</div>
		<!-- /.main-content -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<%@include file="../layout/common.js.jsp"%>
	<!-- inline scripts related to this page -->
	
</body>



</html>











