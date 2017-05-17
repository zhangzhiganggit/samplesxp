/**
 * Created with IntelliJ IDEA. User: JY Date: 13-6-14 Time: 上午10:17 To
 * change this template use File | Settings | File Templates.
 */
jQuery(document).ready(function() {
	//商户账户状态
	var mercAccountState = $("#mercAccountState").html();
	var mercAccountStateArray = ['正常','销户','只入','只出','不入不出'];
	var mercAccountStateName = mercAccountStateArray[parseInt(mercAccountState)-1];
	$("#mercAccountState").html(mercAccountStateName);
	$("#mercAccountState").attr('data-content',mercAccountStateName);
	var isRepeatLiquidation = $("#isRepeatLiquidation").html();
	var isRepeatLiquidationArray = ['否','是'];
	var isRepeatLiquidationName = isRepeatLiquidationArray[parseInt(isRepeatLiquidation)];
	$("#isRepeatLiquidation").html(isRepeatLiquidationName);
	$("#isRepeatLiquidation").attr('data-content',isRepeatLiquidationName);
	
	$.ajax({
        url: '/obtainingDocInfo/getCountersignList.do',
        data:{
        	orderNo:$('#orderNo').html()
        },
        cache: false,
        async:true,
        success: function(data) {
            if(data.length > 0 ){
            	for(var i=0;i<data.length;i++){
            		//为了减少遍历次数，指定遍历文本框、文本域、下拉框
            		$("textarea").each(function(){
            			if(this.id == data[i].countersignId)
            				this.value = data[i].countersignValue;
            		});
            		$("select").each(function(){
            			if(this.id == data[i].countersignId)
            				this.value = data[i].countersignValue;
            		});
            		$("input[type='text']").each(function(){
            			if(this.id == data[i].countersignId)
            				this.value = data[i].countersignValue;
            		});
            		$("label").each(function(){
            			if(this.id == data[i].countersignId){
            				$(this).html(data[i].countersignValue);
            				$(this).attr('data-content',data[i].countersignValue);
            			}
            				
            		});
            	}
            }
        }
	});
	$('#obtainingBillForm').bootstrapValidator({
		message: 'This value is not valid',
		container:'popover',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			cityAgentSign: {
				validators: {
					notEmpty: {},
					stringLength:{
						max:200
					}
				}
			}
		}
	});
});

