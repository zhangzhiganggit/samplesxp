<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../layout/common.jsp"%>
<script src="${ctx }/js/fileUp/fileUpload.js"></script>

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
										<i class="ace-icon fa fa-table"></i> 紧急通知查询条件
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
												action="<%=request.getContextPath()%>/emergencyNotice/list.do?entry=1"
												method="post" id="searchForm">
												<input type="hidden" name="pageSize"
													value="${pageInfo.getPageSize()}"> <input
													type="hidden" name="pageNum"
													value="${pageInfo.getPageNum()}">
												<div class=" col-xs-12">
												

													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">通知标题:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="noticeTitle" value="${notice.noticeTitle }"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="noticeTitle">
														</div>
													</div>

												</div>
												<button class="btn btn-normal btn-sm" type="submit">
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button"
													onclick="resetAll()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
												</button>
												<c:if test="${loginUserPermission.SMS_EmergencyNotice_005!=null }">
													<button class="btn btn-danger btn-sm" type="button"
														onclick="noticeAdd()">
														<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
														添加
													</button>
												</c:if>

											</form>
										</div>
									</div>
								</div>
							</div>




							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 紧急通知列表
									</h5>


								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 25%">通知标题</th>
													<th style="text-align: center; width: 15%">起始时间</th>
													<th style="text-align: center; width: 15%">终止时间</th>
													<th style="text-align: center; width: 15%">创建日期</th>
													<th style="text-align: center; width: 10%">创建人</th>
													<th style="text-align: center;">操作</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${noticeList }" var="nl">
													<tr>
														<td style="text-align: left;">${nl.noticeTitle }</td>
														<td style="text-align: center;"><fmt:formatDate value="${nl.beginDate}" pattern="yyyy-MM-dd "/></td>
														<td style="text-align: center;"><fmt:formatDate value="${nl.endDate}" pattern="yyyy-MM-dd "/></td>
														<td style="text-align: center;"><fmt:formatDate value="${nl.inputDate}" pattern="yyyy-MM-dd"/></td>
														<td style="text-align: center;">${nl.inputEm }</td>
														<td style="text-align: left;">
															<div class="   action-buttons">
																<a href="#" class="green" id="edit"
																	onclick="noticeDetail('${nl.noticeId}');"> <i
																	class="ace-icon fa fa-search-plus blue bigger-130"><font
																		size="2">查看详情</font></i>
																</a>
															
																<c:if
																	test="${loginUserPermission.SMS_EmergencyNotice_004!=null }">
                                                        				<a href="#" onclick="delNotice('${nl.noticeId}');" class="red" id="del"> 
																			<i class="ace-icon fa fa-trash-o blue bigger-130">
																				<font size="2">删除</font>
																			</i>
																		</a>
																	</c:if>
															
															
															</div>
														</td>
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
								<%@include file="../layout/pagination.jsp"%>
							</div>

						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->

	<%--   <%@include file="../layout/footer.jsp"%> --%>
	<%@include file="../layout/common.js.jsp"%>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
 	jQuery(function($) {
        $('[data-rel=popover]').popover({container:'body'});
        $('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                firstName: {
                    validators: {
                        notEmpty: {},
                        stringCase: {
                            'case': 'upper'
                        }
                    }
                },
                lastName: {
                    validators: {
                        notEmpty: {},
                        stringCase: {
                            'case': 'upper'
                        }
                    }
                },
                username: {
                    validators: {
                        notEmpty: {},
                        stringLength: {
                            min: 6,
                            max: 20
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/
                        },
//                        remote: {
//                            url: 'remote.php',
//                            message: 'Tên tài kho?n này ?? ???c ??ng ky'
//                        },
                        different: {
                            field: 'email',
                            message: 'The username and password cannot be the same as each other'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {},
                        emailAddress: {}
                    }
                },
                password: {
                    validators: {
                        notEmpty: {},
                        identical: {
                            field: 'confirmPassword'
                        },
                        different: {
                            field: 'username',
                            message: 'M?t kh?u và tên ??ng nh?p ph?i khác nhau'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {},
                        identical: {
                            field: 'password'
                        },
                        different: {
                            field: 'username',
                            message: 'M?t kh?u và tên ??ng nh?p ph?i khác nhau'
                        }
                    }
                },
                age: {
                    validators: {
                        notEmpty: {},
                        digits: {},
                        greaterThan: {
                            value: 18
                        },
                        lessThan: {
                            value: 100
                        }
                    }
                },
                website: {
                    validators: {
                        notEmpty: {},
                        uri: {}
                    }
                },
                phoneNumber: {
                    validators: {
                        notEmpty: {},
                        digits: {},
                        phone: {
                            country: 'US'
                        }
                    }
                },
                gender: {
                    validators: {
                        notEmpty: {}
                    }
                },
                'languages[]': {
                    validators: {
                        notEmpty: {}
                    }
                },
                'programs[]': {
                    validators: {
                        choice: {
                            min: 2,
                            max: 4
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
            todayHighlight: true
        })
//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true});

        $(".fancybox-manual-b").click(function() {
            $.fancybox.open({
                href : 'detail.html',
                type : 'iframe',
                scrolling:'no',
                scrollOutside:false,
                model :true,
                minWidth:400,
                width:900,
                height:400,
                autoHeight:true,
                autoWidth:true,
                closeBtn:true,
                padding : 5
            });
        });
        //$('#sidebar').addClass('compact');
    })
</script>



	<script type="text/javascript">
        $('.chosen-select').chosen({});
     
        function noticeAdd(){
        	var noticeTitle=$("#noticeTitle").val();
        	$.fancybox.open({
				href : '<%=request.getContextPath()%>/emergencyNotice/addView.do',
				type: 'iframe',
		        padding: 5,
		        scrolling: 'no',
		        fitToView: true,
		        width: 900,
		        height: 500,
		        autoSize: false,
		        closeClick: false,
				afterClose:function(){
					window.location.href='<%=request.getContextPath()%>/emergencyNotice/list.do';
				}
			});
        }
        
     function noticeDetail(id){
    		   $.fancybox.open({
    			href : '<%=request.getContextPath()%>/emergencyNotice/see?noticeId='+id,
    			type: 'iframe',
    	        padding: 5,
    	        scrolling: 'no',
    	        fitToView: true,
    	        width: 900,
    	        height: 400,
    	        autoSize: false,
    	        closeClick: false,
    	        closeBtn:false,
    				afterClose:function(){
    				}
    			});
     }

  
     
     function delNotice(id){
    	 
    		 var conf = confirm("确定要删除该紧急通知吗？");
    		 if(conf){
    			 $.ajax({
  				   type: "POST",
  				   url: "<%=request.getContextPath()%>/emergencyNotice/delNotice",
  				   data: "noticeId="+id,
  				   success: function(data){
  					  alert(data.msg);
  					  location.href='<%=request.getContextPath()%>/emergencyNotice/list.do';
  				   }
  				});
    			 
    		 }else{
    			 return;
    		 }
     }
     
     function resetAll(){
    	 $(':input','#searchForm')  
	 	 .not(':button, :submit, :reset, :hidden')  
	 	 .removeAttr('checked')  
	 	 .removeAttr('selected'); 
	 	$("#noticeType").val('');
		 	$("#noticeType").trigger("chosen:updated");
		 	$("#noticeTitle").val("");
		 	$('#noticeTitle').trigger("chosen:updated");
		 	$("#noticeStatus").val("");
		 	$('#noticeStatus').trigger("chosen:updated");
		 	$("#noticeRange").val("");
		 	$('#noticeRange').trigger("chosen:updated");
		 	$("#inputEmpId").val("");
		 	$('#inputEmpId').trigger("chosen:updated");

     }
     

     
     function editNotice(noticeId){
    	 $.fancybox.open({
				href : '<%=request.getContextPath()%>/notice/addView?noticeId='+noticeId
						+"&entry1=update",
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 900,
	        height: 500,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
					window.location.href='<%=request.getContextPath()%>/notice/list.do' 
				}
			});
     }
   

</script>
</body>
</html>











