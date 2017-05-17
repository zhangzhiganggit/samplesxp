function changeEmpCoop(){
		$("#empCooperateManagerNmHidden").val(document.getElementById("empCooperateManagerId").options[document.getElementById("empCooperateManagerId").selectedIndex].text);
	}

	function setCity2(pid){
		$.ajax({
			type:'post',
			url:"/org/moudel/org_bnk_city.do",
			data:'id='+pid,
			async:false,
			success:function(data){
				$("#bankCityCd").chosen("destroy");
				$("#bankCityCd").html(data);
				$("#bankCityCd").chosen({});
			},
			error:function(){
				alert('数据提交失败');
			}
		});
	}
	function submitForm(){
		$("#branchAttributionNameHidden").val(document.getElementById("branchAttribution").options[document.getElementById("branchAttribution").selectedIndex].text)
		$.ajax({
			cache: true,
	        type: "POST",
	        url:'/org/getAreaByBranch.do',
			data :'branchAttribution='+ $("#branchAttribution").val(),// 你的formid
			async : false,
			error : function(data) {
				alert("系统异常，请稍后再试");
			},
			success : function(data) {
				$("#regionalAgencyDiv").html(data)
			}
		});
		$.ajax({
			cache: true,
	        type: "POST",
	        url:'/org/getEmpCooperateManagerId.do',
			data :'branchAttribution='+ $("#branchAttribution").val(),
			async : false,
			error : function(data) {
				alert("系统异常，请稍后再试");
			},
			success : function(data) {
				$("#empCooperateManagerId").chosen("destroy");
				$("#empCooperateManagerId").html(data)
				$("#empCooperateManagerId").chosen({});
			}
		});
	}

	function checkNum(){
		var box = $("input[type=checkbox][name=regionalAgencyStr]:checked")
		var value="";
		for (var i=0;i<box.length;i++ ){
		    	value = value+","+box[i].value; 
		}
		var ret = true;
		$.ajax({
			type:'post',
			url:"/org/checkNum.do",
			data:'citys='+value.substr(1),
			async:false,
			success:function(data){
				if(data!=""){
					alert("城市\""+data+"\"的代理商数量已满，您不能再代理该地区");
					document.getElementById(data).checked = undefined;
				//	$("#"+data).attr("selected","false")
					return true;
				}else{
					ret = false;
				}
			},
			error:function(){
				alert('系统异常，请稍后再试'); 
			}
		});	
		return ret;
	}
			

	function searchBnkLink(){
		$.ajax({
	    	cache: true,
	        type: "POST",
	        url:'/org/searchBnkLink.do',
			data : $('#bnkLinkForm').serialize(),// 你的formid
			async : false,
			error : function(data) {
				alert("系统异常，请稍后再试");
			},
			success : function(data) {
				$("#bnkPage").html(data);
			}
		});
	}

	function chooseBnkInfo(obj1, obj2, obj3, obj4, obj5) {
		if($('#accountType').val()=='2'){
			$("#bankName").val(obj1)
			$("#backCardNum").val(obj5)
			$('#myModal').modal('hide');
		}else if($('#accountType').val()=='1'){
			$("#openbankName").val(obj1);
			$("#cnapsCode").val(obj5);	
			$('#myModal').modal('hide');
		}else{
			
		}
		
	}
	function addAgent(){
		if(!checkNum()){
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
				data : $('#searchForm').serialize(),// 你的formid
				async : false,
				error : function(data) {
					data = eval("(" + data + ")")
					alert(data.message);
				},
				success : function(data) {
					data = eval("(" + data + ")")
					if(data.message == 'ok'){
						document.getElementById("searchForm").submit()
					}else{
						alert(data.message);
						 $("#addButton").attr("class","btn btn-danger btn-sm")
							document.getElementById("addButton").disabled = undefined;
					}
				}
			});
		}
	}
    $('.main-content .chosen-select').chosen({});
    $("#orgRunProp").chosen({}).change(function(){
        if($("#orgRunProp").val()==2)
            $('.ele').show();
        else
            $('.ele').hide()
    });

		$("#select4").chosen({}).change(function() {
			if ($("#select4").val() == 1)
				$('.ele2').show();
			else
				$('.ele2').hide()
		});

		jQuery(function($) {
			 if($("#orgRunProp").val()==2)
	                $('.ele').show();
	            else
	                $('.ele').hide()
			$("#bankAccount").keyup(function(){
				$(this).val(this.value.encodeAccount());
			});

			$('#bank').click(function() {
				var Str="2";
				document.getElementById("accountType").value =Str;
				
				$('#myModal').modal({
					keyboard : true
				});
			});
			$('#banks').click(function() {
				var Str="1";
				document.getElementById("accountType").value =Str;
				$('#myModal').modal({
					keyboard : true
				});
			});

			$('#myModal').on('shown.bs.modal', function() {
				$('#myModal .chosen-select').chosen("destroy");
				$('#myModal .chosen-select').chosen({});
			})

			$('#searchForm').formValidation({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					orgNm : {
						validators : {
							notEmpty : {
								message : "机构名称不能为空"
							}

						}
					},
					orgAddr : {
						validators : {
							notEmpty : {
								message : "机构地址不能为空"
							}

						}
					},
					legalPersonNm : {
						validators : {
							notEmpty : {
								message : "法人身份证姓名不能为空"
							}

						}
					},
					contactMail : {
						validators : {
							notEmpty : {
								message : "联系人邮箱不能为空"
							},
							emailAddress: {
					            'default': '请输入有效的邮件地址'
					        }
						}
					},
					email : {
						validators : {
							regexp: {
		                        regexp: /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/,
		                        message:'请输入有效的邮件地址'
		                    },
							emailAddress: {
					            'default': '请输入有效的邮件地址'
					        },
					        stringLength: {
		                    	max : 40,
		                    	message:'邮箱长度不能超过40个字符'
		                    }
						}
					},
					qq : {
						 validators: {
							 stringLength: {
			                    	min : 5,
			                    	max : 20,
			                    	message:'请输入5-20个数字'
			                    }
			                }
					},
					wechat : {
						validators : {
							regexp: {
		                        regexp: /^[a-zA-Z0-9_-]{6,20}$/,
		                        message:'请输入正确的微信号'
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
					idCardName : {
						validators : {
							notEmpty : {
								message : "身份证姓名不能为空"
							},
							regexp: {
		                        regexp: /^[A-Za-z0-9\u4e00-\u9fa5·]*$/,
		                        message:'请输入正确的身份证姓名'
		                    }
						}
					},
					idCardNo : {
						validators : {
							notEmpty : {
								message : "身份证号不能为空"
							},
							regexp: {
		                        regexp: /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/g,
		                        message:'请输入15或18位身份证号'
		                    }
						}
					},
					remarkName : {
						validators : {
							notEmpty : {
								message : "备注名不能为空"
							},
						}
					},
					contactTelNo : {
						validators : {
							notEmpty : {
								message : "联系人手机不能为空"
							},
							regexp: {
		                        regexp: /^[1][3578][0-9]{9}$/g,
		                        message:'请输入正确的手机号'
		                    }
						}
					},
					phone : {
						validators : {
							notEmpty : {
								message : "联系人手机不能为空"
							},
							regexp: {
		                        regexp: /^[1][3578][0-9]{9}$/g,
		                        message:'请输入正确的手机号'
		                    }
						}
					},
					mainContract : {
						validators : {
							notEmpty : {
								message : "签约主体不能为空"
							},

						}
					},
					depositmarginReceivable : {
						validators : {
							notEmpty : {
								message : "应收保证金不能为空"
							},
							regexp: {
		                        regexp: /^(0|([1-9][0-9]*))$/,
		                        message:'应收保证金只能输入整数'
		                    }
						}
						
					},
					signDate : {
						validators : {
							notEmpty : {
								message : "签约日期不能为空"
							},
							
						}
					},
					accountName : {
						validators : {
							regexp: {
		                        regexp: /^[A-Za-z0-9\u4e00-\u9fa5·]*$/,
		                        message:'请输入正确的账户名称'
		                    }
						}
					},
				
//					paidDeposit : {
//						validators : {
//							notEmpty : {
//								message : "实收保证金不能为空"
//							},
//						}
//					},
					idNumber : {
						validators : {
							notEmpty : {
								message : "身份证号不能为空"
							},
							regexp: {
		                        regexp: /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/g,
		                        message:'请输入15或18位身份证号'
		                    }
						}
	                    
					},
					legalCard : {
						validators : {
							notEmpty : {
								message : "法人身份证号不能为空"
							},
							regexp: {
								 regexp: /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/g,
			                      message:'请输入15或18位身份证号'
								},
		                       
		                    }
						}
					},
					accNumber : {
						validators : {
							notEmpty : {
								message : "结算账户名不能为空"
							}
						}
					},
					bankAccount : {
						validators : {
							notEmpty : {
								message : "结算账号不能为空"
							}
						}
				},
				filingProtocolState : {
					validators : {
						notEmpty : {
							message : "归档状态不能为空"
						},
						
					}
				},
				isOfferInvoice : {
					validators : {
						notEmpty : {
							message : "是否提供发票不能为空"
						},
						
					}
				}
				
			}).on('success.form.fv', function(e) {
	            e.preventDefault();
	            var $form = $(e.target);
	            addAgent()
	        });


			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			})
			.next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			$('.input-daterange').datepicker({
				autoclose : true
			});

		})
		function checkName(){
			var idCardName=$('#idCardName').val();
			var accountName=$('#accountName').val();
			if(""!=accountName && null!=accountName && ""!=idCardName && null!=idCardName){
				if(idCardName!=accountName){
					alert("个人结算信息-账户名称应与身份证姓名一致");
					document.getElementById("accountName").value =idCardName;
				}
			}
		}
	function getRemarkName(){
		checkName();
		$.ajax({
	        type: "POST",
	        url:'/org/getRemarkName',
			data : {remarkName:$('#idCardName').val()},
			async:true,
			cache: false,
			success : function(data) {
				$("#remarkName").val(data);
				revalidateFieldByFieldName('searchForm','remarkName');
			}
		});
	}