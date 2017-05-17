<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
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
                            <a href="#">分润管理</a>
                        </li>
                        <li class="active">其它款项金额修改</li>
                    </ul>
                </div>
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                     其它款项金额修改
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="<%=request.getContextPath()%>/agentExam/addAgentExam.do">
                                              <input type="hidden" id="orgNo" name="orgNo" value="${dsm.orgNo }">
                                               <input type="hidden" id="profitMonth" name="profitMonth" value="${dsm.profitMonth }">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                    data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${dsm.orgNo }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${dsm.orgNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${dsm.orgNm }</label>
                                                        </div>
                                                    </div>
                                                   
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >其它款项金额:</label>

                                                        <div class="col-sm-8 no-padding"  >
                                                            <select id="operFlg" name="operFlg"   class="col-sm-2 width-20 chosen-select width-20">
                                                                <option value="add" >加</option>
                                                                <option value="sub" >减</option>
                                                            </select>
                                                            <input type="text" id="otherAmount" onblur="test()" name="otherAmount" value=""  class="form-control input-small width-100px " data-placement="bottom" title=""   >元
                                                        </div>
                                                    </div>
                                                </div>
												<div class=" col-xs-12">
                                                     <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >备注:<font color="red">*</font></label>

                                                        <div class="col-sm-8 no-padding width-60">
                                                            <textarea maxlength="150"   id="otherComment" name="otherComment" style="height:80px" class="form-control limited input-small width-100"></textarea>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="subform()">
                                                        <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                        保存
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
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>>
	<%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
    function test(){
    	
    	var ss = $("#otherAmount").val();
    	var reg = /^[0-9]+(.[0-9]{1,3})?$/g ;
    	if(!reg.test(ss)){
    		alert("请输入小数位在3位以内的整数");
    		$("#otherAmount").val('');
    		return false;
    	}
    }

    function subform(){
	   var ss =  $("#otherComment").val();
	   var mm = $("#otherAmount").val();
	   if(ss==''||ss==null){
		   alert("请填写备注");
		   return ;
	   }
	   if(mm==''||mm==null){
		   alert("请填写金额");
		   return ;
	   }
	   test();
    	$.ajax({
			    	cache: true,
			        type: "POST",
			        url:'<%=request.getContextPath()%>/orgTradeSum/editOtherAmount.do',
					data : $('#searchForm').serialize(),// 你的formid
					async : false,
					error : function(data) {
						alert(data.msg);
					},
					success : function(data) {
						alert(data.msg);
						parent.$.fancybox.close();
					}
				});
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
    })
</script>
</body>
</html>











