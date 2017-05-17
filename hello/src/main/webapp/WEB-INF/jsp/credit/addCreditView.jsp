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
                        <div class=" widget-container-col ui-sortable">
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        设置机构赊购信息
                                    </h5>
                                </div>
  							<div class="widget-body">
                               <div class="widget-main no-padding ">
                                 <div class="widget-main ">
                                            <form id="addCreditForm" class="form-inline form-horizontal" action="<%=request.getContextPath()%>/credit/addCreditInfo.do" method="post">
                                                <input type="hidden" id="repayAmount" name="repayAmount" value="0">
                                                <input type="hidden" id="usedAmount" name="usedAmount" value="0">
                                                 <div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
                                                        <label  for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >机构编号:<font color="red">*</font></label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text"  id="orgNo"  name="orgNo"  class="form-control input-small width-200px" data-placement="bottom" title=""   onblur="completeOrgNm()">
                                                        </div>
                                                    </div>
													<div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text"  id="orgNm"  name="orgNm" class="form-control input-small width-200px" data-placement="bottom" title=""  readonly="readonly" >
                                                        </div>
                                                    </div>
                                                	<div class="input-daterange form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >赊购使用月份:<font color="red">*</font></label>
                                                        <div class="col-sm-8  no-padding" >
                                                             <input type="text" value="${credit.creditMonth }" id="creditMonth"  name="creditMonth"  class="form-control input-small width-200px " data-placement="bottom" readonly>
                                                        </div>
                                                    </div>
                                                	<div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >月赊购上限:<font color="red">*</font></label>

                                                        <div class="col-sm-8  no-padding" >
                                                            <input type="text" id="highLimitAmount"  name="highLimitAmount"  value=""  class="form-control input-small width-200px" data-placement="bottom" title="" >
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="javascript:confirmAddCredit();"  >
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                      提交
                                                    </button>&nbsp;&nbsp;
                                                    
                                                    <button class="btn btn-default btn-sm" type="button" onclick="javascript:closewin();" id="sub" >
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                      返回
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
    function confirmAddCredit(){
    	var orgNo = $("#orgNo").val().replace(/\s/gi,'');
		var creditMonth = $("#creditMonth").val().replace(/\s/gi,'');
		var highLimitAmount = $("#highLimitAmount").val().replace(/\s/gi,'');
		var usedAmount = $("#usedAmount").val();
		var repayAmount = $("#repayAmount").val();
		var orgNm = $("#orgNm").val().replace(/\s/gi,'');
		if(orgNo == ''){
			alert("机构编号不能为空！");
			return;
		}
		if(orgNm == ''){
			alert("请填写正确机构信息");
			return;
		}
		if(highLimitAmount == ''){
			alert("月赊购上限不能为空！");
			return;
		}
		if(highLimitAmount == 0){
			alert("月赊购上限不能为0！");
			return;
		}
		if(highLimitAmount > 9999999){
			alert("月赊购上限不能超过9999999");
			return;
		}
		if(creditMonth == ''){
			alert("赊购使用月份不能为空！");
			return;
		}
		var pattern =/^[0-9]+([.]\d{1,2})?$/;
		 if(!pattern.test(highLimitAmount)){
		    alert("请输入数字(例:0.00),最高保留两位小数");
		    return ;
		 }
	    if(confirm("确认对"+orgNm+"赊购上限"+highLimitAmount+"的操作")){
    		addCreditInfo(orgNo,creditMonth,highLimitAmount,usedAmount,repayAmount);
    	}
    }
	function addCreditInfo(orgNo,creditMonth,highLimitAmount,usedAmount,repayAmount) {
		$.ajax({
	    	type: "POST",
	    	async:false,
	    	data:{
	    		orgNo: orgNo,
	    		creditMonth: creditMonth,
	    		highLimitAmount:highLimitAmount,
	    		usedAmount:usedAmount,
	    		repayAmount:repayAmount
			},
	        url: "/credit/addCreditInfo",
	        success: function(data){
	        	if(data=="OK") {
	        		alert("赊购信息设置成功");
	        		parent.$.fancybox.close();
					window.parent.location.reload();
	        	}else if(data=="notUnique"){
	        		alert("赊购信息已存在,请重新填写");
	        	}else{
	        		alert("系统异常");
	        	}
		        
		    }
		});
	}
	
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
    /**
    *根据机构编号自动补全机构名称信息
    */
    function completeOrgNm(){
    	$.ajax({
	    	type: "POST",
	    	async:false,
	    	data:{
	    		orgNo: $("#orgNo").val()
			},
	        url: "/credit/completeOrgNm",
	        success: function(data){
	        	if(data=="none") {
	        		alert("机构不存在");
	        		$("#orgNm").removeAttr("readonly");
	        		$("#orgNm").val("");
	        		$("#orgNm").attr("readonly","readonly");
	        	}else{
	        		var resultJson = eval('('+data+')');
	        		$("#orgNo").val(resultJson.ORGNO);
	        		$("#orgNm").removeAttr("readonly");
	        		$("#orgNm").val(resultJson.ORGNM);
	        		$("#orgNm").attr("readonly","readonly");
	        	}
		    }
		});
    }
</script>
</body>
</html>











