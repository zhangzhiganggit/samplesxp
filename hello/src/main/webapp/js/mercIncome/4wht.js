/**
 * 
 */

var CSS_DP_NONE = {
	'display' : 'none'
};
var CSS_DP_BLOCK = {
	'display' : 'block'
};
var $hasPosMaintainFee = $('#hasPosMaintainFee');
var $posMaintainFeeType1 = $('#posMaintainFeeType1');
var $posMaintainFeeType2 = $('#posMaintainFeeType2');
var $posMaintainFeeRelatedDiv = $('#posMaintainFeeAmmountDiv,#posMaintainFeeTypeDiv');
var $hasPosMaintainFeeHidden = $('#hasPosMaintainFeeHidden');
var $posMaintainFeeAmount = $("#posMaintainFeeAmount")
var $isMaintenanceFee = $('#isMaintenanceFee');

function initPosMaintain(hasPosMaintainFee, feeType, editable) {
	console.info(arguments)
	// debugger
	if (!editable) {
		$hasPosMaintainFee.click(function() {
			return false;
		});
		$posMaintainFeeType1.click(function() {
			return false;
		});
		$posMaintainFeeType2.click(function() {
			return false;
		});
	}
	$hasPosMaintainFee.prop('checked', false);
	$posMaintainFeeType1.prop('checked', false);
	$posMaintainFeeType2.prop('checked', false);
	if (hasPosMaintainFee) {
		$posMaintainFeeRelatedDiv.css(CSS_DP_BLOCK);
		$hasPosMaintainFee.prop('checked', true);
		if (feeType == '1') {
			$posMaintainFeeType1.prop('checked', true);
		} else if (feeType == '2') {
			$posMaintainFeeType2.prop('checked', true);
		} else {
			$posMaintainFeeType1.prop('checked', true);
		}
	} else {
		$posMaintainFeeRelatedDiv.css(CSS_DP_NONE);
	}
}

/**
 * 添加事件
 */
function bindEventForWHT() {
	var maintainFeeSelectors = [ '#hasPosMaintainFee', '#isMaintenanceFee' ];
	console.info(maintainFeeSelectors.join(','))
	$(maintainFeeSelectors.join(',')).click(
			function(e) {
				var hasPosMaintainFee = $hasPosMaintainFee.is(':checked');
				var isMaintenanceFee = $isMaintenanceFee.is(':checked');
				if (hasPosMaintainFee && isMaintenanceFee) {
					$(this).trigger('click');
					alert('POS维护费和维护通只能收取一种');
					return;
				}
				var currentId = $(this).attr('id');
				if ('hasPosMaintainFee' == currentId) {
					changeFormValidateStyle('mercInfoForm',
							'feeInfo.maintainInoneFeeAmount', 'VALID',
							'maintainInoneFee');
					if (hasPosMaintainFee) {
						$hasPosMaintainFeeHidden.val('true');
						$posMaintainFeeRelatedDiv.css(CSS_DP_BLOCK);
					} else {
						$hasPosMaintainFeeHidden.val('false');
						$posMaintainFeeAmount.val('');
						$posMaintainFeeRelatedDiv.css(CSS_DP_NONE);
					}
				} else if ('isMaintenanceFee' == currentId) {
					$hasPosMaintainFeeHidden.val('false');
					changeFormValidateStyle('mercInfoForm',
							'feeInfo.posMaintainFeeAmount', 'VALID',
							'posMaintainFee');
					if (isMaintenanceFee) {
						$('#maintainInoneFeeAmountDiv').css(CSS_DP_BLOCK);
					} else {
						$('#maintainInoneFeeAmountDiv').css(CSS_DP_NONE);
					}
				}
				console.info(hasPosMaintainFee + ':' + isMaintenanceFee)
			});
	var posMaintainFeeTypeSelectors = [ '#posMaintainFeeType1',
			'#posMaintainFeeType2' ];
	console.info($(posMaintainFeeTypeSelectors.join(',')))
	$(posMaintainFeeTypeSelectors.join(',')).click(
			function(e) {
				var posMaintainFeeType1 = $posMaintainFeeType1.is(':checked');
				var posMaintainFeeType2 = $posMaintainFeeType2.is(':checked');
				if (posMaintainFeeType1 && posMaintainFeeType2) {
					$(this).trigger('click');
					alert('累计／非累计扣费只能收取一种');
				}
				$('#posMaintainFeeType').val(
						posMaintainFeeType1 ? 1
								: (posMaintainFeeType2 ? 2 : ''));
				console.info(hasPosMaintainFee + ':' + isMaintenanceFee)
			});
}


function clickPosMaintainFee(){
	var isMaintenanceFee = $('#isMaintenanceFee').is(':checked');
	var hasPosMaintainFee = $('#hasPosMaintainFee').is(':checked');
	if(isMaintenanceFee&&hasPosMaintainFee){
		alert('2选1')
	}
	if($('#hasPosMaintainFee').prop('checked')){
		$('#posMaintainFeeAmmountDiv').show();
		$("#posMaintainFeeType1").prop('checked',true);
		$posMaintainFeeAmount.val("");
	}else{
		$posMaintainFeeAmount.val("");
	}
}

function checkFee(id, targetId, targetName) {
	if ($("#"+id).prop("checked")) {
		var $target = $('#'+targetId);
		var targetValue = $target.val();
		console.info(targetValue)
		if(!targetValue){
			changeFormValidateStyle('mercInfoForm',targetName, 'INVALID',targetId);
		}
	}
}
