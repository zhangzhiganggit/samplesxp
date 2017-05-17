<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="com.suixingpay.sms.orm.sms.domain.HistoryDetail"%>
<%@page import="com.suixingpay.sms.orm.uap.domain.Org"%>
<%@page import="com.suixingpay.sms.orm.ssp.domain.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.css.jsp"%>
    	<style type="text/css">
    	.redTip{
   		 	color:#F00;
   		}
		</style>
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
                                        代理商信息-修改详情
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="/org/continueMod.do" method="post">
										<input type="hidden" name="orgInfo" value='<%= JSONArray.fromObject((Org)request.getAttribute("org")).toString().replace("\\", "").replace("[", "").replace("]", "").replace("dateCreated", "dateCreatedStr").replace("lastUpdated", "lastUpdatedStr").replace("'", "\"")%>'>
                                           		<input type="hidden" name="userInfo" value='<%= JSONArray.fromObject((User)request.getAttribute("user")).toString().replace("\\", "").replace("[", "").replace("]", "").replace("'", "\"")%>'>
                                                <input type="hidden" value="${action }" name="action">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgUuid }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgUuid }</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <c:if test="${historylist.size() > 0}">
                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">修改内容</h3>
                                                    <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                                        <thead class="thin-border-bottom">
                                                        <tr>
                                                            <th style="text-align:right;width: 8%">项目</th>
                                                            <th>修改前</th>
                                                            <th>修改后</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${historylist }" var="hist">
                                                        <tr>
                                                            <td>${hist.displayName }</td>
                                                            <td>${hist.oldValue }</td>
                                                            <td>${hist.newValue }</td>
                                                        </tr>
                                                       </c:forEach>

														<tr>
														<td colspan="3">
	                                                 	<label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >备注</label>
														<div class="col-sm-8  no-padding"  >
			                                                  	<textarea maxlength="500" name="orgMemo" 
			                                                  	onblur="writeMemo()" onfocus="writeMemo()" id="orgMemo" id="form-field-9" style="height:80px"  class="form-control limited input-small width-100">请输入备注</textarea>
		                                             		</div>
														</td>
														</tr>
                                                        </tbody></table>
                                                        
                                                        <h3 class="header smaller lighter red checkArea" style="display:none;">注销检查未通过的项目</h3>
													<input id='forceWithdraw'  type='hidden'/>
                                                    <table id='errorCheckTable' class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable checkArea" style="display:none;">
                                                        <thead class="thin-border-bottom">
                                                        <tr>
                                                            <th style="width:15%">检查项目</th>
                                                            <th style="width:55%">详细信息</th>
                                                            <th style="width:30%">说明或建议</th>
                                                            <!-- <th style="width:15%">操作</th>
                                                            <th style="width:10%">状态</th> -->
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
														</tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                
                                                
                                                
												</c:if>
                                                <c:if test="${historylist.size() <=0 }">没有修改内容</c:if>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
													<c:if test="${historylist.size() >0 }">
                                                    <button class="btn btn-danger btn-sm" type="button" id='confirmModify' onclick="confirmSaveOrg()">
                                                        <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                        确认保存
                                                    </button>
                                                    </c:if>
                                                    <button class="btn  btn-sm" type="submit" id='continueModify'>
                                                        <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                        继续修改
                                                    </button>
                                                    <button class="btn  btn-sm" style='display:none;' type="button" id='cancelModify'
                                                    onclick="location.href='/org/list.do?orgProp=2'">
                                                        <span class="ace-icon fa fa-cancel icon-on-right bigger-110"></span>
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
    var $errorCheckTable = $('#errorCheckTable');
    var unfinishedOrderTip1="该代理商存在未完成订单,订单编号:";
    var unfinishedOrderTip2="，请与总仓确认,若订单已完成,点击'确定',注销代理商;若未完成,点击'取消',不注销代理商";
    
    
    var rowCandidate={
    		workFlowsRequired:{
    			item:"<td>存在未完成的工作流</td>",
    			suggestion:"",
    			operation:"",
    			state:""
    		},
    		workFlowsOptional:{}
    };
	
    function confirmSaveOrg(){
    	$('#confirmModify').attr('disabled',"true");
		$('.checkArea').hide();
		var checkAreaVisiable =false;
    	var force = $('#forceWithdraw').val();
    		var params ="map="+'{"action":"${action}","memo":"'+$("#orgMemo").val()+'","org" : <%= JSONArray.fromObject((Org)request.getAttribute("org")).toString().replace("\\", "").replace("[", "").replace("]", "").replace("dateCreated", "dateCreatedStr").replace("lastUpdated", "lastUpdatedStr")%>,"list":[<%= JSONArray.fromObject((List<HistoryDetail>)request.getAttribute("historylist")).toString().replace("\\", "").replace("[", "").replace("]", "") %>],"user" : <%= JSONArray.fromObject((User)request.getAttribute("user")).toString().replace("\\", "").replace("[", "").replace("]", "")%>}'; 
	    	$.ajax({
	    		type:'post',
	    		url:"/org/save.do?forceWithdraw=" + force,
	    		data:params,
	    		async:false,
	    		success:function(data){
	    			data = eval("("+data+")")
	    			console.info(data)
	    			$('#requiredFlowTr,#optionalFlowTr,#optionalOrderTr').remove();
	    			if(data.result==0){
	    				alert(data.message);
	    				return;
	    			}
	    			if(data.result==99){
	    				alert("组织机构平移失败!查看原因！请联系管理员！");
	    			}
	    			if(data.result==9){	    				
	    				var messageJson=eval("("+data.message+")");
		    			var workFlowsRequired = messageJson.workFlowsRequired;
	    				if(workFlowsRequired&&workFlowsRequired.length>0){
	    					if(!checkAreaVisiable){
	    						$('.checkArea').show();
	    		    			checkAreaVisiable = true;
	    					}
		    				var info = "<tr id='requiredFlowTr' class='redTip'>";
		    				info+="<td class='redTip'>有必须完成的工作流未结束<br/>(共"+workFlowsRequired.length+"个)</td><td>";
			    			for(var i=0;i<workFlowsRequired.length;i++){
			    				var flow = workFlowsRequired[i];
			    				console.info(flow.taskId)
			    				info+="账号:"+flow.userCode 
			    						+ "&nbsp;&nbsp;流程名称:" + flow.flowTypeStr
			    						+ "&nbsp;&nbsp;工单编号:" + flow.flowNo
			    						+ "<br/>";
			    			}
		    				info+="</td><td>该项目为必须满足的条件,请处理以上流程后再进行此操作</td>"; 
		    				//info+="<td>请完成以上流程后再注销代理商</td>";
		    				//info+="<td class='redTip'>不允许注销</td></tr>";
			    			info+='</tr>';
		    				$errorCheckTable.prepend(info);
			    			//alert('不允许注销,有必须完成的工作流未完成');
	    					$('#confirmModify,#continueModify').hide();
	    					$('#cancelModify').show();
	    					return ;
	    				}
	    				var workFlowsOptional =messageJson.workFlowsOptional;
	    				var orders =messageJson.orders;
	    				if(((workFlowsOptional&&workFlowsOptional.length>0))||(orders&&orders.length>0)){
	    					$('#forceWithdraw').val('true');
	    					$('#continueModify').hide();
	    					$('#cancelModify').show();
	    				}
	    				if(workFlowsOptional&&workFlowsOptional.length>0){
	    					if(!checkAreaVisiable){
	    						$('.checkArea').show();
	    		    			checkAreaVisiable = true;
	    					}
		    				var info = "<tr id='optionalFlowTr'>";
		    				info+="<td>存在可强制完成的工单<br/>(共"+workFlowsOptional.length+"个)</td><td>";
			    			for(var i=0;i<workFlowsOptional.length;i++){
			    				var flow = workFlowsOptional[i];
			    				info+="账号:"+flow.userCode 
			    						+ "&nbsp;&nbsp;流程名称:" + flow.flowTypeStr
			    						+ "&nbsp;&nbsp;工单编号:" + flow.flowNo
			    						+ "<br/>";
			    			}
		    				info+="</td><td>该工单会在注销时强制结束,若可强制结束,点击\"确认保存\";<br/>若不能强制结束,点击\"取消\"</td>"; 
		    				//info+="<td><input type='radio' name='confirmFlow' value='false' checked='checked'/>暂不注销<br/><input type='radio' name='confirmFlow' value='true'/>强制完成后注销</td>";
			    			//info+="<td id='confirmFlowTip'>该项目未通过,请确认</td></tr>";
			    			info+='</tr>';
		    				$errorCheckTable.prepend(info);
		    				$('#confirmModify').removeAttr('disabled');
	    				} 
	    				if(orders&&orders.length>0){
	    					if(!checkAreaVisiable){
	    						$('.checkArea').show();
	    		    			checkAreaVisiable = true;
	    					}
		    				var info = "<tr id='optionalOrderTr'>";
		    				info+="<td>存在未完成订单<br/>(共"+orders.length+"个)</td><td>";
			    			for(var i=0;i<orders.length;i++){
			    				var order = orders[i];
			    				info+="订单编号:" +order.goodsOrderId+"<br/>";
			    			}
		    				info+="</td><td>请与总仓确认,若订单已完成,点击\"确认保存\",注销代理商;<br/>若未完成,点击\"取消\"不注销代理商</td>"; 
		    				//info+="<td><input type='radio' name='confirmOrder' value='false' checked='checked' />未与总仓确认<br/><input type='radio' name='confirmOrder' value='true' />已与总仓确认订单完成 </td>";
		    				//info+="<td id='confirmOrderTip'>该项目未通过,请确认</td>";
			    			info+='</tr>';
		    				$errorCheckTable.prepend(info);
		    				$('#confirmModify').removeAttr('disabled');
	    				}
	    			}
	    			// 优化任务  ARCH-2627 
	    			var data_message = data.message||'';
	    			if(data_message.length>4){
	    				data_message = data_message.substring(0,4);
	    			}
	    			if(data_message == "修改成功"){
	    				if('${org.parentOrg}' == ''){
		    				location.href="/org/list.do?orgProp=2"
	    				}else{
	    					if('${action}'!='modSta'){
		    					window.parent.$.fancybox.close();
		    					window.parent.location.reload();
	    					}else{
	    						window.location.href="/org/getNextOrg.do?orgUuid=${org.parentOrg }"
	    					}
	    				}
	    			}
	    		},
	    		error:function(data){
	    			data = eval("("+data+")")
	    			if(data == ""){
	        			alert('数据提交失败');
	        			$('#confirmModify').attr('disabled',"false");
	    			}else{
	    				alert(data.message);
	    			}
	    		}
	    	});
    }
    
    function writeMemo(){
	    	var memo = $("#orgMemo").val()
	    	if(memo==""){
	    		$("#orgMemo").val("请输入备注")
	    	}
	    	if(memo=="请输入备注"){
	    		$("#orgMemo").val("")
	    	}
	    	if(memo.length>50){
	    		alert("最多可输入50个字符");
	    		$("#orgMemo").val(memo.substr(0,50))
	    	}
    }
</script>
</body>
</html>
<!-- 2016年7月14日21:08:22 -->











