<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../../layout/common.jsp"%>

<script src="<%=request.getContextPath()%>/js/common/common.js"></script>
<link href="../../../../css/css/froala_editor.min.css" rel="stylesheet"
	type="text/css">
</head>

<body class="no-skin ">
	<div class="main-container" id="main-container">
		<script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

		<div class="main-content ">
			<div class="main-content-inner ">

				<div class="page-content ">

					<div class="row">


						<div class=" widget-container-col ui-sortable  ">
							
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 新增终端限制
									</h5>


								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="list-div" id="listDiv">
											<form id="searchForm"  method="post"
												action="<%=request.getContextPath()%>/deviceLimit/saveAdd.do">	
												 <input type="hidden" id="chk" name="chk" >	
												 <input type="hidden" id="type" name="type" >											
												<table style="width: 120%">
												
													<tr>
														<td width="5%"><br/><br/><br/></td>
														<td>
															<div class="form-group form-group-sm width-300px ">
		                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right"  ><span
																	style="color: red">*</span>厂商:</label>
		                                                        <div class="col-sm-8  no-padding"  >
		                                                           <select data-placeholder="请选择" id="factId" name="factId" onchange="changeFactId()"
		                                                              class="chosen-select form-control" style="width: 200px">
		                                                               <option value="">全部</option>
																		<c:if test="${!empty manuFactoryList }">
																			<c:forEach items="${manuFactoryList}" var="item">
																				<option value="${item.factId}"
																				<c:if test="${item.factId==deviceLimit.factId}"> selected </c:if>>${item.factShortname}</option>									
																		    </c:forEach>
																		</c:if>
		                                                            </select>
		                                                         </div>
                                                            </div>
														</td>
													</tr>
													<tr>
														<td width="5%"></td>
														<td>
															<div class="form-group form-group-sm width-300px ">
		                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right"  ><span
																	style="color: red">*</span>型号:</label>
		                                                        <div class="col-sm-8  no-padding"  >
		                                                            <select data-placeholder="请选择" id="modId" name="modId" 
		                                                              class="chosen-select form-control " style="width: 200px">
		                                                               <option value="">全部</option>
																		<c:if test="${!empty adList }">
																			<c:forEach items="${adList}" var="item">
																			    <option value="${item.modId}"
																				<c:if test="${item.modId==deviceLimit.modId}"> selected </c:if>>${item.modNm}</option>
																			</c:forEach>
																		</c:if>
		                                                            </select>
		                                                        </div>
                                                            </div>
														</td>
													</tr>
													<tr>
														<td width="5%"></td>
														<td>
														 <div class="form-group form-group-sm width-300px">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right"><span
																	style="color: red">*</span>限制版本号:</label>
																<div class="col-sm-8  no-padding">
																	<div class="col-sm-8  no-padding">
																		     <table  style="width:500px;cellspacing:10px;border-collapse:separate; border-spacing:10px;">
																		        <tr style="">
																		          <td><input type="checkbox" class="ace " id="chk1" name="type" value="11" onclick="sel1(this)">
																		              <span class="lbl middle"></span></td>
																		          <td><span class="lbl middle">所有版本</span></td>
																		          <td></td>
																		        </tr>
																		        <tr>
																		          <td><input type="checkbox" class="ace " id="chk2" name="type" value="12" onclick="sel2(this)">
																		              <span class="lbl middle"></span></td>
																		          <td><span class="lbl middle">应用版本号高于</span></td>
																		          <td><input type="text" class="form-control input-small" id="aValue" name="aValue" style="width:80px" value="${deviceLimit.posVersion }" ></td>
																		        </tr>
																		        <tr>
																		          <td><input type="checkbox" class="ace " id="chk3" name="type" value="13" onclick="sel3(this)">
																		              <span class="lbl middle"></span></td>
																		          <td><span class="lbl middle">应用版本号低于</span></td>
																		          <td><input type="text" class="form-control input-small" id="bValue" name="bValue" style="width:80px" value="${deviceLimit.posVersion }" ></td>
																		        </tr>
																		        <tr>
																		          <td><input type="checkbox" class="ace " id="chk4" name="type" value="14" onclick="sel4(this)">
																		              <span class="lbl middle"></span></td>
																		          <td><span class="lbl middle">特定版本号:</span></td>
																		          <td><input type="text" class="form-control input-small" id="cValue" name="cValue" style="width:200px" value="${deviceLimit.posVersion }" ></td>
																		        </tr>
																		        
																		     </table>
																	</div>
																</div>
															</div>
															
														</td>
													</tr>
													<tr>
														<td width="5%"></td>
														<td>
															<div class="form-group form-group-sm width-300px ">
																<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right"><span
																		style="color: red">*</span>限制操作:</label>
			                                                    <div class="col-sm-8  no-padding">  
			                                                        <div class="col-sm-6">
			                                                            <input type="checkbox" class="ace " name="changedmno" value="11" id="gritter-light" >
			                                                            <span class="lbl middle">签到</span>
			                                                        </div>
			                                                        <div class="col-sm-6">
			                                                            <input type="checkbox" class="ace " name="changedmno" value="01"  id="gritter-light" >
			                                                            <span class="lbl middle">入库</span>
			                                                        </div>
			                                                    </div>
                                                   			 </div>
														</td>
													</tr>
													<tr>
														<td width="5%"></td>
														<td>
															<div class="form-group form-group-sm width-300px">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right"><span
																	style="color: red">*</span>生效时间:</label>
																<div class="col-sm-8  no-padding">
																	<div class="col-sm-8  no-padding">
																		<div class="input-daterange input-group width-200px"
																			data-date-format="yyyy-mm-dd">
																			<input type="text" name="beginDate" value="${deviceLimit.beginDate }" 
																			id="beginDate" class="input-small form-control date-picker">
																		</div>
																	</div>
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td width="5%"></td>
														<td>
														  <div class="form-group form-group-sm width-300px">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right"><span
																	style="color: red">*</span>入库时间限制:</label>
																<div class="col-sm-8  no-padding">
																	<div class="col-sm-8  no-padding">
																		<div class="input-daterange input-group width-200px"
																			data-date-format="yyyy-mm-dd">
																			<input type="text" name="storeDate" value="${deviceLimit.storeDate }" 
																			id="storeDate" class="input-small form-control date-picker"
																			onmouseover="over()" onmouseout="out()" >
																		</div>
																	</div>
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td width="5%"></td>
														<td>
														  <div class="form-group form-group-sm width-300px">
																<label for="form-field-6"
																	class="col-sm-4 control-label width-100px no-padding-right" ></label>
																<div class="col-sm-8  no-padding">
																	<div class="col-sm-8  no-padding">
																			<input type="text" id="mouse" name="mouse" value="包含该日期及之后入库的终端" style="border-left:10px;border-top:0px;border-right:0px;border-bottom:1px;display: none; " class="form-control input-small width-200px">
																	</div>
																</div>
															</div>
														</td>
													</tr>
													<tr style="margin:5px">
														<td width="5%"><br/><br/><br/><br/></td>
														<td>
															<div class="form-group form-group-sm width-100">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right">备注:</label>
																<div class="col-sm-8  no-padding">
																	<input type=text id="remark" name="remark"
																		value='${deviceLimit.remark }'
																		class="form-control input-sm width-100   view-control  " />
																</div>
															</div>
														</td>
													</tr>
												</table>
												<script src="../../../../js/js/libs/jquery-1.11.1.min.js"></script>
												<script src="../../../../js/js/froala_editor.min.js"></script>
												<script src="../../../../js/js/plugins/lists.min.js"></script>
												<script src="../../../../js/js/plugins/colors.min.js"></script>
												<script src="../../../../js/js/plugins/font_size.min.js"></script>
												<script src="../../../../js/jquery.form.js"></script>
												<script>
											     	$(function(){
											          	$('#edit').editable({inlineMode: false, alwaysBlank: true})
											      	});
											  	</script>
												<div class="form-actions center widget-color-normal5">
													
													<button class="btn btn-danger btn-sm" type="button"
														id="btnAdd" onclick="return noticeAdd()">
														<span class="ace-icon fa  fa-save icon-on-right bigger-110"></span>
														保存
													</button>
													
													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWin()">
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

	</div>
	<!-- /.main-container -->
	<%@include file="../../layout/common.js.jsp"%>

	<script type="text/javascript">
	$('.chosen-select').chosen({});
	jQuery(function($) {
		$('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	aValue: {
                    validators: {
                    	 regexp: {
                             regexp: /^[0-9]\.\d{2}$/,
                             message:'版本号的正确格式为X.XX'
                         }
                    }
                },
                bValue: {
                    validators: {
                    	 regexp: {
                             regexp: /^[0-9]\.\d{2}$/,
                             message:'版本号的正确格式为X.XX'
                         }
                    }
                },
                cValue: {
                    validators: {
                    	 regexp: {
                             regexp: /^[0-9]\.\d{2}$|^(([0-9]\.\d{2},)*[0-9]\.\d{2})$/,
                             message:'正确格式为X.XX或X.XX,X.XX,请注意,为英文格式'
                         }
                    }
                }
            }
        });
		
	//日期	
		$('.date-picker').datepicker({
			autoclose : true,
			language : 'zh-CN',
			todayHighlight : true
		})
		//show datepicker when clicking on the icon
		.next().on(ace.click_event, function() {
			$(this).prev().focus();
		});
		//or change it into a date range picker
		$('.input-daterange').datepicker({
			autoclose : true,
			language : 'zh-CN'
		});
		 
			 
	})
	function over(){
		$("#mouse").show();
	}
	function out(){
		$("#mouse").hide();
	}
	function getLen(obj){
    	var char = obj.replace(/[^\x00-\xff]/g, '**');
        return char.length;
    }
    function closeWin(){
    	if(confirm("信息未保存，是否确认关闭?")){
    		parent.$.fancybox.close();
    	}
    }

        $('.chosen-select').chosen({});
        
     function noticeAdd(){    	     	 
    	 var factId =$("#factId").val();
    	 var modId=$("#modId").val();
    	 var storeDate = $("#storeDate").val();
    	 var beginDate = $("#beginDate").val();
    	 var remark=$("#remark").val();
    	 if(beginDate==""||beginDate==null){
    		 alert("生效时间不能为空");
    		 return false;
    	 }
    	 if(storeDate==""||storeDate==null){
    		 alert("入库时间限制不能为空");
    		 return false;
    	 }
    	 if(factId=='' || factId==null || factId==undefined){
    		 alert("厂商为必填，请检查");
    		 return false;
    	 }
    	 if(modId=="" || modId==null || modId==undefined){
    		 alert("型号为必填，请检查");
	    	 return false;
    	 }
    	 if(getLen(remark)>63){
    		 alert("备注最多为63个字符，请检查");
    		 return false;
    	 }
    	 var chk_value =[]; 
    	 $('input[name="type"]:checked').each(function(){ 
    	 chk_value.push($(this).val()); 
    	 }); 
    	 var chk="";
    	 for(var i=0; i<chk_value.length; i++){
    		 var s=chk_value[i];
    		  chk += s+',';   		
    	 }
    	 document.getElementById("chk").value =chk;
    	 var tranType =[]; 
    	 $('input[name="changedmno"]:checked').each(function(){ 
    		 tranType.push($(this).val()); 
    	 }); 
    	 var type="";
    	 for(var i=0; i<tranType.length; i++){
    		 var s=tranType[i];
    		 type += s+',';   		
    	 }
    	 document.getElementById("type").value =type;
    	 if(chk==""){
    		 alert("版本号为必填，请检查");
    		 return false; 
    	 }
		 if(type==""){
			 alert("限制操作为必填，请检查");
    		 return false;		 
		 }
		 if($("#chk2").prop("checked")  && ($("#aValue").val()=="" || $("#aValue").val()==null)){
			 alert("请填写高于的版本号！");
    		 return false;
		 }
		 if($("#chk3").prop("checked")  && ($("#bValue").val()=="" || $("#bValue").val()==null)){
			 alert("请填写低于的版本号！");
    		 return false;
		 }
		 if($("#chk4").prop("checked")  && ($("#cValue").val()=="" || $("#cValue").val()==null)){
			 alert("请填写特定版本号！");
    		 return false;
		 }
    	 //接收后台返回的参数
    	 $.ajax({
 			    	cache: true,
 			        type: "POST",
 			        url:'/deviceLimit/saveAdd.do',
 					data : $('#searchForm').serialize(),// 你的formid
 					async : false,
 					success : function(data) {
 						if(data.flag=='1'){
 							alert("该型号已经添加过！");
 						}else if(data.flag=='2'){
 							alert("添加限制操作异常！");
 						}else if(data.flag=='3'){
 							alert("添加成功！");
 						}else if(data.flag=='4'){
 							alert("接口返回异常！");
 						}
 						parent.location.reload();
 					}
 				});
    	 return true;
	}
		//厂商简称和型号下拉框变动	
		  function changeFactId() {
				var fact_id = $("#factId").val();
				var mobj = $("#modId");
				var option="<option value=''> 请选择...  </option>";
				mobj.empty();
				$.ajax({
					url : '/deviceLimit/changeFactId',
					data : {fact_id : fact_id},
					cache : true,
					async : false,
					success : function(data) {
						debugger
						for (var i = 0; i < data.length; i++) {
							option+="<option value='"+data[i].modId+"'>" + data[i].modNm + "</option>";
						}
						$("#modId").html(option);
						$("#modId").trigger("chosen:updated");
					}
				});
			}
		  function sel1(obj){
			   if(obj.checked){  
				   document.all.chk2.checked=false;
				   document.all.chk3.checked=false;
				   document.all.chk4.checked=false;
			   }
			}
		  function sel2(obj){
			   if(obj.checked){
				   document.all.chk1.checked=false;
			   }
			}
		  function sel3(obj){
			   if(obj.checked){                     
				   document.all.chk1.checked=false;
			   }
			}
		  function sel4(obj){
			   if(obj.checked){                     
				   document.all.chk1.checked=false;
			   }
			}
	</script>

</body>
</html>











