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
	var bankId=$("#bankId").val();
	var phoneId=$('#phoneId').val();
	if((name==null || name=='')||(cardId==null || cardId=='')||(bankId==null || bankId=='')){
		//alert("校验信息不能为空");
		//return;
	}
	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
    if(reg.test(cardId) === false){  
       //alert("身份证号码不合法");  
      // $("#checkIdCard").linkbutton('enable');
      // return false;  
	}

	var url = '<%=request.getContextPath() %>/identityDetailFour/nameAndCardidFour.do?name='+name+'&cardId='+cardId+'&bankId='+bankId+'&phoneId='+phoneId+'&source='+2;
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
															<input type="text" name="cardId" id="cardId"
																maxlength="20" 
																class="form-control input-small width-200px "
																data-placement="bottom" title="身份证号">
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">银行卡号<span
															class="red">*</span>:
														</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="bankId" id="bankId"
																maxlength="26" 
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">手机号:
														</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="phoneId" id="phoneId"
																maxlength="11" 
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													
												</div>

												<div class="row"></div>
												 <c:if test="${loginUserPermission.SMSA_FOUR_ELEMENT_002!=null }">
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="submit" onclick="Verification();">四要素校验
													</button>
												</div>
												</c:if>
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
		<form id="deviceForm" action="/identityDetailFour/batchIncome.do" method="post"  class="form-inline form-horizontal" enctype="multipart/form-data">
			<input style="display: none;" type="text" id="excelName"  name="excelName"/>
		    <div class=" col-xs-12">
				<h3 class="header smaller lighter green">选择Excel导入</h3>
					<div class="form-group col-sm-4 ">
						<label class="ace-file-input ace-file-multiple widget-main" style="height:200px">
							<input type="file" name="uploadFile" id="uploadFile" class="id-input-file" onchange="copyName()" >
	                    </label>
	                </div>
	        </div>
			<div class="row"></div>
			<div class="form-actions center widget-color-normal5">
			<c:if test="${loginUserPermission.SMSA_FOUR_ELEMENT_003!=null }">
				<button class="btn btn-danger btn-sm" id="submitBtn" type="button" onclick="checkForm()">
				<span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
					批量校验
				</button>
			</c:if>
			<c:if test="${loginUserPermission.SMSA_FOUR_ELEMENT_004!=null }">
				<a class="btn btn-primary btn-sm" href="/identityDetailFour/downloadExcel.do" >
					<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
						下载模板
				</a>
			</c:if>	
			</div>
		</form>

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<%@include file="../layout/common.js.jsp"%>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		function copyName(){
			$("#excelName").val($("#uploadFile").val());
		}
		$('.id-input-file').ace_file_input({
		    style:'well',
		    btn_choose:'请上传Excel文件！',
		    btn_change:null,
		    /* allowExt : ['xlxs','xls'], */
		    no_icon:'ace-icon fa fa-cloud-upload',
		    droppable:true,
		    height:300,
		    thumbnail:'large',
		    preview_error : function(filename, error_code) {
		    }
		}).on('change', function(){
		    //console.log($(this).data('ace_input_files'));
		    //console.log($(this).data('ace_input_method'));
		});
		
		function checkForm(){
			var excelName = $("#excelName").val();
			if(!excelName){
				alert("上传文件不可为空");
				$("#submitBtn").attr("disabled",false);
				return false;
			}
			$('#submitBtn').attr('disabled',"true");
			document.getElementById("deviceForm").submit();
		}
		
	
	</script>
</body>
</html>











