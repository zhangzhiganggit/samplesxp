<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<style type="text/css">
a:hover {
	background-color: transparent;
	text-decoration: underline;
}
</style>
<%@include file="../layout/common.css.jsp"%>

</head>

<body class="no-skin ">

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger">
										<i class="ace-icon fa fa-table"></i> 操作结果
									</h5>
								</div>
								<div class="widget-body">
									<h3 class="smaller lighter green inline">
										&nbsp;&nbsp;操作结果
										<c:if test="${success }">成功<font color="blue" size="+2""></font></c:if>
										<c:if test="${!success }">失败<font color="red" size="+2"></font></c:if>
										&nbsp;&nbsp;
									</h3>
									<h3 class="smaller lighter green inline">&nbsp;&nbsp;${message}&nbsp;&nbsp;</h3>
									<label style="font-size: 15px; color: green;"><a
										id='abc' id="returnLink">&nbsp;&nbsp;点此处继续${returnPageName}</a></label>
								</div>
								<br /> <br />
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->
	<c:if test="${isToErrorPage != 'true'}">
		<%@include file="../layout/common.alljs.jsp"%>
	</c:if>
</body>
<script type="text/javascript">
	jQuery(function($) {
		$('#abc').bind('click',${operation} );
	});
	


	function close() {
		window.parent.$.fancybox.close();
	}

	function closeAndReturn() {
		close();
		parent.location.reload();
		// window.location.href='${returnUrl}'
	}
	
	function back(){
		history.go(-1);history.go(0)
		location.reload(); 
	}
	
</script>
</html>











