<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>工单禁审</title>

    <%@include file="../layout/common.jsp"%>
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
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
       <c:if test="${operatedTyp=='0'}">添加禁审规则 </c:if>
       <c:if test="${operatedTyp=='1'}">修改禁审规则 </c:if>
       <c:if test="${operatedTyp=='2'}">删除禁审规则 </c:if>
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
                                            <form class="form-inline form-horizontal" action="/forbidAudit/handleForbidAudit.do" id="batchForbidAuditForm" method="post">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:<font color="#FF0000">*</font></label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNo" id="orgNo" value="${orgNo}" onblur="getOrgNmByOrgNo()" class="form-control input-small width-200px" data-placement="bottom" data-rel="tooltip">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                             <input type="text" name="orgNm" id="orgNm" value="${orgNm}" class="form-control input-small width-200px" readonly="readonly">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单类型:<font color="#FF0000">*</font></label>
                                                        <div class="col-sm-8  no-padding">
                                                             <select data-placeholder="请选择" name="orderTyp" id="orderTyp" class="chosen-select form-control width-200px">
                                                                <option <c:if test="${orderTyp=='0'}"> selected </c:if> value="0">全部工单</option>
                                                                <option <c:if test="${orderTyp=='1'}"> selected </c:if> value="1">录入工单</option>
                                                                <option <c:if test="${orderTyp=='2'}"> selected </c:if> value="2">修改工单</option>
                                                            </select>
                                                        </div>
                                                    </div> 
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <div class="col-sm-8  no-padding"  >   
                                                        </div>
                                                    </div> 
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >原因:<font color="#FF0000">*</font></label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <textarea rows="3" cols="75" id="forbidAuditReason"
																		name="forbidAuditReason" style="resize: none"></textarea>
															<input type="hidden" id="operatedTyp" name="operatedTyp" value="${operatedTyp}"/>
															<input type="hidden" id="oldOrderTyp" name="oldOrderTyp" value="${orderTyp}"/>
															<input type="hidden" id="uuid" name="uuid" value="${uuid}"/>
															<input type="hidden" id="noBatchCount1" name="noBatchCount1" value="${noBatchCount1}"/>
															<input type="hidden" id="noBatchCount2" name="noBatchCount2" value="${noBatchCount2}"/>
															<input type="hidden" id="isAll" name="isAll"/>
                                                        </div>
                                               		 </div>                                                
                                                </div>
                                               <div class="form-actions center widget-color-normal5">
													<button class="btn btn-normal btn-sm" type="button" id="btnBatch"
														onclick="batchForbidAudit();">
														<span class="ace-icon fa  add icon-on-right bigger-110"></span>
														确定
													</button>
													<button class="btn  btn-sm" type="button" onclick="closeWin()">
														<span class="ace-icon fa 	 icon-on-right bigger-110"></span> 关闭
													</button>
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
								<%@include file="../layout/pagination.jsp" %>
							</div>
						</div>
                    </div>
                </div>
            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/task/task.js"></script>
    <script type="text/javascript">
    jQuery(function($) {
    	var operatedTyp=$("#operatedTyp").val();
    	if(operatedTyp=='1'){
    		$("#orgNo").attr("readonly","readonly");
    		$("#orgNm").attr("readonly","readonly");
    	}
    	if(operatedTyp=='2'){
    		$("#orgNo").attr("readonly","readonly");
    		$("#orgNm").attr("readonly","readonly");
    		$("#orderTyp").attr("disabled","disabled");
    	}
    });
					function strlen(str) {
						if (str != '' && str != undefined && str != null) {
							var len = 0;
							for (var i = 0; i < str.length; i++) {
								var c = str.charCodeAt(i);
								// 单字节加1
								if ((c >= 0x0001 && c <= 0x007e)
										|| (0xff60 <= c && c <= 0xff9f)) {
									len++;
								} else {
									len += 2;
								}
							}
							return len;
						}
					}

					function closeWin() {
						parent.$.fancybox.close();
					}
                    //通过机构编号获取机构名称
					function getOrgNmByOrgNo(){
						var orgNo=$("#orgNo").val();
						if(orgNo==""){
							alert("请输入机构编号！！");
							return;
						}
						var reg = new RegExp("^[0-9]+(\.[0-9]+)?$");   
					    if(!reg.test(orgNo)){  
					    	alert("请输入有效的机构编号！！");
					    	$("#orgNo").val("");
							return;
					    }
						$.ajax({
							cache : true,
							type : "POST",
							url : '/forbidAudit/getOrgNmByOrgNo',
							data : {
								orgNo:orgNo
							},// 你的formid
							async : false,
							error : function(data) {
								alert(data.msg);
							},
							success : function(data) {
								 if(data.regCode=='01'){
									 $("#orgNm").val(data.regMsg);
								 }else{
									 alert(data.regMsg);
									 $("#orgNo").val("");
								 }
							}
						});
					}
					
					function batchForbidAudit() {
						$("#btnAdd").attr('disabled', "true");
						var orgNo=$("#orgNo").val();
						if(orgNo==""||orgNo==null){
							alert("机构编号不能为空！！！");
							$("#btnAdd").removeAttr("disabled");
							return;
						}
						var forbidAuditReason = $("#forbidAuditReason").val().replace(/(^\s*)|(\s*$)/g,'');
						if (forbidAuditReason == ""
								|| forbidAuditReason == null) {
							alert("禁审原因不能为空！！！");
							$("#btnAdd").removeAttr("disabled");
							return;
						}
						var len = strlen(forbidAuditReason);
						var lens = len * 1;
						if (lens > 100) {
							alert("禁审/解禁原因超过100个字符，请核实后再填写！！！");
							$("#btnAdd").removeAttr("disabled");
							return;
						}
						var txt = new RegExp("[`~!@#$^&%*()=|{}\\[\\].<>/~！@#￥%……&*（）—|{}【】]");
					    if(forbidAuditReason.match(txt)){
					    	alert("您输入的原因中含有特殊字符，请检查后再提交！");
					    	$("#btnAdd").removeAttr("disabled");
							return;
					    }
					    
					    if($("#operatedTyp").val()=='1'){
					    	if($("#orderTyp").val()==$("#oldOrderTyp").val()){
					    		alert("该工单类型与原始类型相同，请你选择要修改的工单类型！！");
					    		$("#btnAdd").removeAttr("disabled");
					    		return;
					    	}
					    }
					   
					    var noBatchCount1=parseInt($("#noBatchCount1").val());
					    var noBatchCount2=parseInt($("#noBatchCount2").val());
					    var noBatchCount=0;
					    
					    if($("#operatedTyp").val()=='2'){
					    	noBatchCount=noBatchCount1;
					    }else if($("#operatedTyp").val()=='1'){
					    	if($("#oldOrderTyp").val()=='0'&&$("#orderTyp").val()=='1'){
					    		noBatchCount=noBatchCount2;
					    	}else if($("#oldOrderTyp").val()=='0'&&$("#orderTyp").val()=='2'){
					    		noBatchCount=noBatchCount1;
					    	}else if($("#oldOrderTyp").val()=='1'&&$("#orderTyp").val()=='2'){
					    		noBatchCount=noBatchCount1;
					    	}else if($("#oldOrderTyp").val()=='2'&&$("#orderTyp").val()=='1'){
					    		noBatchCount=noBatchCount1;
					    	}
					    }
					    
					    if($("#operatedTyp").val()!='0'&&noBatchCount!=0){
						    var r=confirm("数据中含有"+noBatchCount+"条单条禁审记录,是否要对其进行操作？");
								if (r) {
									$("#isAll").val("1");
								}else{
									$("#isAll").val("0");
								}
					    }
					    
						$.ajax({
							cache : true,
							type : "POST",
							url : '/forbidAudit/handleForbidAudit.do',
							data : $('#batchForbidAuditForm').serialize(),// 你的formid
							async : false,
							error : function(data) {
								alert(data.regMsg);
							},
							success : function(data) {
								alert(data.regMsg);
								parent.$.fancybox.close();
							}
						});
					}
				
    </script>
</body>
</html>