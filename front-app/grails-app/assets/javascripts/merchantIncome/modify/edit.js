/**
 * Created by jingxl on 2016/10/15.
 * 进件时，编辑商户初始化编辑数据使用
 */

$(function(){
    /*****************编辑时内容初始化***************************/
    console.log("----------------分店设置的值----------------------------")
    var branchShopSet=$('#branchShopSet').val();//分店设置
    var arryBranch = branchShopSet.split(",");
    console.log("================arryBranch=================>"+arryBranch)
    if(arryBranch!=''){
        $.each(arryBranch, function(i,val){
            $('#branchShopSet'+val).attr('checked',true);
        });
    }

    // ****>显示隐藏'账户法人姓名'属性
    $('#toPrivateAccountName').trigger("blur");

    console.log("----------------结算卡信息(功能受理)----------------------------")
    var functionAcceptanceSettleVal=$('#functionAcceptanceSettle').val();
    var arryCardVal = functionAcceptanceSettleVal.split(",");
    console.log("--->JJ:"+functionAcceptanceSettleVal);
    if(arryCardVal!=''){
        $.each(arryCardVal, function(i,val){
            console.log("---索引:"+i+"_值："+val);
            $('#functionAcceptanceSettle'+val).attr('checked',true);
        });
    }


    var ifSuiYiTongSettleVal=$('#ifSuiYiTongSettle').val();//随意通结算
    $('#ifSuiYiTongSettle').attr('checked', ifSuiYiTongSettleVal == 1 ? true : false);
    ifChecked('ifSuiYiTongSettle','sytDiv1','sytDiv2');//随意通,触发状态事件

    var ifNonworkdaySettleVal=$('#ifNonworkdaySettle').val();//非工作日结算
    $('#ifNonworkdaySettle').attr('checked', ifNonworkdaySettleVal == 1 ? true : false);

    var ifIntradaySettleVal=$('#ifIntradaySettle').val();//即日付
    $('#ifIntradaySettle').attr('checked', ifIntradaySettleVal == 1 ? true : false);
    ifChecked('ifIntradaySettle','jrfDiv1');//即日付

    var ifOtherConsumptionVal=$('#ifOtherConsumption').val();//其他消费
    $('#ifOtherConsumption').attr('checked', ifOtherConsumptionVal == 1 ? true : false);

    var ifNextSettle=$('#ifNextSettle').val();//隔夜对账
    $('#ifNextSettle').attr('checked', ifNextSettle == 1 ? true : false);

    var allowCreditCard=$('#allowCreditCard').val();//允许信用卡
    $('#allowCreditCard').attr('checked', allowCreditCard == 1 ? true : false);

    console.log("----------------结算卡功能，自动结算时间----------------------------")
    var automaticSettleTimeVal=$('#automaticSettleTime').val();//结算时间
    console.log("=================================ifOtherConsumptionVal>:"+automaticSettleTimeVal)
    var arrySettleTime = automaticSettleTimeVal.split(",");
    if(arrySettleTime!=''){
        $.each(arrySettleTime, function(i,val){
            $('#automaticSettleTime'+val).attr('checked',true);
        });
    }


    //POS维护费与维护通
    console.log("----------------POS维护费与维护通----------------------------")
    var feeInfomationVal=$('#feeInfomation').val();
    var arryFeeVal = feeInfomationVal.split(",");
    if(arryFeeVal!=''){
        $.each(arryFeeVal, function(i,val){
            if(val=="1"){
                $('#ifMaintainFeeOfPos').attr('checked',true);
                ifChecked('ifMaintainFeeOfPos','posDiv');//《POS维护费》触发的状态事件
            }
            if(val=="2"){
                $('#ifWeiHuTong').attr('checked',true);
                ifChecked('ifWeiHuTong','whtDiv');//《维护通》触发的状态事件
            }
        });
    }

    console.log("----------------POS维护费，日累计、非日累计----------------------------")
    var posMaintainFeeTypeVal=$('#posMaintainFeeType').val();//POS维护费（日累计、非日累计）
    var arryPosInfo = posMaintainFeeTypeVal.split(",");
    console.log(arryPosInfo)
    if(arryPosInfo!='' && arryPosInfo.length==1){
        if(arryPosInfo[0]=='1'){
            $('#ifMaintainFeeOfPos2').attr('checked',true);
            $('#ifMaintainFeeOfPos3').attr('checked',false);
        }else{
            $('#ifMaintainFeeOfPos2').attr('checked',false);
            $('#ifMaintainFeeOfPos3').attr('checked',true);
        }
    }


    //预付卡与交行外卡
    // console.log("----------------预付卡与交行外卡----------------------------")
    // var preCardOutCardVal=$('#preCardOutCard').val();
    // var arryVal = preCardOutCardVal.split(",");
    // if(arryVal!=''){
    //     $.each(arryVal, function(i,val){
    //         if(val=="1"){
    //             $('#ifPrepaidCard').attr('checked',true);
    //             ifChecked('ifPrepaidCard','preH','preDiv1','preDiv2');// 《预付卡》触发的状态事件
    //         }
    //         if(val=="2"){
    //             $('#ifOutBCMCard').attr('checked',true);
    //             ifChecked('ifOutBCMCard','bcmH','bcmDiv1','bcmDiv2','bcmDiv3');//《交行外卡》触发的状态事件
    //         }
    //     });
    // }
    //
    // console.log("----------------预付卡信息(功能受理)----------------------------")
    // var functionAcceptancePrepaidCaVal=$('#functionAcceptancePrepaidCa').val();
    // var arryCardVal = functionAcceptancePrepaidCaVal.split(",");
    // if(arryCardVal!=''){
    //     $.each(arryCardVal, function(i,val){
    //         $('#functionAcceptancePrepaidCard'+val).attr('checked',true);
    //     });
    // }

    console.log("----------------商户类别----------------------------")
    var merchantClassify = $("#merchantClassify").val()
    if(merchantClassify == '01'){
        $("#merchantClassifyShow").val("标准类");
    }else if(merchantClassify == '02'){
        $("#merchantClassifyShow").val("优惠类");

    }else if(merchantClassify == '03'){
        $("#merchantClassifyShow").val("减免类");

    }else if(merchantClassify == '04'){
        $("#merchantClassifyShow").val("特殊优惠类");
    }

    console.log("---------------归属机构----------------------------")
    //根据机构编号查询机构名称
    var orgNo = $("#hiddenOrgNo").val();
    $.ajax({
        url:"/merchantIncomeModify/getOrgName",
        data:{orgNo:orgNo},
        type:"POST",
        success:function(data){
            $('#orgInputId').val(orgNo);
            $('#orgInput').val(data);
        }
    })

    console.log("---------------拓展类型----------------------------")
    // var expandType = $("#expandTypeId").val();
    // if(expandType == 1 || expandType == 2 || expandType == 3){
    //     $("#expandTypeString").val("自有");
    // }

});//end JQuery


