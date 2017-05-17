<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../../layout/common.jsp"%>
    <script type="text/javascript">

    function chk(){
 		var orgProp = $('#orgProp').val();
 		if( orgProp =="1" || orgProp =="2"){
 		  document.getElementById("orgNm").disabled="";
          document.getElementById("receName").disabled="";	 
 		}else if (orgProp =='' || orgProp ==null){
 		  document.getElementById("orgNm").disabled="disabled"; 
 		  document.getElementById("receName").disabled="disabled";
 		  document.getElementById("orgNm").value=''; 
		  document.getElementById("receName").value='';
 		}
     }
    </script>
    
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
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        运营经理卡冻结
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/IcCardManage/updateCardLoss" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >卡号：</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="hidden" id="id"  name="id" value="${card.id }" /> 
															 <input type="hidden" id="org_id"  name="org_id" value="${card.orgId }" /> 
															<input type=text id="card_id" name="card_id" readonly value="${card.cardId }" class="form-control input-small width-200px   view-control"  />
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >卡内序列号：</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type=text id="fact_sn" name="fact_sn"  readonly value="${card.factSn }" class="form-control input-small width-200px   view-control"  />
                                                        </div>
                                                    </div> 
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >卡状态：</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type=text readonly id="status" name="status" 
																<c:if test="${card.status==1 }">value="已发行"</c:if>
																<c:if test="${card.status==2 }">value="已领用"</c:if>
																<c:if test="${card.status==3 }">value="已冻结"</c:if>
																<c:if test="${card.status==-1 }">value="已作废"</c:if>
																class="form-control input-small width-200px   view-control"  />
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构性质:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <input type=text id="orgProp" name="orgProp" readonly 
															<c:if test="${card.orgProp==1 }">value="直营"</c:if>
															<c:if test="${card.orgProp==2 }">value="代理商"</c:if>
														 		class="form-control input-small width-200px   view-control" />
                                                            
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称：</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <input type=text id="org_name" name="org_name" readonly value="${card.orgNm }" class="form-control input-small width-200px   view-control" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >领用人姓名：</span></label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <input type=text id="rece_name" name="rece_name" readonly value="${card.receName }" class="form-control input-small width-200px   view-control" />
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px" id="tel">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >领用人手机号：</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <input type=text id="telphone" name="telphone" readonly value="${card.telphone}" class="form-control input-small width-200px   view-control" readonly/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >密码接收手机号<span class="red">*</span></label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <input type=text id="rece_tel" name="rece_tel"  value="${card.receTel }" class="form-control input-small width-200px    required"  readonly/>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >领用人编号：</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <input type=text id="rece_jn" name="rece_jn" readonly value="${card.receId}" class="form-control input-small width-200px   view-control"  />
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >巡检权限：</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                          <input type=text id="if_polling" name="if_polling" readonly 
															<c:if test="${card.ifPolling==1 }">value="是"</c:if>
															<c:if test="${card.ifPolling==0 }">value="否"</c:if>
														 		class="form-control input-small width-200px   view-control" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >下载pos密钥权限：</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <input type=text id="if_down_pass" name="if_down_pass" readonly 
															<c:if test="${card.ifDowmPass==1 }">value="是"</c:if>
															<c:if test="${card.ifDowmPass==0 }">value="否"</c:if>
														 		class="form-control input-small width-200px   view-control" /></td>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px" >
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >有效日期：</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="startTimeStart" name="startTimeStart" value="${card.startTime }" disabled='disabled' onchange="revalidateField();" class="form-control input-small   view-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="startTimeEnd" name="startTimeEnd" value="${card.stopTime }" disabled='disabled' onchange="revalidateField();" class="form-control input-small    view-control">
                                                            </div>
                                                        </div>
                     								</div>	
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">操作人:</label>
                                                        <div class="col-sm-8   no-padding">
                                                           <input type=text id="create_user" name="create_user" value="${card.modifyUser}" disabled='disabled'   class="form-control input-small width-200px   view-control " >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">操作日期：</label>
                                                        <input type="text" hidden="hidden" id="xxx" value="2">
                                                        <div class="col-sm-8   no-padding">
                                                           <input type=text id="create_time" name="create_time" value="${card.modifyTime}" class="form-control input-small width-200px   view-control" disabled='disabled'  >
                                                        </div>
                                                    </div>

                                                </div>
                                                <input type="hidden" id="editIcbs" name="editIcbs" value="0" />
												<input type="hidden" id="ACTION" name="ACTION" value="RECE" />
												<div class=" center ">	
                                                <button type="button" class="btn btn-sm btn-danger saveBtn" name="save" id="saveButton"
														onclick="bCancel=false" >
														<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span> 冻结
													</button>
									
													<button type="button" class="btn  btn-sm" id="upbtn" onclick="cancle()">
														<span class="ace-icon fa 	 icon-on-right bigger-110"></span>取消
													</button>	
													<span id="editmsg" class="blue"></span>
													<span id="init_textdetail" class="red" >${message}</span>
													<span id="rece_id_text" class="red"></span>
													</div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="row col-sm-12    ">
                            <div class="col-sm-4 hidden-480 left">
                            	<label class="dataTables_info " id="dynamic-table_info"
									role="status" aria-live="polite"></label>
                               </div>

                                <div class="col-sm-8 right">
                                    <%@include file="../../layout/pagination.jsp" %>
                                </div>
                        </div>
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../../layout/common.js.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">     
    jQuery(document).ready(function(){
    	jQuery("#saveButton").click(function(){
    		var val=$('#rece_jn option:selected').text();
    		$("#rece_name").val(val);
    		$("#searchForm").submit();
    	})		
    	hideTel();
    })
     function hideTel(){
        	$("#tel").show();
        	var orgProp=$("#orgProp").val();
        	if(orgProp=='直营'){
        		$("#tel").hide();
        	}
        }
    function cancle(){
    	href ='<%=request.getContextPath() %>/IcCardManage/toQueryCardList';
    	window.location.href=href;
    }
   
    
</script>
</body>
</html>