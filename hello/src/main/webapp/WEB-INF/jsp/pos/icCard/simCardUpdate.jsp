<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../../layout/common.jsp"%>
<script type="text/javascript">
function getLen(obj){
	var char = obj.replace(/[^\x00-\xff]/g, '**');
    return char.length;
}
function save()
{   
	var factSn=$("#factSn").val();
	var imsi=$("#imsi").val();
	var status=$("#status").val();
	var useDate=$("#useDate").val();
	var actDate=$("#actDate").val();
	var factId=$("#factId").val();
	var telNum=$("#telNum").val();
	var operSeat=$("#operSeat").val();
	
	var payStatus=$("#payStatus").val();
	var oldUseDate=$("#oldUseDate").val();
	if(useDate!=oldUseDate){
		if(payStatus!=11){
			 alert("该SIM卡不是已充值状态，不能修改卡有效期");
			 document.getElementById("useDate").value =oldUseDate;
			 return false;
		 }
	}
	if(getLen(operSeat)>20){
  		 alert("归属地最多为10个汉字，请检查");
  		 return false;
  	 }
	$.ajax({
	   	    	cache: true,
	   	        type: "POST",
	   	        url:"<%=request.getContextPath()%>/SimCard/updateSave?factSn="+factSn+"&imsi="+imsi+"&status="+status+"&useDate="+useDate+"&actDate="+actDate+"&factId="+factId+"&telNum="+telNum+"&operSeat="+operSeat,
	   	        dataType : "json",
				async : false,
				error : function(data) {
					alert("提交失败");
				},
				success : function(data) {
					var resCode = data.resCode;
					alert(data.resMsg);
					parent.$.fancybox.close();
					window.parent.location.reload();
				}
			});
	return true;
}

function closewin(){
	parent.$.fancybox.close();
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
										<i class="ace-icon fa fa-table"></i>修改SIM卡信息
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="submitForm" action=""
												class="form-inline form-horizontal" method="post">
												<input type="hidden" id="payStatus" name="payStatus" value="${simCard.payStatus }">
												<input type="hidden" id="oldUseDate" name="oldUseDate" value="${simCard.useDate }">
												<input type="hidden" id="factId" name="factId" value="${simCard.factId }">
												<input type="hidden" id="factSn" name="factSn" value="${simCard.factSn }">
												
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-3 control-label  widget-color-normal5 width-100px ">卡号:</label>
														<div class="col-sm-5 no-padding">
															<label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${simCard.factSn}</label>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-3 control-label  widget-color-normal5 width-100px ">运营商:</label>
														<div class="col-sm-5 no-padding">
															<label class="form-control input-small width-200px   view-control  "
                                                                    data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover">
                                                                    <c:choose>
																	 <c:when test="${simCard.factId =='005'}">
																							中国移动
																	 </c:when>
																	 <c:when test="${simCard.factId =='006'}">
																							中国联通
																	 </c:when>
																	 <c:when test="${simCard.factId =='007'}">
																							中国电信
																	 </c:when>
																	</c:choose>
														   </label>
														</div>
													</div>
													</br>
													<div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >状态<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="status" name="status"  class="chosen-select form-control width-200px" >
																	<option value="10" <c:if test="${10==simCard.status}"> selected </c:if>>正常</option>
																	<option value="11" <c:if test="${11==simCard.status}"> selected </c:if>>暂停</option>
																	<option value="12" <c:if test="${12==simCard.status}"> selected </c:if>>注销</option>
																	
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
														<label class="col-sm-2 control-label  widget-color-normal5 width-100px">IMSI号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"  name="imsi"
																id="imsi" value="${simCard.imsi}" 
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过15个字符" onkeyup="this.value=this.value.replace(/[^+\d]/g,'')">
														</div>
													</div>
													</br>
													<div class="form-group form-group-sm width-300px a1">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">卡有效期<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="useDate" name="useDate" value="${simCard.useDate }"  class="input-small form-control" readonly>
															</div>
														</div>
											        </div>
											        <div class="form-group form-group-sm width-300px a1">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">激活日期<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="actDate" name="actDate" value="${simCard.actDate }"  class="input-small form-control" readonly>
															</div>
														</div>
											        </div>
													</br>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-2 control-label  widget-color-normal5 width-100px">手机号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"  name="telNum"
																id="telNum" value="${simCard.telNum}" 
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过13个数字">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-2 control-label  widget-color-normal5 width-100px">归属地:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"  name="operSeat"
																id="operSeat" value="${simCard.operSeat}" 
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过10个汉字" >
														</div>
													</div>
												</div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="button" name="savebtn" onclick="return save()" id="savebtn">
														<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														修改
													</button>
													<button type="button" class="btn btn-default btn-sm" onclick="javascript:closewin();">
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



		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<%@include file="../../layout/common.js.jsp"%>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">

    $('.main-content .chosen-select').chosen({});
		jQuery(function($) {
			$('#submitForm').formValidation({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
					
				},
				fields : {
				
	    	}
	    	})
			$('.input-daterange').datepicker({
				autoclose : true
			});
			
		});
		function changeDate(){
			 var payStatus=$("#payStatus").val();
			 var oldUseDate=$("#oldUseDate").val();
			 if(payStatus!=11){
				 alert("该SIM卡不是已充值状态，不能修改卡有效期");
				 document.getElementById("useDate").value =oldUseDate;
			 }
		 }	
	</script>
</body>
</html>

