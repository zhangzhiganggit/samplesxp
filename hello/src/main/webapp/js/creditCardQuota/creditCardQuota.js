/**
 * Created with IntelliJ IDEA. User: JY Date: 13-6-14 Time: 上午10:17 To
 * change this template use File | Settings | File Templates.
 */
jQuery(function($) {
	$('#creditCardQuotaForm').formValidation({
        message: 'This value is not valid',
        container:'popover',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	mercId: {
                validators: {
                    notEmpty: {
                    	message:'请输入15位有效商编！'
                    },
                    integer:{
                    	message:'请输入15位有效商编！'
                    },
                    stringLength: {
                    	min:15,
                    	max:15,
                    	message:'请输入15位有效商编！'
                    }
                }
            },
            sinQuNew: {
                validators: {
                	notEmpty:{
                		message:'单笔交易限额不可为空'
                	},
                    integer: {
                        message:'请输入有效单笔交易限额(整数)'
                    },
                    greaterThan: {
                    	value : 0,
                    	message : '单笔交易限额不可低于0元'
                    },
                    lessThan:{
                    	value :9999999,
                    	message : '单笔交易限额不可高于9999999元'
                    }
                }
            },
            dayPubQuNew: {
                validators: {
                	notEmpty:{
                		message:'单日交易限额不可为空'
                	},
                	integer: {
                        message:'请输入有效单日交易限额(整数)'
                    },
                    greaterThan: {
                    	value : 0,
                    	message : '单日交易限额不可低于0元'
                    },
                    lessThan:{
                    	value :9999999,
                    	message : '单日交易限额不可高于9999999元'
                    }
                }
            },
            opinion: {
                validators: {
                	notEmpty:{
                		message:'会签意见不可为空'
                	},
                	stringLength: {
                        max:200,
                        message:'会签意见不可超过200个字符'
                    }
                }
            }
        }
    });
});


/**
 * 根据商编获取商户信息
 */
