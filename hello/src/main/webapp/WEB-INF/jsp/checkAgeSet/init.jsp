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
    function operationFun(obj,obj1,obj2){
    	var h = 320*1;
    	var w=800*1;
    	var url="";
    	if(obj=='update'){
    		url = "<%=base%>checkAgeSet/checkAgeSetUpdate.do?" + "uuid=" + obj1 ;
    	}else {
    		url = "<%=base%>checkAgeSet/showOperLog.do?" + "uuid=" + obj1 + "&flag=" + obj2;
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
                                        审单年龄设置(年龄范围内的身份信息允许通过)
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
                                            <form class="form-inline form-horizontal" action="<%=base%>checkAgeSet/searchCheckAgeSetList" id="searchForm" method="post">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >操作日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="startDate" value="${checkAgeSet.dateStart }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="endDate" value="${checkAgeSet.dateEnd }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">产品类型:</label>
															<div class="col-sm-8  no-padding">
																<select id="productId" name="productId" class="chosen-select form-control width-200px">
                                                                	<option value="-1">请选择</option>
                                                                	<c:forEach items="${orgList }" var="orgs">
																		<option value="${orgs.id }"
																		<c:if test="${orgs.id == checkAgeSet.productId }"> selected </c:if>>${orgs.name }</option>
																	</c:forEach>
																</select>
															</div>
													</div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">启用状态:</label>
															<div class="col-sm-8  no-padding">
																<select id="enableState" name="enableState" class="chosen-select form-control width-200px" >
																	<option value="-1" <c:if test="${checkAgeSet.enableState == '-1'}">selected="selected"</c:if>>全部</option>
                                                                	<option value="1" <c:if test="${checkAgeSet.enableState == '1'}">selected="selected"</c:if>>启用</option>
																	<option value="0" <c:if test="${checkAgeSet.enableState == '0'}">selected="selected"</c:if>>禁用</option>
																</select>
															</div>
													</div>
                                               </div>
                                               <button class="btn btn-normal btn-sm" type="submit" >
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>清空检索条件
												</button>
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
                                                <th width="15%">产品类型</th>
                                                <th width="10%">年龄范围</th>
                                                <th width="10%">启用状态</th>
                                                <th width="10%">操作人</th> 
                                                <th width="30%">操作时间</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            
                                            
                                            <tbody>
                                            <c:forEach items="${checkAgeSetList}" var="po">
                                            <tr>

                                                <td align="center"> ${po.productName } </td>
                                                <td align="center">${po.ageBracket}</td>
                                                <td align="center">${po.isUseVal}</td>
                                                <td align="center">${po.updatePersonName}
                                                <td align="center">${po.operatorDateStr}</td>
                                                
                                                <td align="center">
                                                	 <div class="   action-buttons">
                                                	 	<%-- <c:if test="${loginUserPermission.SMSA_REST_015 !=null }"> --%>
                                                        <a class="blue" href="javascript:;" onclick="operationFun('update','${po.uuid }')">
                                                          <i class="ace-icon fa fa-gear icon-on-right bigger-110"><font size="2">修改</font></i>
                                                        </a>
                                                        <%-- </c:if> --%>
                                                        <a class="blue" href="javascript:;" onclick="operationFun('log','${po.uuid }','${po.flag }')">
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
   	 $("#productId").val('');
	 $("#productId").trigger("chosen:updated");
	 $("#enableState").val('-1');
	 $("#enableState").trigger("chosen:updated");
		
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











