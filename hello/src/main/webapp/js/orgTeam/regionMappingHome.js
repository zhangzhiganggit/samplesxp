var URL_SURFIX = '.do?';
URL_SURFIX = '?';
var URLS = {
	addOrEdit : MODULE_CTX + 'addOrEditRM' + URL_SURFIX,
	detail : MODULE_CTX + 'detail' + URL_SURFIX,
	edit : MODULE_CTX + 'edit' + URL_SURFIX,
	save : MODULE_CTX + 'doSaveRm' + URL_SURFIX,
	delete : MODULE_CTX + 'deleteRegionMapping' + URL_SURFIX,
	findCandidate : MODULE_CTX + 'findCandidate' + URL_SURFIX,
	findProvince : APP_CTX + 'commonUtils/getProv' + URL_SURFIX,
	findCityByProvince : APP_CTX + 'commonUtils/getCityByProvCd' + URL_SURFIX,
	findDistrictByCity : APP_CTX + 'commonUtils/getAreaByCityCd' + URL_SURFIX
};

function validate(){
}

function initAutoComplete() {
	autoComplate('teamName', 'teamId',
			URLS.findCandidate + 'type=teamOrg');
	autoComplate('regionName', 'regionCode', URLS.findCandidate + 'type=region');
};

function autoComplate(showId, valueId, url) {
	var $show = $('#' + showId);
	var $value = $('#' + valueId);
	$show.on('input', function(e) {
		$value.val('');
	}).autocomplete({
		max : 20,
		minChars : 3,
		mustMatch : true,
		source : url,// availableTags
		select : function(event, ui) {
			$value.val(ui.item.id);
		}
	}).autocomplete("instance")._renderItem = function(ul, item) {
		return $("<li>").append("<a>" + item.label + "</a>").appendTo(ul);
	};
};
function deleteItem(teamId, regionCode) {
	if (!teamId||!regionCode) {
		return;
	}
	$.ajax({
		type : "post",
		url : URLS.delete,
		data : {
			"zo['teamId']" : teamId,
			"zo['regionCode']" :regionCode 
		},
		dataType : "json",
		success : function(data) {
			if (data.success) {
				alert(data.message);
				window.location.reload();
			} else {
				alert('删除失败');
			}
		}
	});
};
function detail(id) {
	var config = $.extend({}, TAB_CONFIG, {
		height : 420,
		href : URLS.detail + 'type=view&teamId=' + id
	});
	$.fancybox.open(config);
};
function addOrEdit(type, teamId,regionCode) {
	var config = $.extend({}, TAB_CONFIG, {
		height : 420,
		href : URLS.addOrEdit + 'type=' + type + '&teamId=' + teamId+ '&regionCode=' + regionCode,
		afterClose : function() {
			window.location.reload();
		}
	});
	$.fancybox.open(config);
};
function save($saveButton) {
	// 1.判断是否变化 2.判断是否为空
	var $teamId = $('#teamId');
	var teamId = $teamId.val();
	if(!teamId||teamId==''){
		alert('请选择所属拓展组。');
		return;
	}
	var $district = $("#district");
	var district = $district.val(); 	
	if(!district||district==''){
		alert('请选择区域。');// 如果要解除该关联关系,请删除该条记录
		return;
	}
	var $regionNameOld = $('#regionNameOld');
	var regionNameOld = $regionNameOld.val();
	//数据未发生变化的情况 不保存
	if(teamId==$('#teamIdOld').val()&&district==$('#regionCodeOld').val()&&$('#regionName').val()==$('#regionNameOld').val()){
		alert('数据未发生修改,该请求被忽略。');
		return;
	}
	$("#saveButton").attr({
		"disabled" : "disabled"
	});
	$.ajax({
		type : "post",
		url : URLS.save,
		data : $('#eForm').serialize(),
		dataType : "json",
		success : function(data) {
			console.info(data)
			if (data.success) {
				alert(data.message);
			} else {
				alert('保存失败');
			}
		},fail:function(){
			debugger
		}
	});
	$("#saveButton").removeAttr("disabled");
}; 
function myResetForm() {
	var selects = $('#searchForm').find('select');
	$.each(selects, function(i, v) {
		$(v).val('').trigger("chosen:updated");
	}); 
}; 
function queryBranchCompany($selector, branchCompany,firstOption) {
	$.ajax({
		url : APP_CTX + 'opQuestion/queryBranchCompany',
		data : {},
		cache : true,
		success : function(list) {
			if (list) {
				var options = firstOption||DEFAULT_OPTIONS;
				for (var i = 0; i < list.length; i++) {
					var selected = branchCompany
							&& branchCompany == list[i].ORG_UUID;
					var selectedSt = selected ? "selected='selected'" : '';
					options += "<option " + selectedSt + " value='"
							+ list[i].ORG_UUID + "''>" + list[i].ORG_NM
							+ "</option>";
				}
				$selector.html(options).trigger("chosen:updated");
			}
		}
	});
};