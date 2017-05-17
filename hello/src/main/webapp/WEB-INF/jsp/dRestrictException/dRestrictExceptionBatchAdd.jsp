<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
    <%@include file="../layout/common.jsp"%>
</head>
<body class="no-skin ">
    <div class="main-container" id="main-container">
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        <c:choose>
                                        	<c:when test="${resultMap.readStatus == '' || resultMap.readStatus == null }">
                                        		添加重复次数例外设置
                                        	</c:when>
                                        	<c:otherwise>
                                        			Excel数据验证结果
                                        	</c:otherwise>
                                        </c:choose>
                                    </h5>
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>
                                </div>
                                <c:if test="${resultMap.readStatus == '' || resultMap.readStatus == null }">
                                	<div class="widget-body">
	                                    <div class="widget-main no-padding ">
	                                        <div class="widget-main ">
	                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/dRestrictException/importExcel.do" id="searchForm" method="post"  enctype="multipart/form-data">
	                                              	<input type="hidden" id="orgNm" name="orgNm">
	                                              	<div class=" col-xs-12">
		                                              	<div class="form-group form-group-sm  width-300px">
															<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司<font color="red">*</font>:</label>
															<div class="col-sm-8  no-padding">
																<select id="orgNo" name="orgNo"  onchange="findOrgNm()" class="chosen-select form-control width-200px">
																	<c:forEach items="${orgList }" var="orgs">
																		<option value="${orgs.orgUuid }"  >${orgs.orgNm}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
															<div class="form-group form-group-sm width-300px" style="display: none;">
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否全量例外:</label>
																<div class="col-sm-8  no-padding">
																	<label> 
																		<input type="checkbox" id="isAll" value="1" name="isAll" class="ace ace-switch ace-switch-6 btn-flat" >
																		<span class="lbl"></span>
																	</label>
																</div>
															</div>
		                                                    <div class=" col-xs-12">
		                                                    <h3 class="header smaller lighter green">选择Excel导入,最多允许导入1000条数据!</h3>
		                                                    <div class="form-group col-sm-4 ">
		                                                        <label class="ace-file-input ace-file-multiple widget-main" style="height:200px">
		                                                            <input type="file" name="excelFile" id="excelFile" class="id-input-file" >
		                                                        </label>
		                                                    </div>
		                                                </div>
	                                                </div>
													<div class="form-actions center widget-color-normal5">
														<button class="btn btn-danger btn-sm" type="submit" id="btnUpload">
															<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
															提交
														</button>
														<button class="btn  btn-sm" type="button" onclick="window.parent.$.fancybox.close();">
															<span class="ace-icon fa icon-on-right bigger-110"></span>
															关闭
														</button>
													</div>
	                                            </form>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:if>                                
                            </div>
                            <c:if test="${resultMap.readStatus != '' && resultMap.readStatus != null }">
	                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
	                                <div class="widget-body">
	                                    <div class="widget-main no-padding " id="batchStartResultInfo">
	                                    	<c:if test="${resultMap.readStatus == 'error'}">
	                                    		<h3 class=" smaller lighter red" style="padding-left:5px;">Excel数据验证失败，错误信息如下：</h3>
	                                    		<h5 class="header smaller lighter red">${resultMap.errorMsg}</h5>
	                                    		<div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="returnPage()">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
	                                                   返回修改
                                                    </button>
                                                </div>
	                                    	</c:if>
	                                    </div>
	                                </div>
	                            </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
	    $('.chosen-select').chosen({});
	    
	    
	    function findOrgNm(){
	    	var nm = $("#orgNo").find("option:selected").text();
	    	$("#orgNm").val(nm);
	    }
    
        
        $("#btnUpload").click(function(){
        	var nm = $("#orgNo").find("option:selected").text();
        	$("#orgNm").val(nm);
    	    var excelFile = $("#excelFile").val();
    	    if(excelFile==""||excelFile==null){
    	    	alert("请选择excel进行上传");
    	    	return false;
    	    }
    	  	$("#searchForm").submit();
   	 	}); 
        function returnPage(){
        	location.href = '<%=request.getContextPath() %>/dRestrictException/batchAddView.do';
        }
       
        $('.id-input-file').ace_file_input({
            style:'well',
            btn_choose:'数据导入',
            btn_change:null,
            allowExt : ['xlxs','xls'],
            no_icon:'ace-icon fa fa-cloud-upload',
            droppable:true,
            height:80,
            thumbnail:'large',
            preview_error : function(filename, error_code) {
            }
        }).on('change', function(){
        });
        $('.input-daterange').datepicker({
			autoclose : true
		});
	</script>
</body>
</html>











