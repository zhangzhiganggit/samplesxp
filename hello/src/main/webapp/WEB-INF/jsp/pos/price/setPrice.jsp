<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="../../common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>随行付 Admin</title>

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
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        价格修改
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                    	<form id="myForm" class="form-inline form-horizontal" action="<%=request.getContextPath() %>/posPriceAdmin/confirmPricePage.do" method="post">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                           	<input type="text" id="priceData" name="priceData" value="" style="display:none"/>
                                           	<input type="text" id="priceGroupId" name="priceGroupId" value="${priceGroupId}" style="display:none"/>
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width:10%">类型</th>
                                                <th style="text-align:center;width:30%">厂商</th>
                                                <th style="text-align:center;width:20%">型号</th>
                                                <th style="text-align:center;width:20%">通讯方式</th>
                                                <th style="text-align:center;width:10%">单位</th>
                                                <th style="text-align:center;width:10%">价格</th>
                                            </tr>
                                            </thead>
											<tbody>
                                            	<c:forEach items="${goodsPriceList}" var="gp">
													<tr class="tr-row">
														<td class="goodsName">${gp.goodsName}</td>
														<td class="factName">${gp.factName}</td>
														<td class="modName">${gp.modName}</td>
														<td style="display:none;" class="modId">${gp.modId}</td>
														<td style="display:none;" class="priceId">${gp.priceId}</td>
														<td>
														<c:if test="${gp.commType eq '1' }">GPRS</c:if>
														<c:if test="${gp.commType eq '0' }">拨号</c:if>
														<c:if test="${gp.commType eq '2' }">以太网</c:if>
														<c:if test="${gp.commType eq '3' }">TD-LTE</c:if>
														<c:if test="${gp.commType eq '4' }">CDMA</c:if>
														<c:if test="${gp.commType eq '5' }">CDMA2000</c:if>
														<c:if test="${gp.commType eq '6' }">WCDMA</c:if>
														<c:if test="${gp.commType eq '7' }">TD_SCDMA</c:if>
														<c:if test="${gp.commType eq '8' }">WIFI</c:if>
														<c:if test="${gp.commType eq '9' }">FDD-LTE</c:if>
                                           				<input type="text" id="commType" class="commType" value="${gp.commType}" style="display:none"/>
														</td>
														<%-- <td class="unit" style="text-align:center">${gp.unit}</td> --%>
														<td class="unit" style="text-align:center">${gp.unit}</td>
														<td>
															<%-- <c:if test='${gp.price == null}'>
																<input type="text" value="0.00" style="text-align:right" onkeyup="amount(this)" maxlength="7" onchange="compareValue(this)"  class="form-control input-small width-10px formText price" data-placement="bottom"/>
																<input type="text" value="0.00" class="oldPrice" style="display:none"/>
															</c:if>
															<c:if test='${gp.price != null}'>
																<c:if test = '${gp.price == 0}'>
																	<input type="text" value="0.00" class="oldPrice" style="display:none"/>
																	<input type="text" value="0.00" style="text-align:right" onkeyup="amount(this)" maxlength="7" onchange="compareValue(this)" class="form-control input-small width-10px formText price" data-placement="bottom"/>
																</c:if>
																<c:if test = '${gp.price != 0}'> --%>
																	<input type="text" value="${gp.price}" class="oldPrice" style="display:none"/>
																	<input type="text" value="${gp.price}" style="text-align:right" onkeyup="compareValue(this)" maxlength="7" class="form-control input-small width-10px formText price" data-placement="bottom"/>
																<%-- </c:if>
															</c:if> --%>
															<input type="text" value="0" class="changeFlag" style="display:none"/>
														</td>
													</tr>
												</c:forEach>
                                            </tbody>
                                        </table>
                                        </form>
                                    </div>
                                </div>
                                <div class="form-actions center widget-color-normal5">
                                    <button class="btn btn-success btn-sm saveBtn" type="button" onclick="nextStep()">
                                        <span class="ace-icon fa fa-print icon-on-right bigger-110"></span>
                                        	下一步
                                    </button>
                                </div>
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
        $('.chosen-select').chosen({});
        jQuery(function($) {

            $(".price").each(function(index){
            	var index=this.value.indexOf('.');
            	if(index == -1)
            	{
            		this.value=this.value+".00";
            	}
            });
            
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
    
    //---------------------------------
    
	    function nextStep(){
        	$(".saveBtn").attr('disabled',true);
        	var dataArray = [];
        	$(".tr-row").each(function(){
        		var changeFlag = $(this).find(".changeFlag").val();
        		var price = $(this).find(".price").val();
        		/* if(changeFlag == '1'){ */
        		if(Number(price) > 0 || changeFlag == '1'){
        			dataArray.push(
     						new trObject($(this).find(".modId").text(),
     								$(this).find(".priceId").text(),
     								$(this).find(".goodsName").text(),
     								$(this).find(".factName").text(),
     								$(this).find(".modName").text(),
     								$(this).find(".commType").val(),
     								$(this).find(".unit").text(),
     								$(this).find(".price").val())); 
        		}
    		});
        	if(dataArray.length == 0){
        		alert("请录入价格！");
        		$(".saveBtn").attr('disabled',false);
        		return;
        	}
        	var priceData = JSON.stringify(dataArray);
       		$("#priceData").val(priceData);
       		$("#myForm").submit();
	    }
        
        function trObject(modId,priceId,goodsName,factName,
        		modName,commType,unit,price){ 
        	this.modId = modId; 
        	this.priceId = priceId; 
        	this.goodsName = goodsName; 
        	this.factName = factName; 
        	this.modName = modName; 
        	this.commType = commType; 
        	this.unit = unit; 
        	this.price = price; 
       		return this;
        }     
        
        function amount(th){
            var regStrs = [
                ['^0(\\d+)$', '$1'], //禁止录入整数部分两位以上，但首位为0
                ['[^\\d\\.]+$', ''], //禁止录入任何非数字和点
                ['\\.(\\d?)\\.+', '.$1'], //禁止录入两个以上的点
                ['^(\\d+\\.\\d{2}).+', '$1'] //禁止录入小数点后两位以上
            ];
            for(i=0; i<regStrs.length; i++){
                var reg = new RegExp(regStrs[i][0]);
                th.value = th.value.replace(reg, regStrs[i][1]);
            }
            if(th.value < 0){
            	th.value = Math.abs(th.value);
            }
        }
        
        function compareValue(obj){
        	amount(obj);
        	var parent = $(obj).parents(".tr-row");
        	if(isNaN(Number(obj.value))){
        		$(obj).val(parent.find(".oldPrice").val());
        		return;
        	}
        	/* var index=obj.value.indexOf('.');
        	if(index == -1)
        	{
        		obj.value=obj.value+".00";
        	} */
        	if(Number(parent.find(".oldPrice").val()) == Number(obj.value)){
        		parent.find(".changeFlag").attr("value","0");
        	}else{
        		parent.find(".changeFlag").attr("value","1");
        	}
        	if(obj.value == '' || obj.value == null || Number(obj.value) == 0){
        		$(obj).val("0.00");
        	}
        }
</script>
</body>
</html>











