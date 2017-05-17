jQuery(function($) {
    $('#mercInfoForm').formValidation({
        message: 'This value is not valid',
        container:'popover',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            //签购单名称
        	mercSnm: {
                validators: {
                    notEmpty: {
                    	message:'签购单名称不可为空'
                    },
                    stringLength: {
                    	max : 30
                    }
                }
            },
            //营业地址-街道
            mercAddr: {
                validators: {
                    notEmpty: {
                    	message:'营业地址-街道信息不可为空'
                    },
                    stringLength: {
                    	max : 60
                    }
                }
            },
            //注册地址-街道
            regAddrStreet: {
                validators: {
                    notEmpty: {
                    	message:'营业地址-街道信息不可为空'
                    },
                    stringLength: {
                    	max : 40
                    }
                }
            },
            //经营范围
        	bizScope: {
                validators: {
                    notEmpty: {
                    	message:'经营范围不可为空'
                    },
                    stringLength: {
                    	max : 200
                    }
                }
            },
            //联系人电话
            telNo: {
                validators: {
                    notEmpty: {
                    	message:'联系人手机号不可为空'
                    },
                    phone: {
                    	country : 'CN'
                    }
                }
            },
            //费率
            feeRate: {
                validators: {
                    notEmpty: {
                    	message:'费率不可为空'
                    },
                    numeric: {},
                    greaterThan: {
                    	value : 0,
                    	message : '签约费率不可低于0%'
                    },
                    lessThan:{
                    	value :10,
                    	message : '签约费率不可高于10%'
                    }
                }
            },
            //封顶金额
            capAmt: {
                validators: {
                    notEmpty: {
                    	message:'封顶金额不可为空，0为不封顶！'
                    },
                    numeric: {
                    	message:'请填写有效封顶金额！'
                    },
                    greaterThan: {
                    	value : 0,
                    	message : '封顶金额不可低于0元'
                    },
                    lessThan:{
                    	value :9999999.99,
                    	message : '封顶金额不可高于9999999.99元'
                    }
                }
            },
            //注册名称
        	"mercQualInfo.mercRegNm": {
                validators: {
                    notEmpty: {
                    	message:'注册名称不可为空'
                    },
                    stringLength: {
                    	max : 60
                    }
                }
            },
            //营业地址-街道信息
            mercAddr: {
                validators: {
                    notEmpty: {
                    	message:'营业地址不可为空'
                    },
                    stringLength: {
                    	max : 120
                    }
                }
            },
            //注册地址-街道信息
        	regAddrStreet: {
                validators: {
                    notEmpty: {
                    	message:'注册地址不可为空'
                    },
                    stringLength: {
                    	max : 120
                    }
                }
            },
            //注册登记号
        	"mercQualInfo.regNo": {
                validators: {
                    notEmpty: {
                    	message:'注册登记号不可为空'
                    },
                    stringLength: {
                    	max : 60
                    }
                }
            },
            //法人姓名
        	"mercQualInfo.legalNm": {
                validators: {
                    notEmpty: {
                    	message:'法人姓名不可为空'
                    },
                    stringLength: {
                    	max : 30
                    }
                }
            },
            //法人证件号
        	"mercQualInfo.legalCredentialsNo": {
                validators: {
                    notEmpty: {
                    	message:'法人证件号不可为空'
                    }
                }
            },
            //对私身份证号
        	"mercStmInfo.idCardNo1": {
                validators: {
                    notEmpty: {
                    	message:'结算人身份证号不可为空'
                    }
                }
            },
          	//经营名称
            "mercIncome.mercFnm": {
        		validators: {
                    notEmpty: {
                    	message:'经营名称不可为空'
                    },
                    stringLength: {
                    	max : 60
                    }
                }
            },
        	//结算卡1 - 结算银行详细信息
        	"mercStmInfo.stmBankDetails1": {
                validators: {
                    notEmpty: {
                    	message:'个体结算信息-开户行信息不可为空'
                    },
                    stringLength: {
                    	max : 60
                    }
                }
            },
            //结算卡1 - 结算银行联行行号
            "mercStmInfo.stmLbankNo1": {
                validators: {
                    notEmpty: {
                    	message:'个体结算信息-联行行号不可为空'
                    },
                    stringLength: {
                    	max : 60
                    }
                }
            },
            //结算卡1 - 结算账户名
            "mercStmInfo.stmActNm1": {
                validators: {
                    notEmpty: {
                    	message:'个体结算信息-账户名不可为空'
                    },
                    stringLength: {
                    	max : 60
                    }
                }
            },
            //结算卡1 - 结算账户
            "mercStmInfo.stmAct1": {
                validators: {
                    notEmpty: {
                    	message:'个体结算信息-结算账号不可为空'
                    },
                    stringLength: {
                    	max : 20
                    }
                }
            },
            //结算卡2 - 结算银行详细信息
        	"mercStmInfo.stmBankDetails2": {
                validators: {
                    stringLength: {
                    	max : 60
                    }
                }
            },
            //结算卡2 - 结算银行联行行号
            "mercStmInfo.stmLbankNo2": {
                validators: {
                    stringLength: {
                    	max : 60
                    }
                }
            },
//            //结算卡2 - 结算账户名
//            "mercStmInfo.stmActNm2": {
//                validators: {
//                    stringLength: {
//                    	max : 60
//                    },
//                    identical: {
//                    	field : "mercQualInfo.mercRegNm",
//                    	message : '对公账户名必须和注册名称一致'
//                    }
//                }
//            },
            //结算卡2 - 结算账户
            "mercStmInfo.stmAct2": {
                validators: {
                    stringLength: {
                    	max : 20
                    }
                }
            },
            //功能授理至少选择一个
            'settleCardFunction': {
                validators: {
                	choice: {
                        min: 1
                    }
                }
            },
            regAddrTown:{
            	choice: {
                    min: 1
                }
            },
            //维护费免收起点
//            "feeInfo.freeStartingPoint":{
//                validators: {
//                    notEmpty: {
//                    	message:'维护费免收起点不可为空'
//                    },
//                    digits:{},
//                    greaterThan: {
//                    	value : 1,
//                    	message : '维护费免收起点不可低于1元'
//                    },
//                    lessThan:{
//                    	value :9999999,
//                    	message : '维护费免收起点不可高于9,999,999元'
//                    }
//                }
//            },
            //最低有效交易笔数
//            "feeInfo.minEffectiveTrans":{
//                validators: {
//                    notEmpty: {
//                    	message:'最低交易笔数不可为空'
//                    },
//                    digits:{},
//                    greaterThan: {
//                    	value : 1,
//                    	message : '最低交易笔数不可低于1笔'
//                    },
//                    lessThan:{
//                    	value :9999999,
//                    	message : '最低交易笔数不可高于9,999,999笔'
//                    }
//                }
//            },
            //押金金额
//            "feeInfo.deposit":{
//                validators: {
//                    notEmpty: {
//                    	message:'押金金额不可为空'
//                    },
//                    digits:{},
//                    greaterThan: {
//                    	value : 1,
//                    	message : '押金金额不可低于1元'
//                    },
//                    lessThan:{
//                    	value :9999999,
//                    	message : '押金金额不可高于9,999,999元'
//                    }
//                }
//            },
            //会签意见
            opinion: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                    	max : 200
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
//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
    /* $('input[name=date-range-picker]').daterangepicker({
        'applyClass' : 'btn-sm btn-success',
        'cancelClass' : 'btn-sm btn-default',
        locale: {
            applyLabel: 'Apply',
            cancelLabel: 'Cancel',
        }
    })
        .prev().on(ace.click_event, function(){
            $(this).next().focus();
        });
    $('#timepicker1').timepicker({
        minuteStep: 1,
        showSeconds: true,
        showMeridian: false
    }).next().on(ace.click_event, function(){
        $(this).prev().focus();
    });
    $('#date-timepicker1').datetimepicker().next().on(ace.click_event, function(){
        $(this).prev().focus();
    }); */


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