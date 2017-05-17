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
                                        商户转移
                                    </h5>
                                </div>
                                <div class="widget-main " style="padding-left: 20px" >
                                    <form id="searchForm"  class="form-inline form-horizontal" 
                                    action="/mecIfHandPos/importFile" 
                                    method="post" enctype ="multipart/form-data">
                                        <h3 class="header smaller lighter green">选择Excel导入，最多允许导入2000条数据！</h3>
                                        <div class="form-group form-group-sm width-300px">
                                            <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">上传文件:</label>
                                            <div style="float: left;">
                                                <input type="file" id="excelFile" name="file" class="id-input-file">
	                                            <button class="btn btn-primary btn-sm" type="button"
	                                                onclick="downloadFile();">
	                                                <span
	                                                    class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
	                                                下载模板
	                                            </button>
	                                            <!-- <font color="red">上传前请务必确认excel每一列均为文本格式!</font> -->
                                            </div>
                                        </div>
                                        <div class="form-actions center widget-color-normal5">
                                            <button class="btn btn-danger  btn-sm" type="submit" onclick="return save()" id="sub">
                                                <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                提交
                                            </button>
                                            <button class="btn btn-default btn-sm" type="button"
                                                onclick="closeWindow();">
                                                <span
                                                    class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
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
    <%@include file="../../layout/common.js.jsp"%>
    <script type="text/javascript">
        $('.chosen-select').chosen({});
        function save() {
            var excelFile = $("#excelFile").val();
            if (excelFile == "" || excelFile == null) {
                $("button[type='submit']").removeAttr("id");
                alert("请选择一个上传文件");
                return false;
            }
            var lastName = excelFile.substring(excelFile.lastIndexOf(".")+1);
            if(lastName != "xlsx" && lastName != "xls"){
                $("button[type='submit']").removeAttr("id");
                alert("上传文件类型有误");
                return false;
            }
            $("#sub").attr({"disabled":"disabled"});
            <%-- window.location.href='<%=request.getContextPath()%>/bond/manage/batchImport'; --%>
            $("#searchForm").submit();
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
        
        function closeWindow(){
            window.parent.$.fancybox.close();
        }
        
        function downloadFile(){
        	   window.location.href='<%=request.getContextPath() %>/mecIfHandPos/downloadFile'; 
        }
        
    </script>
</body>
</html>











