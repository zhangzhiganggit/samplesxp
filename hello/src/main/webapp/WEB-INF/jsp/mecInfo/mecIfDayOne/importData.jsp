<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../../layout/common.css.jsp"%>
</head>

<body class="no-skin ">
    

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

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
                                        		数据导入
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
	                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIfDayOneStatus/importExcel.do" id="searchForm" method="post"  enctype="multipart/form-data">
	                                              	<div class=" col-xs-12">
	                                                    <h3 class="header smaller lighter green">选择Excel导入,每次导入的数量不可超过1000条</h3>
	                                                    <div class="form-group col-sm-4 ">
	                                                        <label class="ace-file-input ace-file-multiple widget-main" style="height:200px">
	                                                            <input type="file" name="excelFile" id="excelFile" class="id-input-file" >
	                                                        </label>
	                                                    </div>
	                                                    &nbsp;
	                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >&nbsp;操作类型<font color="red">*</font>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="operFlg" name="operFlg" data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                 <option value=""></option>
                                                                <option value="open" >开通</option>
                                                                <option value="close" >关闭</option>
                                                            </select>
                                                        </div>
                                                       </div>
                                                       <br />
	                                                    <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >备注<font color="red">*</font>:</label>

                                                        <div class="col-sm-8 no-padding width-60">
                                                            <textarea maxlength="" id="rmk" name="rmk" style="height:80px" class="form-control limited input-small width-100"></textarea>
                                                        </div>
                                                        
	                                                </div>
	                                                <button class="btn btn-danger btn-sm"  type="button" id="btnUpload">
	                                                    <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
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
                                                    <button class="btn btn-default btn-sm" type="button" onclick="returnImportOrderPage()" id="btnReturn">
                                                       <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
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

   <%@include file="../../layout/common.alljs.jsp"%>
    <script type="text/javascript">
        $('.chosen-select').chosen({});
        $("#btnUpload").click(function(){
    	    var excelFile = $("#excelFile").val();
    	    var rmk=$("#rmk").val();
    	    var operFlg=$("#operFlg").val();
    	    if(excelFile==""||excelFile==null){
    	    	alert("请选择一个上传文件");
    	    	return false;
    	    }
    	    if(rmk==""||rmk==null){
    	    	alert("请填写备注");
    	    	return false;
    	    }
    	    if(operFlg==""||operFlg==null){
    	    	alert("请选择操作类型");
    	    	return false;
    	    }
    	    var len = rmk.strLen();
    	    if(len>60){
    	    	alert("备注长度不能超过30汉字");
    	    	return;
    	    }
    	    document.getElementById("btnUpload").disabled=true;
    	  	$("#searchForm").submit();
   	 	}); 
        function returnImportOrderPage(){
        	location.href = '<%=request.getContextPath() %>/mecIfDayOneStatus/importPage.do';
        }
       
        $('.id-input-file').ace_file_input({
            style:'well',
            btn_choose:'请上传Excel文件！',
            btn_change:null,
            allowExt : ['xlsx','xls'], 
            no_icon:'ace-icon fa fa-cloud-upload',
            droppable:true,
            height:300,
            thumbnail:'large'//large | fit |small
            //,icon_remove:null//set null, to hide remove/reset button
            /**,before_change:function(files, dropped) {
            //Check an example below
            //or examples/file-upload.html
            return true;
            }*/
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
	</script>
</body>
</html>











