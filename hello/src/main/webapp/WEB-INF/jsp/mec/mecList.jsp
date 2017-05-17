<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
<%@include file="../layout/common.jsp"%>
<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" href="../css/font.css" />

<link href="../css/datepicker.min.css" rel="stylesheet">
<link href="../css/bootstrap-timepicker.min.css" rel="stylesheet">
<link href="../css/daterangepicker.min.css" rel="stylesheet">
<link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrapValidator.css"/>
<link rel="stylesheet" href="../css/main.css" class="ace-main-stylesheet" id="main-ace-style" />
<script src="../js/main.extra.js"></script>
<link rel="stylesheet" href="../css/docsupport/prism.css">
<link rel="stylesheet" href="../css/chosen.css">
<script type="text/javascript">
function mecPageList(){
	 $.ajax({
		 url: "<%=request.getContextPath()%>/mec/pageList.do",
		 data:{	},
		 async:false,success: function(data){
	        
			 $("#mecPageList").html(data)
	    }});
}
</script>
</head>

<body class="no-skin ">
    
    <%@include file="../layout/header.jsp"%>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
        <%@include file="../layout/menu.jsp"%>

        <div class="main-content ">
            <div class="main-content-inner ">

                <div id="breadcrumbs" class="breadcrumbs">
                    <script type="text/javascript">
                        try{
                            ace.settings.check('breadcrumbs' , 'fixed');
                            ace.settings.breadcrumbs_fixed(null, true);

                        }catch(e){}
                    </script>

                    <ul class="breadcrumb">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="#">Home</a>
                        </li>

                        <li>
                            <a href="#">商户管理</a>
                        </li>


                        <li class="active">商户查询</li>
                    </ul><!-- /.breadcrumb -->


                </div>
                <div class="page-content ">

                    <div class="row" >


                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        商户查询条件
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


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/mec/pageList.do" id="searchForm">
                                                <div class=" col-xs-12">
                                                
                                                
                                                
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mno" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mercCnm" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mercAbbr" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签约费率:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="feeRat1" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                    
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >创建时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="dateStart" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" name="dateEnd" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >行业大类:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="form-field-select-3" multiple class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                <option value="1001">餐娱类</option>
                                                                <option value="3001">一般类</option>
                                                                <option value="2001">民生类</option>
                                                                <option value="1002">房产汽车类</option>
                                                                <option value="3002">批发类</option>
                                                                <option value="4001">公益类</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="form-field-select-3" multiple class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                <option value="01">正常</option>
                                                                <option value="03">停用</option>
                                                                <option value="02">销户</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="form-field-select-3" multiple class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                <option value="">全部</option>
                                                                <option value="0">正常</option>
                                                                <option value="1">暂停结算</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    
                                                </div>

                                                <button class="btn btn-normal btn-sm" type="button" onclick="mecPageList()">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="submit">
                                                    <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    Excel
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
                                        商户查询结果
                                    </h5>


                                </div>

                                <div class="widget-body" id="mecPageList">
                                      <%@include file="mecPageList.jsp"%>


                                </div>
                            </div>
                        </div>
                        <div class="row col-sm-12    ">
                            <div class="col-sm-4 hidden-480 left">
                                <label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
                            </div>

                                <div class="col-sm-8 right">
                                    <div class="dataTables_paginate paging_simple_numbers clearfix" id="dynamic-table_paginate">
                                        <ul class="pagination clearfix">
                                            <li class="paginate_button previous disabled" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_previous">
                                                <a href="#">|<</a></li><li class="paginate_button active" aria-controls="dynamic-table" tabindex="0">
                                                <a href="#">1</a>
                                            </li>
                                            <li class="paginate_button " aria-controls="dynamic-table" tabindex="0"><a href="#">2</a></li>
                                            <li class="paginate_button " aria-controls="dynamic-table" tabindex="0"><a href="#">3</a></li>
                                            <li class="paginate_button next" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_next"><a href="#">>|</a></li>
                                        </ul>
                                    </div>
                                </div>

                        </div>
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../layout/footer.jsp"%>
<script src="../js/jquery.2.1.1.js"></script>
<script type="text/javascript">
  window.jQuery || document.write("<script src='js/jquery.js'>"+"<"+"/script>");
</script>
<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.touch.js"></script>
<script src="../js/bootstrap-datepicker.min.js"></script>
<script src="../js/moment.min.js"></script>
<script src="../js/jquery.easychart.js"></script>
<script src="../js/jquery.sparkline.js"></script>
<script src="../js/jquery.flot.js"></script>
<script src="../js/jquery.flot.pie.js"></script>
<script src="../js/jquery.flot.resize.js"></script>
<script type="text/javascript" src="../js/bootstrapValidator.js"> </script>
<script src="../js/main.element.js"></script>
<script src="../js/main.js"></script>
<script type="text/javascript" src="../js/zh_CN.js"> </script>
<script src="../js/chosen.jquery.js" type="text/javascript"></script>
<script src="../js/docsupport/prism.js" type="text/javascript" charset="utf-8"></script>


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
</script>
</body>
</html>











