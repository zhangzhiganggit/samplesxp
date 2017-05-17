<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title>

	<%@include file="../../common/taglib.jsp"%>
    <%@include file="../../layout/common.jsp"%>
</head>

<body class="no-skin ">
    <!-- 隐藏一个遮罩层用于提示操作结果 -->
	  <div id="test" style="display:none;" align="center">
	  <div  style="background-color:  rgb(192,255,62 ); opacity: 0.5;filter:alpha(opacity=50); top: 0px; left: 0px; width: 100%; height: 60px;  ">
	  <span><font color="red" size="5" style="font-weight:bold;font-style:italic;">${result}</font></span> 
	  <div class="alert_div"><span style="color:red;" id="alert_span"></span>秒后自动关闭
	  </div>
	  </div>
	  </div>
	<!-- END -->

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
                                        POS机型号查询条件
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
                                            <form class="form-inline form-horizontal" action="/posModel/posModelManager" id="searchForm">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" id="result" name="result" value="${result}">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >厂商简称:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="mfrNo" name="mfrNo" class="chosen-select form-control width-200px">
                                                                <option value="">请选择...</option>
                                                                	<c:forEach items="${mls}" var="item">
																		<option value="${item.code}"
																		<c:if test="${item.code==posInfo.mfrNo}"> selected </c:if> >${item.short_name}</option>
								                                    </c:forEach>
                                                                <%-- <option value="02" <c:if test="${posInfo.mercTyp =='02'}">selected="selected"</c:if>>手刷商户</option> --%>
                                                            </select>

                                                        </div>
													</div>
													<div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物品类型:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="goodsTyp" name="goodsTyp" class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <c:forEach items="${typeList}" var="item">
																		<option value="${item.goods_type}"
																		<c:if test="${item.goods_type==posInfo.goodsTyp}"> selected </c:if> >${item.goods_name}</option>
								                                    </c:forEach>
                                                            </select>

                                                        </div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物品名称:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="goodsId" name="goodsId" class="chosen-select form-control width-200px">
                                                               <option value="">请选择...</option>
                                                                <c:forEach items="${subsectionList}" var="item">
																		<option value="${item.goods_id}"
																		<c:if test="${item.goods_id==posInfo.goodsId}"> selected </c:if> >${item.goods_name}</option>
								                                    </c:forEach>
                                                            </select>

                                                        </div>
													</div>
												</div>
												<!-- 二排条件 -->
												<div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号名称:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="modId" name="modId" class="chosen-select form-control width-200px">
                                                                <option value="">请选择...</option>
                                                                	<c:forEach items="${pms}" var="item">
																		<option value="${item.modId}"
																		<c:if test="${item.modId==posInfo.modId}"> selected </c:if> >${item.modNm}</option>
								                                    </c:forEach>
                                                            </select>

                                                        </div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号状态:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="modSts" name="modSts" class="chosen-select form-control width-200px">
                                                                 <option value="">全部</option>
                                                                 <option value="0" <c:if test="${posInfo.modSts =='0'}">selected="selected"</c:if>>正常</option>
                                                                 <option value="1" <c:if test="${posInfo.modSts =='1'}">selected="selected"</c:if>>冻结</option>
                                                                 <option value="2" <c:if test="${posInfo.modSts =='2'}">selected="selected"</c:if>>待审批</option>
                                                                 <option value="9" <c:if test="${posInfo.modSts =='9'}">selected="selected"</c:if>>注销</option>
                                                            </select>

                                                        </div>
													</div>
													
				                                   <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >规格说明:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="normsDesc" id="normsDesc" value="${posInfo.normsDesc }" onkeyup="javascript:this.value=this.value.replace(/\s/g,'');" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
												</div>
												<!-- 三排参数 -->
											<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否电子签名:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="isSignature" name="isSignature" <c:if test="${posInfo.goodsTyp != '0'}">disabled="disabled"</c:if>  class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <option value="1"
																<c:if test="${posInfo.isSignature  == '1'}"> selected </c:if>>是</option>
															<option value="0"
																<c:if test="${posInfo.isSignature  == '0'}"> selected </c:if>>否</option>
                                                            </select>

                                                        </div>
													</div>
													<div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >厂商型号代码:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="fact_mod" id="fact_mod" value="${posInfo.fact_mod }"  class="form-control input-small width-200px" data-placement="bottom" title="" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
												</div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="resetSearchForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button>
                                                   <button class="btn btn-info btn-sm" type="button" onclick="javaScript:alertIframe(this,2,3)">
                                                    添加
                                                </button>
                         <!--                        <button class="btn btn-danger btn-sm" type="button" onclick="uploadExcel()">
                                                    <span class="ace-icon fa fa-file-excel-o icon-on-right bigger-110"></span>
                                                    导出型号到excel
                                                </button> -->
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        POS机型号查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width:5%">序号</th>
                                                <th style="text-align:center;width:5%">物品类型</th>
                                                <th style="text-align:center;width:15%">物品名称</th>
                                                <th style="text-align:center;width:20%">厂商简称</th>
                                                <th style="text-align:center;width:5%">型号状态</th>
                                                <th style="text-align:center;width:15%">型号名称</th>
                                                <th style="text-align:center;width:15%">规格说明</th>
                                                <th style="text-align:center;width:5%">计量单位</th>
                                                <th style="text-align:center;width:15%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach items="${mods}" var="pos"  varStatus="status">
													<tr>
														<td style="text-align:center;">${status.index+1 }</td>
														<td style="text-align:center;">${pos.goods_type_name}</td>
														<td style="text-align:center;">${pos.goods_name}</td>
														<td style="text-align:center;">${pos.fact_name}</td>
														<td style="text-align:center;">${pos.mod_status_name}</td>
														<td style="text-align:center;">${pos.modNm}</td>
														<td style="text-align:center;">${pos.normsDesc}</td>
														<td style="text-align:center;">${pos.unit}</td>
														<td style="text-align:center;">
										                     <div class="action-buttons">
										                         <a href="javaScript:alertIframe(this,'${pos.modId}',1)" class="blue" title="明细">
										                              明细
										                         </a>
										                            <a href="javaScript:alertIframe(this,'${pos.modId}',2)" class="blue" title="修改">
										                              修改
										                         </a>
										                            <a href="javaScript:deleteModel(this,'${pos.modId}',3)" class="blue" title="删除">
										                              删除
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
	  var flag = 5;
	  var timer;
	  function auto_close(){
	   if(flag == 0){
	     flag = 5;
	     fun_close();
	   }else{
		 document.getElementById("alert_span").innerHTML = flag;
		 flag--;
		 timer = setTimeout(auto_close,1000);
	   }
	  }
	  function fun_close(){
	    document.getElementById("test").style.display = 'none';
	    clearTimeout(timer);
	  }
	  function fun_open(){
	    flag = 5;
	    document.getElementById("test").style.display = '';
	    auto_close();
	  }

        $('.chosen-select').chosen({});
        jQuery(function($) {
            if($("#result").val() != ""){
            	fun_open();
            }
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
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        
    function alertIframe(obj,modId,flag){
    	
    	var href = '';
    	if(1 == flag){//明细
    		href = '<%=request.getContextPath() %>/posModel/posModelDetail?modId='+modId;
    	}else if(2 == flag){//修改
    		href = '<%=request.getContextPath() %>/posModel/posModelEdit?modId='+modId;
    	}else if(3 == flag){//添加
    		href = '<%=request.getContextPath() %>/posModel/posModelAdd';
    	}
    	$.fancybox.open({
			href : href,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width(),
            height: $(window).width(),
            centerOnScroll:true,
            autoSize: true,
            helpers:{
            	overlay:{
            		closeClick:false
            	}
            },
			afterClose:function(){
				if(4 != flag){
					reloadParent();
				}
			}
		});
    }
    //联动
    function put2PosInfo(value){
    	alert("选择了"+value);
    }
    //导出excel
    function uploadExcel(){
		$("#searchForm").attr("action","<%=request.getContextPath()%>/posModel/uploadExcel");
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath()%>/posModel/posModelManager");
    }
    //删除
    function deleteModel(obj,modId,flag){
    	var href = '<%=request.getContextPath() %>/posModel/posModelDel?modId='+modId;
    	if(confirm("是否确认删除?")){
			$.ajax({
				type : "GET",
				url : href,
				dataType : "json",
				cache : false,
				success : function(data) {
					if(data == '1'){
						alert("删除成功!");
					}else{
						alert("删除失败!");
					}
				}
			});
			location.reload();
    	}
    }
    //联动
		$("#goodsTyp").change(function() {
			var val_goods_type = $(this).val();
			var var_fact=$("#mfrNo").val();
			
			if(val_goods_type == '0'){
				$("#isSignature").removeAttr("disabled");
				$("#isSignature").trigger("chosen:updated");
			}else{
				$("#isSignature").attr("disabled", true);
				$("#isSignature").trigger("chosen:updated");
			}
			var pobj = $("#goods_id");
			pobj.empty();
			//获得型号明细对象
			$.ajax({
				type : "GET",
				url : "<%=request.getContextPath() %>/posModel/unlimitGetGoods?goods_type=" + val_goods_type+"&fact_id="+var_fact,
				dataType : "json",
				cache : false,
				success : function(data) {
					var abc='<option value="">请选择</option>';
					for (var i = 0; i < data.length; i++) {
						abc += "<option value='"+data[i].goods_id+"'>" + data[i].goods_name + "</option>";
					} 
					$("#goodsId").html(abc);
					$("#goodsId").trigger("chosen:updated");
				}
			});
		});
		

		
		$("#goodsId").change(function() {								

			var val = $(this).val();
			var fact_val=$("#mfrNo").val();
			var goods_type =$("#goodsTyp").val()
			$("#mod_id").empty();
			$.ajax({
				type : "GET",
				url : "<%=request.getContextPath() %>/posModel/unlimitGetMod?goods_id=" + val+"&fact_id="+fact_val+"&goods_type="+goods_type,
				dataType : "json",
				cache : false,
				success : function(data) {
					var abc='<option value="">请选择</option>';
					for (var i = 0; i < data.length; i++) {
						//var selected = '${posInfo.goodsId}' == data[i].modId ? 'selected':'';
						abc += "<option value='"+data[i].modId+"'>" + data[i].modNm + "</option>";
						//abc += "<option value='"+data[i].modId+"' "+selected+">" + data[i].modNm + "</option>";
					} 
					$("#modId").html(abc);
					$("#modId").trigger("chosen:updated");
				}
			});
			
		});
		

		//厂商简称下拉框变动
		$("#mfrNo").change(function() {								

			var mobj = $("#modId");
			var var_goods_type = $("#goodsTyp").val();
			var var_fact=$("#mfrNo").val();
			var pobj = $("#goodsId");
			pobj.empty();
			$.ajax({
				type : "GET",
				url : "<%=request.getContextPath() %>/posModel/unlimitGetGoods?goods_type=" + var_goods_type+"&fact_id="+var_fact,
				dataType : "json",
				cache : false,
				success : function(data) {
					var abc='<option value="">请选择</option>';
					for (var i = 0; i < data.length; i++) {
						var selected = '${posInfo.goodsId}' == data[i].goods_id ? 'selected':'';
						abc += "<option value='"+data[i].goods_id+"' "+selected+">" + data[i].goods_name + "</option>";
					} 
					$("#goodsId").html(abc);
					$("#goodsId").trigger("chosen:updated");
				}
			});				
		});
		$("#mfrNo").trigger('change');
		//清空检索按钮
		function resetSearchForm(){
			 $("#mfrNo").val('');
			 $("#mfrNo").trigger("chosen:updated");
			 $("#goodsTyp").val('');
			 $("#goodsTyp").trigger("chosen:updated");
			 $("#goodsId").chosen("destroy"); 
			 var goodids='<option value="">请选择...</option>'+
			 '<c:forEach items="${subsectionList}" var="item">'+
			 '<option value="${item.goods_id}"<c:if test="${item.goods_id==posInfo.goodsId}"> selected </c:if> >'+
			 '${item.goods_name}</option></c:forEach>'
			 $("#goodsId").html(goodids);			 
			 $("#goodsId").chosen({});		
			 $("#goodsId").val('');
			 $("#goodsId").trigger("chosen:updated");
			 $("#modId").val('');
			 $("#modId").trigger("chosen:updated");
			 $("#modSts").val('');
			 $("#modSts").trigger("chosen:updated");
			 $("#normsDesc").val('');
			 $("#normsDesc").trigger("chosen:updated");			
			 $("#isSignature").val('');
			 $("#isSignature").trigger("chosen:updated");
			 $("#isSignature").attr("disabled","display"); 
			 $("#isSignature").trigger("chosen:updated");
			 $("#fact_mod").val('');
			 $("#fact_mod").trigger("chosen:updated");

		}

</script>
</body>
</html>











