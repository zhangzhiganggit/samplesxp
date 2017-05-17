<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../../layout/common.jsp"%>

<script src="<%=request.getContextPath()%>/js/common/common.js"></script>
<link href="../../../../css/css/froala_editor.min.css" rel="stylesheet"
	type="text/css">
</head>

<body class="no-skin ">
	<div class="main-container" id="main-container">
		<script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

		<div class="main-content ">
			<div class="main-content-inner ">

				<div class="page-content ">

					<div class="row">


						<div class=" widget-container-col ui-sortable  ">
							
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 限制版本号详情
									</h5>


								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="list-div" id="listDiv">
											<form id="searchForm"  method="post"
												action="">	
												 <input type="hidden" id="chk" name="chk" >	
												 <input type="hidden" id="type" name="type" >											
												<table style="width: 100%">
													<tr>
														<td width="5%"></td>
														<td>
														 <div class="form-group form-group-sm width-300px">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span
																	style="color: red">*</span>限制版本号:</label>
																<div class="col-sm-8  no-padding">
																	<div class="col-sm-8  no-padding">
																		     <table  style="width:500px;cellspacing:10px;border-collapse:separate; border-spacing:10px;">
																		        <tr>
																		          <td><input type="checkbox" class="ace " id="chk1" value="${deviceLimit.allchk}" 
																				          <c:if test="${deviceLimit.allchk=='11'}">
							                                                           		 checked="checked"
							                                                              </c:if> >
																		              <span class="lbl middle"></span></td>
																		          <td><span class="lbl middle">所有版本</span></td>
																		          <td></td>
																		        </tr>
																		        <tr>
																		          <td><input type="checkbox" class="ace " id="chk2" value="${deviceLimit.achk}" 
																		                <c:if test="${deviceLimit.achk=='12'}">
							                                                           		 checked="checked"
							                                                              </c:if> >
																		              <span class="lbl middle"></span></td>
																		          <td><span class="lbl middle">应用版本号高于</span></td>
																		          <td><input type="text" class="form-control input-small " id="aValue" name="aValue" style="width:80px" value="${deviceLimit.aValue }" readonly="readonly"></td>
																		        </tr>
																		        <tr>
																		          <td><input type="checkbox" class="ace " id="chk3" value="${deviceLimit.bchk}" 
																		               <c:if test="${deviceLimit.bchk=='13'}">
							                                                           		 checked="checked"
							                                                              </c:if>>
																		              <span class="lbl middle"></span></td>
																		          <td><span class="lbl middle">应用版本号低于</span></td>
																		          <td><input type="text" class="form-control input-small " id="bValue" name="bValue" style="width:80px" value="${deviceLimit.bValue }" readonly="readonly"></td>
																		        </tr>
																		        <tr>
																		          <td><input type="checkbox" class="ace " id="chk4" value="${deviceLimit.bchk}" 
																		                <c:if test="${deviceLimit.cchk=='14'}">
							                                                           		 checked="checked"
							                                                              </c:if>>
																		              <span class="lbl middle"></span></td>
																		          <td><span class="lbl middle">特定版本号:</span></td>
																		          <td><input type="text" class="form-control input-small " id="cValue" name="cValue" style="width:200px" value="${deviceLimit.cValue }" readonly="readonly"></td>
																		        </tr>
																		        
																		     </table>
																	</div>
																</div>
															</div>
															
														</td>
													</tr>
												</table>
												<script src="../../../../js/js/libs/jquery-1.11.1.min.js"></script>
												<script src="../../../../js/js/froala_editor.min.js"></script>
												<script src="../../../../js/js/plugins/lists.min.js"></script>
												<script src="../../../../js/js/plugins/colors.min.js"></script>
												<script src="../../../../js/js/plugins/font_size.min.js"></script>
												<script src="../../../../js/jquery.form.js"></script>
												<script>
											     	$(function(){
											          	$('#edit').editable({inlineMode: false, alwaysBlank: true})
											      	});
											  	</script>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWin()">
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

		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->
	<%@include file="../../layout/common.js.jsp"%>

	<script type="text/javascript">
			$("input[type='checkbox']").click( 
			function(){ 
			this.checked = !this.checked; 
			} 
			); 
			
	function closeWin(){
	//	window.parent.$.fancybox.close();
		parent.$.fancybox.close();
    }  
	</script>

</body>
</html>











