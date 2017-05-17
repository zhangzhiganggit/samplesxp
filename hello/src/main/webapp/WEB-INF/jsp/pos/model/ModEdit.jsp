<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付</title>

<%@include file="../../common/taglib.jsp"%>
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
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div>
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 型号修改
									</h5>
									<span class="widget-toolbar"> <a data-action="collapse"
										href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal"
												action="/posModel/posModelEditSave" id="deviceModelForm">
												<input type="hidden" id="modId" name="modId" value="${deviceModel.modId}">
												<input type="hidden" id="version" name="version" value="${deviceModel.version}">
												<input type="hidden" id="modids" name="modids" value="${deviceModel.modids}">
												<input type="hidden" id="godTyp" name="godTyp" value="${deviceModel.goods_type}">  
												<input type="hidden" id="fid" name="fid" value="${deviceModel.fact_id}">
												<input type="hidden" id="fmod" name="fmod" value="${deviceModel.fact_mod}">
												<input type="hidden" id="checkFlg" name="checkFlg" value="1">
												<input type="hidden" id="updateFlg" name="updateFlg" value="0">
												<div class=" col-xs-12"><div class=" col-xs-12">
												   <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物品类型<span><font color="red">*</font></span>:</label>
                                                       <div class="col-sm-8  no-padding"  >
															<select name="goods_type"
																id="goods_type"
																class="chosen-select form-control width-200px"
																<c:if test="${not empty deviceModel.modId}">disabled</c:if>>
																	<option value="">选择...</option>
																	<c:if test="${!empty typeList }">
																		<c:forEach items="${typeList}" var="item">
																			<option value="${item.goods_type}"
																				<c:if test="${item.goods_type==deviceModel.goods_type}"> selected </c:if>>${item.goods_name}</option>
																		</c:forEach>
																	</c:if>
															</select>
															</div></div>
															 <div class="form-group form-group-sm width-300px">
                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号细分<span><font color="red">*</font></span>:</label>
                                                            <div class="col-sm-8  no-padding"  >
															<select name="goods_id"
																id="goods_id"
																class="chosen-select form-control width-200px"
																<c:if test="${not empty deviceModel.modId}"> disabled </c:if>>
																	<option value="">选择...</option>
																	<c:if test="${!empty subsectionList }">
																		<c:forEach items="${subsectionList}" var="item">
																			<option value="${item.goods_id}"
																				<c:if test="${item.goods_id==deviceModel.goods_id}"> selected </c:if>>${item.goods_name}</option>
																		</c:forEach>
																	</c:if>
															</select>
														    	</div>
														</div>
														 <div class="form-group form-group-sm width-300px">
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号状态:</label>
		                                                    <div class="col-sm-8  no-padding"  >
																	<select name="mod_status"
																		id="mod_status"
																		class="chosen-select form-control width-200px"
																		onchange="upmark()">
																			<!-- <option value="">选择...</option> -->
																			<c:if test="${!empty statusList }">
																				<c:forEach items="${statusList}" var="item">
																					<option value="${item.mod_status}"
																						<c:if test="${item.mod_status==deviceModel.modSts}"> selected </c:if>>${item.mod_status_name}</option>
																				</c:forEach>
																			</c:if>
																	</select>
															 </div>
													     </div></div>
														<div class=" col-xs-12">
														<div class="form-group form-group-sm width-300px">
                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >厂商简称<span><font color="red">*</font></span>:</label>
                                                            <div class="col-sm-8  no-padding"  >
															<select name="fact_id" id="fact_id"
																onchange="checkMerChantNum();"
																class="chosen-select form-control width-200px">
																	<option value="">选择...</option>
																	<c:if test="${!empty mlist }">
																		<c:forEach items="${mlist}" var="item">
																			<option value="${item.code}"
																				<c:if test="${item.code==deviceModel.fact_id}" > selected </c:if>>${item.short_name}</option>
																		</c:forEach>
																	</c:if>
															</select></div></div>
															<div class="form-group form-group-sm width-300px">
                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号名称<span><font color="red">*</font></span>:</label>
                                                            <div class="col-sm-8  no-padding"  >
															<input type=text name="modNm" id="modNm"
																value="${deviceModel.modNm}" onchange="upmark()"
																class="form-control input-sm required modName"
																style="width: 180px; height: 29px" /></div></div>
															<div class="form-group form-group-sm width-300px">
                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >厂商型号代码<span><font color="red">*</font></span>:</label>
                                                            <div class="col-sm-8  no-padding"  >
															<input type=text name="fact_mod" id="fact_mod"
																value="${deviceModel.fact_mod}"
																onchange="checkMerChantNum();upmark();"
																class="form-control input-sm required factName"
																style="width: 180px; height: 29px" /></div></div>
														</div>
														<div class=" col-xs-12">
															<div class="form-group form-group-sm width-300px">
                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >计量单位<span><font color="red">*</font></span>:</label>
                                                            <div class="col-sm-8  no-padding"  ><input name="unit" id="unit"
																value="${deviceModel.unit}" onchange="upmark()"
																class="form-control input-sm unitLength_lt6 required"
																style="width: 180px; height: 29px" /></div></div>
															<div class="form-group form-group-sm width-300px">
                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >包装数量<span><font color="red">*</font></span>:</label>
                                                            <div class="col-sm-8  no-padding"  ><input name="qty" id="qty"
																value="${deviceModel.qty}" onchange="upmark()"
																class="form-control input-sm digits integer required"
																style="width: 180px; height: 29px" /></div></div>
															<div class="form-group form-group-sm width-300px">
                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >包装单位<span><font color="red">*</font></span>:</label>
                                                            <div class="col-sm-8  no-padding"  ><input name="packing_unit" id="packing_unit"
																value="${deviceModel.packing_unit}" onchange="upmark()"
																class="form-control input-sm unitLength_lt6 required"
																style="width: 180px; height: 29px" /></div></div>
														</div>
													<div class=" col-xs-12">
															<label for="spec">规格说明</label>
															<textarea class="form-control input-sm " rows="3"
																id="mod_spec" name="mod_spec" onchange="upmark()"
																style="resize: none">${deviceModel.normsDesc}</textarea>
													</div>
													<div class=" col-xs-12">
															<label for="remark">备注</label>
															<textarea class="form-control input-sm " rows="3"
																id="remark" id="remark" onchange="upmark()"
																name="remark" style="resize: none">${deviceModel.remark}</textarea>
													</div>
												</div>
												<span class="ace-icon fa  icon-on-right bigger-110"></span>
												<span class="ace-icon fa  icon-on-right bigger-110"></span>
												<!-- 具体信息 START -->
												<c:if test="${deviceModel.goods_type == '0'}">
													<div class=" col-xs-12">
														<div class="form-group col-sm-3">
															<label for="print_type">打印机类型</label><br> <select
																name="print_type" id="print_type"
																class="chosen-select form-control">
																<c:if test="${!empty printModeList }">
																	<c:forEach items="${printModeList}" var="item">
																		<option value="${item.print_type}"
																			<c:if test="${item.print_type==dmp.print_type}"> selected </c:if>>${item.print_type_name}</option>
																	</c:forEach>
																</c:if>
															</select>
														</div>
														<div class="form-group col-sm-3">
															<label for="print_speed">打印机速度</label> <input
																name="print_speed" id="print_speed"
																value="${dmp.print_speed}"
																class="form-control input-sm " />
														</div>
														<div class="form-group col-sm-3">
															<label for="comm_typ">通讯方式</label><br> <select
																name="comm_type" id="comm_type"
																class="chosen-select form-control">
																<c:if test="${!empty commModeList }">
																	<c:forEach items="${commModeList}" var="item">
																		<option value="${item.comm_type}"
																			<c:if test="${item.comm_type==dmp.comm_type}"> selected </c:if>>${item.comm_type_name}</option>
																	</c:forEach>
																</c:if>
															</select>
														</div>
														<div class="form-group col-sm-3">
															<label for="psam_num">插卡数量</label> <input name="psam_num"
																id="psam_num" value="${dmp.psam_num}"
																class="form-control input-sm" />
														</div>
													</div>
													<div class=" col-xs-12">
														<div class="form-group col-sm-3">
															<label for="cert_type">通过认证</label> <input
																name="cert_type" id="cert_type" value="${dmp.cert_type}"
																class="form-control input-sm" />
														</div>
														<div class="form-group col-sm-3">
															<label for="warranty">保修期</label> <input name="warranty"
																id="warranty" value="${dmp.warranty}"
																class="form-control input-sm" />
														</div>
														<div class="form-group col-sm-3">
															<label for="screen">屏幕分辨率</label> <input name="screen"
																id="screen" value="${dmp.screen}"
																class="form-control input-sm" />
														</div>
														<div class="form-group col-sm-3">
															<label for="memory">内存</label> <input name="memory"
																id="memory" value="${dmp.memory}"
																class="form-control input-sm" />
														</div>
													</div>
													<div class=" col-xs-12">
														<div class="form-group col-sm-3">
															<label for="keyword">密码键盘</label><br> <select
																name="keyword" id="keyword"
																class="chosen-select form-control">

																<c:if test="${!empty keywordList }">
																	<c:forEach items="${keywordList}" var="item">
																		<option value="${item.keyword}"
																			<c:if test="${item.keyword==dmp.keyword}"> selected </c:if>>${item.keyword_name}</option>
																	</c:forEach>
																</c:if>
															</select>
														</div>
														<div class="form-group col-sm-3">
															<label for="cpu">处理器及主频</label> <input name="cpu"
																id="cpu" value="${dmp.cpu}"
																class="form-control input-sm" />
														</div>
														<div class="form-group col-sm-3">
															<label for="language">开发平台</label><br> <select
																name="language" id="language"
																class="chosen-select form-control">
																<c:if test="${!empty devLanguageList }">
																	<c:forEach items="${devLanguageList}" var="item">
																		<option value="${item.devLan}"
																			<c:if test="${item.devLan==dmp.language}"> selected </c:if>>${item.devLan_name}</option>
																	</c:forEach>
																</c:if>
															</select>
														</div>
														<div class="form-group col-sm-3">
															<label for="woltage_type">电压类型</label><br> <select
																name="woltage_type" id="woltage_type"
																class="chosen-select form-control">
																<c:if test="${!empty voltageTypeList }">
																	<c:forEach items="${voltageTypeList}" var="item">
																		<option value="${item.voltageType}"
																			<c:if test="${item.voltageType==dmp.woltage_type}"> selected </c:if>>${item.voltageType_name}</option>
																	</c:forEach>
																</c:if>
															</select>
														</div>
													</div>
													<div class=" col-xs-12">
														<div class="form-group col-sm-3">
															<label for="cardreader">插卡方式</label><br> <select
																name="cardreader" id="cardreader"
																class="chosen-select form-control">
																<c:if test="${!empty cardreaderList }">
																	<c:forEach items="${cardreaderList}" var="item">
																		<option value="${item.cardreader}"
																			<c:if test="${item.cardreader==dmp.cardreader}"> selected </c:if>>${item.cardreader_name}</option>
																	</c:forEach>
																</c:if>
															</select>
														</div>
														<div class="form-group col-sm-3">
															<label for="mod_volume">体积</label> <input
																name="mod_volume" id="mod_volume"
																value="${dmp.mod_volume}" class="form-control input-sm" />
														</div>
														<div class="form-group col-sm-3">
															<label for="weight">重量</label> <input name="weight"
																id="weight" value="${dmp.weight}"
																class="form-control input-sm" />
														</div>
														<div class="form-group col-sm-3">
															<label for="temperature">工作温度</label> <input
																name="temperature" id="temperature"
																value="${dmp.temperature}" class="form-control input-sm" />
														</div>
													</div>
													<div class=" col-xs-12">
														<div class="form-group col-sm-3">
															<label for="humidity">工作湿度</label> <input name="humidity"
																id="humidity" value="${dmp.humidity}"
																class="form-control input-sm" />
														</div>
														<div class="form-group col-sm-3">
															<label for="price">指导价格</label> <input name="price"
																id="price" value="${dmp.price}"
																class="form-control input-sm" />
														</div>
														<div class="form-group col-sm-3">
															<label for="price">是否电子签名<span class="redstar">*</span></label><br>
															<select name="eSignature" id="eSignature"
																class="chosen-select form-control">
																<option value="">请选择</option>
																<option value="0"
																	<c:if test="${dmp.eSignature==0 }">selected="selected"</c:if>>否</option>
																<option value="1"
																	<c:if test="${dmp.eSignature==1 }">selected="selected"</c:if>>是</option>
															</select>
														</div>
													</div>
												</c:if>
													<c:if test="${deviceModel.goods_type != '0'}">
														<div style="margin: 25px 25px 25px 25px">
															<ul class="media-list">
																<li class="media">
																	<div class="media-body">
																		<c:if test="${!empty posList }">
																			<c:forEach items="${factMap}" var="item">
																				<h4 >${item.value.fact_name}</h4>
																				<div class="row">
																					<c:if test="${not empty dmMap[item.key]}">
																						<c:forEach items="${dmMap[item.key]}"
																							var="subItem" varStatus="status">
																							<c:if test="${status.count%3 eq 1}">
																								<div class="row"></div>
																							</c:if>
																							<label style="padding-left:200px;width:10px"
																								class="checkbox-inline col-sm-4"><nobr><input
																								type="checkbox" name="posIds" 
																								value="${subItem.id}" onclick="logChecked(this,'${subItem.modId}')"
																								<c:forEach items="${dmMatchList}" var="dm">
																		<c:if test="${subItem.modId eq dm.mod_master_id}">checked</c:if>
																	</c:forEach>><nobr> ${subItem.modNm}</nobr> </nobr>
																							</label>
																							<c:if
																								test="${(status.count%3 eq 0) || (status.count eq fn:length(dmMap[item.key]))}"></c:if>
																					</c:forEach>
																					</c:if>
																				</div>
																			</c:forEach>
																		</c:if>
																	</div>
																</li>
															</ul>
														</div>
													</c:if>
												<!-- 具体信息 END -->
											   <div class="form-actions center widget-color-normal5">
                                                    <button class="btn  btn-sm" type="button" onclick="javascript:closewin();">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                        取消
                                                    </button>
                                                    	<button type="submit" class="btn  btn-sm" name="upbtn"
							                               id="savebtn" onclick="return save()">
							                               <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
							      更新
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
	</div>

	<%@include file="../../layout/common.js.jsp"%>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	  function closewin(){
	    	parent.$.fancybox.close();
	    }
        jQuery(function($) {
        $('.chosen-select').chosen({});
            $('#deviceModelForm').bootstrapValidator({
            	 message: 'This value is not valid',
                 container:'popover',
                 feedbackIcons: {
                     valid: 'glyphicon glyphicon-ok',
                     invalid: 'glyphicon glyphicon-remove',
                     validating: 'glyphicon glyphicon-refresh'
                 },
                 fields: {
                 	goods_type: {
                         validators: {
                             notEmpty: {
                             	message:'物品类型不可为空'
                             }
                         }
                     },
                     goods_id: {
                         validators: {
                             notEmpty: {
                             	message:'型号细分不可为空'
                             }
                         }
                     },
                    status: {
                         validators: {
                             notEmpty: {
                             	message:'型号状态不可为空'
                             }
                         }
                     },
     	/* 			fact_id: {
                         validators: {
                             notEmpty: {
                             	message:'厂商简称不可为空'
                             },
                             stringLength: {
                                 min: 10,
                                 message : '厂商简称不可为空'
                             }
                         }
                     }, */
                     modNm: {
                         validators: {
                             notEmpty: {
                             	message:'型号名称不可为空'
                             },
                             stringLength: {
                                 max: 30,
                                 message : '型号名称不能大于30个字符长度'
                             }
                         }
                     },
                     fact_mod: {
                         validators: {
                             notEmpty: {
                             	message:'厂商型号代码不可为空'
                             },
                             stringLength: {
                                 max: 10,
                                 message : '厂商型号不能大于10个字符长度'
                             }
                         }
                     },
                     unit: {
                         validators: {
                         	notEmpty: {
                         		message:'计量单位不可为空'
                         	},
                             stringLength: {
                                 max: 6,
                                 message : '计量单位不能大于6个字符长度'
                             }
                         }
                     },
                     packing_unit: {
                         validators: {
                         	notEmpty: {
                         		message:'包装单位不可为空'
                         	},
                             stringLength: {
                                 max: 6,
                                 message : '包装单位不能大于6个字符长度'
                             }
                         }
                     },
     			qty: {
                         validators: {
                             notEmpty: {
                             	message:'包装数量不可为空'
                             },
                             digits: {
                            	 message : '包装数量必须为数字'
                             },
                             greaterThan: {
                                 value: 2,
                                 message : '包装数量不能小于2'
                             },
                             lessThan: {
                                 value: 2147483647,
                                 message : '包装数量不能大于2147483647'
                             }
                         }
                     },
                     mod_spec: {
                         validators: {
                         	stringLength: {
                                 max: 400,
                                 message : '规格说明最多400个字符'
                             }
                         }
                     },
                     remark: {
                     	validators: {
                         	stringLength: {
                                 max: 400,
                                 message : '备注最多400个字符'
                             }
                         }
                     },
                     psam_num: {
                         validators: {
                         	 digits: {},
                              lessThan: {
                                  value: 2,
                                  message : '插卡数量不能大于2'
                              }
                         }
                     },
                     eSignature: {
                         validators: {
                             notEmpty: {
                            	 message : '电子签名不能为空' 
                             }
                         }
                     }
                 }
            }).on('form.success.bv',function(e){

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
                .next().on(ace.click_event, function(){
                    $(this).prev().focus();
                });
            $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
        })
        
    function upmark()
    {
    }
     function save()
    {
    	if($('#qty').val().length>=10){
    		alert("包装数量大于等于10位");
    		return false;
    	}
    	if($('#fact_id').val() == ""){
    	   alert("厂商简称不能为空");
    	   return false;
    	}
    	if($('#eSignature').val() == ""){
    	   alert("电子签名不能为空");
    	   return false;
    	}
    	if($('#fact_mod').val().length>10){
    		alert("厂商型号 大于10位");
    		return false;
    	}   
    	if($("#updateFlg").val()=='1'){
    	  checkMerChantNum();
    	}
    	var goods_type  = $("#goods_type").val();
    	
    	if('1'==goods_type || "2"==goods_type || "3"==goods_type){
    		//物品类型为：附件设备、配件设备、耗材时，需勾选支持厂商pos
    		var otype = document.getElementsByName("posIds");
    		//alert("otype.length="+otype.length);
    		var num = 0;
    		for ( var i = 0; i < otype.length; i++) {
				if(otype[i].checked){
					num++;
				}else{
					//
				}					
			}
    		if(num==0){
    			alert("请选择所支持的终端厂商");
    			return false;
    		}
    	}
    	if($("#checkFlg").val()=="1"){
    		$("#savebtn").removeAttr("disabled");
	    	if(confirm("是否确认下一步")){
				return true;
			}
    	}else{
    		$("#savebtn").attr({"disabled":"disabled"});
    		return;
    	}
    }
    //联动
    function put2PosInfo(value){
    	alert("选择了"+value);
    }
    function logChecked(obj,value){
    	var old = $("#modids").val();
    	if(obj.checked){
    		//选中则累加
    		$("#modids").val(old+value+",");
    	}else{
    		//取消
    		$("#modids").val(old.replace(value+",", ""));
    	}
    }
	/**
	 * 判断厂商型号代码是否已存在
	 */
	function checkMerChantNum() 
	{
		
		var fid = $("#fact_id").val();
		if(fid==null||fid=='')
		{
			alert("请选择厂商简称");
			return ;
		}
		var getmod = $("#fact_mod").val();
		var fact_id = $("#fact_id").val();
		if(getmod==null||getmod=='')
		{
			return ;
		}
		//修改标识 说明做过改动 
		if($("#fid").val() != fact_id || $("#fmod").val() != getmod){
		    $("#updateFlg").val("1");
		}
		$.ajax({
			type : "GET",
			url : "<%=request.getContextPath()%>/posModel/factmod?fact_mod="+getmod+"&fact_id="+ fact_id,
			dataType : "json",
			cache : false,
			success : function(data) {
				if(data>0)
				{
					alert("厂商型号代码不允许重复");
					$("#savebtn").attr({"disabled":"disabled"});
					$("#checkFlg").val("0");
				}else
				{
					$("#savebtn").removeAttr("disabled");
					$("#checkFlg").val("1");
				}
			}
		});
		
	}
    //联动
		$("#goodsTyp").change(function() {
			var val_goods_type = $(this).val();
			var var_fact=$("#mfrNo").val();
			
			if(val_goods_type == '0'){
				$("#isSignature").removeAttr("disabled");
				$("#isSignature").trigger("chosen:updated");
			}else{
				$("#isSignature").attr("disabled", true);
				$("#isSignature").trigger("chosen:updated");
			}
			var pobj = $("#goods_id");
			pobj.empty();
			//获得型号明细对象
			$.ajax({
				type : "GET",
				url : "<%=request.getContextPath()%>/posModel/unlimitGetGoods?goods_type=" + val_goods_type+"&fact_id="+var_fact,
				dataType : "json",
				cache : false,
				success : function(data) {
					var abc='<option value="">请选择</option>';
					for (var i = 0; i < data.length; i++) {
						abc += "<option value='"+data[i].goods_id+"'>" + data[i].goods_name + "</option>";
					} 
					$("#goodsId").html(abc);
					$("#goodsId").trigger("chosen:updated");
				}
			});
		});
		

		
		$("#goodsId").change(function() {								

			var val = $(this).val();
			var fact_val=$("#mfrNo").val();
			var goods_type =$("#goodsTyp").val()
			$("#mod_id").empty();
			$.ajax({
				type : "GET",
				url : "<%=request.getContextPath()%>/posModel/unlimitGetMod?goods_id=" + val+"&fact_id="+fact_val+"&goods_type="+goods_type,
				dataType : "json",
				cache : false,
				success : function(data) {
					var abc='<option value="">请选择</option>';
					for (var i = 0; i < data.length; i++) {
						//var selected = '${posInfo.goodsId}' == data[i].modId ? 'selected':'';
						abc += "<option value='"+data[i].modId+"'>" + data[i].modNm + "</option>";
						//abc += "<option value='"+data[i].modId+"' "+selected+">" + data[i].modNm + "</option>";
					} 
					$("#modId").html(abc);
					$("#modId").trigger("chosen:updated");
				}
			});
			
		});
		

		//厂商简称下拉框变动
		$("#mfrNo").change(function() {								

			var mobj = $("#modId");
			var var_goods_type = $("#goodsTyp").val();
			var var_fact=$("#mfrNo").val();
			var pobj = $("#goodsId");
			pobj.empty();
			$.ajax({
				type : "GET",
				url : "<%=request.getContextPath()%>/posModel/unlimitGetGoods?goods_type=" + var_goods_type+"&fact_id="+var_fact,
				dataType : "json",
				cache : false,
				success : function(data) {
					var abc='<option value="">请选择</option>';
					for (var i = 0; i < data.length; i++) {
						var selected = '${posInfo.goodsId}' == data[i].goods_id ? 'selected':'';
						abc += "<option value='"+data[i].goods_id+"' "+selected+">" + data[i].goods_name + "</option>";
					} 
					$("#goodsId").html(abc);
					$("#goodsId").trigger("chosen:updated");
				}
			});				
		});
		$("#mfrNo").trigger('change');
</script>
</body>
</html>