<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
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
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
	                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
	                                <div class="widget-body">
	                                    <div class="widget-main no-padding " id="batchStartResultInfo">
	                                    <input id="batNo" name="batNo" type="hidden" value="${batNo }"/>
	                                    	<c:if test="${resultMap.readStatus == 'error'}">
	                                    		<h3 class=" smaller lighter red" style="padding-left:5px;">Excel数据验证失败，错误信息如下：</h3>
	                                    		<h5 class="header smaller lighter red">${resultMap.errorMsg}</h5>
	                                    		<c:forEach var="errorMsg" items="${errorList}">
		                                    					<h5 class="header smaller lighter red">${errorMsg.REASON}</h5>
		                                    				</c:forEach>
	                                    		<div class="form-actions center widget-color-normal5">
	                                    		           
                                                    <button class="btn btn-default btn-sm" type="button" onclick="returnImportOrderPageb()" id="btnReturn">
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
	                                                   返回
                                                    </button>
                                                </div>
	                                    	</c:if>
	                                    	<c:if test="${resultMap.readStatus == 'pass'}">
	                                    		<h3 class=" smaller lighter red" style="padding-left:5px;">Excel导入结果：</h3>
	                                    		<h5 class="header smaller lighter red">${resultMap.errorMsg}</h5>
	                                    		<div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-default btn-sm" type="button" onclick="returnImportOrderPage()" id="btnReturn">
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
	                                                   关闭
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
    <%@include file="../../layout/common.js.jsp"%>
    <script type="text/javascript">
    
        $('.chosen-select').chosen({});
        $("#btnUpload").click(function(){
    	    var excelFile = $("#excelFile").val();
    	    if(excelFile==""||excelFile==null){
    	    	alert("请选择一个上传文件");
    	    	return false;
    	    }
    	    $("#tipInfo").html("Excel正在解析,请您耐心等候。。。");
    	    $("#btnUpload").hide();
    	  	$("#searchForm").submit();
   	 	}); 
        function returnImportOrderPage(){
        	parent.$.fancybox.close();
        }
        
        function returnImportOrderPageb(){
        	debugger;
        	var batNo=$("#batNo").val();
        	location.href = '<%=request.getContextPath()%>/deviceLimit/limitImport?batNo='+batNo;
        }
        $('.id-input-file').ace_file_input({
            style:'well',
            btn_choose:'请上传Excel文件！',
            btn_change:null,
            no_icon:'ace-icon fa fa-cloud-upload',
            droppable:true,
            height:300,
            thumbnail:'large',
            preview_error : function(filename, error_code) {
            }
        }).on('change', function(){
        });
	</script>
</body>
</html>











