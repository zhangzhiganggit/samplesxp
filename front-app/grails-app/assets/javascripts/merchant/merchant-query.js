/**
 * Created by tian on 9/12/16.
 *
 */

var SspMerchantQuery = function () {
    /**
     * POS商户查询
     */
    var fun1 = function () {

        $(".group-checkable").on('click', function () {
            $("input[name='merchantCode']").prop("checked", this.checked);
        });


        $(".checkboxes").on('click', function () {
            var $subs = $(".checkboxes");
            $(".group-checkable").prop("checked", $subs.length == $subs.filter(":checked").length ? true : false);
            //alert($("input[name='stringValue']:checkbox:checked").val());
        });

        $(".batchEditor").on('click', function (e) {
            e.preventDefault();
            var id = "";
            var flag = false;
            $("input[name='merchantCode']:checkbox:checked").each(function () {
                if($(this).val()!="on"){
                    id = id + "," + $(this).val();
                }
                flag = true;
            })

            if (flag) {
                var url = $(this).attr('href');
                var target = $(this).attr('data-modal-target');
                $.ajax({
                    url: url,
                    data: {
                        insideMerchantCode: id.substr(1)
                    },
                }).success(function (data) {
                    $('#' + target).modal('show')
                    $('.modal-body').empty();
                    $('.modal-body').append(data);
                })
                // updateEmp(id.substr(1))
            } else {
                bootbox.alert("至少勾选一条记录")
            }
        });
    };

    return {
        init: function () {
            fun1();
        }
    };
}();
$(".Editor").on('click',function () {
    var radioValue="";
    $(":radio:checked").each(function(){
        radioValue=$(this).val();
    });
    var fromToOrg;
    if("emp"==radioValue){
        fromToOrg=$("#q_salmans").val();
    }else if("org"==radioValue){
        fromToOrg=$("#transferOrgInputId").val();
    }else if(radioValue==''){
        bootbox.alert("请选择机构或者业务员！");
        return;
    }
    $.ajax({
        url: "/merchantManagement/batchEdit",
        data:{
            insideMerchantCode: $("input[name='inside']").val(),
            radioValue:radioValue,
            fromToOrg:fromToOrg
        }

    }).done(function (data) {
        bootbox.dialog({
            message: "提示信息："+data,
            //title: '确认是否划拨',
            buttons: {
                success: {
                    label: 'OK',
                    className: "green",
                    callback: function () {
                        $("#closed").on('click',function () {
                            $("div.scaffold-search form").submit();
                        }).click();
                    }
                }
            }
        });
    })
});
$("input:radio").on('click',function () {
    var radioValue = $("input[name='belong']:radio:checked").val();
    if(radioValue == 'emp')
    {
        getUserNameList();
        $('#p1').show();
        $('#p2').hide();
    }else
    {

        $('#p2').show();
        $('#p1').hide();
        //getOrgIdList();
    }
});

//获取当前机构下业务员
function getUserNameList(){
    $.ajax({
        url: '/merchantManagement/getUserNameList'
    }).done(function(data) {
        if (data != "") {
            $('#q_salmans').empty();
            var optionList='<option value="" selected="selected" >--请选择--</option>';
            for (var i = 0; i < data.length; i++) {
                optionList += "<option  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";

            }
            $("#q_salmans").append(optionList);
        }
    });
}

$(".btn-reset").on('click',function () {
    $("#q_salesMan").select2("val","");
    $('#q_merchantStatus').empty();
    $('#q_businessClassify').empty();
});
function clearForm(){

}
//获取机构树
/*function getOrgIdList(){

    $('#q_orgs').empty();
    var optionList='<option value="" selected="selected" >--请选择--</option>';
    optionList += "<option  value='5138497260'>红豆一代gdl</option>";
    $("#q_orgs").append(optionList);
}*/
