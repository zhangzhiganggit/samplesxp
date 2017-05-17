<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<%@include file="../layout/common.css.jsp"%>
<title>随行付 Admin</title>
<style type="text/css">
a:hover {
	background-color: transparent;
	text-decoration: underline;
}
</style>
</head>
<body class="no-skin ">
	<div class="main-container" id="main-container">
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<form action="${nextUrl }" method="post">
								<input type="hidden" id="uuid" name="uuid" value="${uuid }">
								<input type="hidden"  id="adverName" name="adverName" value="${adverName }">
								<input type="hidden"  id="adverUrl" name="adverUrl" value="${adverUrl }">
								<input type="hidden"  id="remark" name="remark" value="${remark }">
								<input type="hidden"  id="adverStatus" name="adverStatus" value="${adverStatus }">
									<input type="hidden"  id="imageAddr" name="imageAddr" value="${imageAddr }">
									<div class="widget-header">
										<h5 class="widget-title bigger">
											<i class="ace-icon fa fa-table"></i> 操作结果
										</h5>
									</div>
									<div class="widget-body">
										<h3 class="smaller lighter green inline">&nbsp;&nbsp;${message}&nbsp;&nbsp;</h3>
										<c:if test="${isHaveButton != 'false'}">
											<label style="font-size: 15px; color: green;"><a
												<c:if test="${goBack==true}"> onclick="javascript:window.history.go(-1);"</c:if>
												id="returnLink">&nbsp;&nbsp;点击立即返回${returnPageName}</a></label>
										</c:if>
										
										<c:if test="${isHaveButton1 != 'false'}">
											<label style="font-size: 15px; color: green;"><a 
												<c:if test="${goBack==true}"> onclick="tiaozhuan(3);"</c:if>
												id="returnLink">&nbsp;&nbsp;点击立即返回${returnPageName}</a></label>
										</c:if>
										
										<c:if test="${operation == 'flow' && level==1}">
											<label style="font-size: 15px; color: green;"><a 
												<c:if test="${goBack==true}"> onclick="tiaozhuan(1);"</c:if>
												id="returnLink">&nbsp;&nbsp;点击立即返回${returnPageName}</a></label>
										</c:if>
										<c:if test="${operation == 'flow' && level==2}">
											<label style="font-size: 15px; color: green;"><a 
												<c:if test="${goBack==true}"> onclick="tiaozhuan(2);"</c:if>
												id="returnLink">&nbsp;&nbsp;点击立即返回${returnPageName}</a></label>
										</c:if>
									</div>
									<c:if test="${hasNext eq 'true' }">
										<div class="form-actions center widget-color-normal5">
											<button class="btn btn-danger btn-sm" type="submit">
												<span
													class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
												下一步
											</button>
										</div>
									</c:if>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${isToErrorPage != 'true'}">
    	<%@include file="../layout/common.alljs.jsp"%>	
    </c:if>
    
</body>
<script type="text/javascript">

function tiaozhuan(id){
	  var uuid=$('#uuid').val();
	  var adverName=$('#adverName').val();
	  var adverUrl=$('#adverUrl').val();
	  var remark=$('#remark').val();
	  var adverStatus=$('#adverStatus').val();
	  var imageAddr=$('#imageAddr').val();
	  
	  if(id==1){
		  location.href='<%=request.getContextPath() %>/flow/advertisementAdd?uuid='+uuid+'&name='+adverName+'&url='+adverUrl+'&remark='+remark+'&status='+adverStatus+'&imageAddr='+imageAddr;
	  }
	 if(id==2){
		 location.href='<%=request.getContextPath() %>/flow/advertisementEdit?uuid='+uuid; 
	 }
	 if(id==3){
		 location.href='<%=request.getContextPath() %>/flow/advertisement?entry=1';
	 }
		
	
}

</script>
</html>











