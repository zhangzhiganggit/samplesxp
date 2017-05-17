<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
    <%@include file="../layout/common.jsp"%>
    <script type="text/javascript" src="../../../js/jquery.rotate.min.js"></script>
    <style type="text/css">
		.suspend{
			position: fixed;
			left:25%;
			top:10%; 
			width:500px;
			height:500px;
		}
		.buttonsDiv{
			position: fixed; 
			left:25%; 
			top:4%;
			width: 500px;
			background-color:#CDCDCD;
			z-index: 9999;
		}
		#imgDiv{
			background-color:white;
		}
	</style>
    <script type="text/javascript">
    	
    	function comebackList(){
    		var proposeTimeStart = $("#proposeTimeStart").val();
    		var proposeTimeEnd = $("#proposeTimeEnd").val();
    		location.href='<%=request.getContextPath()%>/suggestion/list?entry=1'
    				+'&proposeTimeStart='+proposeTimeStart
    				+'&proposeTimeEnd='+proposeTimeEnd;
    	}
    	
    	function toUpdateSuggestion(uuid,operResult){
    		var remarks=$("#remarks").val();
    		var operType=$("#operType").val();
    		var executerNm=$("#executerNm").val();
    		var executeTime=$("#executeTime").val();
        	if(executerNm== null || executerNm==''){
        		alert("处理人不能为空");
        		return;
        	} else if(remarks== null || remarks==''){
        		alert("回复内容不能为空");
        		return;
        	}else if(operType== null || operType==''){
        		alert("处理方式不能为空");
        		return;
        	} else if(executeTime== null || executeTime==''){
        		alert("处理时间不能为空");
        		return;
        	} else{        		
        		var url="<%=request.getContextPath()%>/suggestion/toUpdateSuggestion";
        		$.ajax({
    				url:url,
    				data:
    				{
    					remarks:remarks,
    					operType:operType,
    					executerNm:executerNm,
    					executeTime:executeTime,
    					operResult:operResult,
    					uuid:uuid
    				},
    				cache: true,
    				async : false,
    				success : function(data) {
    					alert(data);
    					comebackList();
    				}
    			});
        		
        	}
    	}
    	function closeImgDiv(){//点击关闭
			$("#imgDiv").hide();
			$("#buttonsDiv").hide();
		}
    	function enlargeImg(address,col){//点击图片查看大图
			value=0;
			//address=address.replace("small","big");
			$("#imgDiv").remove();
			$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='500px' height='500px'  onclick='clickImgFunction()'/></div>");
			$("#img").attr("src",address);
			$("#img").attr("class",col);//将小图的信息，即第几列存于大图信息中
			$("#buttonsDiv").show();
			$("#imgDiv").show();
		}
    	var value=0;
		function clickImgFunction(obj){//图片翻转
			value +=90;
			$("#imgDiv").rotate({ animateTo:value});
		}
		function toNext(){//点击下一张
			//首先先获得当前图片列数col（第几张，存于class）
			var col=$("#img").attr("class");
			col=parseInt(col);
			//查找下一张图片，查找方法，列数加一
			var nextSrc=$('#'+(col+1)).attr("src");
			if(nextSrc==null){
				alert("已经是最后一张");
			}else{
				nextSrc=nextSrc.replace("small","big");
				$("#img").attr("class",col+1);
				$("#img").attr("src",nextSrc);
			}
		}
 	 	function toLast(){//点击上一张
			//首先先获得当前图片列数col（第几张，存于name）
			var col=$("#img").attr("class");
			col=parseInt(col);
			//查找下一张图片，查找方法，列数减一
			var lastSrc=$('#'+(col-1)).attr("src");
			if(lastSrc==null){
				alert("已经是第一张");
			}else{
				lastSrc=lastSrc.replace("small","big");
				$("#img").attr("class",col-1);
				$("#img").attr("src",lastSrc);
			}
		} 
    </script>
