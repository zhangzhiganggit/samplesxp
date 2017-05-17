<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.css.jsp"%>
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

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
											功能选择	
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
											<div class="form-group form-group-sm  ">
											<form class="form-inline form-horizontal" action="/mecIf/switchFuc" id="searchForm" method="post"  enctype="multipart/form-data">
											
												<input type="hidden" id="mnos" name="mnos" value="${mnos}">
                                                <input type="hidden" id="posAttrStatus" name="posAttrStatus" value="${posAttrStatus}">
											
												<label for="form-field-6"
													class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">POS功能:</label>

												<div class="col-sm-8  no-padding">
													<select id="posAttr" name="posAttr" data-placeholder="请选择"
														class="chosen-select form-control width-200px">
														<option value="">请选择</option>
														<option value="YECX"
															<c:if test="${posAttr=='YECX' }">selected</c:if>>余额查询</option>
														<option value="XFCX"
															<c:if test="${posAttr=='XFCX' }">selected</c:if>>消费撤销</option>
														<option value="JYMXDY"
															<c:if test="${posAttr=='JYMXDY' }">selected</c:if>>终端交易明细打印</option>
														<option value="XJXFJZ"
															<c:if test="${posAttr=='XJXFJZ' }">selected</c:if>>现金消费记账</option>
														</select>
												</div>
												

												</form>
												
												
												
											</div>


											<div class="row"></div>
												<div class="form-actions  widget-color-normal5 center">

                                                    <button class="btn btn-danger btn-sm"  id="btnOK" type="button">
                                                        <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                        确认
                                                    </button>
                                                    
                                                    <button  class="btn btn-default btn-sm" type="button" onclick="javascript:closewin();">
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
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
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

<!-- basic scripts -->

    <%@include file="../layout/common.alljs.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    
    function closewin(){
    	parent.$.fancybox.close();
    }
    
   
 
    

	jQuery(function($){
	
		
		$("#btnOK").click(function(){
			
    	    var posAttr = $("#posAttr").val();
    	    if(posAttr == ""){
    	    	alert("请选择需要操作的POS功能");
    	    	return false;
    	    }
			
    	    
    	    
    	    
    	  	$("#searchForm").submit();
			
		}
		);
		
		
		
		
		
		
		
		
		
		
		
	})
    
			   
    
	
	
	jQuery(function($){
	
		$(":checkbox").click(function(){
			this.checked = !this.checked;
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	})
	
	
	
	
	
	
	
	
	

</script>
</body>
</html>











