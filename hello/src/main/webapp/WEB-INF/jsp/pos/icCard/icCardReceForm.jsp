<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../../layout/common.jsp"%>
<script type="text/javascript">

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
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 运营经理卡领用
									</h5>
									<span class="widget-toolbar"> <a data-action="collapse"
										href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal"
												action="<%=request.getContextPath() %>/IcCardManage/updateCardRece.do"
												id="searchForm" method="post">
												<input type="hidden" name="pageNum"
													value="${pageInfo.pageNum }"> <input type="hidden"
													name="pageSize" value="${pageInfo.pageSize }">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">卡号：</label>

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
																class="form-control input-small width-200px   view-control" />
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构性质<span
															class="red">*</span></label>
														<div class="col-sm-8  no-padding">
															<select id="nature" name="nature"
																class="chosen-select form-control width-200px"
																style="height: 29px; width: 175px"
																onchange="getOrgName()">
																<option value="">请选择</option>
																<option value="1">直营</option>
																<option value="2">代理</option>
															</select>

														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">分公司:<span
															class="red">*</span></label>
														<div class="col-sm-8  no-padding">
															<select name="orgName" id="orgName"
																onchange="getOrgNameById()"
																class="chosen-select form-control width-200px">
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px"
														id="orgSon">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">代理机构:<span
															class="red">*</span></label>
														<div class="col-sm-8  no-padding">
															<select name="orgName1" id="orgName1"
																onchange="getOrgNameById1()"
																class="chosen-select form-control width-200px">
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px" id="receName">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">领用人姓名<span
															class="red">*</span></label>
														<div class="col-sm-8  no-padding">
														<input type="hidden" id="receNm" name="receNm" value="">
															<select name="rece_name" id="rece_name"
																class="chosen-select form-control width-200px"
																onchange="getUserCode()">
																<!-- ui-autocomplete-loadingbefore -->
															</select>

														</div>
													</div>
													<div class="form-group form-group-sm width-300px" id="receTel">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">密码接收手机号<span
															class="red">*</span></label>

														<div class="col-sm-8  no-padding">
															<input type=text id="rece_tel" name="rece_tel" value="${card.receTel }"
																class="form-control input-small width-200px    required" />
														</div>
													</div>
													<div class="form-group form-group-sm width-300px" id="receJn">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">领用人工号：</label>

														<div class="col-sm-8  no-padding">
															<input type=text id="rece_jn" name="rece_jn" readonly
																value="${card.receId}"
																class="form-control input-small width-200px   view-control" />
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">巡检权限：</label>

														<div class="col-sm-8  no-padding">
															<select id="if_polling" name="if_polling"
																class="form-control input-small width-200px   view-control">
																<option value="1"
																	<c:if test="${card.ifPolling=='1'}">selected</c:if>>是</option>
																<option value="0"
																	<c:if test="${card.ifPolling=='0'}">selected</c:if>>否</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">下载pos密钥权限：</label>

														<div class="col-sm-8  no-padding">
															<select id="if_down_pass" name="if_down_pass"  data-placeholder="1" 
																class="form-control input-small width-200px   view-control">
																<option value="1"
																	>是</option>
																<option value="0"
																	>否</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">有效日期<span
															class="red">*</span></label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="startTimeStart"
																	name="startTimeStart" value="${card.startTime }"
																	onchange="changeDateStart()"
																	class="input-small form-control"> <span
																	class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" id="startTimeEnd"
																	name="startTimeEnd" value="${card.stopTime }"
																	onchange="changeDateEnd()"
																	class="input-small form-control">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">发行日期：</label>

														<div class="col-sm-8  no-padding">
															<input type=text id="publishDate" name=publishDate
																value="${card.publishDate}"
																class="number form-control input-sm factIdLength digits"
																disabled='disabled'>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">解冻日期：</label>

														<div class="col-sm-8  no-padding">
															<input type=text id="thawDate" name="thawDate"
																value="${card.thawDate}"
																class="form-control input-small width-200px   view-control"
																disabled='disabled'>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">操作人:</label>
														<div class="col-sm-8   no-padding">
															<input type=text id="create_user" name="create_user"
																value="${card.modifyUser}" disabled='disabled'
																class="form-control input-small width-200px   view-control ">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">操作日期：</label>
														<input type="text" hidden="hidden" id="xxx" value="2">
														<div class="col-sm-8   no-padding">
															<input type=text id="create_time" name="create_time"
																value="${card.modifyTime}"
																class="number form-control input-sm factIdLength digits"
																disabled='disabled'>
														</div>
													</div>

												</div>
												<input type="hidden" id="editIcbs" name="editIcbs" value="0" />
												<input type="hidden" id="ACTION" name="ACTION" value="RECE" />
												<div class=" center ">
													<button type="button" class="btn btn-danger btn-sm"
														name="save" id="saveButton" onclick="doIt()">
														<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
														领用
													</button>

													<button type="button" class="btn btn-default btn-sm"
														id="upbtn" onclick="cancle()">
														<span
															class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>关闭
													</button>
													<span id="rece_id_text" class="red"></span> <span
														id="init_textdetail" class="red">${message}</span>
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
								<%@include file="../../layout/pagination.jsp"%>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->

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

        	$('#searchForm').formValidation({ }); 

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


    })
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
     /* //机构性质，机构名称，领用人之间关系   
    
		function disabledReceName(){
    	var orgNm = $('#orgNm').val();
    	var orgProp = $('#orgProp').val();
    	var receName=$('#receName').val();

		if((orgProp =="1" || orgProp =="2") && (orgNm=='' || orgNm==null) ){
			if(receName==''||receName==null){
			}else{
	    		
	    		alert('请填写机构名称');
	    		return false;
			}
    	}
		
    	return true;
    } */
		function doIt(){
			var rt=$("#rece_tel").val().trim();
			var rlName=$("#rece_name").val();
			var nature=$("#nature").val();
			var orgName1=$("#orgName1").val();
			var startTimeStart=$("#startTimeStart").val().trim();
			var startTimeEnd=$("#startTimeEnd").val().trim();
			
			var pareg=/^\d+(\.\d+)?$/;
			
			if(nature!=2){
				if(rlName==null||rlName==""){
					alert("领用人姓名不能为空 ");
					return;
				}
				if(rt.length!=11){
					alert("请输入11位数的手机号");
					return;
				}
				if(!pareg.test(rt)){
					alert("手机号由11位数字组成，请正确输入");
					return;
				}
			}
			if(nature!=1){
				if(orgName1==null||orgName1==""){
					alert("代理机构不能为空 ");
					return;
				}
			}
			if(rt==''||rt==null){
				alert("手机号为必输项");
				return;
			}
			if (startTimeEnd==''){
				alert("有效期结束不能为空！");
				return ;
			}
			if (startTimeStart==''){
				alert("有效期开始不能为空！");
				return ;
			}
			if (startTimeStart>startTimeEnd){
				alert("有效期开始不能大于有效期结束！");
				return ;
			}
			if(nature!=2){
				$.ajax({
					type : "GET",
					url : "<%=request.getContextPath() %>/IcCardManage/selectFrom?rece_id="+rlName,
					dataType : "json",
					cache : false,
					success : function(data) {
						if(data.result){
							$("#rece_id_text").html(data.detail);
							return;
						}else{
					    	document.getElementById("searchForm").submit();
						}	
					},
				error : function(e) { 				
					alert("查询失败");
					$("#searchBtn").val("查询");
					} 			
				});	
			}else{
				document.getElementById("searchForm").submit();
			}
		}
    function getOrgName(){
    	$("#receName").show();
		$("#receJn").show();
    	var natureval=$("#nature").val();
   	 $.ajax({ url:"<%=request.getContextPath() %>/IcCardManage/getOrgName?natureval="+natureval,
   		 dataType: "json",
            type: "GET",
            async: false,
            cache:false,
            success: function(data){
            $("#orgName").empty();  
            $("#orgName").chosen("destroy");
            $("#orgName").append("<option  value=''>请选择</option>");
           for(var i=0;i<data.length;i++){
           	 $("#orgName").append("<option  value='"+data[i].orgUuid+"'>"+data[i].orgNm+"</option>");
            }
           $("#orgName").chosen({});
            $("#orgName").trigger("liszt:updated");
   	 }
        });
   	 if(natureval==1){    
   			$("#if_down_pass").removeAttr("disabled","disabled");
   			$("#if_down_pass").val("1");
   			$("#if_down_pass").trigger("chosen:updated");
    		$("#orgName1").attr("disabled","disabled"); 
    		$("#orgName1").empty();
    		$("#orgName1").chosen("destroy");
    		$("#orgName1").append("<option  value=''>请选择</option>");
    		$("#orgName1").chosen({});
    		$("#orgName1").trigger("liszt:updated");
    		$("#rece_name").empty();
    		$("#rece_name").chosen("destroy");
    		$("#rece_name").append("<option  value=''>请选择</option>");
    		$("#rece_name").chosen({});
    		$("#rece_name").trigger("liszt:updated");
    	}else if(natureval==null||natureval==""){
    		$("#if_down_pass").removeAttr("disabled","disabled"); 
    		$("#if_down_pass").val("1");
    		$("#if_down_pass").trigger("chosen:updated");
    		$("#orgName").empty();
    		$("#orgName").chosen("destroy");
    		$("#orgName").append("<option  value=''>请选择</option>");
    		$("#orgName").chosen({});
    		$("#orgName").trigger("liszt:updated");
    		$("#orgName1").attr("disabled","disabled"); 
    		$("#orgName1").empty();
    		$("#orgName1").chosen("destroy");
    		$("#orgName1").append("<option  value=''>请选择</option>");
    		$("#orgName1").chosen({});
    		$("#orgName1").trigger("liszt:updated");
    		$("#rece_name").empty();
    		$("#rece_name").chosen("destroy");
    		$("#rece_name").append("<option  value=''>请选择</option>");
    		$("#rece_name").chosen({});
    		$("#rece_name").trigger("liszt:updated");
    	}else{
    		$("#orgName1").removeAttr("disabled","disabled"); 
    		$("#orgName1").empty();
    		$("#orgName1").chosen("destroy");
    		$("#orgName1").append("<option  value=''>请选择</option>");
    		$("#orgName1").chosen({});
    		$("#orgName1").trigger("liszt:updated");
    		$("#rece_name").empty();
    		$("#rece_name").chosen("destroy");
    		$("#rece_name").append("<option  value=''>请选择</option>");
    		$("#rece_name").chosen({});
    		$("#rece_name").trigger("liszt:updated");
    		$("#if_down_pass").val("0");
    		$("#if_down_pass").trigger("chosen:updated");
    		$("#if_down_pass").attr("disabled","disabled"); 
    		$("#receName").hide();
    		$("#receJn").hide();
    	}   
   	getUserCode(); //设置领取人工号值
    }	
    function getOrgNameById(){
    	 var orgId=$("#orgName").val();
    	 var consuming=$("#rece_name");
    	 var natureval=$("#nature").val();
    	 if(natureval==1){
    		 if(orgId!=''){
        		 $.ajax({ url:"<%=request.getContextPath() %>/IcCardManage/getUserNamesByOrgId?orgId="+orgId,
        				dateType:"json",
        				type:"GET",
        				async:false,
        				cache:false,
        				success:function(data){
        					consuming.empty();	
        					consuming.chosen("destroy");
        					consuming.append("<option  value=''>请选择</option>");
        					for(var i=0;i<data.length;i++){
        					consuming.append("<option  value='"+data[i].empNo+"'>"+data[i].empNm+"</option>");
        			    	 }
        					consuming.chosen({});
        					consuming.trigger("liszt:updated");
        				}
        			}); 
        		$("#orgName1").empty();
         		$("#orgName1").chosen("destroy");
         		$("#orgName1").append("<option  value=''>请选择</option>");
         		$("#orgName1").chosen({});
         		$("#orgName1").trigger("liszt:updated");
        	 }else{
        		 consuming.empty();
        		 consuming.chosen("destroy");
        		 consuming.append("<option  value=''>请选择</option>");
        		 consuming.chosen({});
        		 consuming.trigger("liszt:updated");
        		}
    	 }else{
    		  $.ajax({ url:"<%=request.getContextPath() %>/IcCardManage/getOrg?orgUuid="+orgId,
    	   		 dataType: "json",
    	            type: "GET",
    	            async: false,
    	            cache:false,
    	            success: function(data){
    	            $("#orgName1").empty();  
    	            $("#orgName1").chosen("destroy");
    	            $("#orgName1").append("<option  value=''>请选择</option>");
    	           for(var i=0;i<data.length;i++){
    	           	 $("#orgName1").append("<option  value='"+data[i].orgUuid+"'>"+data[i].orgNm+"</option>");
    	            }
    	            $("#orgName1").chosen({});
    	            $("#orgName1").trigger("liszt:updated");
    	   	 	}
    	        });    	
    		 consuming.empty();
     		 consuming.chosen("destroy");
     		 consuming.append("<option  value=''>请选择</option>");
     		 consuming.chosen({});
     		 consuming.trigger("liszt:updated");
    	 }        	
    	getUserCode(); //设置领取人工号值
    }
    function getOrgNameById1(){
   	 var orgId=$("#orgName1").val();
   	 var consuming=$("#rece_name");   	
       		 $.ajax({ url:"<%=request.getContextPath() %>/IcCardManage/getUserNamesByOrgId?orgId="+orgId,
       				dateType:"json",
       				type:"GET",
       				async:false,
       				cache:false,
       				success:function(data){
       					consuming.empty();	
       					consuming.chosen("destroy");
       					consuming.append("<option  value=''>请选择</option>");
       					for(var i=0;i<data.length;i++){
       					consuming.append("<option  value='"+data[i].empNo+"'>"+data[i].empNm+"</option>");
       			    	 }
       					consuming.chosen({});
       					consuming.trigger("liszt:updated");
       				}
       			});   
   	getUserCode(); //设置领取人工号值
   }
    function getUserCode(){
    	var receCode = $("#rece_name").val();
    	var receNm=document.getElementById("rece_name").options[document.getElementById("rece_name").selectedIndex].text;
    	if(receCode!=""){
	    	$("#receNm").val(receNm);
    	}
    	$("#rece_jn").attr("value",receCode);
    } 
    function cancle(){
    	href ='<%=request.getContextPath() %>/IcCardManage/toQueryCardList.do';
    	window.location.href=href;
    }
    function changeDateStart(){
 		 var creStartTm=Number($("#startTimeStart").val().replace(/-/g,''));
 		 var creEndTm=Number($("#startTimeEnd").val().replace(/-/g,''));
 		 if(creEndTm!=0){
 			 if(creStartTm>creEndTm){
 				 $("#startTimeEnd").val($("#startTimeStart").val());
 			 }
 		 }
 	 }
 	 function changeDateEnd(){
 		 var creStartTm=Number($("#startTimeStart").val().replace(/-/g,''));
 		 var creEndTm=Number($("#startTimeEnd").val().replace(/-/g,''));
 		 if(creStartTm!=0){
 			 if(creStartTm>creEndTm){
 				 $("#startTimeStart").val($("#startTimeEnd").val());
 			 }
 		 }
 	 }
   
    
</script>
</body>
</html>