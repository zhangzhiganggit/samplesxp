/**
 * Created with IntelliJ IDEA. User: JY Date: 13-6-14 Time: 上午10:17 To
 * change this template use File | Settings | File Templates.
 */
jQuery(document).ready(
		function() {
			//问题来源
			var quesSourceArray = [ '内部', '商户', '非商户' ]
			var quesSource = $('#quesSource').html();
			$('#quesSource').html(quesSourceArray[quesSource - 1]);
			//问题来源不为商户时不显示商户信息
			if(quesSource != 2){
				$('#mercInfo').attr("style","display:none;");
			}
			$('#quesSource').attr('data-content',quesSourceArray[quesSource - 1]);
			//问题类型
			var quesTypeArray = [
					[ '', '查询', '', '其他', 'BUG', '需求' ],
					[ 'POS故障维护', '资金查询类', '', '', '', '商户需求类', 'POS申请',
							'耗材物流配送', 'POS风险事件', '合作伙伴问题' ],
					[ '查询', '申请合作', '需求', '意见建议', '其他' ] ];
			var quesType = $('#quesType').html();
			$('#quesType').html(quesTypeArray[quesSource - 1][quesType - 1]);
			$('#quesType').attr('data-content',quesTypeArray[quesSource - 1][quesType - 1]);
			//业务类型
			var businessTypeArray = [ '业务类工单', '运营类工单', '风控类工单' ]
			var businessType = $('#businessType').html();
			$('#businessType').html(businessTypeArray[businessType - 1]);
			$('#businessType').attr('data-content',businessTypeArray[businessType - 1]);
			//工单级别
			var orderLevelArray = [ '普通', '加急', '超急' ]
			var orderLevel = $('#orderLevel').html();
			$('#orderLevel').html(orderLevelArray[orderLevel - 1]);
			$('#orderLevel').attr('data-content',orderLevelArray[orderLevel - 1]);
			//完成时限
			var timeLimit = $('#timeLimit').html();
			if(timeLimit != undefined && timeLimit !=""){
				$('#timeLimit').html(timeLimit+'天');
			}
			$('#timeLimit').attr('data-content',timeLimit+'天');
		});

/**
 * 办理机构触发办理人联动
 */
function transactChange() {
	var orgNo = $("[name='transactOrgNo']").val();
	var options = "<option value=\"\"></option>";
	if (orgNo != '') {
		$.ajax({
			url : "/eip-web/oa/generalFlow/getEmployeeByDept.do",
			data : {
				orgNo : orgNo,
				tk : new Date()
			},
			async : false,
			success : function(data) {
				$("#transactor").children("option[value!='-1']").remove();
				for (var i = 0; i < data.length; i++) {
					options += "<option value=\"" + data[i].empNo + "\">"
							+ data[i].empNm + "</option>";
				}
				$("#transactor").html(options);
			}
		});
	} else {
		$("#transactor").empty();
	}

}