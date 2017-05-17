<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title>

    <%@include file="../../layout/common.jsp"%>
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
                                        	终端密码键盘管理
                                    </h5>
                                    <!-- <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span> -->
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/device/sKeyExport/list" id="searchForm" method="POST">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="paramReady" value="paramReady" >
                                                <div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备序列号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="fact_sn" id="fact_sn" value="${conditions.fact_sn}" maxlength ="" class="form-control input-small width-200px"  >  
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >终端号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="pos_num" id="pos_num" value="${conditions.pos_number}" class="form-control input-small width-200px"  >  
                                                        </div>
                                                    </div>
                                                   <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备型号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="mod_id" name="mod_id" 
                                                              class="chosen-select form-control width-200px" >
                                                               <option value="">全部</option>
																<c:if test="${!empty modelList }">
																	<c:forEach items="${modelList}" var="item">
																		<option code="${item.id}" value="${item.id}" <c:if test="${item.id==conditions.mod_id}"> selected </c:if>>${item.mod_name}</option>
																	</c:forEach>
																</c:if>
                                                            </select>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="status" name="status" 
                                                              class="chosen-select form-control width-200px" >
                                                               <option value="">全部</option>
																	<c:if test="${!empty status }">
																		<c:forEach items="${status}" var="item">
																			<option value="${item.value}"
																				<c:if test="${item.value==conditions.status}"> selected </c:if>>${item.label}</option>
																		</c:forEach>
																	</c:if>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="merc_id" id="merc_id" value="${conditions.merc_id}" class="form-control input-small width-200px"  >  
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备归属:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="holder" name="holder" 
                                                              class="chosen-select form-control width-200px" >
                                                               <option value="">全部</option>
																<c:if test="${!empty holder }">
																	<c:forEach items="${holder}" var="item">
																		<option value="${item.value}"
																			<c:if test="${item.value==conditions.holder}"> selected </c:if>>${item.label}</option>
																	</c:forEach>
																</c:if>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">入库日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="instock_date_begin" id="instock_date_begin" onchange="revalidateDate();" class="input-small form-control" value="${conditions.storage_date_egt}">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="instock_date_end"  id="instock_date_end" onchange="revalidateDate();" class="input-small form-control"  value="${conditions.instockend}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备归属机构:</label>
                                                        <div class="col-sm-8  no-padding"  >
																<select data-placeholder="请选择" name="org" id="org" class="chosen-select form-control input-sm" <c:if test="${current_org_id != '0010000000'}">readonly</c:if> style="width: 175px;height:29px;">
																	<c:choose>
																	<c:when test="${current_org_id eq '0010000000'}">
																		<option value="">全部</option>
																		<c:forEach items="${orgList}" var="item">
																			<option code="${item.orgUuid}" value="${item.orgUuid}" <c:if test="${item.orgUuid eq conditions.org_id}"> selected </c:if>>${item.orgNm}</option>
																		</c:forEach>
																	</c:when>
																	<c:otherwise >
																		<c:forEach items="${orgList}" var="item">
																			<option code="${item.orgUuid}" value="${item.orgUuid}" <c:if test="${item.orgUuid==current_org_id}"> selected </c:if>>${item.orgNm}</option>
																		</c:forEach>
																	</c:otherwise>
																	</c:choose>
																</select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">安装日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="install_date_begin" id="install_date_begin"  class="input-small form-control" value="${conditions.install_date_egt}">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="install_date_end"  id="install_date_end" class="input-small form-control" value="${conditions.installDateend}" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- 条件完毕 -->
                                                </div>
                                                 <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                   	 查询
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="javaScript:uploadExcel('01')">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                 	  批量导出密钥
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="uploadExcel('02')">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    IC卡批量导出密钥
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
	                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                            	<th style="text-align:center;width:8%">设备编码</th>
                                                <th style="text-align:center;width:10%">设备序列号</th>
                                                <th style="text-align:center;width:7%">设备型号</th>
                                                <th style="text-align:center;width:7%">厂商编号 </th>
                                                <th style="text-align:center;width:8%">厂商简称</th>
                                                <th style="text-align:center;width:8%">设备状态 </th>
                                                <th style="text-align:center;width:9%">终端号</th>
                                                <th style="text-align:center;width:8%">商户名称</th>
                                                <th style="text-align:center;width:8%">归属机构</th>
                                                <th style="text-align:center;width:7%">设备归属</th>
                                                <th style="text-align:center;width:8%">是否携机入网</th>
                                                <th style="text-align:center;width:7%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${posDeviceList}" var="posDevice"  varStatus="status">
												<tr>
													<td style="text-align:center;">${posDevice.id}</td>
													<td style="text-align:center;">${posDevice.fact_sn }</td>
													<td style="text-align:center;">${posDevice.mod_name}</td>
													<td style="text-align:center;">
														${posDevice.fact_id}
													</td>
													<td style="text-align:right;">${posDevice.fact_name}</td>
													<td style="text-align:center;">
														<c:if test="${posDevice.status eq 0 }">订货</c:if>
														<c:if test="${posDevice.status eq 1 }">在库</c:if>
														<c:if test="${posDevice.status eq 2 }">领用</c:if>
														<c:if test="${posDevice.status eq 3 }">安装</c:if>
														<c:if test="${posDevice.status eq 4 }">报修</c:if>
														<c:if test="${posDevice.status eq 5 }">处理中</c:if>
														<c:if test="${posDevice.status eq 6 }">已退货</c:if>
														<c:if test="${posDevice.status eq -1 }">报废</c:if>
														<c:if test="${posDevice.status eq -2 }">损失</c:if>
													</td>
													<td style="text-align:right;">${posDevice.pos_num}</td>
													<td style="text-align:center;">
														${posDevice.merc_name}
													</td>
													<td style="text-align:center;">
														${posDevice.org_name}
													</td>
													<td style="text-align:center;">
														<c:if test="${posDevice.device_own eq 0 }">随行付</c:if>
														<c:if test="${posDevice.device_own eq 1 }">商户</c:if>
														<c:if test="${posDevice.device_own eq 2 }">租赁</c:if>
														<c:if test="${posDevice.device_own eq 3 }">第三方</c:if>
													</td>
													<td style="text-align:center;">
														<c:if test="${posDevice.merc_own eq 0 }">否</c:if>
														<c:if test="${posDevice.merc_own eq 1 }">是</c:if>
													</td>
													<td style="text-align:center;">
									                     <div class="   action-buttons">
									                         <a href="javaScript:openIframe('${posDevice.id}','1')" class="blue">
									                             	查看详情
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
                            	<label class="dataTables_info " id="dynamic-table_info"
									role="status" aria-live="polite"></label>
                               </div>
                                <div class="col-sm-8 right">
                                <c:if test="${posDeviceList.size() > 0}">
                                    <%@include file="../../layout/pagination.jsp" %>
                                    </c:if>
                                </div>
                        </div>
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../../layout/common.js.jsp"%>
     <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    
		function uploadExcel(type){
			if(type=="01"){	
				$("#searchForm").attr("action","<%=request.getContextPath()%>/device/sKeyExport/skeyExportExcel");
			}else{
				$("#searchForm").attr("action","<%=request.getContextPath()%>/device/sKeyExport/ICsKeyExport");
			}
			document.getElementById("searchForm").submit();
			$("#searchForm").attr("action","<%=request.getContextPath()%>/device/sKeyExport/list");
		}
		
		 //校验日期合法
		   function revalidateDate(){
		   	revalidateFieldByFieldName('searchForm','instock_date_begin');
		   	revalidateFieldByFieldName('searchForm','instock_date_end');
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
            	instock_date_begin: {
                    validators: {
                        dateCompare: {
                        	dayLength:1
                        }
                    }
                },
                instock_date_end: {
                    validators: {
                        dateCompare: {
                        	dayLength:1
                        }
                    }
                },
                install_date_begin: {
                    validators: {
                        dateCompare: {
                        	dayLength:1
                        }
                    }
                },
                install_date_end: {
                    validators: {
                        dateCompare: {
                        	dayLength:1
                        }
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
    
    function formatValue(obj){
        	var value=Number(obj.value.replace(/[^+\d]/g,''));
        	if(value == 0){
        		obj.value = '';
        		return;
        	}
        	obj.value = value;
        	
        }
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        
    function openIframe(uuid,flag){
    	var href = '';
    	if(1 == flag){
    		href = '<%=request.getContextPath() %>/device/sKeyExport/Detail?uuid='+uuid;
    	}else if(2 == flag){
    		href = '<%=request.getContextPath() %>/device/sKeyExport/confirmPaymentPage?uuid='+uuid;
    	}else if(3 == flag){
    		href = '<%=request.getContextPath() %>/device/sKeyExport/list';
    	}
    	$.fancybox.open({
			href : href,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width() * 0.9,
            centerOnScroll:true,
            autoSize: true,
            helpers:{
            	overlay:{
            		closeClick:false
            	}
            },
			afterClose:function(){
				if(3 == flag){
					reloadParent();
				}
			}
		});
    }
    
    function reloadParent(){
    	document.getElementById("searchForm").submit();
    }
    
  //型号细分类型下拉框变动
	$(document).ready(function() {
		$("#goods_id").change(function() {								

			var val = $(this).val();
			var mobj = $("#mod_id");
			var fact_val=$("#fact_id").val();
					
			mobj.empty();
			mobj.append("<option value=''> 请选择...  </option>");
			$.ajax({
				type : "GET",
				url : "${ctx}/device/sKeyImport/getModList?goods_id=" + val+"&fact_id="+fact_val,
				dataType : "json",
				cache : false,
				success : function(data) {

					for (var i = 0; i < data.length; i++) {
						mobj.append("<option value='"+data[i].id+"'>" + data[i].mod_name + "</option>");
					} 
				}
			});
			
		});
				
		//厂商简称下拉框变动
		$("#fact_id").change(function() {								
		//alert("asdf");
			var val = $(this).val();
			var mobj = $("#mod_id");
			var goods_val=$("#goods_id").val();
			
			mobj.empty();
			mobj.append("<option value=''> 请选择...  </option>");
			$.ajax({
				type : "GET",
				url : "${ctx}/device/sKeyImport/getModList?fact_id=" + val+"&goods_id="+goods_val,
				dataType : "json",
				cache : false,
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						mobj.append("<option value='"+data[i].id+"'>" + data[i].mod_name + "</option>");
					}
				}
			});
		
		});
	});
  
  
	function getInternalOrg() {
		var mobj =$("#org");
		mobj.empty();
		mobj.append("<option value=''> 请选择...  </option>");	
		$.ajax({
			type : "GET",
			url : "${ctx}/posDevice/deviceTransferOrder/unlimitGetOrg?org_name="+encodeURI
					($("#org_name_query").val()+"&org_type=1"),
			dataType : "json",
			cache : false,
			async : false,
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					if (i==0)
						mobj.append("<option value='"+data[i].id+"' selected >" + data[i].name + " </option>");
					else
						mobj.append("<option value='"+data[i].id+"'>" + data[i].name + "</option>");
				}
				if(0<data.length){
					$("#org_name_query").val(data[0].name);
				}

			}
		});
	}	
</script>
</body>
</html>











