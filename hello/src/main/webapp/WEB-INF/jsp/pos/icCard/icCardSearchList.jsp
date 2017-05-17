<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
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
 		var branchName1 = $('#branchName1').val();
 		if (orgProp =='' || orgProp ==null){
 			$("#orgUId").removeAttr("disabled","disabled"); 
 			$("#orgNm").removeAttr("disabled","disabled"); 
 			$("#receName").removeAttr("disabled","disabled"); 
 			$("#branchId").removeAttr("disabled","disabled"); 
		  document.getElementById("receName").value='';
		  document.getElementById("orgNm").value='';
		  $("#orgUId").val("");
          $("#orgUId").trigger("chosen:updated");
          if(branchName1=="0010000000"){
	          $("#branchId").val("");
	          $("#branchId").trigger("chosen:updated");
          }
 		}else if(orgProp ==1){
 			$("#orgUId").attr("disabled","disabled"); 
 			$("#orgNm").attr("disabled","disabled"); 
 			$("#receName").removeAttr("disabled","disabled"); 
 			$("#branchId").removeAttr("disabled","disabled"); 
 			if(branchName1=="0010000000"){
 		          $("#branchId").val("");
 		          $("#branchId").trigger("chosen:updated");
 	          }
    		 $("#orgUId").chosen("destroy"); 
     	   	 $("#orgUId").html('<option value="">全部</option>');
     	   	 $("#orgUId").chosen({});
             $("#orgUId").trigger("chosen:updated");
             document.getElementById("orgNm").value='';
 		}else {
 			$("#orgUId").removeAttr("disabled","disabled"); 
 			$("#orgNm").removeAttr("disabled","disabled"); 
 			$("#receName").removeAttr("disabled","disabled"); 
 			$("#branchId").removeAttr("disabled","disabled"); 
 			if(branchName1=="0010000000"){
 		          $("#branchId").val("");
 		          $("#branchId").trigger("chosen:updated");
 	          }
    		 $("#orgUId").chosen("destroy"); 
     	   	 $("#orgUId").html('<option value="">全部</option>');
     	   	 $("#orgUId").chosen({});
             $("#orgUId").trigger("chosen:updated");
             document.getElementById("orgNm").value='';
 		}
     }
    function getOrg(){
    	var orgUuid =$("#branchId").val();
    	if(orgUuid!=null && orgUuid!=""){
	    	$.ajax({ 
	    		url:"<%=request.getContextPath() %>/IcCardManage/getOrg",
				type:"GET",
				data: {
			    	   orgUuid : orgUuid
		  		        },
				async:false,
				cache:false,
				success:function(orgNameList){
					if(orgNameList != null && orgNameList !=undefined){
						var options = '';
	      	 			options = "<option value=''>全部</option>";
					for(var i=0;i<orgNameList.length;i++){
						options+="<option value=\""+orgNameList[i].orgUuid+"\">"+orgNameList[i].orgNm+"</option>";
			    	 }
					 $("#orgUId").html(options);
			         $("#orgUId").trigger("chosen:updated");
					}
				}
			}); 
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
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 运营经理卡查询条件
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
												action="<%=request.getContextPath() %>/IcCardManage/queryCardList.do"
												id="searchForm" method="post">
												<input type="hidden" name="pageNum"
													value="${pageInfo.pageNum }"> <input type="hidden"
													name="pageSize" value="${pageInfo.pageSize }">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构性质:</label>

														<div class="col-sm-8  no-padding">
															<select data-placeholder="全部" id="orgProp" name="orgProp"
																class="chosen-select form-control width-200px"
																onchange="chk();">
																<option value=''>全部</option>
																<option value="1"
																	<c:if test="${card.orgProp == '1'}">selected="selected"</c:if>>直营</option>
																<option value="2"
																	<c:if test="${card.orgProp == '2'}">selected="selected"</c:if>>代理</option>

															</select>

														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<input type="hidden" name="branchName1" id="branchName1"
																value="${card.orgId  }"> 
															<select data-placeholder="全部" name="branchId" id="branchId"
																class="chosen-select form-control width-200px"
																onchange="getOrg()">
																<c:if test="${card.orgId=='0010000000'}">
																	<option value="">全部</option>
																</c:if>
																<c:forEach items="${orgNameList }" var="org">
																	<option value="${org.orgUuid }"
																		<c:if test="${card.branchId == org.orgUuid }"> selected="selected" </c:if>>${org.orgNm }</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属机构:</label>
														<div class="col-sm-8  no-padding">
															<input type="hidden" name="orgName1" id="orgName1"
																value="${card.orgUId  }"> <select
																data-placeholder="全部" name="orgUId" id="orgUId"
																class="chosen-select form-control width-200px">
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">直属机构:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="orgNm" id="orgNm"
																value="${card.orgNm}"
																class="form-control input-small width-200px" />
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">领用人:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="receName" id="receName"
																value="${card.receName }"
																class="form-control input-small width-200px" />
														</div>
													</div>
													<!-- 添加卡号过滤 -->

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">卡号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="cardId" id="cardId"
																value="${card.cardId }"
																class="form-control input-small width-200px"
																onkeyup="this.value=this.value.replace(/\D/g,'')">

														</div>
													</div>
													<!-- 添加卡号过滤end -->

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">序列号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factSn" id="factSn"
																value="${card.factSn }"
																class="form-control input-small width-200px"
																onkeyup="value=value.replace(/[^\dA-Za-z]/g,'')">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态:</label>

														<div class="col-sm-8  no-padding">
															<select data-placeholder="所有" id="status" name="status"
																class="chosen-select form-control width-200px">
																<option value=''>所有</option>
																<option value="1"
																	<c:if test="${card.status == 1}">selected="selected"</c:if>>已发行</option>
																<option value="2"
																	<c:if test="${card.status == 2}">selected="selected"</c:if>>已领用</option>
																<option value="3"
																	<c:if test="${card.status == 3}">selected="selected"</c:if>>已冻结</option>
																<option value="-1"
																	<c:if test="${card.status == -1}">selected="selected"</c:if>>已作废</option>
															</select>

														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">生效日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="startTimeStart"
																	name="startTimeStart" value="${card.startTimeStart }"
																	class="input-small form-control" onchange="changeDateStart1()"> <span
																	class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" id="startTimeEnd"
																	name="startTimeEnd" value="${card.startTimeEnd }"
																	class="input-small form-control" onchange="changeDateEnd1()">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">失效日期:</label>
														<input type="text" hidden="hidden" id="xxx" value="2">
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="stopTimeStart"
																	name="stopTimeStart" value="${card.stopTimeStart }"
																	onchange="changeDateStart2()"
																	class="input-small form-control"> <span
																	class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" id="stopTimeEnd" name="stopTimeEnd"
																	value="${card.stopTimeEnd }"
																	onchange="changeDateEnd2()"
																	class="input-small form-control">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">领用日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="receDateStart"
																	name="receDateStart" value="${card.receDateStart }"
																	onchange="changeDateStart3()"
																	class="input-small form-control"> <span
																	class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" id="receDateEnd" name="receDateEnd"
																	value="${card.receDateEnd }"
																	onchange="changeDateEnd3()"
																	class="input-small form-control">
															</div>
														</div>
													</div>

												</div>
												<button class="btn btn-normal btn-sm" type="submit"
													onclick="return disabledReceName()">
													<span
														class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												 <button class="btn btn-info btn-sm" type="button"
													onclick="resetMecForm()">
													   <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span> 清空检索条件
												</button>
												<c:if test="${loginUserPermission.SMSA_IC_CARD_003!=null}">
													<c:if test="${cards.orgId=='0010000000' }">
														<button class="btn btn-primary btn-sm" type="button"
															onclick="return prepareAddCard()">
															<span
																class="ace-icon fa fa-search icon-on-right bigger-110"></span>
															发行
														</button>
													</c:if>
												</c:if>
											</form>
										</div>
									</div>
								</div>
							</div>
							<c:if test="${null!=resultFlag}">
								<div class="alert alert-success ">
									<a href="#" data-dismiss="alert" class="close">×</a>
									${resultFlag} <br>

								</div>
							</c:if>
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 运营经理卡查询结果
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 5%">卡号</th>
													<th style="text-align: center; width: 8%">序列号</th>
													<th style="text-align: center; width: 5%">状态</th>
													<th style="text-align: center; width: 6%">归属分公司</th>
													<th style="text-align: center; width: 6%">所属机构</th>
													<th style="text-align: center; width: 6%">直属机构</th>
													<th style="text-align: center; width: 6%">生效日期</th>
													<th style="text-align: center; width: 6%">失效日期</th>
													<th style="text-align: center; width: 6%">领用日期</th>
													<th style="text-align:center;width: 6%">领用人姓名</th>
													<th style="text-align: center; width: 5%">巡检权限</th>
													<th style="text-align: center; width: 5%">下载密钥权限</th>
													<th style="text-align: center; width: 4%">IC卡密码</th>
													<c:if test="${loginUserPermission.SMSA_IC_CARD_003!=null}">
														<th style="text-align: center; width: 10%">操作</th>
													</c:if>

												</tr>
											</thead>

											<tbody>
												<c:forEach items="${icCardSearchList}" var="card"
													varStatus="status">
													<tr>
														<td style="text-align: center">${card.cardId}</td>
														<td style="text-align: center;">${card.factSn}</td>
														<td style="text-align: center"><c:if
																test="${card.status==1}">已发行</c:if> <c:if
																test="${card.status==2}">已领用</c:if> <c:if
																test="${card.status==3}">已冻结</c:if> <c:if
																test="${card.status==-1}">已作废</c:if></td>
														<td style="text-align: center">${card.branchName}</td>
														<td style="text-align: center">${card.orgName}</td>
														<td style="text-align: center">${card.orgNm}</td>
														<td style="text-align: center">${card.startTime}</td>
														<td style="text-align: center">${card.stopTime}</td>
														<td style="text-align: center">${card.receDate}</td>
														<td style="text-align:center">${card.receName}</td>
														<td style="text-align: center"><c:if
																test="${card.ifPolling=='1'}">是</c:if> <c:if
																test="${card.ifPolling=='0'}">否</c:if></td>
														<td style="text-align: center"><c:if
																test="${card.ifDowmPass=='1'}">是</c:if> <c:if
																test="${card.ifDowmPass=='0'}">否</c:if></td>
														<td style="text-align: center">
															<div class="action-buttons">
																<a href="#"
																	onclick="mecIfdetailShow('${card.password}')"
																	class="blue fancybox-manual-b"> <i
																	class="ace-icon fa  blue bigger-130"><font size="2">查看</font></i>
																</a>
															</div>
														</td>
														<c:if test="${loginUserPermission.SMSA_IC_CARD_003!=null}">
														<td style="text-align: center">
															<div class="action-buttons">
																<c:if
																	test="${card.status!=1 }">
																	<a href="#"
																		onclick="selectOption('${card.cardId}','${card.orgId}','prepareNewCard')"
																		class="blue fancybox-manual-b"> <i
																		class="ace-icon fa blue bigger-130"><font
																			size="2">查看详情</font></i>
																	</a>
																</c:if>
																<c:if
																	test="${card.status==2 && cards.orgId=='0010000000'}">
																	<a href="#"
																		onclick="selectOption('${card.cardId}','${card.orgId}','prepareUpdateCard')"
																		class="blue fancybox-manual-b"> <i
																		class="ace-icon fa blue bigger-130"><font
																			size="2">修改</font></i>
																	</a>
																	<a href="#"
																		onclick="selectOption('${card.cardId}','${card.orgId}','prepareUpdateCardTakeback')"
																		class="blue fancybox-manual-b"> <i
																		class="ace-icon fa blue bigger-130"><font
																			size="2">回收</font></i>
																	</a>
																</c:if>
																<c:if
																	test="${card.status==1 && cards.orgId=='0010000000'}">
																	<a href="#"
																		onclick="selectOption('${card.cardId}','${card.orgId}','prepareUpdateCardRece')"
																		class="blue fancybox-manual-b"> <i
																		class="ace-icon fa blue bigger-130"><font
																			size="2">领用</font></i>
																	</a>
																</c:if>
																<c:if
																	test="${card.status==2 && cards.orgId=='0010000000'}">
																	<a href="#"
																		onclick="selectOption('${card.cardId}','${card.orgId}','prepareUpdateCardLoss')"
																		class="blue fancybox-manual-b"> <i
																		class="ace-icon fa blue bigger-130"><font
																			size="2">冻结</font></i>
																	</a>
																</c:if>
																<c:if
																	test="${card.status==3 && cards.orgId=='0010000000'}">
																	<a href="#"
																		onclick="selectOption('${card.cardId}','${card.orgId}','prepareUpdateCardScrap')"
																		class="blue fancybox-manual-b"> <i
																		class="ace-icon fa blue bigger-130"><font
																			size="2">作废</font></i>
																	</a>
																	<a href="#"
																		onclick="selectOption('${card.cardId}','${card.orgId}','prepareUpdateCardRelieve')"
																		class="blue fancybox-manual-b"> <i
																		class="ace-icon fa blue bigger-130"><font
																			size="2">解冻</font></i>
																	</a>
																</c:if>
															</div>
														</td>
														</c:if>
													</tr>
												</c:forEach>
											</tbody>
										</table>
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
    $('.chosen-select').chosen({});
      function revalidateField(){
    	  
    	revalidateFieldByFieldName('searchForm','stopTimeStart');
    	revalidateFieldByFieldName('searchForm','stopTimeEnd');
    	 
    	revalidateFieldByFieldName('searchForm','receDateStart');
    	revalidateFieldByFieldName('searchForm','receDateEnd'); 
      }


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
        var orgProp = $('#orgProp').val();
		if(orgProp==1){
			$("#orgUId").attr("disabled","disabled"); 
			$("#orgNm").attr("disabled","disabled"); 
		}
		var orgName1=$("#orgName1").val();
	      	  getOrg();
		if(orgName1!=null && orgName1!=""){
	      	$("#orgUId").val(orgName1);
	      	$("#orgUId").trigger("chosen:updated");
		}
		
    })
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
     //机构性质，机构名称，领用人之间关系   
    
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
    }
  //清空检索条件
    function resetMecForm(){
    	revalidateField();
       	 $(':input','#searchForm') 
       	 .not(':button, :submit, :reset, :hidden')
       	 .val('')  
       	 .removeAttr('checked')  
       	 .removeAttr('selected');
       	
       	var branchName1 = $('#branchName1').val();
       	 $("#orgProp").val('');
    	 $("#orgProp").trigger("chosen:updated");
    	 $("#status").val('');
   		 $("#status").trigger("chosen:updated");
   		 if(branchName1=="0010000000"){
	    	 $("#branchId").val('');
   			 $("#branchId").trigger("chosen:updated");
	   		$("#orgUId").empty();
			$("#orgUId").chosen("destroy");
			$("#orgUId").append("<option  value=''>全部</option>");
			$("#orgUId").chosen({});
			$("#orgUId").trigger("liszt:updated");
  		}else{
  			$("#orgUId").val('');
  	    	 $("#orgUId").trigger("chosen:updated");
  		}
   		chk();
   		/*  var d = new Date();
   		$("#startTimeStart").val(d.getFullYear()+"-"+(d.getMonth()+1>=10?(d.getMonth()+1).toString():'0' +(d.getMonth()+1))+"-"+(d.getDate()>9?d.getDate().toString():'0'+d.getDate()));
		$("#startTimeEnd").val(d.getFullYear()+"-"+(d.getMonth()+1>=10?(d.getMonth()+1).toString():'0' +(d.getMonth()+1))+"-"+(d.getDate()>9?d.getDate().toString():'0'+d.getDate()));  */
   	}
  //查看密码
    function mecIfdetailShow(password){
  	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/IcCardManage/icCardPwdShow?password='+password,
				type: 'iframe',
				padding: 4,
		        scrolling: 'no',
		        width: $(window).width() * 0.4,
		        centerOnScroll:true,
		        autoSize: true,
		        helpers:{
		        	overlay:{
		        		closeClick:false
		        	}
		        }
			});
    }
  //发行卡
    <%-- function prepareAddCard(password){	  
  	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/IcCardManage/prePareaddCard',
				type: 'iframe',
				padding: 4,
		        scrolling: 'no',
		        width: $(window).width() * 0.8,
		        centerOnScroll:true,
		        autoSize: true,
		        helpers:{
		        	overlay:{
		        		closeClick:false
		        	}
		        }
			});
    }  --%>
  //发行运营经理卡
    function prepareAddCard(){
    	href ='<%=request.getContextPath() %>/IcCardManage/prePareaddCard.do';
    	window.location.href=href;
      } 
    function selectOption(ic_card,orgId,option){
    	if("prepareUpdateCard"== option){
    		href = '<%=request.getContextPath() %>/IcCardManage/prepareUpdateCard.do?ic_card='+ic_card;
    	}else if("prepareUpdateCardLoss"== option){
    		href = '<%=request.getContextPath() %>/IcCardManage/prepareUpdateCardLoss.do?ic_card='+ic_card;
    	}else if("prepareUpdateCardTakeback"== option){
    		href = '<%=request.getContextPath() %>/IcCardManage/prepareUpdateCardTakeback.do?ic_card='+ic_card;
    	}else if("prepareUpdateCardRece"== option){
    		href = '<%=request.getContextPath() %>/IcCardManage/prepareUpdateCardRece.do?ic_card='+ic_card;
    	}else if("prepareUpdateCardScrap"== option){
    		href = '<%=request.getContextPath() %>/IcCardManage/prepareUpdateCardScrap.do?ic_card='+ic_card;
    	}else if("prepareUpdateCardRelieve"== option){
    		href = '<%=request.getContextPath() %>/IcCardManage/prepareUpdateCardRelieve.do?ic_card='+ic_card;
    	}else if("prepareNewCard"== option){
    		href = '<%=request.getContextPath() %>/IcCardManage/prepareUpdateCardRece.do?ic_card='+ic_card+'&orgId='+orgId+'&flag=1';
    	}else {
    		alert("操作有误，请重试！");
    		return false;
    	}
    	
    	 window.location.href=href;	 
    	
    	  
    }
  
        
