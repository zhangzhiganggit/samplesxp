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
                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3">
                              <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        SIM卡批量修改
                                    </h5>
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>

                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
											<div class="form-group form-group-sm  ">
											<form class="form-inline form-horizontal" action="importBatchModifyExcel" id="searchForm" method="post"  enctype="multipart/form-data" onsubmit="return dosubmit()">
													<div class=" col-xs-12">
														<h3 class="header smaller lighter green">选择Excel导入</h3>
														<div class="form-group col-sm-4 ">
															<label
																class="ace-file-input ace-file-multiple widget-main"
																style="height: 200px"> <input type="file"
																name="excelFile" id="excelFile" class="id-input-file">
															</label>
														</div>
													</div>
												</form>
											</div>

											<div class="row"></div>
												<div class="form-actions  widget-color-normal5 center">

                                                    <button class="btn btn-danger btn-sm" id="btnOK" type="button">
                                                        <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                        确认
                                                    </button>
                                                    
                                                    <button class="btn btn-primary btn-sm" type="button" onclick="exportDown()">
													    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
													下载模板
												    </button>
												    <button class="btn  btn-sm cleanBtn" type="button" onclick="closeWindow()">
	                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
	                                                        取消
	                                                    </button>
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

        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>
    <%@include file="../../layout/common.js.jsp"%>
    <script type="text/javascript">
    function exportDown(){
		location.href='<%=request.getContextPath()%>/SimCard/excelModiyDown'
	}
    function closeWindow(){
		window.parent.$.fancybox.close();
	} 
	jQuery(function($){
	
		$("#btnOK").click(function(){
			var excelFile = $("#excelFile").val();
    	    if(excelFile==""||excelFile==null){
    	    	alert("请选择一个上传文件");
    	    	return false;
    	    }
    	    
    	  	$("#searchForm").submit();
			
		}
		);
	})
	
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
	 function dosubmit(){
		 $("#btnOK").attr({"disabled":"disabled"});
		 return true;
	 }

</script>
</body>
</html>











