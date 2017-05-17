<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>
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
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
							代理商费率设置管理
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm1" class="form-inline form-horizontal" method="post" action="<%=request.getContextPath() %>/MposRatManager/editInfo.do" >
											<input type="hidden" name="flag" value="${flag }">
                                                <div style="margin-left: 150px">
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >机构编号:</label>
                                                        <div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="orgUuid" readonly="readonly"
																value="${orgUuid }" id="orgUuid"
																class="form-control input-small width-200px "
																data-placement="bottom" >
														</div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px" style="margin-left: -7px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >代理商名称:</label>
                                                        <div class="col-sm-8  no-padding">
															<input type="text"  maxlength="40"
																value="${orgNm }" name="orgNm" readonly="readonly"
																id="orgNm"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过40个字符">
														</div>
                                                    </div>
                                                    </div>
                                                    </br>
                                                    <div class="form-group form-group-sm  width-300px"  style="margin-left: 150px">
                                                         <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >费率设置管理:</label>
                                                        <div class="col-sm-8  no-padding" id="divrate">
                                                        	<input type="hidden" value="" id="rate" name="rate" >
															<input type="checkbox" value="PB01" id="rate1" name="rate1" onchange="changeComboType()" checked="checked"/><label for="rate1">套餐一：非秒到+0.65%费率</label></br>
															<input type="checkbox" value="PB02" id="rate2" name="rate2" <c:if test="${fn:contains(rate,'PB02')}">checked="checked"</c:if>/><label for="rate2">套餐二：秒到+等级费率</label></br>
															<input type="checkbox" value="PB03" id="rate3" name="rate3" <c:if test="${fn:contains(rate,'PB03')}">checked="checked"</c:if>/><label for="rate3">套餐三：秒到+0.6%费率</label></br>
															<input type="checkbox" value="PB04" id="rate4" name="rate4" <c:if test="${fn:contains(rate,'PB04')}">checked="checked"</c:if>/><label for="rate4">套餐四：秒到+0.65%费率</label></br>
															<input type="checkbox" value="PB05" id="rate5" name="rate5" <c:if test="${fn:contains(rate,'PB05')}">checked="checked"</c:if>/><label for="rate5">套餐五：秒到+0.64%费率</label></br>
															<input type="checkbox" value="PB06" id="rate6" name="rate6" <c:if test="${fn:contains(rate,'PB06')}">checked="checked"</c:if>/><label for="rate6">套餐六：秒到+0.63%费率</label></br>
															<input type="checkbox" value="PB07" id="rate7" name="rate7" <c:if test="${fn:contains(rate,'PB07')}">checked="checked"</c:if>/><label for="rate7">套餐七：秒到+0.62%费率</label></br>
															<input type="checkbox" value="PB08" id="rate8" name="rate8" <c:if test="${fn:contains(rate,'PB08')}">checked="checked"</c:if>/><label for="rate8">套餐八：秒到+0.61%费率</label></br>
															<input type="checkbox" value="PB09" id="rate9" name="rate9" <c:if test="${fn:contains(rate,'PB09')}">checked="checked"</c:if>/><label for="rate9">套餐九：秒到+0.59%费率</label></br>
															<input type="checkbox" value="PB10" id="rate10" name="rate10" <c:if test="${fn:contains(rate,'PB10')}">checked="checked"</c:if>/><label for="rate10">套餐十：秒到+0.58%费率</label></br>
														</div> 
                                                    </div>
                                                
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="submit" onclick="return date();" id="addButton">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        	确认开通
                                                    </button>
                                                    <button class="btn  btn-sm" type="button" onclick="window.parent.$.fancybox.close();">
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

    $('.main-content .chosen-select').chosen({});
    function openAccount(){
    	   var orgUuid = $("#orgUuid").val();
    	   var deposit = $("#deposit").val();
    	   var href = '<%=request.getContextPath() %>/MobAgentTimelyAccount/toOpenView?orgUuid='+orgUuid+'&deposit='+deposit;
   	       $.ajax({
   		        url:href,
   			/* 	data : {
   	        			empNos : id
   	        		    }, */
   	        	cache: true,
   				async : false,
   				success : function(result) {
   					if(confirm(result)){
   						window.parent.$.fancybox.close();
   						window.location.reload();
   					}else{
   						window.parent.$.fancybox.close();
   						window.location.reload();
   					}
   				}
   			});
    }
    function checkComboType(){
    	debugger;
    	var comboType=$("#rate").val();
    	if(comboType=='PB01'){
    		 $('#rate1').prop('checked',true);
    	}else if(comboType=='PB02'){
    		$('#rate2').prop('checked',true);
    	}else if(comboType=='PB03'){
    		$('#rate3').prop('checked',true);
    	}else if(comboType=='PB04'){
    		$('#rate4').prop('checked',true);
    	}
    }
    function changeComboType(){
    	debugger;
    	var flag = document.getElementById("rate1").checked;
    	if(!flag){
    		alert("套餐一必须选择");
    		$('#rate1').prop('checked',true);
    		return;
    	}
    }
    function date(){
    	var i=0;
    	var rate="";
    	debugger;
    	 $("#divrate input[type='checkbox']").each(function(){
			if($(this).prop("checked")){
				rate=rate+$(this).val()+",";
				i++;
			}
    	 });
    	 if(i>0){
    		 rate=rate.substring(0,rate.length-1);
    		 $("#rate").val(rate);
    		 return true;
    	 }else{
    		 alert("套餐类型不可为空,可多选");
    		 return false;
    	 }
    	 changeComboType();
    }
    /* 提交数据之前校验 */
    function checkData(){
    	var rateLength = $("input[type='checkbox']:checked").length;
    	if(rateLength == 0){
    		alert("请选择费率！");
    		return false;
    	}else{
    		return true;
    	}
    }
</script>
</body>
</html>
