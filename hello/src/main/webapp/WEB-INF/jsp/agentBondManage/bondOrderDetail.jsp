<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="../common/taglib.jsp"%>

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

                        <div class=" widget-container-col ui-sortable  "  >

                            <div class="widget-box widget-color-normal3"  >
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        订单详情
                                    </h5>


                                </div>

                                <div class="widget-body" >
                                    <div class="widget-main no-padding ">
                                        <form class="form-inline form-horizontal" action="" id="searchForm">
                                        	<input type="hidden" id="bondOrderId" value="${bondOrder.bondId }">
                                        	<input type="hidden" id="orgUuid" value="${bondOrder.orgUuid }">
                                        	<input type="hidden" id="receivedMoney" value="${bondOrder.receivedMoney }">
                                            <div class="widget-main no-padding" >
                                               
                                                <div class="col-sm-12" style="padding-top:2px">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="orgNm" style="text-align:left;">${orgNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="orgUuid" style="text-align:left;">${bondOrder.orgUuid }</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12" style="padding-top:2px">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >付款金额:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="receivedMoney" >${bondOrder.receivedMoney }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >付款日期:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="payDate">${bondOrder.payDate }</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12" style="padding-top:2px">
                                                    <div class="form-group form-group-sm width-60">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >付款账号:</label>

                                                        <div class="col-sm-8  no-padding width-80"  >
                                                            <label class="form-control input-small width-90   view-control  " id="remitCard">${bondOrder.remitCard }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-60">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >付款账户名称:</label>

                                                        <div class="col-sm-8  no-padding width-80"  >
                                                            <label class="form-control input-small width-90   view-control  " id="remiter">${bondOrder.remiter }</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12" style="padding-top:2px">
                                                    <!-- <div class="form-group form-group-sm width-60"> -->
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >付款凭证:</label>
                                                    	<div
															style="padding-left: 20px; padding-top: 20px; height: 180px"
																	class="form-group form-group-sm width-300px">
																	<img style="width: 290px; height: 150px" " alt=""
																		id="img0"
																		src="<%=request.getContextPath()%>/bond/manage/showImage?imageAddr=${bondOrder.filePath}${bondOrder.fileName}"
																		onclick="enlargeImg0()">
														</div>
                                                </div>
                                                <div class="row"></div>
                                                <c:if test="${flag == 1}">
	                                                <div class="form-actions center widget-color-normal5">
	
	                                                    <button class="btn  btn-sm" type="submit"  onclick="closeWin()">
	                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
	                                                        关闭
	                                                    </button>
	                                                </div>
                                                </c:if>
                                                <c:if test="${flag == 2 }">
                                                	<div class="form-actions center widget-color-normal5">
	                                                    <button class="btn btn-danger btn-sm saveBtn" type="button" onclick="confirmMoney(1)">
	                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
	                                                       确认收款
	                                                    </button>
	                                                    
	                                                    <button class="btn btn-danger btn-sm saveBtn" type="button" onclick="confirmMoney(2)">
	                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
	                                                       付款失败
	                                                    </button>
	
	                                                    <button class="btn  btn-sm cleanBtn" type="button" onclick="closeWindow()">
	                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
	                                                        取消
	                                                    </button>
                                                	</div>
                                                </c:if>
                                            </div>
                                        </form>

                                    </div>

                                </div>
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
    //查看图片
      function alertImg(id){
    	var url = "<%=request.getContextPath()%>/posOrderAdmin/imgPage.do?goodsOrderId="+id;
    	$.fancybox.open({
			href : url,
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
            }
		});
    }
    
    function closeWin(){
    	parent.$.fancybox.close();
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

        $('.id-input-file').ace_file_input({
            style:'well',
            btn_choose:'凭证预览图片！',
            btn_change:null,
            no_icon:'ace-icon fa fa-cloud-upload',
            droppable:true,
            height:300,
            thumbnail:'large',
           	before_change:function(files,dropped){
            	var fileName = files[0].name;
            	var fileSize = files[0].size;
            	var pointIndex = fileName.lastIndexOf('.');
            	if(pointIndex == -1){
            		alert('请上传图片文件(jpg、jpeg、png、gif、bmp)！');
            		return false;
            	}	
            	var fileType = fileName.substr(pointIndex+1).toLowerCase();
            	var allowMime = ['jpg','jpeg','png','gif','bmp'];
            	var flag = false;
            	for(var i = 0;i<allowMime.length;i++){
            		if(allowMime[i] == fileType){
            			flag = true;
            		}
            	}
            	if(!flag){
            		alert('请上传图片文件(jpg、jpeg、png、gif、bmp)！');
            	}
            	if(flag && parseInt(fileSize/1024) > 300){
            		alert('单张图片大小不可超过300K');
            		flag = false;
            	}
            	return flag;
            }
            //large | fit |small
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
        
    function confirmMoney(flag){
        	var bondOrderId = $("#bondOrderId").val();
        	var orgUuid = $("#orgUuid").val();
        	var receivedMoney = $("#receivedMoney").val();
        	$.ajax({
				type:'post',
				url:"<%=request.getContextPath()%>/bond/manage/confirmMoney",
				data:{"orgUuid":orgUuid,"bondId":bondOrderId,"receivedMoney":receivedMoney,"mark":flag},
				async:false,
				success:function(data){
					if(data){
						alert("收款成功！")
					}else{
						alert("收款失败！")
					}
					window.parent.$.fancybox.close();
					window.parent.location.reload();
				}
			});
        }
        
        function closeWindow(){
			window.parent.$.fancybox.close();
		}
</script>
</body>
</html>











