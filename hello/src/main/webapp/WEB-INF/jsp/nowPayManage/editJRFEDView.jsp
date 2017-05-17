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
                                     修改即日付结算额度
                                    </h5>

                                </div>

                                <div class="widget-body" >
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="editJRFflForm" class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIfDayPay/editJRFfl" method="post">
                                                <div class=" col-xs-12">
                                                    <div class="col-sm-12 form-group form-group-sm width-400px ">
                                                    <div class="col-sm-1"  ></div>
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-7 "  >
                                                            <input type="text" class="col-sm-11" id="mno"  name="mno" readonly="readonly"  value="${mf.mno }"  class="form-control input-small width-400px " data-placement="bottom" title=""   >
                                                            <input type="hidden" id="inMno"  name="inMno" value="${mf.inMno}"  >
                                                        </div>
                                                    </div>
                                                     
                                                </div>
                                                <div class=" col-xs-12">
                                                	<div class="col-sm-12 form-group form-group-sm width-400px ">
                                                	<div class="col-sm-1"  ></div>
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户名称:</label>

                                                        <div class="col-sm-7"  >
                                                            <input type="text" class="col-sm-11" id="cprRegNmCn" readonly="readonly"  name="cprRegNmCn"  value="${mf.cprRegNmCn }"  class="form-control input-small width-400px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class=" col-xs-12">
                                                	<div class="col-sm-12 form-group form-group-sm width-400px ">
                                                		<div class="col-sm-1"  ></div>
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >当前即日付额度</label>

                                                        <div class="col-sm-7  "  >
                                                            <input type="text" class="col-sm-11"  id="jrfednow" readonly="readonly"  name="cprRegNmCn"  value="${mf.jrfed}"  class="form-control input-small width-400px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class=" col-xs-12">
                                                	<div class="col-sm-12 form-group form-group-sm width-400px ">
                                                		<div class="col-sm-1"  ></div>
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >新即日付额度<font color="red">*</font></label>

                                                        <div class="col-sm-7 "  >
                                                            <input type="text" class="col-sm-11" id="jrfed"  name="jrfed"  value=""  class="form-control input-small width-400px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="javascript:validate();" id="sub" >
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                      确定
                                                    </button>&nbsp;&nbsp;
                                                    
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



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

 <%@include file="../layout/common.alljs.jsp"%>

    <script type="text/javascript">
    

    function closewin(){

    		window.parent.$.fancybox.close();
    }
    
	function validate() {
		var inMno = document.getElementById("inMno").value;
		var jrfed = document.getElementById("jrfed").value;
		if(jrfed == "") {
			alert("新即日付额度不能为空！");
			return ;
		}
		var re = /^(0|([1-9][0-9]*))$/ ; 
		if(!re.test(jrfed)){
			alert("即日付额度必须为整数！");
			return ;
		} 
		$.ajax({
	    	type: "POST",
	    	async:false,
	        url: "/nowPayManage/editJRFED?inMno="+inMno+"&jrfed=" + jrfed,
	        success: function(data){
	        	if(data=="OK") {
	        		alert("修改成功");
	        		parent.$.fancybox.close();
					window.parent.location.reload();
	        	}else {
	        		alert(data);
	        	}
		        
		    }
		});
	}
</script>
</body>
</html>











