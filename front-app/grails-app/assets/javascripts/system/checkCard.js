/**
 * Created by krupp on 16/9/20.
 */
$(function () {
    // var cardId = $("input[name='cardId']").val();
    $(".deleteCard").click(function(e){
        e.preventDefault();
        var cardId = $(this).attr("cardId");
        toDelete(cardId);
        return false;
    });

    $("#bankCardNum").keyup(function () {
        this.value=this.value.replace(/\D/g,'');
    });




    $("#checkFormSubmit").bind("click",function(e){
        e.preventDefault();
        var len=document.getElementsByName("bankCardNum")[0].value.length;
        var saValue = $("#salesmanCode").val();
        // var value=document.getElementsByName("bankCardNum")[0].value;
        console.log(len);
        var offsetHid = $("#scaffold_offset").val();
        console.log(offsetHid);
        var offsetMax = $("#scaffold_max").val();
        console.log(offsetMax);
        if(len < 10 || len >20){
            bootbox.alert("请输入最多20个数字！");
            return false;
        }
        if(saValue == '' || saValue == null || saValue == undefined){
            bootbox.alert("请选择业务员！");
            return false;
        }
        var bankCardNum = $("#bankCardNum").val();
        var salesmanCode =$("#salesmanCode").val();
        $.ajax({
            type: "POST",
            async: false,
            url: "/checkCard/save",
            dataType: "JSON",
            data: {bankCardNum:bankCardNum,salesmanCode:salesmanCode},
            success: function (resultMap) {
                console.log(resultMap);
                if (resultMap.flag == 0) {
                    bootbox.alert(resultMap.msg);
                }else if(resultMap.flag == 1){
                    bootbox.alert({
                        buttons: {
                            ok: {
                                label: '确定',
                            }
                        },
                        message: resultMap.msg,
                        callback: function() {
                            window.location.href="/checkCard/search?salesmanCode=''&offset="+offsetHid+"&max="+offsetMax;
                        },
                        title: "",
                    });

                }else{
                    bootbox.alert({
                        buttons: {
                            ok: {
                                label: '确定',
                            }
                        },
                        message: resultMap.msg,
                        callback: function() {
                            window.location.reload();
                        },
                        title: "",
                    });

                }
            }
        })
    });


    $("#checkEditSubmit").click(function(){
        // e.preventDefault();
        var offsetHidden = $("#offsetHidden").val();
        var len=document.getElementsByName("bankCardNum")[0].value.length;
        console.log(len);
        var saValue = $("#salesmanCode").val();
        // var value=document.getElementsByName("bankCardNum")[0].value;
        var offsetHidden = $("#offsetHidden").val();
        var maxHidden = $("#maxHidden").val();
        if(len < 10 || len >20){
            bootbox.alert("请输入最多20个数字！");
            return false;
        }
        if(saValue == '' || saValue == null || saValue == undefined){
            bootbox.alert("请选择业务员！");
            return false;
        }
        var bankCardNum = $("#bankCardNum").val();
        var salesmanCode =$("#salesmanCode").val();
        var cardId = $("#cardId").val();
        var oldSalesManNo = $("#oldSalesManNo").val();
        var oldBankCardNum = $("#oldBankCardNum").val();
        console.log(saValue);
        console.log(oldSalesManNo);
        console.log(oldBankCardNum);
        $.ajax({
            type: "POST",
            url: "/checkCard/update",
            dataType: "JSON",
            data: {bankCardNum:bankCardNum,salesmanCode:salesmanCode,cardId:cardId,oldSalesManNo:oldSalesManNo,oldBankCardNum:oldBankCardNum},
            success: function (resultMap) {
                console.log("******return"+resultMap+"******");
                if (resultMap.flag == 0) {
                    bootbox.alert({
                        buttons: {
                            ok: {
                                label: '确定',
                            }
                        },
                        message: resultMap.msg,
                        callback: function() {
                            window.location.reload();
                        },
                        title: "",
                    });

                }else if(resultMap.flag == 1){
                    bootbox.alert({
                        buttons: {
                            ok: {
                                label: '确定',
                            }
                        },
                        message: resultMap.msg,
                        callback: function() {
                            window.location.href="/checkCard/search?offset="+offsetHidden+"&max="+maxHidden+"&flag="+true;
                        },
                        title: "",
                    });

                }else if(resultMap.flag == -1){
                    bootbox.alert({
                        buttons: {
                            ok: {
                                label: '确定',
                            }
                        },
                        message: resultMap.msg,
                        callback: function() {
                            location.reload();
                        },
                        title: "",
                    });

                }
            }
        })
    })
});

function toDelete(cardId){
    bootbox.setLocale("zh_CN");
    bootbox.confirm("您将删除当前巡检银行卡号，是否继续?", function (result) {
        if(result){
            //alert(result)
            window.location.href = '/checkCard/deleteCheckCard?cardId='+cardId
        }
    });
}

