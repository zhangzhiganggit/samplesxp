jQuery(function($) {
    $('#agentT0Form').formValidation({
        message: 'This value is not valid',
        container:'popover',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            //会签意见
            opinion: {
                validators: {
                    notEmpty: {
                    	message:'会签意见不可为空'
                    },
                    stringLength: {
                    	max : 200
                    }
                }
            }
        }
    });
})

/**
 * 填充代理商出资和收益比例
 * 计算公式：
 * 假设代理商申请随意通业务规模M,代理商希望出资比例f，则代理商需出资金额:M1=M*f，代理商获得收益比例: f1={0.9*M1+0.3*(M-M1)}/M
 */
function fillInvestmentAndProfitScale(inputId,taskDefKey){
	if(taskDefKey == 'yefaDeal'){
		var agentApplyAmount = parseInt($("[name='agentApplyAmount']").val());
		var amount = parseInt($("[name='amount']").val());
		if(amount > agentApplyAmount){
			alert("业发调整代理商业务规模不得超过代理商申请规模！");
			$("[name='amount']").val(''+agentApplyAmount);
		}
	}
	//业务规模
	var amount = parseInt($("[name='amount']").val());
	var taskDefKey = $("[name='taskDefKey']").val();
	if(taskDefKey != 'yefaDeal'){
		$("[name='amount']").val('每日'+angelMoney(amount)+'元');
	}
	//代理商出资比例
	var investmentScale = ($("[name='riskBal']").val().replace('%',''))/100;
	if(amount!=0 && investmentScale!=''){
		//出资金额
		var investmentAmount = amount*investmentScale;
		//收益比例
		var profitScale = (investmentAmount*0.9+0.3*(amount-investmentAmount))*100/amount;
		investmentAmount = angelMoney(investmentAmount);
		$("[name='investmentAmount']").val(investmentAmount);
		$("[name='profitScale']").val(profitScale+"%");
		$("[name='payCorpus']").val(investmentAmount);
		$("[name='amountOfRemittance']").val(investmentAmount);
	}
	if(taskDefKey == 'yefaDeal'){
		if(inputId == '')
			$("[name='amount']").focus();
		else if(inputId == 'amount')
			$("[name='opinion']").focus();
	}else if(taskDefKey == 'agentDeal'){
		$("[name='accountName']").focus();
	}
}

function angelMoney(money){
	if(/[^0-9\.]/.test(money)) return "不是数字！";
	money = ''+money;
	money=money.replace(/^(\d*)$/,"$1.");
	money=(money+"00").replace(/(\d*\.\d\d)\d*/,"$1");
	money=money.replace(".",",");
	var re=/(\d)(\d{3},)/;
	while(re.test(money))
		money=money.replace(re,"$1,$2");
	money=money.replace(/,(\d\d)$/,".$1");
	return money.replace(/^\./,"0.")
}

/**
 *
 * 修改Action地址
 * @param condition 条件
 */
function modifyAction(condition){
	var taskDefKey = $("[name = taskDefKey]").val();
	if(condition == 'submit'){
		if('yefaEnd' == taskDefKey){
			if(!confirm("是否确认结束流程")){
				return false;
			}
		}
		if('yefaEnd' != taskDefKey){
			if(!confirm("是否确认下一步")){
				return false;
			}
		}
		$("[name='condition']").val('success');
	}else if(condition == 'busDevRefuse'){
		$("[name='condition']").val('fail');
	}else if(condition == 'agentClose'){
		$("[name='condition']").val('complete');
	}else if(condition == 'financeClose'){
		$("[name='condition']").val('fail');
	}else if(condition == 'financeBack'){
		if(!confirm("是否确认退回")){
			return false;
		}
		$("[name='condition']").val('back');
	}
	return true;
}

/**
 * 填充代理商出资和收益比例,用于查看页面
 * 计算公式：
 * 假设代理商申请随意通业务规模M,代理商希望出资比例f，则代理商需出资金额:M1=M*f，代理商获得收益比例: f1={0.9*M1+0.3*(M-M1)}/M
 */
function fillInvestmentAndProfitScaleForViewPage(){
	//业务规模
	var amount = parseInt($("#amount").html());
	//代理商出资比例
	var investmentScale = parseFloat($("#investmentScale").html());
	if(amount!='' && investmentScale!=''){
		//出资金额
		var investmentAmount = amount*investmentScale;
		//收益比例
		var profitScale = (investmentAmount*0.9+0.3*(amount-investmentAmount))*100/amount;
		investmentAmount = angelMoney(investmentAmount);
		//出资金额
		$("#investmentAmount").html(investmentAmount);
		$("#investmentAmount").attr("data-content",investmentAmount);
		//收益比例
		$("#profitScale").html(profitScale+"%");
		$("#profitScale").attr("data-content",profitScale+"%");
		//需缴纳本金
		$("#payCorpus").html(investmentAmount);
		$("#payCorpus").attr("data-content",investmentAmount);
		//合计汇款金额
		$("#amountOfRemittance").html(investmentAmount);
		$("#amountOfRemittance").attr("data-content",investmentAmount);
		//对业务规模金额格式化
		$("#amount").html('每日'+angelMoney(amount)+'元');
		$("#amount").attr("data-content",'每日'+angelMoney(amount)+'元');
		investmentScale = investmentScale*100+'%';
		$("#investmentScale").html(investmentScale);
		$("#investmentScale").attr("data-content",investmentScale);
	}
}