<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
    <script type="text/javascript">
    function operationFun(obj,obj1){
    	var h = 320*1;
    	var w=800*1;
    	var url="";
    	if(obj=='insert'){
    		url = "<%=base%>restExcep/restExcepAdd.do";
    	}else if(obj=='update'){
    		url = "<%=base%>restExcep/restExcepAdd.do?uuid="+obj1;
    	}else if(obj=='batchInsert'){
    		url = "<%=base%>restExcep/batchAddView.do";
    		h= 500*1;
    	}else if(obj=='log'){
    		url = "<%=base%>restExcep/seeOperLog?uuid="+obj1;
    		w=1100*1;
    	}
    	$.fancybox.open({
			href : url,
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        autoWidth:true,
	        height: h,
	        width: w,
	        autoSize: false,
	        closeClick: false,
	        afterClose:function(){
	        	<%-- location.href = '<%=request.getContextPath() %>/restExcep/restExcepTimesList.do'; --%>
			}
		});
    }
    
    function deleteDept(obj){
    	if(confirm("确认要删除？")){
	    	$.ajax({
	    		type:'post',
	    		url:"<%=base%>restExcep/restExcepDel",
	    		data:'deptUuid='+obj,
	    		async:false,
	    		success:function(data){
					data = eval("(" + data + ")")
					if(data.message=='ok'){
						alert('删除成功')
						location.reload();
					}else{
						alert(data.message)
					}
	    		},
	    		error:function(){
	    			alert('数据提交失败');
	    		}
	    	});
    	}
    }
    </script>
</head>

<body class="no-skin ">
    <div class="main-container" id="main-container">
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" >
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        重复次数例外设置
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
                                            <form class="form-inline form-horizontal" action="<%=base%>restExcep/restExcepTimesList" id="searchForm" method="post">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
												<div class=" col-xs-12">
                                                	<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="orgNo" name="orgNo" 
																	class="chosen-select form-control width-200px">
																	<option value="">请选择</option>
																	<c:forEach items="${orgList }" var="orgs">
																		<option value="${orgs.orgUuid }"
																			<c:if test="${orgs.orgUuid == restExcep.orgNo }"> selected </c:if>>${orgs.orgNm}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >操作日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="startDate" value="${restExcep.startDate }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="endDate" value="${restExcep.endDate }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">例外类型:</label>
															<div class="col-sm-8  no-padding">
																<select id="excepTyp" name="excepTyp" class="chosen-select form-control width-200px">
                                                                	<option value="">请选择</option>
																	<option value="0">结算人卡号</option>
																	<option value="1">结算人户名</option>
																	<option value="2">结算人证件号</option>
																	<option value="3">注册名称</option>
																	<option value="4">注册登记号</option>
																</select>
															</div>
													</div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否生效:</label>
															<div class="col-sm-8  no-padding">
																<select id="isOutOfTime" name="isOutOfTime" class="chosen-select form-control width-200px">
																	<option value="-1" <c:if test="${restExcep.isOutOfTime == '-1'}">selected="selected"</c:if>>全部</option>
                                                                	<option value="1" <c:if test="${restExcep.isOutOfTime == '1'}">selected="selected"</c:if>>是</option>
																	<option value="0" <c:if test="${restExcep.isOutOfTime == '0'}">selected="selected"</c:if>>否</option>
																</select>
															</div>
													</div>
													
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">例外名称:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="excepNm" id="excepNm" value="${restExcep.excepNm }"  
															onBlur="this.value=ignoreSpaces(this.value);"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="inputEmpId">
														</div>
													</div>
													
                                               </div>
                                               <button class="btn btn-normal btn-sm" type="submit" >
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
			清空检索条件
												</button>
												<c:if test="${loginUserPermission.SMSA_REST_015 !=null }">
                                                <button  class="btn btn-danger btn-sm" type="button" onclick="operationFun('insert','')">
                                                <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                    添加
                                                </button>
                                                 <button class="btn btn-primary btn-sm" type="button" onclick="downLoad()">
                                                 <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    下载模板
                                                </button>
                                                 <button class="btn btn-danger btn-sm" type="button" onclick="operationFun('batchInsert','')">
              									 <span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>                                     
                                                    批量导入
                                                </button>
                                                </c:if>
                                            </form>
                                             <form  action="<%=request.getContextPath()%>/restExcep/downExcel.do" id="downLoadForm" method="post">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table style="word-break:break-all; word-wrap:break-all; " class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="15%">归属分公司 </th>
                                                <th width="10%">例外类型</th>
                                                <th width="30%">例外名称</th>
                                                <th width="10%" style="display: none;">是否全量例外</th> 
                                                <th width="10%">操作人</th>
                                                <!-- <th width="15%">操作时间</th>
                                                <th width="10%">失效时间</th> -->
                                                
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            
                                            
                                            <tbody>
                                            <c:forEach items="${tBizRestExcepTimesPos }" var="po">
                                            <tr>

                                                <td align="center"> ${po.orgNm } </td>
                                                <td align="center">${po.excepTypStr}</td>
                                                <td align="left">${po.excepNm}</td>
                                                <td align="center" style="display: none;">${po.isAllStr}
                                                <td align="center">${po.operNo}</td>
                                              <%--   <td align="center">${po.operDatetime}</td>
                                                <td align="center">${po.expiryDateStr}</td> --%>
                                                
                                                <td align="center">
                                                	 <div class="   action-buttons">
                                                	 	<c:if test="${loginUserPermission.SMSA_REST_015 !=null }">
                                                        <a class="blue" href="javascript:;" onclick="operationFun('update','${po.uuid }')">
                                                          <i class="ace-icon fa fa-gear icon-on-right bigger-110"><font size="2">修改</font></i>
                                                        </a>
                                                        <%-- <a class="blue" href="javascript:;" onclick="deleteDept('${po.uuid }')">
                                                        <i class="ace-icon fa fa-trash-o icon-on-right bigger-110"><font size="2">删除</font></i>
                                                        </a> --%>
                                                        </c:if>
                                                        <a class="blue" href="javascript:;" onclick="operationFun('log','${po.uuid }')">
                                                         <i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">操作记录</font></i>
                                                        </a>
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
                                <label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
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
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    function resetMecForm(){
   	 $(':input','#searchForm')  
   	 .not(':button, :submit, :reset, :hidden')  
   	 .val('')  
   	 .removeAttr('checked')  
   	 .removeAttr('selected'); 
   	 $("#orgNo").val('');
	 $("#orgNo").trigger("chosen:updated");
	 $("#excepTyp").val('');
	 $("#excepTyp").trigger("chosen:updated");
		
    }
    function refreshThisWin(){
    	document.getElementById("searchForm").submit();
    }
    
    function downLoad(){
   		document.getElementById("downLoadForm").submit();
       }

        $('.chosen-select').chosen({});
        jQuery(function($) {

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
                        remote: {
                            url: 'remote.php',
                            message: 'Tên tài khoản này đã được đăng ký'
                        },
                        different: {
                            field: 'password',
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
                            message: 'Mật khẩu và tên đăng nhập phải khác nhau'
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
                            message: 'Mật khẩu và tên đăng nhập phải khác nhau'
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
    
   function ignoreSpaces(string) {
	var temp = "";
	string = '' + string;
	splitstring = string.split(" ");
	for(i = 0; i < splitstring.length; i++)
	temp += splitstring[i];
	return temp;
	} 
</script>
</body>
</html>











