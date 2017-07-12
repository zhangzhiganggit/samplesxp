/**
 * Created by krupp on 16/10/18.
 */


$(function(){
    $("#merchantCode").attr('maxlength',15);
    $("#merchantCode").keyup(function () {
        this.value=this.value.replace(/[^+\d]/g,'');
    });
    $("#taskCode").keyup(function () {
        this.value=this.value.replace(/\s/g,'');
    });
    var taskType = $("#taskType").val();
    if(taskType == '00'){//商户随意通调整
        $("#merchantsyth").show();
        $("#merchantsytb").show();
        $("#agentsyth").hide();
        $("#agentsytb").hide();
        $("#merchantSel").show();
        $("#agentSel").hide();
    }else if(taskType == '01'){
        $("#merchantsyth").hide();
        $("#merchantsytb").hide();
        $("#agentsyth").show();
        $("#agentsytb").show();
        $("#merchantSel").hide();
        $("#agentSel").show();
    }


    $("#suiYiTongSubMit").click(function(){
        var flowVersion = $("#hiddenFlowVersion").val();
        var taskCode = $("#hiddentaskCode").val();
        subNext(flowVersion,taskCode);
    });

});


function subNext(flowVersion,taskCode){
    $.ajax({
        type:'post',
        url:'/suiYiTongAuditDataQuery/subNext',
        dataType:'json',
        data:{flowVersion:flowVersion,taskCode:taskCode},
        success:function(data){
            bootbox.alert(data);
            window.location.reload();
        }
    });
}


function switchFlowType(){
    var taskCode = $("#taskCode").val();
    var taskType = $("#taskType").val();
    var taskStatus;
    var merchantCode = $("#merchantCode").val();
    var q_launchDate_from = $("#q_launchDate_from").val();
    var q_launchDate_to = $("#q_launchDate_to").val();
    if(taskType == '00'){//商户随意通调整
        taskStatus = $("#mtaskStatus").val();
        $("#merchantsyth").show();
        $("#merchantsytb").show();
        $("#agentsyth").hide();
        $("#agentsytb").hide();
        $("#merchantSel").show();
        $("#agentSel").hide();
    }else if(taskType == '01'){
        taskStatus = $("#taskStatus").val();
        $("#merchantsyth").hide();
        $("#merchantsytb").hide();
        $("#agentsyth").show();
        $("#agentsytb").show();
        $("#merchantSel").hide();
        $("#agentSel").show();
    }
    window.location.href="/suiYiTongAuditDataQuery/index?taskCode="+taskCode+"&taskType="+taskType+"&taskStatus="+taskStatus+"&merchantCode="+merchantCode+"&q_launchDate_from="+q_launchDate_from+"&q_launchDate_to="+q_launchDate_to;
};
