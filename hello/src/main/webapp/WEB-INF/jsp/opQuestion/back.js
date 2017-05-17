
/**
 * 
 */
var DEFAULT_OPTIONS = "<option value=''>全部</option>";
var $questionStatus = $("[name='questionStatus']");
;
var $searchForm = $('#searchForm');
var $questionForm = $('#questionForm');
var $questionType = $("[name='questionType']");
var $questionSummary = $("[name='questionSummary']");
var $branchCompany = $("[name='branchCompany']");

var $questionCheckBox = $("input[name='checkQuestion']");
var URLS = {
	add : MODULE_CTX + 'add?',
	detail : MODULE_CTX + 'detail?',
	edit : MODULE_CTX + 'edit?',
	save : MODULE_CTX + 'doSave?',
	close : MODULE_CTX + 'doClose?',
	queryBranchCompany : MODULE_CTX + 'queryBranchCompany?',
	download : MODULE_CTX + 'download?',
	exportExcel : MODULE_CTX + 'exportExcel?',
	opQuesionHome: MODULE_CTX+'opQuesionHome?'
};
var TAB_CONFIG = {
	type : 'iframe',
	padding : 5,
	scrolling : 'no',
	fitToView : true,
	autoSize : false,
	width : 800,
	height : 800,
	closeClick : false,
	afterClose : function() {
	}
}

function queryQuestionStatus(questionStatus) {
	var dataConfig = {
		url : '/opQuestion/queryQuestionStatus',
		cache : true,
		value : 'value',
		text : 'description',
		success : function(list) {
			if (list) {
				var options = DEFAULT_OPTIONS;
				for (var i = 0; i < list.length; i++) {
					var selected = questionStatus
							&& questionStatus == list[i].value;
					var selectedSt = selected ? "selected='selected'" : '';
					options += "<option " + selectedSt + " value='"
							+ list[i][dataConfig.value] + "''>"
							+ list[i][dataConfig.text] + "</option>";
				}
				$questionStatus.html(options).trigger("chosen:updated");
			}
		}
	};
	$.ajax({
		url : dataConfig.url,
		cache : dataConfig.cache,
		success : dataConfig.success
	});

}

function queryQuestionType(type, summary) {
	console.info('queryQuestionType')
	var dataConfig = {
		url : '/opQuestion/queryQuestionType',
		value : 'value',
		text : 'description',
		success : function(list) {
			if (list) {
				var options = DEFAULT_OPTIONS;
				for (var i = 0; i < list.length; i++) {
					var selected = type && type == list[i].value;
					var selectedSt = selected ? "selected='selected'" : '';
					options += "<option " + selectedSt + " value='"
							+ list[i][dataConfig.value] + "''>"
							+ list[i][dataConfig.text] + "</option>";
				}
				$questionType.html(options).trigger("chosen:updated");
				queryQuestionSummary(type, summary);
			}
		}
	};
	$.ajax({
		url : dataConfig.url,
		cache : dataConfig.cache,
		success : dataConfig.success
	});
}

function queryQuestionSummary(questionType, summary) {
	if (!questionType) {
		$questionSummary.html(DEFAULT_OPTIONS);
		return;
	}
	$.ajax({
		url : '/opQuestion/queryQuestionSummary',
		data : {
			questionType : questionType
		},
		cache : true,
		success : function(list) {
			console.info(list)
			if (list) {
				var options = DEFAULT_OPTIONS;
				for (var i = 0; i < list.length; i++) {
					var selected = summary && summary == list[i].value;
					var selectedSt = selected ? "selected='selected'" : '';
					options += "<option " + selectedSt + " value='"
							+ list[i].value + "''>" + list[i].description
							+ "</option>";
				}
				$questionSummary.html(options).trigger("chosen:updated");
			}
		}
	});
}

