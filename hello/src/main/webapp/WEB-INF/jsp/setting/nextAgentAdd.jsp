<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.css.jsp"%>
    
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
							<c:if test='${null != org.orgUuid and  org.orgUuid != ""}'>修改直属机构</c:if> 
							<c:if test='${null == org.orgUuid or  org.orgUuid eq ""}'>添加直属机构</c:if> 
                                        
                                        
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm1" class="form-inline form-horizontal" method="post"
											<c:if test='${null != org.orgUuid and  org.orgUuid != ""}'> action="/org/confirmUpdateAgent.do" </c:if> 
											<c:if test='${null == org.orgUuid or  org.orgUuid eq ""}'> action="/org/confirmNextAgent.do" </c:if> 
                                             >
												<input type="hidden" id="fromFunction" name="fromFunction" value="${fromFunction }">
												<input type="hidden" id="orgProp" name="orgProp" value="2">
												<input type="hidden" id="regionalAgency" name="regionalAgency" value='${org.regionalAgency }'>
												<input type="hidden" id="activeFlg" name="activeFlg" value="1">
												<input type="hidden" id="orgUuid" name="orgUuid" value="${org.orgUuid }">
												<input type="hidden" id="action" name="action" 
													<c:if test='${null == org.orgUuid or  org.orgUuid eq ""}'>value="add1"</c:if>
													<c:if test='${null != org.orgUuid and  org.orgUuid !=""}'>value="update1"</c:if>
												>
												<input type="hidden" id="parentOrg" name="parentOrg" value="${parentOrg }">
												<input type="hidden" id="orgSts" name="orgSts" value="1">
												<input type="hidden" id="cityNmHidden" name="cityNm" value="${org.cityNm }">
												<input type="hidden" id="branchAttributionName" name="branchAttributionName" value="${branchAttributionName }">
												<input type="hidden" id="branchAttribution" name="branchAttribution" value="${branchAttribution }">
												
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属机构:</label>

                                                        <div class="col-sm-8  no-padding width-80">
															<input type="text" readonly="readonly"
																value="${parentOrgNm }" maxlength="100"
																class="form-control input-small width-95 "
																data-placement="bottom" title="不得输入超过100个字符">
														</div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding width-80">
															<input type="text" name="orgNm" id="orgNm"
																value="${org.orgNm }" maxlength="200"
																class="form-control input-small width-95 "
																data-placement="bottom" title="不得输入超过100个字符">
														</div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构地址<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding width-80">
															<input type="text" maxlength="120" name="orgAddr"
																value="${org.orgAddr }" id="orgAddr"
																class="form-control input-small width-95 "
																data-placement="bottom" title="不得输入超过60个字符">
														</div>                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >机构电话:</label>
                                                        <div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="orgTelNo"
																value="${org.orgTelNo }" id="orgTelNo"
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																class="form-control input-small width-200px "
																data-placement="bottom" title="只能填数字">
														</div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >联系人邮箱<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding">
															<input type="text"  maxlength="40"
																value="${org.contactMail }" name="contactMail"
																id="contactMail"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过40个字符">
														</div>
                                                    </div>
                                                    
                                                    


                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >邮政编码:</label>
                                                        <div class="col-sm-8  no-padding">
															<input type="text"
																class="form-control input-small width-200px "
																value="${org.orgZip}" maxlength="6" name="orgZip"
																id="orgZip" data-placement="bottom" title="只能填数字">
														</div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >传真:</label>
                                                        <div class="col-sm-8  no-padding">
															<input type="text" maxlength="32" name="orgFax"
																value="${org.orgFax }" id="orgFax"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过20个字符">
														</div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联系人<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="contact"
																value="${org.contact }" id="contact"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过10个字符">
														</div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联系人手机<span class="red">*</span>:</label>

                                                       <div class="col-sm-8  no-padding">
															<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')"
																class="form-control input-small width-200px "
																value="${org.contactTelNo }" maxlength="20"
																name="contactTelNo" id="contactTelNo"
																data-placement="bottom" title="不能超过20个字符">
														</div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属城市<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding">
															<select id="prov" name="prov"
																class="chosen-select form-control width-48"
																onchange="fillCitySelect('prov','cityCd','');">
																<option value="0">请选择省份</option>
																<c:forEach items="${provs }" var="prov">
																	<option value="${prov.areaId }">${prov.areaNm}</option>
																</c:forEach>
															</select> <select id="cityCd" name="cityCd"
																onchange="$('#cityNmHidden').val(document.getElementById('cityCd').options[document.getElementById('cityCd').selectedIndex].text)"
																class="chosen-select form-control width-48">
																<option value="0">请选择城市</option>
															</select>
														</div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构经营模式<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding">
															<select name="orgRunProp" id="orgRunProp"
																class="chosen-select form-control width-200px">
																<option value="1"
																	<c:if test="${org.orgRunProp ==1 }"> selected </c:if>>个人</option>
																<option value="2"
																	<c:if test="${org.orgRunProp ==2 }"> selected </c:if>>公司</option>
															</select>
														</div>
                                                    </div>



                                                    <div class="form-group form-group-sm width-300px ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构注册号:</label>

                                                        <div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="orgRegistNum"
																id="orgRegistNum" value="${org.orgRegistNum }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过20个字符">
														</div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人名称:</label>

                                                        <div class="col-sm-8  no-padding">
															<input type="text" maxlength="40" name="legalPersonNm"
																id="legalPersonNm" value="${org.legalPersonNm }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过40个字符">
														</div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册资本:</label>

                                                       <div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="registCapitall"
																id="registCapitall" value="${org.registCapitall }"
																class="form-control input-small width-200px "
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																data-placement="bottom" title="只能填数字">
														</div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-100 ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册地址:</label>

                                                        <div class="col-sm-8  no-padding width-80">
															<input type="text" maxlength="60" name="registAddress"
																id="registAddress" value="${org.registAddress }"
																class="form-control input-small width-95 "
																data-placement="bottom" title="不能超过40个字符">
														</div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人身份证:</label>

                                                        <div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="legalCard"
																id="legalCard" value="${org.legalCard }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="身份证号">
														</div>
                                                    </div>

                                                </div>
                                                <div class="col-sm-12 ele2" id="regionalAgencyDiv">
													<%@include file="regionalAgency.jsp"%>
                                                </div>

                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="submit" id="addButton">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        保存
                                                    </button>
                                                    <button class="btn  btn-sm" type="button" onclick="window.parent.$.fancybox.close();">
                                                       <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
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


    <%@include file="../layout/common.alljs.jsp"%>
    <script type="text/javascript">
    function addAgent(){
    	/* if(!checkNum()){ */
    		var box = $("input[type=checkbox][name=regionalAgencyStr]:checked")
    		var regionalAgencyStr = "";
    		for (var i=0;i<box.length;i++ ){
    			regionalAgencyStr = regionalAgencyStr+","+box[i].getAttribute("htmlText") ; 
    		}
    		$("#regionalAgency").val(regionalAgencyStr.substr(1))
    		$.ajax({
    	    	cache: true,
    	        type: "POST",
    	        url:'/org/checkQuickAddView.do',
    			data : $('#searchForm1').serialize(),// 你的formid
    			async : false,
    			error : function(data) {
    				data = eval("(" + data + ")")
    				alert(data.message);
    			},
    			success : function(data) {
    				data = eval("(" + data + ")")
    				if(data.message == 'ok'){
    					document.getElementById("searchForm1").submit()
    				}else{
    					alert(data.message);
    					$("#addButton").attr("class","btn btn-danger btn-sm")
						document.getElementById("addButton").disabled = undefined;
    				}
    			}
    		});
    }

    	$(document).ready(function(){
    		if('${org.prov}' != ''){
        		$("#prov").val('${org.prov}');
        		$("#prov").trigger("chosen:updated");
        		fillCitySelect('prov','cityCd','');
        		$("#cityCd").val(${org.cityCd});
        		$("#cityCd").trigger("chosen:updated");
        	}
    	})

    $('.main-content .chosen-select').chosen({});
    $("#orgRunProp").chosen({}).change(function(){
        if($("#orgRunProp").val()==2)
            $('.ele').show();
        else
            $('.ele').hide()
    });

    $("#select4").chosen({}).change(function(){
        if($("#select4").val()==1)
            $('.ele2').show();
        else
            $('.ele2').hide()
    });

    jQuery(function($) {
    	
            if($("#orgRunProp").val()==2)
                $('.ele').show();
            else
                $('.ele').hide()


        $('#searchForm1').formValidation({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	orgNm : {
					validators : {
						notEmpty : {
							message : "机构名称不能为空"
						},

					}
				},
				orgAddr : {
					validators : {
						notEmpty : {
							message : "机构地址不能为空"
						},

					}
				},
				contactMail : {
					validators : {
						notEmpty : {
							message : "联系人邮箱不能为空"
						},
						emailAddress: {
				            'default': '请输入有效的邮件地址'
				        },
					}
				},
				legalCard : {
					validators : {
						regexp: {
	                        regexp: /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/g,
	                        message:'请输入15或18位身份证号'
	                    }
					}
				},
				contact : {
					validators : {
						notEmpty : {
							message : "联系人不能为空"
						},
					}
				},
				contactTelNo : {
					validators : {
						notEmpty : {
							message : "联系人手机不能为空"
						},
						regexp: {
	                        regexp: /^1\d{10}$/g,
	                        message:'请输入正确的手机号'
	                    }

					}
				}
            }
        }).on('success.form.fv', function(e) {
            e.preventDefault();
            var $form = $(e.target);
            addAgent()
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

    })
</script>
</body>
</html>











