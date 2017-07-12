/**
 * Created by wangyu on 16/10/29.
 */


$(".btn-modify").click(function (e) {
    e.preventDefault();
    $("input:text").not("[readonly]").val("");
    $("select").prop('selectedIndex', 0);
    $(".select2-hidden-accessible").val("").trigger("change");
    // $("#beginDate").val(getNowFormatDate());
    // $("#endDate").val(getNowFormatDate());
    $("#orgInputId").val($("#hiddenCurrentOrgNo").val());
    console.log($("#hiddenCurrentOrgNo").val());
    $("#orgInput").val($("#hiddenCurrentOrgName").val());
    console.log($("#hiddenCurrentOrgName").val());
});

//获取当前机构下业务员:当前机构编号，当前人员编号，当前人员dom元素
function getOrgUserNameList(orgNo,currentEmp,currentEmpDom){
    $.ajax({
        url: '/cardManagement/getOrgUserNameList',
        data:{
            orgNo:orgNo
        }
    }).done(function(data) {
        if (data != "") {
            currentEmpDom.empty();
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
            currentEmpDom.append(optionList);
        }else{
            currentEmpDom.empty();
        }
    });
}