function changeDateStart3(){
  		 var creStartTm=Number($("#receDateStart").val().replace(/-/g,''));
  		 var creEndTm=Number($("#receDateEnd").val().replace(/-/g,''));
  		 if(creEndTm!=0){
  			 if(creStartTm>creEndTm){
  				 $("#receDateEnd").val($("#receDateStart").val());
  			 }
  		 }
  	 }
  	 function changeDateEnd3(){
  		 var creStartTm=Number($("#receDateStart").val().replace(/-/g,''));
  		 var creEndTm=Number($("#receDateEnd").val().replace(/-/g,''));
  		 if(creStartTm!=0){
  			 if(creStartTm>creEndTm){
  				 $("#receDateStart").val($("#receDateEnd").val());
  			 }
  		 }
  	 }
    function changeDateStart2(){
  		 var creStartTm=Number($("#stopTimeStart").val().replace(/-/g,''));
  		 var creEndTm=Number($("#stopTimeEnd").val().replace(/-/g,''));
  		 if(creEndTm!=0){
  			 if(creStartTm>creEndTm){
  				 $("#stopTimeEnd").val($("#stopTimeStart").val());
  			 }
  		 }
  	 }
  	 function changeDateEnd2(){
  		 var creStartTm=Number($("#stopTimeStart").val().replace(/-/g,''));
  		 var creEndTm=Number($("#stopTimeEnd").val().replace(/-/g,''));
  		 if(creStartTm!=0){
  			 if(creStartTm>creEndTm){
  				 $("#stopTimeStart").val($("#stopTimeEnd").val());
  			 }
  		 }
  	 }
    function changeDateStart1(){
  		 var creStartTm=Number($("#startTimeStart").val().replace(/-/g,''));
  		 var creEndTm=Number($("#startTimeEnd").val().replace(/-/g,''));
  		 if(creEndTm!=0){
  			 if(creStartTm>creEndTm){
  				 $("#startTimeEnd").val($("#startTimeStart").val());
  			 }
  		 }
  	 }
  	 function changeDateEnd1(){
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