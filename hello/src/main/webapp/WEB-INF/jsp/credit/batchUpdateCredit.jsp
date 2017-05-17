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
                                        		批量设置/修改赊购额度
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
	                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/credit/batchUpdateCredit.do"  method="post"  enctype="multipart/form-data" onsubmit="return dosubmit()">
	                                              	<input type="hidden" id="orgNm" name="orgNm">
	                                              	<div class=" col-xs-12">
	                                              	<div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >赊购使用月份:<font color="red">*</font></label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="creditMonth" id="creditMonth" class="input-small form-control" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class=" col-xs-12">
                                                   	 <h3 class="header smaller lighter green">上传机构赊购信息附件</h3>
	                                                    <div class="form-group col-sm-4 ">
	                                                        <label class="ace-file-input ace-file-multiple widget-main" style="height:200px">
	                                                            <input type="file" name="excelFile" id="excelFile" class="id-input-file" >
	                                                        </label>
	                                                    
	                                                    </div>
	                                                </div>
	                                                </div>
												<div class="form-actions center widget-color-normal5">
														
													<button class="btn btn-danger btn-sm" type="submit" id="btnUpload">
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														提交
													</button>
													<button class="btn btn-default btn-sm"  type="button"
														onclick="window.parent.$.fancybox.close();">
														<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
														返回
													</button>
													 <button class="btn btn-primary btn-sm" type="button" onclick="downLoad()">
                                                   		<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                   		下载模板
                                                		</button>
												</div>
	                                            </form>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:if>                                
                            </div>
                            <form  action="<%=request.getContextPath()%>/credit/downExcel" id="downLoadForm" method="post">
                        	 </form>
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
        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
    
        $('.chosen-select').chosen({});
        $("#btnUpload").click(function(){
        	var creditMonth = $("#creditMonth").val();
        	if(creditMonth == ""){
        		alert("赊购使用月份不能为空！");
        		return false;
        	}
    	    var excelFile = $("#excelFile").val();
    	    if(excelFile==""||excelFile==null){
    	    	alert("请选择excel进行上传");
    	    	return false;
    	    }
    	  	$("#searchForm").submit();
   	 	}); 
        function returnPage(){
        	location.href = '<%=request.getContextPath() %>/credit/creditList.do';
        }
       
        $('.id-input-file').ace_file_input({
            style:'well',
            btn_choose:'数据导入',
            btn_change:null,
            no_icon:'ace-icon fa fa-cloud-upload',
            droppable:true,
            height:80,
            thumbnail:'large',
            before_change:function(files, dropped) {
            	var fileName = files[0].name;
            	var pointIndex = fileName.lastIndexOf('.');
            	if(pointIndex == -1){
            		alert('请上传excel文件(xlxs、xls)！');
            		return false;
            	}	
            	var fileType = fileName.substr(pointIndex+1).toLowerCase();
            	var allowMime = ['xlxs','xls'];
            	var flag = false;
            	for(var i = 0;i<allowMime.length;i++){
            		if(allowMime[i] == fileType){
            			flag = true;
            		}
            	}
            	if(!flag){
            		alert('请上传excel文件(xlxs、xls)！');
            		flag = false;
            	}
            	return flag;

            }
            /**,before_remove : function() {
            return true;
            }*/
            ,
            preview_error : function(filename, error_code) {
                //name of the file that failed
                //error_code values
                //1 = 'FILE_LOAD_FAILED',
                //2 = 'IMAGE_LOAD_FAILED',
                //3 = 'THUMBNAIL_FAILED'
                //alert(error_code);
            }
        }).on('change', function(){
            //console.log($(this).data('ace_input_files'));
            //console.log($(this).data('ace_input_method'));
        });
        var date=new Date();
        $('.input-daterange').datepicker({
        	format: 'yyyy-mm',  
            weekStart: 1,  
            autoclose: true,  
            startView: 3, 
            maxViewMode: 1,
            minViewMode:1,
            startDate: date,
            endDate: new Date(date.getFullYear(),date.getMonth()+1,1),
            forceParse: false,  
            language: 'zh-CN'  
		});
        
        <!--下载模板 -->
	    function downLoad(){
	   		document.getElementById("downLoadForm").submit();
	       }
	    function dosubmit(){
			 $("#btnUpload").attr({"disabled":"disabled"});
			 return true;
		 }
	</script>
</body>
</html>











