var URL_SURFIX = '.do?';
URL_SURFIX = '?';
var orgUuid = '';
var URLS = {
	addOrEdit : MODULE_CTX + 'addOrEdit' + URL_SURFIX,
	detail : MODULE_CTX + 'detail' + URL_SURFIX,
	edit : MODULE_CTX + 'edit' + URL_SURFIX,
	modify : MODULE_CTX + 'modify' + URL_SURFIX,
	save : MODULE_CTX + 'doSave' + URL_SURFIX,
	close : MODULE_CTX + 'doClose' + URL_SURFIX,
	findCandidate : MODULE_CTX + 'findCandidate' + URL_SURFIX
};

function initAutoComplete() {
	autoComplate('leaderEmployeeUuidDisplay', 'leaderEmployeeUuid',
			URLS.findCandidate + 'type=emp-leader',
			getDataSource(URLS.findCandidate + 'type=emp-leader'));
	autoComplate('assistantEmployeeUuidDisplay', 'assistantEmployeeUuid',
			URLS.findCandidate + 'type=emp-assistant',
			getDataSource(URLS.findCandidate + 'type=emp-assistant'));
	autoComplate('orgUuidDisplay', 'orgUuid', URLS.findCandidate + 'type=com',
			null);
	var target = $('#fellows');
	var $show = $('#fellowDisplay');
	var $orgUuid = $('#orgUuid');
	var fellowSource = getDataSource(URLS.findCandidate + 'type=emp-manager');
	$show.on('input', function(e) {
	}).autocomplete({
		autoFocus : true,
		max : 20,
		minChars : 3,
		mustMatch : true,
		// source : URLS.findCandidate + 'type=emp-manager',
		source : fellowSource,
		select : function(event, ui) {
			var uuid = ui.item.id;
			var name = ui.item.name;
			var branchName = ui.item.branchName;
			addElement(name, branchName, uuid, target)
		}
	}).autocomplete("instance")._renderItem = function(ul, item) {
		return $("<li>").append("<a>" + item.label + "</a>").appendTo(ul);
	};
	
	var targetAss = $('#assistantMembers');
	var $showAss = $('#assistantEmployeeUuidDisplay');
	var assistantSource = getDataSource(URLS.findCandidate + 'type=emp-assistant');
	$showAss.on('input', function(e) {
	}).autocomplete({
		autoFocus : true,
		max : 20,
		minChars : 3,
		mustMatch : true,
		// source : URLS.findCandidate + 'type=emp-manager',
		source : assistantSource,
		select : function(event, ui) {
			var uuid = ui.item.id;
			var name = ui.item.name;
			var branchName = ui.item.branchName;
			addAssistantElement(name, branchName, uuid, targetAss)
		}
	}).autocomplete("instance")._renderItem = function(ul, item) {
		return $("<li>").append("<a>" + item.label + "</a>").appendTo(ul);
	};


};
function getDataSource(url) {
	return function(request, response) {
		var term = request.term;
		request.orgUuid = $('#orgUuid').val();
		$.getJSON(url, request, function(data, status, xhr) {
			response(data);
		});
	};
};
function changeState(id, oldState) {
	if (!id || (0 != oldState && 1 != oldState)) {
		return;
	}
	$.ajax({
		type : "post",
		url : URLS.save,
		data : {
			"zo['teamId']" : id,
			"zo['activeFlag']" : (oldState + 1) % 2,
			"zo['changeActiveFlag']" : true
		},
		dataType : "json",
		success : function(data) {
			alert(data.message);
			if (data.success) {
				window.location.reload();
			}
		}
	});
};
function detail(id) {
	var config = $.extend({}, TAB_CONFIG, {
		height : 400,
		href : URLS.detail + 'type=view&teamId=' + id
	});
	$.fancybox.open(config);
};
function addOrEdit(type, id) {
	var config = $.extend({}, TAB_CONFIG, {
		height : 400,
		href : URLS.addOrEdit + 'type=' + type + '&teamId=' + id,
		afterClose : function() {
			window.location.reload();
		}
	});
	$.fancybox.open(config);
};
function save($saveButton) {
	var leaderUuid = $('#leaderEmployeeUuid').val();
	var $element = $('#' + leaderUuid);
	if(leaderUuid.length == 0){
		alert('组长不能为空！')
		return;
	}
	if ($element.length != 0 ) {
		alert('组长不能兼任组员或综合助理')
		return;
	}
	$saveButton.attr({
		"disabled" : "disabled"
	});

	var $orgUuid = $('#orgUuid');
	if (!$orgUuid.val()) {
	}
	$.ajax({
		type : "post",
		url : URLS.save,
		data : $('#eForm').serialize(),
		dataType : "json",
		success : function(data) {
			$saveButton.removeAttr('disabled');
			alert(data.message);
		}
	});
};
function queryBranchCompany($selector, branchCompany) {
	$.ajax({
		url : APP_CTX + 'opQuestion/queryBranchCompany',
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
				$selector.html(options).trigger("chosen:updated");
			}
		}
	});
};
function myResetForm() {
	var selects = $('#searchForm').find('select');
	$.each(selects, function(i, v) {
		$(v).val('').trigger("chosen:updated");
	});
	var $dateCreateFrom = $("#dateCreateFrom");
	var $dateCreateTo = $("#dateCreateTo");
	$dateCreateFrom.val('').trigger("chosen:updated");
	$dateCreateTo.val('').trigger("chosen:updated");
};
function addElement(name, branchName, uuid, target) {
	var leaderUuid = $('#leaderEmployeeUuid').val();
	var $element = $('#' + uuid);
	if ($element.length != 0 || leaderUuid == uuid) {
		alert('已经被加入该组')
		return;
	}
	var elementHtml = "<a id='" + uuid
			+ "' class='crumb-select-item' rel='nofollow' title='属于"
			+ branchName + "的[" + name + "]'><b>" + name + "</b><em>["
			+ branchName + "]</em><i onclick=removeElement('" + uuid
			+ "');></i><input name=\"zo['fellows']\" value='" + uuid
			+ "' style='display:none;'></a>";
	target.append(elementHtml);
};
function addAssistantElement(name, branchName, uuid, target) {
	var leaderUuid = $('#leaderEmployeeUuid').val();
	var $element = $('#' + uuid);
	if ($element.length != 0 || leaderUuid == uuid) {
		alert('已经被加入该组')
		return;
	}
	var elementHtml = "<a id='" + uuid
			+ "' class='crumb-select-item' rel='nofollow' title='属于"
			+ branchName + "的[" + name + "]'><b>" + name + "</b><em>["
			+ branchName + "]</em><i onclick=removeElement('" + uuid
			+ "');></i><input name=\"zo['assistantMembers']\" value='" + uuid
			+ "' style='display:none;'></a>";
	target.append(elementHtml);
};
function removeElement(id) {
	$('#' + id).remove();
};
