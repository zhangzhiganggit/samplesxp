function changeEmpCoop(){
		$("#empCooperateManagerNmHidden").val(document.getElementById("empCooperateManagerId").options[document.getElementById("empCooperateManagerId").selectedIndex].text)
	}
	function submitForm(){
		$("#branchAttributionNameHidden").val(document.getElementById("branchAttribution").options[document.getElementById("branchAttribution").selectedIndex].text)
//		$.ajax({
//	    	cache: true,
//	        type: "POST",
//	        url:'/org/getAreaByBranch.do',
//			data :'branchAttribution='+ $("#branchAttribution").val(),// 你的formid
//			async : false,
//			error : function(data) {
//				alert("系统异常，请稍后再试");
//			},
//			success : function(data) {
//				$("#regionalAgencyDiv").html(data)
//			}
//		});
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
		    	value = value+","+box[i].value; //,
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
	function addAgent(){
		
//			var box = $("input[type=checkbox][name=regionalAgencyStr]:checked")
//			var regionalAgencyStr = "";
//			for (var i=0;i<box.length;i++ ){
//				regionalAgencyStr = regionalAgencyStr+","+box[i].getAttribute("htmlText") ; 
//			}
//			$("#regionalAgency").val(regionalAgencyStr.substr(1))
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
						$("#searchForm").attr("action","/org/quickAddView.do")
						document.getElementById("searchForm").submit()
					}else{
						alert(data.message);
						 $("#addButton").attr("class","btn btn-danger btn-sm")
						document.getElementById("addButton").disabled = undefined;
					}
				}
			});
		
	}
		$('.main-content .chosen-select').chosen({});
		$("#select3").chosen({}).change(function() {
			if ($("#select3").val() == 1)
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

			$('#bank').click(function() {
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
							},

						}
					},
					remarkName : {
						validators : {
							notEmpty : {
								message : "备注名不能为空"
							},
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
					phone : {
						validators : {
							notEmpty : {
								message : "联系人手机不能为空"
							},
							regexp: {
		                        regexp: /[1][3578][0-9]{9}$/g,
		                        message:'请输入正确的手机号'
		                    },
							phone: {
		                    	country : 'CN'
		                    }

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
			//show datepicker when clicking on the icon
			.next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			//or change it into a date range picker
			$('.input-daterange').datepicker({
				autoclose : true
			});

		})
		function getRemarkName(){
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
		function roleType(){
			if($("#authorityDiv").is(":hidden")){
				   document.getElementById('authorityDiv').style.display='block';
				   document.getElementById('roleDiv').style.display='none';
			} else{
				document.getElementById('roleDiv').style.display='block';
				document.getElementById('authorityDiv').style.display='none';
			}
		}
		