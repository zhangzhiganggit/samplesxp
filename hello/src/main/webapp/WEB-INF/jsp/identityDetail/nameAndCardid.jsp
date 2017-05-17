<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../layout/common.jsp"%>
<script type="text/javascript">
function Verification(){
	var name=$("#name").val();
	var cardId=$("#cardId").val();
	if((name==null || name=='')||(cardId==null || cardId=='')){
		alert("姓名和身份证号不得为空");
		return;
	}
	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
    if(reg.test(cardId) === false){  
        alert("身份证号码不合法");  
       // $("#checkIdCard").linkbutton('enable');
        return false;  
 	}
	
	var url = '<%=request.getContextPath() %>/identityDetail/NameAndCardid?name='+name+'&cardId='+cardId+'&source='+2;
    url =  encodeURI(url);
    url =  encodeURI(url);
    /**弹出校验结果*/
    $.fancybox.open({
 			href : url,
 			type: 'iframe',
             padding: 5,
             scrolling: 'no',
             width: $(window).width() * 0.6,
             centerOnScroll:true,
             autoSize: true,
             helpers:{
             	overlay:{
             		closeClick:false
             	}
             }
    });
	
}
</script>

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

						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 
					身份证验证							</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<div  class="form-inline form-horizontal" >
												
												<div class=" col-xs-12">
													
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">姓名<span
															class="red">*</span>:
														</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="namn" id="name"
																maxlength="20" 
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证号<span
															class="red">*</span>:
														</label>

														<div class="col-sm-8  no-padding">
															<input type="cardId" name="cardId" id="cardId"
																maxlength="20" 
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
												</div>

												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="submit" onclick="Verification();">校验
													</button>
												</div>
											</div>

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











