<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
</head>

<body class="no-skin " >

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

                <div class="page-content ">

                    <div class="row" >

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                    下载模板
                                    </h5>

                                </div>

                                <div class="widget-body" >
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                                                                
                                            <form id="editJRFflForm" class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIfDayPay/editJRFfl" method="post">
                                                <div class=" col-xs-12">
                                                
                                                	<div class="col-sm-5 ">
                                                		<button class="btn btn-primary btn-sm" type="button" onclick="javascript:downLoad();" id="sub" >
                                                        <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                      		下载开通模板
                                                    	</button>
                                                	</div>
                                                	<div class="col-sm-5 ">
                                                		<button class="btn btn-primary btn-sm" type="button" onclick="javascript:downLoadJRFFL();" id="sub" >
                                                        <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                      		下载即日付费率修改模板
                                                    	</button>
                                                	</div>
                                                     
                                                </div>
                                                <div class=" col-xs-12" style=" position:relative; top: 10px;"  >
                                                	<div class="col-sm-5 ">
                                                		<button class="btn btn-primary btn-sm" type="button" onclick="javascript:downLoadJRFED();" id="sub" >
                                                        <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                      		下载即日付额度修改模板
                                                    	</button>
                                                	</div>
                                                     
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-default btn-sm" type="button" onclick="javascript:closewin();" id="sub" >
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
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
        </div><!-- /.main-content -->
		<form  action="<%=request.getContextPath()%>/mecIfDayPay/downExcel" id="downLoadForm" method="post">
                                            </form>
		<form  action="<%=request.getContextPath()%>/mecIfDayPay/downLoadJRFExcel" id="downLoadJRFForm" method="post">
                                            </form>

        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

 <%@include file="../layout/common.alljs.jsp"%>

    <script type="text/javascript">
    <!--下载开通模板-->
    function downLoad(){
		location.href='<%=request.getContextPath()%>/nowPayManage/excelDown'
    }
    <!--下载修改即日付费率模板模板-->
    function downLoadJRFFL() {
    	location.href='<%=request.getContextPath()%>/nowPayManage/excelDownJRFFL'
    }
    
    function closewin(){
    		parent.$.fancybox.close();
    }
    
	function validate() {
		var mno = document.getElementById("mno").value;
		var jrffl = document.getElementById("jrffl").value;
		if(jrffl == "") {
			alert("新即日付费率不能为空！");
			return ;
		}
		$.ajax({
	    	type: "POST",
	    	async:false,
	        url: "/mecIfDayPay/editJRFfl?mno="+mno+"&jrffl=" + jrffl,
	        success: function(data){
	        	if(data=="OK") {
	        		alter("修改成功");
	        		closewin();
	        	}else {
	        		alter(data);
	        	}
		        
		    }
		});
	}
	 function downLoadJRFED() {
		 location.href='<%=request.getContextPath()%>/nowPayManage/excelDownJRFED'
	    }
</script>
</body>
</html>