function queryBranchCompany(branchCompany) {
	console.info('queryBranchCompany' + branchCompany)
	$.ajax({
		url : URLS.queryBranchCompany,
		data : {},
		cache : true,
		success : function(list) {
			if (list) {
				var options = DEFAULT_OPTIONS;
				for (var i = 0; i < list.length; i++) {
					var selected = branchCompany
							&& branchCompany == list[i].ORG_UUID;
					var selectedSt = selected ? "selected='selected'" : '';
					options += "<option " + selectedSt + " value='"
							+ list[i].ORG_UUID + "''>" + list[i].ORG_NM
							+ "</option>";
				}
				$branchCompany.html(options).trigger("chosen:updated");
			}
		}
	});
}

function download(id) {
	window.open(URLS.download + 'id=' + id, "_blank");
}
function query(){
	$searchForm.  attr("action", URLS.opQuesionHome);
	$searchForm.submit();  
}
function exportToExcel() {
	window.open(URLS.exportExcel+$searchForm.serialize(), "_blank");
	return;
	$searchForm.attr("action", URLS.exportExcel);
	$searchForm.submit();  
	return;
	$.ajax({
		url : URLS.exportExcel,
		data : $('#searchForm').serialize()
		});
	return
}

function validteQuestionForm(type) {
	var $questionForm = $('#questionForm');
	console.info(type)
	if ('add' == type) {
		if ($questionType.val().trim().length == 0) {
			alert('必选填写问题选择问题种类');
			return false;
		}
		if ($questionSummary.val().trim().length == 0) {
			alert('必选填写问题选择问题概要');
			return false;
		}
		$questionContent = $('#questionContent');
		var value = $.trim($questionContent.val());
		$questionContent.val(value);
		if (value.length == 0) {
			alert('必选填写问题内容');
			return false;
		}
	} else if ('followUp' == type) {
		var $lastFollowUpComment = $questionForm.find('#lastFlolowUpComment');
		var value = $.trim($lastFollowUpComment.val());
		$lastFollowUpComment.val(value);
		if (value.length == 0) {
			alert('必选填写跟进内容');
			return false;
		}
	} else if ('reply' == type) {
		var $reply = $questionForm.find('#reply');
		var value = $.trim($reply.val());
		$reply.val(value);
		if (value.length == 0) {
			alert('必选填写回复内容');
			return false;
		}
	}
	return true;
}

function initQuestionCheckBox() {
	$("#ckAll").click(function() {
		$questionCheckBox.prop("checked", this.checked);
	});

	$questionCheckBox
			.click(function() {
				var $subs = $questionCheckBox;
				$("#ckAll").prop(
						"checked",
						$subs.length == $subs.filter(":checked").length ? true
								: false);
			});
}

function getQuestions(max) {
	var id = "";
	var flag = false;
	var count =0;
	var $questionCheckBoxChecked = $("input[name='checkQuestion']:checkbox:checked");
	$questionCheckBoxChecked.each(function() {
		id = id + "," + $(this).val();
		flag = true;
		count++;
	})
	if(count>max){
		alert('最多只能操作['+max+']条记录');
		return null;
	}
	if (flag) {
		return id.substr(1);
	} else {
		alert("至少勾选一条记录")
	}

}

function datePickerInit() {
	$('.date-picker').datepicker({
		autoclose : true,
		language : 'zh-CN',
		todayHighlight : true
	}).next().on(ace.click_event, function() {
		$(this).prev().focus();
	});
	$('.input-daterange').datepicker({
		autoclose : true,
		language : 'zh-CN'
	});
}

function myResetForm() {
	$('#resetSearchForm').trigger("click");
	var selects = $('select');
	$.each(selects, function(i, v) {
		// $("#mySelect option:first").prop("selected", 'selected');
		($(v)).val('');
	});
}

function save() {
	$.ajax({
		type : "post",
		url : URLS.save, // 这里是提交到什么地方的url
		data : $questionForm.serialize(), // 这里把表单里面的数据放在这里传到后台
		dataType : "json",
		success : function(data) {
			console.info(data)
			if (data.success) {
				alert(dta.msg + ',id:' + data.entityId);
			} else {
				alert('新建问题失败');
			}
			// 调用回调函数
		}
	});
	$questionForm.attr("action", 'http://baidu.com').submit(function() {
		alert($questionForm);
		return false;
	});

}

