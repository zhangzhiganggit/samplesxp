<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../../layout/common.jsp"%>
</head>

<body class="no-skin ">

	<div class="main-container" id="main-container">
		<div class="main-content ">
			<div class="main-content-inner ">

				<div class="page-content ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 
					金牌产品配置					</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
										<form  id="searchForm" class="form-inline form-horizontal" method="post">
											<div  class="form-inline form-horizontal" >
												<div class=" col-xs-12">
														<label style="width: 150px"
															class="col-sm-4 control-label widget-color-normal5 no-padding-left">关闭时长限制配置：<span
															class="red">*</span>
														</label>
														<div class="col-sm-8  no-padding ">
															金牌产品开通
															<input type="text" name="close" id="close" value="${close }" onkeyup="this.value=this.value.replace(/\D/g,'')"
																maxlength="20" style="width: 30px" 
																class="form-control input-small"
																data-placement="bottom" title="">
																天以内不能关闭产品(包含${close }天)
														</div>
													</div>
													<div class=" col-xs-12">
 														<label style="width: 150px"
															class="col-sm-4 control-label widget-color-normal5 no-padding-left">开通时长限制配置：<span
															class="red">*</span>
														</label>

														<div class="col-sm-8  no-padding">
														金牌产品关闭
															<input type="text" name="open" id="open" value="${open }" onkeyup="this.value=this.value.replace(/\D/g,'')"
																maxlength="20" style="width: 30px"
																class="form-control input-small "
																data-placement="bottom" title="">
																天以内不能开通产品(包含${open }天)
														</div>
												</div>

												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="submit" onclick="return saveConfig()">保存
													</button>
												</div>
											</div>
											</form>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<%@include file="../../layout/common.js.jsp"%>
<script type="text/javascript">
	function saveConfig(){
		/* var a='00123';
		alert(a.replace(/\b(0+)/gi,"")); */
		var open = $("#open").val().replace(/\b(0+)/gi,"");
		var close = $("#close").val().replace(/\b(0+)/gi,"");
		if(open == ''){
			open = "0";
		}
		if(close == ''){
			close = "0";
		}
		if(open == null || open.replace(/\s+/g,"") == ''){
			alert("开通时长限制配置不能为空！");
			return false;
		}
		if(close == null || close.replace(/\s+/g,"") == ''){
			alert("关闭时长限制配置不能为空！");
			return false;			
		}
		$.ajax({
			url:"saveGoldMecConfig",
			dataType:"json",
			type:"post",
			async : false,
			data:{"open":open,"close":close},
			success : function(resultMap){
				if(resultMap.result == 'success'){
					alert("保存成功！");
					window.location.href="<%=request.getContextPath()%>/goldMerchant/goldMecConfig";
				}
			}
		});
	}
</script>
</body>
</html>











