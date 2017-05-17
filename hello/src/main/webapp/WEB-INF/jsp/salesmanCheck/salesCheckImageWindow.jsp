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
		#parent{ width: 2000px; height: 2000px;  position: relative; margin: 0 auto; background-color: #F4F4F4; }
		#imgDiv{ position: absolute; cursor: pointer; -webkit-box-shadow: 3px 3px 0px 3px #C7C7C7; box-shadow: 3px 3px 3px 0px #C7C7C7; }
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
						<input type="hidden" id="type" value="${type}">
						<button class="btn btn-sm" type="button" onclick="toRight()">
							<span class="ace-icon fa icon-on-right bigger-110"></span> 右旋
						</button>
						<button class="btn btn-sm" type="button" onclick="toLeft()">
							<span class="ace-icon fa icon-on-right bigger-110"></span> 左旋
						</button>
						<button class="btn btn-sm" type="button" onclick="toBig()">
							<span class="ace-icon fa icon-on-right bigger-110"></span> 放大
						</button>
						<button class="btn btn-sm" type="button" onclick="toSmall()">
							<span class="ace-icon fa icon-on-right bigger-110"></span> 缩小
						</button>
						
						<input hidden="hidden" id="uuid" value="${uuid }">
						<button class="btn btn-sm" type="button" onclick="change()">
							<span class="ace-icon fa icon-on-right bigger-110"></span> 切换图片
						</button>
						<div id='parent'>
							<div id="imgDiv" >
								<img class="img" id="idcardFront" alt="" src="<%=request.getContextPath()%>${idcardFront}"  <c:if test="${type !='idcardFront'}"> style = "display:none"</c:if>/>
								<img class="img" id="idcardBack" alt="" src="<%=request.getContextPath()%>${idcardBack}"  <c:if test="${type !='idcardBack'}">style = "display:none"</c:if>/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript" src="../../../js/jquery.rotate.min.js"></script>
	<script type="text/javascript" src="../../../js/drag.js"></script>
	
	<script type="text/javascript">
		$(function(){
		});
		
		function change() {
			var type = $("#type").val();
			if(type=='idcardFront'){
				$("#idcardFront").prop("style","display: none");
				$("#idcardBack").prop("style","display: block");
				$("#type").val('idcardBack');
			}else if(type=='idcardBack'){
				$("#idcardBack").prop("style","display: none");
				$("#idcardFront").prop("style","display: block");
				$("#type").val('idcardFront');
			}
		}

		function toBig() {
			var type = $("#type").val();
			var width = $("#"+ type).width();
			var height = $("#"+ type).height();
			width = width * 1.2;
			height = height * 1.2;
			$("#"+ type).css("width", width + "px");
			$("#"+ type).css("height", height + "px");
		}
		function toSmall() {
			var type = $("#type").val();
			var width = $("#"+ type).width();
			var height = $("#"+ type).height();
			width = width * 0.8;
			height = height * 0.8;
			if (width < 50 || height < 50) {
				return;
			}
			$("#"+ type).css("width", width + "px");
			$("#"+ type).css("height", height + "px");
		}
		
		var right=0;
		function toRight() {
			right = left;
			var type = $("#type").val();
			right += 90;
			$("#imgDiv").rotate({animateTo : right});
			left = right;
		}
		
		var left=0;
		function toLeft() {
			left = right;
			var type = $("#type").val();
			left -= 90;
			$("#imgDiv").rotate({animateTo : left});
			right = left;
		}
	</script>
</body>
</html>