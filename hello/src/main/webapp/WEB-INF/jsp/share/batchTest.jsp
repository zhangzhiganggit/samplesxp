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
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal2" style="opacity: 2;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                         跑批条件
                                    </h5>
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>

                                </div>
                                <div class="widget-body" >
                                    <div class="widget-main no-padding ">
                                           <font color="red">以下为真实跑批，请不要做任何操作！！</font>
                                           <form class="form-inline form-horizontal" action="" method="post" >
                                                   <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal1 width-100px no-padding-left"  >跑批项目:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="proTye" name="proTye" class="chosen-select form-control width-200px" onchange="showProParam(this.value)">
                                                                <option value="">请选择</option>
                                                                <option value="01">POS交易相关</option>
                                                                <option value="02">手刷交易日批</option>
                                                                <option value="04">手刷交易月批</option>
                                                                <option value="03">手刷活跃商户相关</option>
                                                                <option value="05">手刷结算日批</option>
                                                                <option value="06">手刷结算月批</option>
                                                                <option value="07">机构关系维护</option>
                                                                <option value="08">其他消费商户交易日批</option>
                                                                <option value="09">其他消费商户交易月批</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                             </form>
                                        <div  id="mecTradeBranch" hidden="hidden">
                                  <!--         <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/batchTest/amsSave.do" id="searchFormc" method="post" >
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >更新时间:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            格式填写:20150801
                                                            <input type="text" id="day" name="day"  class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                   </div><br>
                                                <button class="btn btn-danger btn-sm" type="submit" >
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                 账务流水更新                
                                                </button>
                                                
                                            </form> --> 
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/batchTest/dayBatch.do" id="searchForma" method="post" >
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >按日跑批时间:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            格式填写:20150801
                                                            <input type="text" id="day" name="day"  class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                   </div>

                                            
                                                <button class="btn btn-danger btn-sm" type="submit" >
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                 按日跑批                       
                                                </button>
                                                  
                                            </form>
                                        <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/batchTest/monthBatch.do" id="searchForm" method="post" >
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >按月时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="dateStart" name="dateStart"  class="input-small form-control date-picker">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="dateEnd" name="dateEnd"  class="input-small form-control date-picker">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                   </div>
                                                <button class="btn btn-danger btn-sm" type="submit"  onclick="downRecordExl()">
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                 按月跑批
                                                </button>
                                           
                                                  
                                            </form>
                                           </dev>
                                        </div>
                                        <!-- 手刷相关批 -->
                                         <form class="form-inline form-horizontal" action="" method="post" >
	                                        <div  id="MobMecTradeBranch" hidden="hidden">
					                                     <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal1 width-100px no-padding-left"  >更新时间:</label>

                                                        <div class="input-daterange input-group width-200px">
                                                            <!-- <input type="text" id="Mobday" name="Mobday"  class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!"> -->
                                                         <input type="text" id="Mobday" name="Mobday"  class="input-small form-control date-picker"> 
                                                        </div>
                                                    </div><br>
	                                            <button class="btn btn-danger btn-sm" type="button" onclick="mobBatch()">
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                             执行跑批                
                                                </button>
	                                        </div>
                                        </form>
                                        <!-- 机构关系维护 -->
                                         <form class="form-inline form-horizontal" action="" method="post" >
	                                        <div  id="OrgMapping" hidden="hidden">
	                                            <button class="btn btn-danger btn-sm" type="button" onclick="orgRelat()">
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                             机构关系维护             
                                                </button>
	                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- add by lcf 20160628 -->
                            <div class="widget-box widget-color-normal2" style="opacity: 2;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       	 同步商编数据
                                    </h5>
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>
                                </div>
                                <div class="widget-body" >
                                    <div class="widget-main no-padding ">
                                           <font color="red">以下为商编同步，请谨慎操作！</font>
                                           <form class="form-inline form-horizontal" action="" method="post" >
                                             <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal1 width-100px no-padding-left"  >任务编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                       <input type="text" id="orderNo" name="orderNo"  class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                          	</div>
                                          	</div>
                                          	<button class="btn btn-danger btn-sm" type="button" onclick="synchronousDataToOa()">
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                 同步商编                       
                                                </button>
                                             </form>
                                          </div>
                                    </div>
                              </div>
                              <!-- by li_jing -->
                            <div class="widget-box widget-color-normal2" style="opacity: 2;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       	 给所有一代管理员开通权限
                                    </h5>
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>
                                </div>
                                <div class="widget-body" >
                                    <div class="widget-main no-padding ">
                                           <font color="red">请输入角色名称（全称）</font>
                                           <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/establish/establishFirstOrg.do" method="post" >
                                             <div class="form-group form-group-sm width-300px ">
                                                 <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal1 width-100px no-padding-left"  >角色名称:</label>

                                                 <div class="col-sm-8  no-padding"  >
                                                <input type="text" id="roleNm" name="roleNm"  class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                          	</div>
                                          	</div>
                                          	<button class="btn btn-danger btn-sm" type="submit" onclick="return establishFirstOrg()">
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                 确认开通                       
                                                </button>
                                                <c:if test="${flag!=null && flag==true }">
                                               <span id="message" ><font color="red">开通成功</font></span>
                                               </c:if>
                                                <c:if test="${flag!=null && flag==false }">
                                               <span id="message" ><font color="red">角色名称不存在</font></span>
                                               </c:if>
                                             </form>
                                          </div>
                                    </div>
                              </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../layout/common.alljs.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    jQuery(function($) {
    	$('.chosen-select').chosen({});
    	
    $('.date-picker').datepicker({
        autoclose: true,
        language: 'zh-CN',
        todayHighlight: true,
        keyboardNavigation:true,
        clearBtn:true
    }).next().on(ace.click_event, function(){
        $(this).prev().focus();
    });
    $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
	 })
     function showProParam(val){
    	 if(val == '01'){
    		 $("#mecTradeBranch").show();
    		 $("#MobMecTradeBranch").hide();
    		 $("#OrgMapping").hide();
    	 }else if(val == '07'){
    		 $("#OrgMapping").show();
    		 $("#mecTradeBranch").hide();
    		 $("#MobMecTradeBranch").hide();
    	 }
    	 else{
    		 $("#mecTradeBranch").hide();
    		 $("#OrgMapping").hide();
    		 $("#MobMecTradeBranch").show();
    	 }
     }
     function mobBatch(){
    	 var forAct = $("#Mobday").val();
    	 var day = $("#Mobday").val().replaceAll('-','');
    	 var proTyp = $("#proTye").val();
    	 var pt = $("#proTye").val();
    	 var url = '<%=request.getContextPath() %>/mobBatchTest/testMobBatch?day='+day+'&proTyp='+proTyp+'&forAct='+forAct;
    	 if(pt=='04' || pt=='06' || pt=='09'){
    		 //执行手刷交易月批
    		 url = '<%=request.getContextPath() %>/mobBatchTest/testMobBatchMonth?day='+day+'&proTyp='+proTyp+'&forAct='+forAct;
    	 }
         if(day == null || day.length != 8){
        	 alert("请填写正确日期!");
         }else{
             $.ajax({   
  				url: url,
  				async:true,
  				cache: false,
  				type:'POST',
  				data:{icNo:$("#icNo").val(),orgNo:$("#orgNo").val(),receMan:$("#receMan").val()},
  				success: function(result) {
  						if(result == '01'){
  							alert("执行成功!");
  						}else if(result == '03'){
  							alert("不存在该任务类型");
  						}else{
  							alert("跑批失败!");
  						}
  					}
  	    });
         }    	 
    	 
     }
     function orgRelat(){ 
    	 var url = '<%=request.getContextPath() %>/batchTest/orgRelationship.do';
		 $.ajax({   
				url: url,
				async:true,
				cache: false,
				type:'POST',
				success: function(result) {
						if(result == '01'){
							alert("执行成功!");
						}else if(result == '02'){
							alert("执行失败!");
						}else{
							alert("对不起，您没有权限访问，请联系管理员!");
						}
					}
	    });
 }
     
     function synchronousDataToOa(){ 
    	 var url = '<%=request.getContextPath() %>/mercInfoUpdate/synchronousDataToOa.do';
		 $.ajax({   
				url: url,
				async:true,
				cache: false,
				type:'POST',
				data:{orderNo:$("#orderNo").val()},
				success: function(result) {
						if(result == 'true'){
							alert("商编同步成功!");
						}else if(result == 'false'){
							alert("商编同步失败!");
						}else{
							alert("对不起，您没有权限访问，请联系管理员!");
						}
					}
	    });
     }
     
     function establishFirstOrg(){
    	 var roleNm=$("#roleNm").val();
    	 if(roleNm==""){
    		 alert("角色名称不能为空");
    		 return false;
    	 }
    	 return true;
     }
     
</script>
</body>
</html>











