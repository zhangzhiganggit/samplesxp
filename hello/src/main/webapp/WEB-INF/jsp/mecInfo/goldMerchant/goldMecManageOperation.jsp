<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
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
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>
										<%-- <c:if test="${entry=='one' }">操作</c:if> --%>
										<c:if test="${entry=='all' }">批量操作导入（一次导入数据不能超过1000条）</c:if>
									</h5>
								</div>
										<div class="widget-main " style="padding-left: 20px" >
											<form id="searchForm"  class="form-inline form-horizontal" 
											action="changeSts?listMno=${listMno}&listCpr_reg_nm_cn=${listCpr_reg_nm_cn}&listStl_sts=${listStl_sts}&listDt_cte_start=${listDt_cte_start}&listDt_cte_end=${listDt_cte_end}&listFirstNm=${listFirstNm}" 
											method="post" enctype ="multipart/form-data">
												<input hidden='hidden' id='uuid' name='uuid' value='${uuid}'>
												<input hidden='hidden' id='mno' name='mno' value='${mno}'>
												<input hidden="hidden" id="enter" name="enter" value="${entry}"/>
												<input hidden="hidden" id="max" name="max" value=""/>
												<input hidden="hidden" id="count" name="count" value=""/>
												<!-- <input hidden="hidden" id="sts" name="sts"/> -->
												<!-- <input hidden="hidden" id="finals" name="finals" value=""/> -->
												
												<div class="form-group form-group-sm" style="width: 500px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:<span class="red">*</span></label>
															
														<div class="col-sm-8  no-padding">
															<select name="orgNm" onchange="validateIsOK()"
																id="orgNm"
																class="chosen-select form-control" style="width: 120px">
																<c:if test="${orgList != null }">
																	<option value=""></option>
																	<c:forEach items="${orgList }" var="org">
																		<option value="${org.orgUuid }">${org.orgNm }</option>
																	</c:forEach>
																</c:if>
																<c:if test="${org != null }">
																	<option value=""></option>
																	<option value="${orgNo }">${org }</option>
																</c:if>
															</select>
														</div>
													</div>
												
													<div class="form-group form-group-sm" style="width: 500px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态:</label>
														<div class="col-sm-8  no-padding">
															<select class="chosen-select form-control" data-placeholder="请选择" style="width: 150px" 
															name="stl_sts" id="stl_sts" onchange="validateIsOK()">
																<!-- <option value="01">开通</option> -->
																<option value="02">关闭</option>
															</select>
														<a style="text-decoration: underline;" href="<%=request.getContextPath()%>/goldMerchant/excelDown">下载导入模板</a>
														</div>
													</div>
													
												<div class="form-group form-group-sm width-300px">
													<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">上传文件:</label>
													<div style="float: left;">
														<input type="file" id="excelFile" name="file" id="id-input-file-3" class="id-input-file">
														<font color="red"  style="float: left; ">上传的excel文件商编必须为文本格式</font>
													</div>
												</div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger  btn-sm" type="submit" onclick="return save()" id="sub" disabled="disabled">
														<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
														确定
													</button>
													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWindow();">
														<span
															class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
														取消
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
	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
	</div>
	<%@include file="../../layout/common.js.jsp"%>
	<script type="text/javascript">
		$('.chosen-select').chosen({});
		function save() {
			var sureButton=$("#sure").val();
			if(sureButton==null){
				$("button[type='submit']").attr("id","sure");
			}else{
				return false;
			}
			var orgNm = $("#orgNm").val();
			if(orgNm == "" || orgNm == null){
				$("button[type='submit']").removeAttr("id");
				alert("请选择归属分公司");
				return false;
			}
			var excelFile = $("#excelFile").val();
			if (excelFile == "" || excelFile == null) {
				$("button[type='submit']").removeAttr("id");
				alert("请选择一个上传文件");
				return false;
			}
			if(excelFile.indexOf(".xlsx") < 0 ){
				$("button[type='submit']").removeAttr("id");
				alert("上传文件类型有误");
				return false;
			}
			return true;
		}

		$('.id-input-file').ace_file_input({
			style : 'well',
			btn_choose : '请上传Excel文件！',
			btn_change : null,
			no_icon : 'ace-icon fa fa-cloud-upload',
			droppable : true,
			height : 300,
			thumbnail : 'large',
			preview_error : function(filename, error_code) {

			}
		}).on('change', function() {
		});

		function getLen(obj) {
			var char = obj.replace(/[^\x00-\xff]/g, '**');
			return char.length;
		}
		
		function closeWindow(){
			window.parent.$.fancybox.close();
		}
		
	/* function validateis(){
		var finals = $("#finals").val();
		var sts = $("#stl_sts").val();
		var flag = $("#sts").val();
		if(finals){
			$("#sub").attr("disabled", true);
		}else{
			if(flag && sts == '02'){
				$("#sub").attr("disabled", false);
			}
		}
	}  */
		
		//校验金牌用户占比情况
		function validateIsOK() {
			$("#sub").attr("disabled", true);
			$("#appendhtml").remove();
			var selected = $('#orgNm option:selected').val();//选中的值
			var stl_sts = $("#stl_sts").val();
			$.ajax({
				type : "POST",
				url : "<%=request.getContextPath()%>/goldMerchant/validateProportion",
				dataType : "json",
				data : {"orgUuid":selected,"stl_sts":stl_sts},
				async : false,
				success : function(resultMap){
					<%-- if(resultMap.flag){
						$("#count").val(resultMap.count);
						$("#max").val(resultMap.max);
						var html = "<span id='appendhtml'><B>金牌产品标准占比："+resultMap.standard +"%</B> <font style='color: red'>当前占比:"+resultMap.nowShare +"%</font></span>"
						$("#orgNm").parent().append(html);
						$("#sub").attr("disabled", false);
					}else if(!resultMap.flag && resultMap.isHave == 'NO'){
						alert("分公司不存在,该分公司商户暂时无法开通此产品!");
						parent.location.href="<%=request.getContextPath()%>/goldMerchant/goldMerchantList.do?flag=true";
						$("#sub").attr("disabled", true);
						$("#finals").val(true);
					}else{
						alert("该分公司商户暂时无法开通此产品!");
						if($("#stl_sts").val() == '02'){
							$("#sub").attr("disabled", false);
						}else{
							$("#sub").attr("disabled", true);
						}
						/* $("#sts").val(true) */
					} --%>
					if(!resultMap.isHave){//分公司存在
						if(resultMap.flag && resultMap.flag1){
							$("#count").val(resultMap.count);
							$("#max").val(resultMap.max);
							var html = "<span id='appendhtml'><B>金牌产品标准占比："+resultMap.standard +"%</B> <font style='color: red'>当前占比:"+resultMap.nowShare +"%</font></span>"
							$("#orgNm").parent().append(html);
							$("#sub").attr("disabled", false);
						}else{
							alert("该分公司商户暂时无法开通此产品!");
							$("#sub").attr("disabled", true);
						}
					}else{
						alert("该分公司商户暂时无法开通此产品!");
						<%-- parent.location.href="<%=request.getContextPath()%>/goldMerchant/goldMerchantList.do?flag=true"; --%>
						/* $("#sub").attr("disabled", true); */
					}
				}
			});
		} 
		
		
	</script>
</body>
</html>











