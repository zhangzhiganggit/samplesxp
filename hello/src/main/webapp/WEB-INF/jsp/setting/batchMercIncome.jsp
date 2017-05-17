<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../layout/common.css.jsp"%>

</head>
<body class="no-skin ">
	<div class="main-content ">
		<div class="main-content-inner ">

			<div class="page-content ">

				<div class="row">

					<div class=" widget-container-col ui-sortable">
						<div class="widget-box widget-color-normal3">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									<i class="ace-icon fa fa-table">批量新增商户</i> 
								</h5>
							</div>

							<div class="widget-body">
								<div class="widget-main no-padding ">
									<div class="widget-main ">
										<form id="deviceForm" action="/batchIncome/batchIncome.do" method="post"  class="form-inline form-horizontal" enctype="multipart/form-data">
											<input style="display: none;" type="text" id="excelName"  name="excelName"/>
											<div class=" col-xs-12">
												<!-- <div class="form-group form-group-sm width-300px">
													<label
														class="col-sm-4 control-label widget-color-normal5 width-150px no-padding-left">上传文件<span
														class="red">*</span>:</label>
													<div class="col-sm-8  no-padding">
														<input type="text" name="excelName"
															id="excelName" disabled="disabled"
															class="form-control input-small width-200px "
															data-placement="bottom" >
														<button class="btn-default" type="button"
															onclick="fileClick()">
														<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110">导入</span></button>
													</div>
												</div> -->
<!-- 												<div class="form-group form-group-sm width-300px"> -->
<!-- 													<label -->
<!-- 														class="col-sm-4 control-label widget-color-normal5 width-150px no-padding-left">用户名<span -->
<!-- 														class="red">*</span>:</label> -->
<!-- 													<div class="col-sm-8  no-padding"> -->
<!-- 														<input type="text" name="loginName" -->
<!-- 															id="loginName" -->
<!-- 															class="form-control input-small width-200px " -->
<!-- 															data-placement="bottom" > -->
<!-- 													</div> -->
<!-- 												</div> -->
												<div class="form-group form-group-sm width-300px">
                                                     <label  class="col-sm-4 control-label widget-color-normal5 width-150px no-padding-left"  >所属机构<span 
                                                     		 class="red">*</span>:</label>
                                                     <div class="col-sm-8  no-padding"  >
                                                         <select data-placeholder="请选择" name="orgNo" id="form-field-select-3" class="chosen-select form-control width-200px">
                                                         	<option value="">请选择</option>
<%--                                                             	<c:forEach var="org" items="${orgList}"> --%>
<%--                                                             		<option value="${org.ORG_UUID }">${org.ORG_NM}</option> --%>
<%--                                                             	</c:forEach> --%>
                                                         </select>
                                                     </div>
                                                 </div>
                                                 <div class=" col-xs-12">
	                                                    <h3 class="header smaller lighter green">选择Excel导入</h3>
	                                                    <div class="form-group col-sm-4 ">
	                                                        <label class="ace-file-input ace-file-multiple widget-main" style="height:200px">
	                                                            <input type="file" name="uploadFile" id="uploadFile" class="id-input-file" onchange="copyName()" >
	                                                        </label>
	                                                    </div>
	                                              </div>
											</div>

											<div class="row"></div>
											<div class="form-actions center widget-color-normal5">
												<button class="btn btn-danger btn-sm" id="submitBtn" type="submit" onclick="return checkForm()">
													<span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
													确定
												</button>
												<a class="btn btn-primary btn-sm" href="/batchIncome/downloadExcel.do" >
													<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
													下载模板
												</a>
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
</body>
<%@include file="../layout/common.alljs.jsp"%>
<script type="text/javascript">
	function copyName(){
		$("#excelName").val($("#uploadFile").val());
	}
	$('.chosen-select').chosen({});
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
	fillStarterAttrOrgSelect('orgNo');
	function fillStarterAttrOrgSelect(inputName,attrOrgNo){
		$.ajax({
	        url: '/commonUtils/getTopOrgList',
	        async:true,
	        cache: true,
	        success : function(orgList) {
	       	 	if(orgList != null && orgList !=undefined){
		       		 var options = "<option value=''>请选择</option>";
		             for(var i=0;i<orgList.length;i++){
		            	 if(attrOrgNo != ''){
		            		 if(orgList[i].ORG_UUID == attrOrgNo){
		            			 options+="<option selected='selected' value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
		            		 }else{
		            			 options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
		            		 }
		            	 }else{
		            		 options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
		            	 }
		             }
		             $("[name='"+inputName+"']").html(options);
		             $("[name='"+inputName+"']").trigger("chosen:updated");
	       	 	}
	        }
		});
	}

	function checkForm(){
		//$("#submitBtn").attr("disabled",true); 
		var excelName = $("#excelName").val();
		var orgNo = $("[name='orgNo']").val();
		var loginName = $("#loginName").val();
		if(!excelName){
			alert("上传文件不可为空");
			//$("#submitBtn").attr("disabled",false);
			return false;
		}
		if(!orgNo){
			$("#submitBtn").attr("disabled",true);
			alert("机构编号不可为空");
			$("#submitBtn").attr("disabled",false);
			return false;
		}
		return true;
	}
</script>
</html>