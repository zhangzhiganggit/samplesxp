<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="../../common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
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
                                        确认价格修改
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
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
                                            	<c:forEach items="${confirmList}" var="cl">
													<tr class="tr-row">
														<td style="display:none;" class="modId">${cl.modId}</td>
														<td style="display:none;" class="priceId">${cl.priceId}</td>
														<td style="BORDER-LEFT: #568AC3 1px solid;">${cl.goodsName}</td>
														<td>${cl.factName}</td>
														<td>${cl.modName}</td>
														<td>
														<c:if test="${cl.commType eq '1' }">GPRS</c:if>
														<c:if test="${cl.commType eq '0' }">拨号</c:if>
								                        <c:if test="${cl.commType eq '2' }">以太网</c:if>
								                        <c:if test="${cl.commType eq '3' }">TD-LTE</c:if>
								                        <c:if test="${cl.commType eq '4' }">CDMA</c:if>
								                        <c:if test="${cl.commType eq '5' }">CDMA2000</c:if>
								                        <c:if test="${cl.commType eq '6' }">WCDMA</c:if>
								                        <c:if test="${cl.commType eq '7' }">TD_SCDMA</c:if>
								                        <c:if test="${cl.commType eq '8' }">WIFI</c:if>
								                        <c:if test="${cl.commType eq '9' }">FDD-LTE</c:if>
														</td>
														<td>${cl.unit}</td>
														<td class="price" style="text-align:right;">${cl.price}</td>
													</tr>
												</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="form-actions center widget-color-normal5">
                                    <button class="btn btn-success btn-sm saveBtn" type="button" onclick="savePrice()">
                                        <span class="ace-icon fa fa-print icon-on-right bigger-110"></span>
                                        	确认保存
                                    </button>
                                    <button class="btn  btn-sm" type="button" onclick="history.go(-1)">
                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                                                                              返回
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
    
	    function savePrice(){
        	$(".saveBtn").attr('disabled',true);
        	var dataArray = [];
        	$(".tr-row").each(function(){
        			dataArray.push(
     						new trObject($(this).find(".modId").text(),
     								$(this).find(".priceId").text(),
     								$(this).find(".price").text())); 
    		});
        	var priceData = JSON.stringify(dataArray);
        	var priceGroupId = $("#priceGroupId").val();
        	$.ajax({ url: "/posPriceAdmin/savePrice.do?randomNum="+new Date().getTime(), 
				   data:{priceData:priceData,priceGroupId:priceGroupId},
				   type: 'POST',
				   async:false,
				   success: function(data){
					   	if("1" == data){
					   		alert("保存成功！");
					   		parent.$.fancybox.close();
					   	}else{
					   		alert("保存失败！");
					   		$(".saveBtn").attr('disabled',false);
					   	}
		        }});
	    }
    
        
        
        function trObject(modId,priceId,price){ 
        	this.modId = modId; 
        	this.priceId = priceId; 
        	this.price = price; 
       		return this;
        }     
        
</script>
</body>
</html>











