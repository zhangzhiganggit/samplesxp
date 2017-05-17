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
                                        运营经理卡发行
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
                                            <form class="form-inline form-horizontal" method="POST"	action="<%=request.getContextPath() %>/IcCardManage/addCard"	id="cardInitForm" name="cardInitForm" autocomplete="off" >
                                            	<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >卡号<span class="red">*</span></label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type=text id="card_id" name="card_id" value="${param.card_id }" 	 >
																<div id="card_id_text" class="red"></div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >卡内序列号<span class="red">*</span></label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type=text id="fact_sn" name="fact_sn" value="${param.fact_sn}"  >
																<div id="fact_sn_text" class="red"></div>
                                                        </div>
                                                    </div> 
                                                    
                                                   
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">操作人:</label>
                                                        <div class="col-sm-8   no-padding">
                                                           <input type=text id="create_user" name="create_user" value="${card.createUser}" disabled='disabled'   class="number form-control input-sm factIdLength digits " >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">操作日期：</label>
                                                        <input type="text" hidden="hidden" id="xxx" value="2">
                                                        <div class="col-sm-8   no-padding">
                                                           <input type=text id="create_time" name="create_time" value="${card.createTime}" class="number form-control input-sm factIdLength digits" disabled='disabled'  >
                                                        </div>
                                                    </div>

                                                </div>
                                                <input type="hidden" id="editIcbs" name="editIcbs" value="0" />
												<input type="hidden" id="ACTION" name="ACTION" value="RECE" />
												<div class=" center ">	
                                                <button id="faxingid" type="button" class="btn btn-sm btn-danger saveBtn" name="save"
																onclick="javaScript:ButtonSubmit();" id="savebtn">
																<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span> 发行
															</button>											
															<button type="button" class="btn  btn-sm" id="upbtn" onclick="cancle()">
																<span class="ace-icon fa 	 icon-on-right bigger-110"></span>取消
															</button>
															<Td>&nbsp;&nbsp;&nbsp;</Td>
															<span id="init_textdetail" class="red" >${message}</span>
															
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
    function ButtonSubmit(){
    	$("#faxingid").attr("disabled",true);
    	$("#card_id_text").html("");
    	$("#fact_sn_text").html("");
    	var regExp=/^\d+(\.\d+)?$/;
    	var card_id=$("#card_id").val().trim();
    	var fact_sn=$("#fact_sn").val().trim();
    	var cas=/^[0-9a-zA-Z]*$/g;
    	var Regy = /^[a-zA-Z]*$/g;
    	var Regz = /^[0-9]*$/g;
    	if(card_id.replace(/[ ]/g,"")==''){
    		$("#card_id_text").html("卡号为必输项");
    		$("#faxingid").attr("disabled",false);
    		return;
    	}else if(card_id.length!=6){
    		$("#card_id_text").html("请正确输入6位卡号");
    		$("#faxingid").attr("disabled",false);
    		return;
    	}else if(!regExp.test(card_id)){
    		$("#card_id_text").html("卡号由数字组成，请正确输入");
    		$("#faxingid").attr("disabled",false);
    		return;
    	}else if(fact_sn.replace(/[ ]/g,"")==''){
    		$("#fact_sn_text").html("卡内序列号为必输项");
    		$("#faxingid").attr("disabled",false);
    		return;
    	}else if(fact_sn.length>20){
    		$("#fact_sn_text").html("请正确输入20位以内卡序列号");
    		$("#faxingid").attr("disabled",false);
    		return;
    	}else if(!cas.test(fact_sn)){
    	    	$("#fact_sn_text").html("卡内序列号由数字或字母组成，请正确输入");
    	    	$("#faxingid").attr("disabled",false);
    	    	return;
    	}
    	
    	/*else if (Regy.test(fact_sn) || Regz.test(fact_sn)){
    		$("#fact_sn_text").html("卡内序列号由数字和字母组合组成，请正确输入");
        	$("#faxingid").attr("disabled",false);
        	return;
    	}*/
    	else{
    		$.ajax({
    			type : "GET",
    			url : "<%=request.getContextPath() %>/IcCardManage/validateCard?card_id=" + $("#card_id").val()+"&fact_sn="+ $("#fact_sn").val(),
    			dataType : "json",
    			cache : false,
    			success : function(data) {
    			if(data.resultState){
    				$("#cardInitForm").submit();
    			}else{
    				$("#init_textdetail").html("此卡号已存在,不能重复发行");
    				$("#faxingid").attr("disabled",false);
    				return;
    			}
    			},
    		error : function(e) { 	
    			$("#faxingid").attr("disabled",false);
    			alert("发行失败");
    			} 			
    		});

    		
    		
    	}
    	
    }
    function cancle(){
    	href ='<%=request.getContextPath() %>/IcCardManage/toQueryCardList';
    	window.location.href=href;
    }  
    
    
</script>
</body>
</html>