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
                                        		其他款项金额导入                 
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
	                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/profitImport/importExcel.do" id="searchForm" method="post"  enctype="multipart/form-data">
	                                              	 <div class=" col-xs-12">
	                                                       <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >目标月份:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="year" name="year"   class="col-sm-8 width-40 chosen-select width-40">
                                                                <c:forEach  items="${yearlist }" var="year">
                                                                  <option value="${year}" <c:if test="${year==year }">selected</c:if>>${year}</option>
                                                               </c:forEach>
                                                            </select>
                                                            			年
                                                            <select id="month" name="month"   class="col-sm-6 width-40  chosen-select width-40  ">
                                                              <option value="01" >01</option>
                                                              <option value="02" >02</option>
                                                              <option value="03" >03</option>
                                                              <option value="04" >04</option>
                                                              <option value="05" >05</option>
                                                              <option value="06" >06</option>
                                                              <option value="07" >07</option>
                                                              <option value="08" >08</option>
                                                              <option value="09" >09</option>
                                                              <option value="10" >10</option>
                                                              <option value="11" >11</option>
                                                              <option value="12" >12</option>
                                                            </select>
                                                                  		  月
                                                        </div>
                                                    </div>
	                                                </div>
	                                              	<div class=" col-xs-12">
	                                                    <h3 class="header smaller lighter green">选择Excel导入   </h3>
	                                                    <div class="form-group col-sm-4 ">
	                                                        <label class="ace-file-input ace-file-multiple widget-main" style="height:200px">
	                                                            <input type="file" name="excelFile" id="excelFile" class="id-input-file" >
	                                                            <font  id="tipInfo" size="2" color="red"></font>
	                                                        </label>
	                                                    </div>
	                                                </div>
	                                               
	                                                <button class="btn btn-danger btn-sm" type="button" id="btnUpload">
	                                                    <span class="ace-icon fa fa-arrow-circle-o-up icon-on-right bigger-110"></span>
	                                                    导入
	                                                </button>
	                                                
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
                                                    <button class="btn btn-default btn-sm" type="button" onclick="returnImportOrderPageb()" id="btnReturn">
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
	                                                   返回修改
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
        	location.href = '<%=request.getContextPath()%>/profitImport/showImportView.do';
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











