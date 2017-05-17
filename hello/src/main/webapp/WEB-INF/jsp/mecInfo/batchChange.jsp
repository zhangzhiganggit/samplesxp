<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
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

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        修改关联
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" method="post"  action="<%=base%>mecIf/saveExcelEmp.do"  enctype="multipart/form-data">
                                            
                                                <div class=" col-xs-12">

                                                    <h4>将下列商户的销售员修改为：</h4>

                                                </div>
                                                <div class="col-sm-12">

                                                    <div class="form-group form-group-sm  width-300px ">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >所属机构:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" id="checkedOrg" name="orgUuid" onchange="getEmp()" class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${orgList }" var="org">
                                                                	<option value="${org.orgUuid }">${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm  width-300px  " >

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >销售人员:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" id="checkedEmp" name="empNo" onchange="$('#addButton').attr('class','btn btn-danger btn-sm');document.getElementById('addButton').disabled = undefined;" class="chosen-select form-control width-200px">
                                                                <option selected value='请选择'>请选择</option>
                                                            </select>
                                                        </div>
                                                    </div>
	                                              	<div class=" col-xs-12">
	                                                    <h3 class="header smaller lighter green">选择Excel导入</h3>
	                                                    <div class="form-group col-sm-4 ">
	                                                        <label class="ace-file-input ace-file-multiple widget-main" style="height:200px">
	                                                            <input type="file" name="excelFile" id="excelFile" class="id-input-file" >
	                                                            <span class="red">建议上传数据不要超过10000条</span>
	                                                        </label>
	                                                    </div>
	                                                </div>

                                                </div>
                                                <div class="col-sm-12">
                                                    <table class="table">
                                                       
                                                        
                                                        
                                                    </table>
                                                </div>


                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="button"  id='addButton' onclick="submitTest()">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        修改
                                                    </button>
                                                    <button class="btn  btn-sm" type="button" onclick="window.parent.$.fancybox.close();">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                        关闭
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>



            </div>
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

<!-- basic scripts -->

    <%@include file="../layout/common.js.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    function getEmp(){
    	var orgUuid = $("#checkedOrg").val();
    	if(orgUuid!=""){
    		$.ajax({
		    	cache: true,
		        type: "POST",
		        url:'<%=base%>employee/getEmp.do',
				data : {
					"orgUuid":orgUuid
				},// 你的formid
				async : false,
				error : function(data) {
					alert("提交失败");
				},
				success : function(data) {
					var options = "<option selected value='请选择'>请选择</option>";
		             for(var i=0;i<data.length;i++){
		            	 options+="<option value=\""+data[i].userCode+"\">"+data[i].remarkName+"</option>";
		             }
		             $("#checkedEmp").html(options);
		             $("#checkedEmp").trigger("chosen:updated");
				}
			});
    	}else{
    		var options = "<option selected value='请选择'>请选择</option>";
    		$("#checkedEmp").html(options);
            $("#checkedEmp").trigger("chosen:updated");
    	}
    }
    
	function submitTest(){
		var checkedEmp = $("#checkedEmp").val();
		if(checkedEmp=='请选择'){
			alert("请先选择销售人员")
			return ;
		}
		document.getElementById("searchForm").submit();
	}

    $('.chosen-select').chosen({});
    jQuery(function($) {
        $(".radio1").hide();
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
//                            message: 'Tên tài khoản này đã được đăng ký'
//                        },
                        different: {
                            field: 'email',
                            message: 'The username and password cannot be the same as each other'
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
        $('.id-input-file').ace_file_input({
            style:'well',
            btn_choose:'请上传Excel文件！',
            btn_change:null,
            /* allowExt : ['xlxs','xls'], */
            no_icon:'ace-icon fa fa-cloud-upload',
            droppable:true,
            height:300,
            thumbnail:'large'//large | fit |small
            //,icon_remove:null//set null, to hide remove/reset button
            /**,before_change:function(files, dropped) {
            //Check an example below
            //or examples/file-upload.html
            return true;
            }*/
            /**,before_remove : function() {
            return true;
            }*/
            ,
            preview_error : function(filename, error_code) {
                //name of the file that failed
                //error_code values
                //1 = 'FILE_LOAD_FAILED',
                //2 = 'IMAGE_LOAD_FAILED',
                //3 = 'THUMBNAIL_FAILED'
                //alert(error_code);
            }
        }).on('change', function(){
            //console.log($(this).data('ace_input_files'));
            //console.log($(this).data('ace_input_method'));
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
</body>
</html>