</head>
<body class="no-skin ">
<input type="hidden" id="proposeTimeStart"/>
<input type="hidden" id="proposeTimeEnd"/>
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
                                    <h5  class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        <span id="detailOrEdit">意见详情</span>
                                        
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" method="post" >
                                                <div class=" col-xs-12">
                                                <br/><br/>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >所属分公司:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input readonly="readonly" class="form-control input-small width-200px   view-control  " value="${suggestion.branchOrgNm}"
                                                                    data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ></input>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >所属一代:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input readonly="readonly" class="form-control input-small width-200px   view-control  " value="${suggestion.topAgentOrgNm}"
                                                                    data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ></input>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >直属机构:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input readonly="readonly" class="form-control input-small width-200px   view-control  " value="${agentOrgNm}"
                                                                   data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ></input>
                                                        </div>
                                                    </div>    
                                                    <br/>                                                
                                                     <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >联系人:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input readonly="readonly" class="form-control input-small width-200px   view-control  " value="${suggestion.contactPeople}"
                                                                    data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ></input>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >联系邮箱:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input readonly="readonly" class="form-control input-small width-200px   view-control  " value="${suggestion.contactEmail}"
                                                                   data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ></input>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >联系电话:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input readonly="readonly" class="form-control input-small width-200px   view-control  " value="${suggestion.contactTel}"
                                                                    data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ></input>
                                                        </div>
                                                    </div>
                                                    <br/>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >反馈类型:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input readonly="readonly" class="form-control input-small width-200px   view-control  " value="${suggestion.feedbackType}"
                                                                   data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ></input>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >提出人:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input readonly="readonly" class="form-control input-small width-200px   view-control  " value="${suggestion.proposePeople}"
                                                                   data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ></input>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >提出时间:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input readonly="readonly" class="form-control input-small width-200px   view-control  " value="<fmt:formatDate value="${suggestion.proposeTime }" pattern="yyyy-MM-dd HH:mm:ss"/>"
                                                                   data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ></input>
                                                        </div>
                                                    </div>
                                                    <br/> 
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >处理状态:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input readonly="readonly" class="form-control input-small width-200px   view-control  " value="${operStatus}"
                                                                    data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ></input>
                                                        </div>
                                                    </div>                                              
                                                    <br/>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >意见建议:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <textarea  cols="165" rows="6" style="height:80px" <c:if test="${operStatus!= '待回复'}" >disabled="disabled"</c:if> class="form-control limited input-small width-100"
                                                                    >${suggestion.suggestion }</textarea>
                                                        </div>
                                                    </div>
                                                    <br/>
                                                    <c:if test="${smallAddr0!=null && smallAddr0!=''}">
                                                    <div class="form-group form-group-sm width-100">
                                                    
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >图片:</label>
                                                        
																<img style="width: 200px; height: 150px" id="0" alt="" src="<%=request.getContextPath()%>/suggestion/showImage?imageAddr=${smallAddr0}" onclick="enlargeImg('<%=request.getContextPath()%>/suggestion/showImage?imageAddr=${smallAddr0}','0')">
																<c:if test="${smallAddr1!=null && smallAddr1!=''}">
																<img style="width: 200px; height: 150px" id="1" alt="" src="<%=request.getContextPath()%>/suggestion/showImage?imageAddr=${smallAddr1}" onclick="enlargeImg('<%=request.getContextPath()%>/suggestion/showImage?imageAddr=${smallAddr1}','1')">
																</c:if>
																<c:if test="${smallAddr2!=null && smallAddr2!=''}">
																<img style="width: 200px; height: 150px" id="2" alt="" src="<%=request.getContextPath()%>/suggestion/showImage?imageAddr=${smallAddr2}" onclick="enlargeImg('<%=request.getContextPath()%>/suggestion/showImage?imageAddr=${smallAddr2}','2')">
																</c:if>
                                                        <div class="col-sm-8  no-padding width-85"  >
                                                        </div>
                                                    </div>
                                                     <br/>
                                                     </c:if>
                                                     <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><span style="color:red">*</span>处理方式:</label>
                                                       <div class="col-sm-8  no-padding width-85">
															<select data-placeholder="请选择" name="operType"
																id="operType" <c:if test="${operStatus!= '待回复'}" >disabled="disabled"</c:if> 
																class="chosen-select form-control width-200px">
																<option value="">请选择</option>
																<option value="电话回复"<c:if test="${suggestion.operType=='电话回复'}">selected ="selected"</c:if>>电话回复</option>
																<option value="邮件回复"<c:if test="${suggestion.operType=='邮件回复'}">selected ="selected"</c:if>>邮件回复</option>
																<option value="无需回复"<c:if test="${suggestion.operType=='无需回复'}">selected ="selected"</c:if>>无需回复</option>
															</select>
														</div>
                                                    </div>
                                                    <br/>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><span style="color:red">*</span>回复内容:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <textarea name="remarks" id="remarks" cols="165" rows="6"
                                                                    style="height:80px" <c:if test="${operStatus!= '待回复'}" >disabled="disabled"</c:if> class="form-control limited input-small width-100"
                                                                    >${suggestion.remarks }</textarea>
                                                        </div>
                                                    </div>
                                                    <br/>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" ><span style="color:red">*</span> 处理人:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input <c:if test="${operStatus!= '待回复'}" >readonly="readonly"</c:if>  name="executerNm" id="executerNm"   class="form-control input-small width-200px   view-control  " value="${empNm}"
                                                                    data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    ></input>
                                                        </div>
                                                    </div>                                                    
                                                    <div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span style="color:red">*</span> 处理日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input  <c:if test="${operStatus!= '待回复'}" >disabled="disabled"</c:if> type="text" name="executeTime" value="${executeTime }"
																	id="executeTime" class="input-small form-control">																
															</div>
														</div>
													</div>
                                                     <br/>
                                                 </div>
                                                <div class="row"></div>
                                                
                                                <div class="form-actions center widget-color-normal5">
                                                <c:if test="${operStatus== '待回复'}" >
                                                <button id="edit2" class="btn btn-danger btn-sm" type="button" onclick="toUpdateSuggestion('${suggestion.uuid}',1)">
                    					                    <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110" ></span>
                                                       提交
					                                </button>
                                                </c:if>
                                                
                                                    
                                                    <button id="detail1" class="btn btn-default  btn-sm" type="button" onclick='comebackList()'>
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                        返回
                                                    </button>
                                                    <c:if test="${operStatus== '待回复'}" >
                                                <button id="detail1" class="btn btn-info  btn-sm" type="button" onclick="toUpdateSuggestion('${suggestion.uuid}',0)">
                                                        <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                        无效
                                                    </button>
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



            </div>
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->
    
    
    <div id='add'>
	<div id="buttonsDiv" class="buttonsDiv" hidden="hidden">
		<div style="float: left;">
			<button class="btn btn-sm" type="button" onclick="toLast()">
            <span class="ace-icon fa icon-on-right bigger-110"></span>
                                      上一张                                                                                              
         	</button>
         	<button class="btn btn-sm" type="button" onclick="toNext()">
            <span class="ace-icon fa icon-on-right bigger-110"></span>
                                      下一张                                                                                              
         	</button>
		</div>
		<div style="float:right;">
			<button class="btn btn-sm" type="button" onclick="closeImgDiv()">
            <span class="ace-icon fa icon-on-right bigger-110"></span>
                                      关闭图片                                                                                              
         	</button>
		</div>
	</div>
	<div class="suspend" id="imgDiv" hidden="hidden">
		<img id='img'/>
	</div> 
</div>



<!-- basic scripts -->

    <%@include file="../layout/common.js.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    $('.chosen-select').chosen({});
    jQuery(function($) {
    	
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
	});

    jQuery(function($) {

        $('[data-rel=popover]').popover({container:'body'});
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
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true});





    })
</script>
</body>
</html>











