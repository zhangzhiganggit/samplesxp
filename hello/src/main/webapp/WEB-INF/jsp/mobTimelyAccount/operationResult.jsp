<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付</title>

<%@include file="../common/taglib.jsp"%>
<%@include file="../layout/common.jsp"%>
</head>

<body class="no-skin " >


	<div class="main-container" id="main-container">
		<script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

		<div class="main-content ">
			<div class="main-content-inner ">

				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div>
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 操作结果
									</h5>
									<span class="widget-toolbar"> <a data-action="collapse"
										href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>

								</div>
                            <h3 class="smaller lighter green inline">&nbsp;&nbsp;${result}&nbsp;&nbsp;</h3>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../layout/common.js.jsp"%>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">

</script>
</body>
</html>