function add() {
	var config = $.extend({
		href : URLS.add + 'type=view&id=' + id
	}, TAB_CONFIG);
	$.fancybox.open(config);
}

function detail(id) {
	if('-1'==id){
		id=getQuestions(1); 
		}
		if(!id){return;}
	var config = $.extend({
		href : URLS.detail + 'type=view&id=' + id
	}, TAB_CONFIG);
	$.fancybox.open(config);
}

function reply(id) {
	if('-1'==id){
		id=getQuestions(1); 
		}
		if(!id){return;}
	var config = $.extend({
		href : URLS.edit + 'type=reply&id=' + id
	}, TAB_CONFIG);
	$.fancybox.open(config);
}

function closeQuestion(id) {

	if('-1'==id){
	id=getQuestions(50); 
	}
	if(!id){return;}
	console.info(id);
	$.ajax({
		url : URLS.close,
		data : {
			ids : id
		},
		success : function(data) {
			console.info(data)
			window.location.reload();
		}
	});
}

function followUp(id) {
	if('-1'==id){
	id=getQuestions(1); 
	}
	if(!id){return;}
	var config = $.extend({
		href : URLS.edit + 'type=followUp&id=' + id
	}, TAB_CONFIG);
	$.fancybox.open(config);
}
function initFileComponent(selector) {
	selector.ace_file_input({
		style : 'well',
		btn_choose : '请选择',
		btn_change : null,
		/*
		 * allowMime : ["image/jpg", "image/jpeg", "image/png", "image/gif",
		 * "image/bmp"],
		 */
		no_icon : 'ace-icon fa fa-cloud-upload',
		droppable : true,
		height : 30,
		thumbnail : 'small',// large | fit |small
		before_change : function(files, dropped) {
			var fileName = files[0].name;
			var fileSize = files[0].size;
			var pointIndex = fileName.lastIndexOf('.');
			if (pointIndex == -1) {
				alert('请上传图片文件(jpg、jpeg、png、gif、bmp)！');
				return false;
			}
			var fileType = fileName.substr(pointIndex + 1).toLowerCase();
			var allowMime = [ 'jpg', 'jpeg', 'png', 'gif', 'bmp' ];
			var flag = false;
			for (var i = 0; i < allowMime.length; i++) {
				if (allowMime[i] == fileType)
					flag = true;
			}
			if (!flag) {
				alert('请上传图片文件(jpg、jpeg、png、gif、bmp)！');
			}
			if (flag && parseInt(fileSize / 1024) > 300) {
				alert('单张图片大小不可超过300K');
				flag = false;
			}
			return flag;
		},
		preview_error : function(filename, error_code) {
			// do nothing
		}
	}).on('change', function() {

	});
}
function setCity2(pid) {
	$.ajax({
		type : 'post',
		url : "<%=request.getContextPath()%>/area/getCityByProvId.do",
		data : 'id=' + pid,
		success : function(data) {
			$("#mecCityCd").chosen("destroy");
			$("#mecCityCd").html(data);
			$("#mecCityCd").chosen({});
			// $("#mecCityCd").attr("class","col-sm-6 width-48 chosen-select
			// width-45 ");

		},
		error : function() {
			$.messager.alert('提示信息', '数据提交失败');
		}
	});
}

function changeDateStart() {
	var creStartTm = Number($("#creStartTm").val().replace(/-/g, ''));
	var creEndTm = Number($("#creEndTm").val().replace(/-/g, ''));
	if (creEndTm != 0) {
		if (creStartTm > creEndTm) {
			$("#creEndTm").val($("#creStartTm").val());
		}
	}
}
function changeDateEnd() {
	var creStartTm = Number($("#creStartTm").val().replace(/-/g, ''));
	var creEndTm = Number($("#creEndTm").val().replace(/-/g, ''));
	if (creStartTm != 0) {
		if (creStartTm > creEndTm) {
			$("#creStartTm").val($("#creEndTm").val());
		}
	}
}
/** * */

function closewin() {
	parent.$.fancybox.close();
}
/** * */
