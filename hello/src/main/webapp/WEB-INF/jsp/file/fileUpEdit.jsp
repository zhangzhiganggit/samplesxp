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

                        <div class=" widget-container-col ui-sortable"   >
                            <div class=" widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                      修改文件信息
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form  class="form-inline form-horizontal" method="POST"
                                       id="bnkLinkForm" action="<%=request.getContextPath()%>/file/detailUpdate.do"  >
                                       <input type="hidden" id="fid" name="fid" value="${ids }">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >分类名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
<!--                                                             <input type="text" name="fileGroupId" id="fileGroupId" class="form-control input-small width-200px " data-placement="bottom" title=""   >
 -->                                                   <select id="typeCd" name="typeCd" data-placeholder="请选择"   class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                <c:forEach items="${fileType}" var="typList">
																		<option value="${typList.fileGroupId}">${typList.groupName}</option>
															   </c:forEach>
                                                       </select>
                                                      
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >文件名:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="fileDesc" id="fileDesc" value="${desc }" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                </div>
                                       
                                                <div class=" col-xs-12"></div>
                                                <div class=" col-xs-12"></div>
                                                <div class=" col-xs-12"></div>
                                                <div class="row"></div>
                                                <div class="row"></div>
                                                <div class="row"></div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                               <!--      <button class="btn btn-danger btn-sm" type="submit" id="btnUpload" >
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        提交
                                                    </button> -->
                                                    
                                                      <button class="btn btn-danger btn-sm" type="button"  onclick="editFileDetail()">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        提交
                                                    </button>

                                                    <button class="btn  btn-sm" type="button" onclick="closeThisWin()">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                        返回
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
    
    function editFileDetail(){
   	 $.ajax({
			    	cache: true,
			        type: "POST",
			        url:'/file/detailUpdate.do',
					data : $('#bnkLinkForm').serialize(),// 你的formid
					async : false,
					error : function(data) {
						//data = eval("(" + data + ")")
						alert(data.msg);
					},
					success : function(data) {
						//data = eval("(" + data + ")")
						alert(data.msg);
						parent.$.fancybox.close();
					}
				});
   	 
   	 
    }
    
    
    function closeThisWin(){
    	parent.$.fancybox.close();
    }
    

    function addFile(){
    	   var fileGroupId = $("#fileGroupId").val();
    	    var myfiles = $("#myfiles").val();
    	    if(fileGroupId=="" || fileGroupId==null || fileGroupId.trim()==""){
    	    	alert("请选择文档分组");
    	    	return false;
    	    }
    	    if(myfiles==""||myfiles==null){
    	    	alert("请选择一个上传文件");
    	    	return false;
    	    }
    	    $("#searchForm").submit();
    }
    
    
    $('.chosen-select').chosen({});
    jQuery(function($) {
    	$("#typeCd").val('${typeids}');
		$("#typeCd").trigger("chosen:updated");
    	
    	
    	 $("#btnUpload").click(function(){ 
    		 var fileGroupId = $("#fileGroupId").val();
     	    var myfiles = $("#myfiles").val();
     	    if(fileGroupId=="" || fileGroupId==null || fileGroupId.trim()==""){
     	    	alert("请选择文档分组");
     	    	return false;
     	    }
     	    if(myfiles==""||myfiles==null){
     	    	alert("请选择一个上传文件");
     	    	return false;
     	    }
     	  // alert(11)
     	    
     	   document.getElementById("searchForm").submit();
    		 
    		 
    	 }); 
    	
    	
    	

        $('.id-file-format').removeAttr('checked').on('change', function() {
            var whitelist_ext, whitelist_mime;
            var btn_choose
            var no_icon
            if(this.checked) {
                btn_choose = "Drop images here or click to choose";
                no_icon = "ace-icon fa fa-picture-o";
                whitelist_ext = ["jpeg", "jpg", "png", "gif" , "bmp"];
                whitelist_mime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];
            }
            else {
                btn_choose = "Drop files here or click to choose";
                no_icon = "ace-icon fa fa-cloud-upload";
                whitelist_ext = null;//all extensions are acceptable
                whitelist_mime = null;//all mimes are acceptable
            }
            var file_input = $('#id-input-file-3');
            file_input
                    .ace_file_input('update_settings',
                    {
                        'btn_choose': btn_choose,
                        'no_icon': no_icon,
                        'allowExt': whitelist_ext,
                        'allowMime': whitelist_mime
                    })
            file_input.ace_file_input('reset_input');
            file_input
                    .off('file.error.ace')
                    .on('file.error.ace', function(e, info) {
                        //console.log(info.file_count);//number of selected files
                        //console.log(info.invalid_count);//number of invalid files
                        //console.log(info.error_list);//a list of errors in the following format
                        //info.error_count['ext']
                        //info.error_count['mime']
                        //info.error_count['size']
                        //info.error_list['ext'] = [list of file names with invalid extension]
                        //info.error_list['mime'] = [list of file names with invalid mimetype]
                        //info.error_list['size'] = [list of file names with invalid size]
                        /**
                         if( !info.dropped ) {
        //perhapse reset file field if files have been selected, and there are invalid files among them
        //when files are dropped, only valid files will be added to our file array
        e.preventDefault();//it will rest input
        }
                         */
                        //if files have been selected (not dropped), you can choose to reset input
                        //because browser keeps all selected files anyway and this cannot be changed
                        //we can only reset file field to become empty again
                        //on any case you still should check files with your server side script
                        //because any arbitrary file can be uploaded by user and it's not safe to rely on browser-side measures
                    });
        });


        $('.id-input-file').ace_file_input({
            style:'well',
            btn_choose:'请上传图片或文件！',
            btn_change:null,
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
//        $('input[name=date-range-picker]').daterangepicker({
//            'applyClass' : 'btn-sm btn-success',
//            'cancelClass' : 'btn-sm btn-default',
//            locale: {
//                applyLabel: 'Apply',
//                cancelLabel: 'Cancel',
//            }
//        })
//            .prev().on(ace.click_event, function(){
//                $(this).next().focus();
//            });
//        $('#timepicker1').timepicker({
//            minuteStep: 1,
//            showSeconds: true,
//            showMeridian: false
//        }).next().on(ace.click_event, function(){
//            $(this).prev().focus();
//        });
//        $('#date-timepicker1').datetimepicker().next().on(ace.click_event, function(){
//            $(this).prev().focus();
//        });


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











