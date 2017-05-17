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
                                            <form id="searchForm1" class="form-inline form-horizontal" method="post" action="" >
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
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >费率设置管理:</label>
                                                        <div class="col-sm-8  no-padding" id="divrate">
                                                        <c:if test="${fn:contains(rate,'PB01')}">
															<input type="checkbox" value="001" id="rate1" name="rate1" checked="checked" disabled='disabled'/>套餐一：非秒到+0.65%费率</br>
														</c:if>
														<c:if test="${fn:contains(rate,'PB02')}">	
															<input type="checkbox" value="002" id="rate2" name="rate2" checked="checked" disabled='disabled'/>套餐二：秒到+等级费率</br>
														</c:if>
														<c:if test="${fn:contains(rate,'PB03')}">
															<input type="checkbox" value="003" id="rate3" name="rate3" checked="checked" disabled='disabled'/>套餐三：秒到+0.6%费率</br>
														</c:if>
														<c:if test="${fn:contains(rate,'PB04')}">
															<input type="checkbox" value="004" id="rate4" name="rate4" checked="checked" disabled='disabled'/>套餐四：秒到+0.65%费率</br>
														</c:if>
														<c:if test="${fn:contains(rate,'PB05')}">
															<input type="checkbox" value="005" id="rate5" name="rate5" checked="checked" disabled='disabled'/>套餐五：秒到+0.64%费率</br>
														</c:if>
														<c:if test="${fn:contains(rate,'PB06')}">
															<input type="checkbox" value="006" id="rate6" name="rate6" checked="checked" disabled='disabled'/>套餐六：秒到+0.63%费率</br>
														</c:if>
														<c:if test="${fn:contains(rate,'PB07')}">
															<input type="checkbox" value="007" id="rate7" name="rate7" checked="checked" disabled='disabled'/>套餐七：秒到+0.62%费率</br>
														</c:if>
														<c:if test="${fn:contains(rate,'PB08')}">
															<input type="checkbox" value="008" id="rate8" name="rate8" checked="checked" disabled='disabled'/>套餐八：秒到+0.61%费率</br>
														</c:if>
														<c:if test="${fn:contains(rate,'PB09')}">
															<input type="checkbox" value="009" id="rate9" name="rate9" checked="checked" disabled='disabled'/>套餐九：秒到+0.59%费率</br>
														</c:if>
														<c:if test="${fn:contains(rate,'PB10')}">
															<input type="checkbox" value="0010" id="rate10" name="rate10" checked="checked" disabled='disabled'/>套餐十：秒到+0.58%费率
														</c:if>
														</div>
                                                    </div>
                                                
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn  btn-sm" type="button" onclick="window.parent.$.fancybox.close();">
                                                       <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
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
    function date(){
    	var i=0;
    	var rate="";
    	debugger;
    	 $("#divrate input[type='checkbox']").each(function(){
			if($(this).prop("checked")){
				rate=$(this).val()+","+rate;
				i++;
			}
    	 });
    	 if(i>0){
    		 rate=rate.substring(0,rate.length-1);
    		 alert(rate);
    		 $("#rate").val(rate);
    		 return true;
    	 }else{
    		 alert("套餐类型不可为空");
    		 return false;
    	 }
    	 
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