var oldMercSn = "";
function ajaxMercInfo() {
	var mercSn = $("[name='mercId']").val();
	if(strlen(mercSn) != 15){
		if(mercSn != ""){
			return;
		}else{
			oldMercSn = "";
			clearForm();
		}
	}else{
		if(oldMercSn != mercSn){
			clearForm();
			$.ajax({
				url : "/creditCardQuota/ajaxMercInfo.do",
				data : {
					mercId : mercSn
				},
				async : false,
				success : function(data) {
					oldMercSn = mercSn;
					if(data !=""){
						$("[name='cprOperNm']").val(data.cprOperNm);
						$("[name='cprRegNm']").val(data.cprRegNm);
						$("[name='attrOrgNm']").val(data.attrOrgNm);
						$("[name='mccCd']").val(data.mccCd);
						$("[name='inMno']").val(data.inMno);
						$("[name='posType']").val(data.posType);
						if(data.devType=='01')
							$("[name='devType']").val('直营');
	  					if(data.devType=='02')
	  						$("[name='devType']").val('代理商代理');
	  					if(data.devType=='03')
	  						$("[name='devType']").val('合作伙伴');
	  					if(data.industryCategories=='1001')
	  						$("[name='industryCategories']").val('餐娱类');
	  					if(data.industryCategories=='3001')
		  					$("[name='industryCategories']").val('一般类');
	  					if(data.industryCategories=='2001')
		  					$("[name='industryCategories']").val('民生类');
	  					if(data.industryCategories=='1002')
		  					$("[name='industryCategories']").val('房产汽车类');
	  					if(data.industryCategories=='3002')
		  					$("[name='industryCategories']").val('批发类');
	  					if(data.industryCategories=='4001')
		  					$("[name='industryCategories']").val('公益类');
	  					if(data.mercNature!=undefined){
	  						var mercNature = parseInt(data.mercNature);
	  						if(mercNature==1)
	  							$("[name='mercNature']").val('国有');
	  						if(mercNature==2)
	  							$("[name='mercNature']").val('私有');
	  						if(mercNature==3)
	  							$("[name='mercNature']").val('外资');
	  						if(mercNature==8)
	  							$("[name='mercNature']").val('个体');
	  						if(mercNature==10)
	  							$("[name='mercNature']").val('公司');
		  					if(mercNature==11)
		  						$("[name='mercNature']").val('个人独资');
	  					}
	  					if(data.leaseContractIncome == '6'){
	  						$("[name='leaseContractIncome']").val('是');
	  					}else{
	  						$("[name='leaseContractIncome']").val('否');
	  					}
	  					
	  					if(data.stmDay < 2)
  							$("[name='stmDay']").val('T+1以下');
	  					else if(data.stmDay >= 2)
	  						$("[name='stmDay']").val('T+2以上');
	  					
	  					
	  					//获取商户限额信息
	  					$.ajax({
	  						url : "/creditCardQuota/ajaxQuotaInfo.do",
	  						data : {
	  							inMno : data.inMno
	  						},
	  						async : false,
	  						success : function(data) {
	  							if(data !=undefined && data!=null && data!=""){
	  								data = eval("("+data+")");
	  								if(data.resCode == 'RCS0000'){
	  									$("[name='sinQuCur']").val(data.sinQuC);
		  			  					$("[name='dayPubQuCur']").val(data.dayQuC);
		  			  				if(data.posType=='0'){
				  						$("[name='posType']").val('固定终端');
				  					}
				  					if(data.posType=='1'){
				  						$("[name='posType']").val('移动终端');
				  					}
	  								}else if(data.resCode=="URM20003"){
	  				  					alert("该商户未初始化限额值!");
	  				  				}else{
	  									alert('无法获取原有限额信息！');
	  								}
	  			  					$("[name='sinQuNew']").focus();
	  							}else{
	  								alert('无法获取原有限额信息！');
	  								$("[name='mercId']").focus();
	  								clearForm();
	  							}
	  						}
	  					});
					}else{
						alert('无法获取商户信息，请重新确认输入！');
						$("[name='mercId']").focus();
						clearForm();
					}
				}
			});
		}
	}
}
function ajaxMercInfoForView() {
	var mercSn = $("#mercId").html();
	$.ajax({
		url : "/creditCardQuota/ajaxMercInfo.do",
		data : {
			mercId : mercSn
		},
		async : false,
		success : function(data) {
			if(data !=""){
				setLabelHtml('cprOperNm',data.cprOperNm);
				setLabelHtml('cprRegNm',data.cprRegNm);
				setLabelHtml('attrOrgNm',data.attrOrgNm);
				setLabelHtml('mccCd',data.mccCd);
				setLabelHtml('inMno',data.inMno);
				setLabelHtml('posType',data.posType);
				if(data.devType=='01')
					setLabelHtml('devType','直营');
				if(data.devType=='02')
					setLabelHtml('devType','代理商代理');
				if(data.devType=='03')
					setLabelHtml('devType','合作伙伴');
				if(data.industryCategories=='1001')
					setLabelHtml('industryCategories','餐娱类');
				if(data.industryCategories=='3001')
					setLabelHtml('industryCategories','一般类');
				if(data.industryCategories=='2001')
					setLabelHtml('industryCategories','民生类');
				if(data.industryCategories=='1002')
					setLabelHtml('industryCategories','房产汽车类');
				if(data.industryCategories=='3002')
					setLabelHtml('industryCategories','批发类');
				if(data.industryCategories=='4001')
					setLabelHtml('industryCategories','公益类');
				if(data.mercNature!=undefined){
					var mercNature = parseInt(data.mercNature);
					if(mercNature==1)
						setLabelHtml('mercNature','国有');
					if(mercNature==2)
						setLabelHtml('mercNature','私有');
					if(mercNature==3)
						setLabelHtml('mercNature','外资');
					if(mercNature==8)
						setLabelHtml('mercNature','个体');
					if(mercNature==10)
						setLabelHtml('mercNature','公司');
  					if(mercNature==11)
  						setLabelHtml('mercNature','个人独资');
				}
				if(data.leaseContractIncome == '6'){
					setLabelHtml('leaseContractIncome','是');
  				}else{
  					setLabelHtml('leaseContractIncome','否');
  				}
				if(data.stmDay < 2)
					setLabelHtml('stmDay','T+1以下');
				else if(data.stmDay >= 2)
					setLabelHtml('stmDay','T+2以上');
				//获取商户限额信息
  				$.ajax({
  					url : "/creditCardQuota/ajaxQuotaInfo.do",
  					data : {
  						inMno : data.inMno
  					},
  					async : false,
  					success : function(data) {
						if(data !=undefined && data!=null && data!=""){
  							data = eval("("+data+")");
  							if(data.resCode == 'RCS0000'){
		  			  			if(data.posType=='0'){
		  			  				setLabelHtml('posType','固定终端');
				  				}
				  				if(data.posType=='1'){
				  					setLabelHtml('posType','移动终端');
				  				}
  							}
  						}
  					}
  				});
			}else{
				alert('无法获取商户信息！');
			}
		}
	});
}
function setLabelHtml(labelId,value){
	$("#"+labelId).html(value);
	$("#"+labelId).attr('data-content',value);
}
//清空表单内容
function clearForm(){
	$("[name='cprOperNm']").val('');
	$("[name='cprRegNm']").val('');
	$("[name='attrOrgNm']").val('');
	$("[name='mccCd']").val('');
	$("[name='mercNature']").val('');
	$("[name='stmDay']").val('');
	$("[name='industryCategories']").val('');
	$("[name='devType']").val('');
	$("[name='sinQuCur']").val('');
	$("[name='sinQuNew']").val('');
	$("[name='dayPubQuCur']").val('');
	$("[name='dayPubQuNew']").val('');
	$("[name='leaseContractIncome']").val('');
}
function strlen(str){
	if(str!='' && str!=undefined && str!=null){
		var len = 0;
		for ( var i = 0; i < str.length; i++) {
			var c = str.charCodeAt(i);
			// 单字节加1
			if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
				len++;
			} else {
				len += 2;
			}
		}
		return len;
	}
}

/** 去除字符串前后空格 **/
function trim(str){
    str = str.replace(/^(\s|\u00A0)+/,'');   
    for(var i=str.length-1; i>=0; i--){   
        if(/\S/.test(str.charAt(i))){   
            str = str.substring(0, i+1);   
            break;   
        }   
    }   
    return str;   
}