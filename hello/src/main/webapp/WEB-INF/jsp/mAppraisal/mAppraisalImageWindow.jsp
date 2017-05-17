<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../layout/common.jsp"%>
<style type="text/css">
		.suspend{
			top:20%; 
		}
		#imgDiv{
			background-color:white;
			text-align:center;
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
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>图片展示
									</h5>
								</div>
								
							</div>
						</div>
						<button class="btn btn-sm" type="button" onclick="clickImgFunction()">
							<span class="ace-icon fa icon-on-right bigger-110"></span> 旋转图片
						</button>
						<button class="btn btn-sm" type="button" onclick="toBig()">
							<span class="ace-icon fa icon-on-right bigger-110"></span> 放大
						</button>
						<button class="btn btn-sm" type="button" onclick="toSmall()">
							<span class="ace-icon fa icon-on-right bigger-110"></span> 缩小
						</button>
						<div id="imgDiv" >
							<img id="img" alt="" src="<%=request.getContextPath()%>${image}"  />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/mAppraisal/mAppraisal.js"></script>
	<script type="text/javascript" src="../../../js/jquery.rotate.min.js"></script>
	<script type="text/javascript">
	 	$(function(){
	 	});
	 	
	 	var value=0;
		function clickImgFunction() {
			value += 90;
			$("#imgDiv").rotate({
				animateTo : value
			});
		}
		function toBig(){
			var width= $("#img").width();
			var height= $("#img").height();
			width= width*1.2;
			height= height*1.2;
			$("#img").css("width",width+"px");
			$("#img").css("height",height+"px");
		}
		function toSmall(){
			var width= $("#img").width();
			var height= $("#img").height();
			width= width*0.8;
			height= height*0.8;
			if(width<50 || height<50){
				return;
			}
			$("#img").css("width",width+"px");
			$("#img").css("height",height+"px");
		}
	</script>
</body>
</html>