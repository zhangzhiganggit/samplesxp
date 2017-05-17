/**
 * @author WangLei
 * @version 2016年4月17日15:12:05
 */

var UPLOAD_EXT_NOT_ALLOWED = '请上传允许的附件类型.';
var DEFAULT_OPTIONS = "<option value=''>全部</option>";
var $searchForm = $('#searchForm');

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
};
//
function download(id) {
	window.open(URLS.download + 'id=' + id, "_blank");
};
// /////////////////////弹框相关
function dialog(url) {
	var config = $.extend({
		href : url
	}, TAB_CONFIG);
	$.fancybox.open(config);
};
// /////////////////////日期控件相关
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
};
function changeDateStart(from, to) {
	var creStartTm = Number($("#" + from).val().replace(/-/g, ''));
	var creEndTm = Number($("#" + to).val().replace(/-/g, ''));
	if (creEndTm !== 0) {
		if (creStartTm > creEndTm) {
			$("#" + from).val($("#" + to).val());
		}
	}
};
function changeDateEnd(from, to) {
	var creStartTm = Number($("#" + from).val().replace(/-/g, ''));
	var creEndTm = Number($("#" + to).val().replace(/-/g, ''));
	if (creStartTm !== 0) {
		if (creStartTm > creEndTm) {
			$("#" + from).val($("#" + to).val());
		}
	}
};
// /////////////////////字符串、日期相关
function getByteNum(str) {
	return str.replace(/[^\x00-\xff]/g, 'xx').length;
};
function formatValue(obj) {
	var value = Number(obj.value.replace(/[^+\d]/g, ''));
	if (value == 0) {
		obj.value = '';
		return;
	}
	obj.value = value;
};
function genMonthFirstDay() {
	var date = new Date();
	var month = date.getMonth() + 1;
	if (month < 10) {
		month = '0' + month;
	}
	return date.getFullYear() + '-' + month + '-' + '01';
};
function genToday() {
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date
			.getMonth() + 1;
	var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
	return year + '-' + month + '-' + day;
};
// /////////////////////复选框相关
function initQuestionCheckBox($mainSelector, subName) {
	var $subCheckBox = $("input[name='" + subName + "']");
	$mainSelector.click(function() {
		$subCheckBox.prop("checked", this.checked);
	});
	$subCheckBox.click(function() {
		var $subs = $subCheckBox;
		var statu = $subs.length === $subs.filter(":checked").length ? true
				: false;
		$mainSelector.prop("checked", statu);
	});
};
function findChecked(subName, max) {
	var id = "";
	var flag = false;
	var count = 0;
	var $subCheckBoxChecked = $("input[name='" + subName
			+ "']:checkbox:checked");
	$subCheckBoxChecked.each(function() {
		id = id + "," + $(this).val();
		flag = true;
		count++;
	});
	if (count > max) {
		alert('最多只能操作[' + max + ']条记录');
		return null;
	}
	if (flag) {
		return id.substr(1);
	} else {
		alert("至少勾选一条记录");
	}
};
// /////////////////////上传框相关
function initFileComponent(selector, allowExt, UPLOAD_SIZE_MAX) {
	selector.ace_file_input({
		style : 'well',
		btn_choose : '请选择',
		btn_change : null,
		// allowMime :allowMime,
		no_icon : 'ace-icon fa fa-cloud-upload',
		droppable : true,
		height : 30,
		thumbnail : 'small', // large | fit |small
		before_change : function(files, dropped) {
			var fileName = files[0].name;
			var fileSize = files[0].size;
			var pointIndex = fileName.lastIndexOf('.');
			if (pointIndex === -1) {
				alert(UPLOAD_EXT_NOT_ALLOWED);
				return false;
			}
			var fileType = fileName.substr(pointIndex + 1).toLowerCase();
			var flag = false;
			for (var i = 0; i < allowExt.length; i++) {
				if (allowExt[i] === fileType)
					flag = true;
			}
			if (!flag) {
				alert(UPLOAD_EXT_NOT_ALLOWED);
			}
			if (flag && parseInt(fileSize / 1024) > UPLOAD_SIZE_MAX) {
				alert('所上传的附件大小不可超过10M');
				flag = false;
			}
			return flag;
		},
		preview_error : function(filename, error_code) {
			// do nothing
		}
	}).on('change', function() {
	});
};
function autoComplate(showId, valueId, url, source) {
	var $show = $('#' + showId);
	var $value = $('#' + valueId);
	$show.on('input', function(e) {
		$value.val('');
	}).autocomplete({
		max : 20,
		minChars : 3,
		mustMatch : true,
		source : source || url,// availableTags
		select : function(event, ui) {
			$value.val(ui.item.id);
		}
	}).autocomplete("instance")._renderItem = function(ul, item) {
		return $("<li>").append("<a>" + item.label + "</a>").appendTo(ul);
	};
};
function closewin() {
	parent.$.fancybox.close();
};
// /////////////////////
// /////////////////////
// /////////////////////
// /////////////////////
// /////////////////////
// /////////////////////
// /////////////////////
