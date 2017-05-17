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
                                        运营经理卡修改
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/IcCardManage/updateCard" id="searchForm" method="post">
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
                                                           <input type=text id="rece_tel" name="rece_tel"  value="${card.receTel }" class="form-control input-small width-200px    required"  />
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
                                                           <select id="if_polling" name="if_polling"  class="form-control input-small width-200px   view-control">
																<option value="1" <c:if test="${card.ifPolling=='1'}">selected</c:if>>是</option>
																<option value="0" <c:if test="${card.ifPolling=='0'}">selected</c:if>>否</option>
															</select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >下载pos密钥权限：</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="if_down_pass" name="if_down_pass" class="form-control input-small width-200px   view-control">
																<option value="1" <c:if test="${card.ifDowmPass=='1'}">selected</c:if>>是</option>
																<option value="0" <c:if test="${card.ifDowmPass=='0'}">selected</c:if>>否</option>
															</select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px" >
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >有效日期<span class="red">*</span></label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="startTimeStart" name="startTimeStart" value="${card.startTime }" onchange="revalidateField();" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="startTimeEnd" name="startTimeEnd" value="${card.stopTime }" onchange="revalidateField();" class="input-small form-control">
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
                                                <button type="submit" class="btn btn-danger btn-sm" name="saveButton" id="saveButton"
													onclick="return check();" id="saveButton">
													<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span> 保存
													</button>				
													<button type="button" class="btn btn-normal btn-sm" id="upbtn" onclick="cancle()">
														<span class="ace-icon fa 	 icon-on-right bigger-110"></span>取消
													</button>
													<button type=button id="iced" name="iced" onclick="editIC()" class="btn btn-primary btn-sm" >
													<span class="ace-icon fa 	 icon-on-right bigger-110"></span>重置运营经理卡口令</button>
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
      function revalidateField(){
    	  
    	revalidateFieldByFieldName('searchForm','stopTimeStart');
    	revalidateFieldByFieldName('searchForm','stopTimeEnd');
    	 
    	revalidateFieldByFieldName('searchForm','receDateStart');
    	revalidateFieldByFieldName('searchForm','receDateEnd'); 
      }


        $('.chosen-select').chosen({});
        jQuery(function($) {

        	$('#searchForm').formValidation({
                message: 'This value is not valid',
                container:'popover',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
          
            fields: {
            	stopTimeStart: {
                    validators: {
                        
                        dateSub: {
                        	dayLength:1
                        }
                    }
                },
                stopTimeEnd: {
                    validators: {
                        
                        dateSub: {
                        	dayLength:1
                        }
                    }
                },
                
                receDateStart: {
                    validators: {
                        
                        dateSubs: {
                        	dayLength:1
                        }
                    }
                },
                receDateEnd: {
                    validators: {
                        
                        dateSubs: {
                        	dayLength:1
                        }
                    }
                }
                
               }
        });

        $('.easy-pie-chart.percentage').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size/10),
                animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
                size: size
            });
        })

        $('.sparkline').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
            $(this).sparkline('html',
                {
                    tagValuesAttribute:'data-values',
                    type: 'bar',
                    barColor: barColor ,
                    chartRangeMin:$(this).data('min') || 0
                });
        });
        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });



        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        })
//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});

//        $('#date-timepicker1').datetimepicker({language: 'zh-CN'}).next().on(ace.click_event, function(){
//            $(this).prev().focus();
//        });

	hideTel();
    })
    function hideTel(){
        	$("#tel").show();
        	var orgProp=$("#orgProp").val();
        	if(orgProp=='直营'){
        		$("#tel").hide();
        	}
        }
        
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }

        function editIC(){
        	
        		$("#iced").attr('disabled',true);
        		var recephone=$("#rece_tel").val().trim();
        		var pt=/^\d+(\.\d+)?$/;
        		var c_id=$('#card_id').val();
        		if(recephone==''){
        			alert("手机号为必输项");
        			$("#iced").attr('disabled',false);
        			return ;
        		}else if(recephone.length!=11){
        			alert("请输入11位数的手机号");
        			$("#iced").attr('disabled',false);
        			return ;
        		}else if(!pt.test(recephone)){
        			alert("手机号由11位数字组成，请正确输入");
        			$("#iced").attr('disabled',false);
        			return ;
        		}else{
        			$.ajax({url:"<%=request.getContextPath() %>/IcCardManage/resetpwd?rece_tel="+recephone+"&card_id="+c_id,
        					dateType:"json",
        					type:"GET",
        					async:false,
        					cache:false,
        					success:function(data){
        						
        							$("#editmsg").html("重置IC 卡口令成功，请点击保存成功后能接收到新口令，否则重置无效");	
        							$("#editIcbs").attr("value","1");
        							flag = 1;
        												
        					}
        			});
        		}
        	}
        function cancle(){
        	href ='<%=request.getContextPath() %>/IcCardManage/toQueryCardList';	
        	window.location.href=href;
        }
        function check(){
       	 var startTimeStart=$("#startTimeStart").val().trim();
       		var startTimeEnd=$("#startTimeEnd").val().trim();		
       		$("#iced").attr('disabled',true);
       		var recephone=$("#rece_tel").val().trim();
       		var pt=/^\d+(\.\d+)?$/;
       		var c_id=$('#card_id').val();
       		if(recephone==''){
       			alert("手机号为必输项");
       			$("#iced").attr('disabled',false);
       			return false;
       		}else if(recephone.length!=11){
       			alert("请输入11位数的手机号");
       			$("#iced").attr('disabled',false);
       			return false;
       		}else if(!pt.test(recephone)){
       			alert("手机号由11位数字组成，请正确输入");
       			$("#iced").attr('disabled',false);
       			return false;
       		}else if (startTimeEnd==''){
       			alert("有效期结束不能为空！");
       			$("#iced").attr('disabled',false);
       			return false;
       		}else if (startTimeStart==''){
       			alert("有效期开始不能为空！");
       			$("#iced").attr('disabled',false);
       			return false;
       		}else if (startTimeStart>startTimeEnd){
       			alert("有效期开始不能大于有效期结束！");
       			$("#iced").attr('disabled',false);
       			return false;
       		}else {
       	 return true ;
       		}
        } 
  
   
    
</script>
</body>
</html>