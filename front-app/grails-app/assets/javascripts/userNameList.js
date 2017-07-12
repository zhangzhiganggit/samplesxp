$(".btn-modify").click(function (e) {
    e.preventDefault();
    $("input:text").not("[readonly]").val("");
    $("select").prop('selectedIndex', 0);
    $(".select2-hidden-accessible").val("").trigger("change");
    $("#beginDate").val(getNowFormatDate());
    $("#endDate").val(getNowFormatDate());
    $("#orgInputId").val($("#hiddenCurrentOrgNo").val());
    $("#orgInput").val($("#hiddenCurrentOrgName").val());
});
//获取当前时间，格式YYYY-MM-DD
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}
function initLoading(){

}

//获取当前机构下业务员
function getOrgUserNameList(orgNo,currentEmp){
    $.ajax({
        url: '/cardManagement/getOrgUserNameList',
        data:{
            orgNo:orgNo
        }
    }).done(function(data) {
        if (data != "") {
            $('#q_salesMan').empty();
            var optionList = "";
            if(currentEmp == ""){
                optionList='<option value="" selected="selected" >--请选择--</option>';
            }else{
                optionList='<option value="" >--请选择--</option>';
            }
            for (var i = 0; i < data.length; i++) {
                if(currentEmp != "" && currentEmp== data[i].userCode){
                    optionList += "<option selected='selected'  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";
                }else{
                    optionList += "<option  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";
                }
            }
            $("#q_salesMan").append(optionList);
            $("#q_salesMan").val($("#hiddenSalesMan").val())
        }else{
            $("#q_salesMan").empty();
        }
    });
}
$("#orgInput").bind('change',function () {
    var orgNo = $("#orgInputId").val();
    var currentEmpNo= $("#q_salesMan").val();
    getOrgUserNameList(orgNo,currentEmpNo);
}).change();

$("#q_salesMan").on('change',function () {
    var factShortNameCode=$('#q_salesMan').val();
    $('#hiddenSalesMan').val(factShortNameCode);

});

