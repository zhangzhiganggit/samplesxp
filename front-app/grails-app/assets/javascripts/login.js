$(function () {

    changeImg();

    if(top.location!=self.location){
        top.location = self.location;
    }

    //
    /*var time;
    if (time && time != undefined && time != 'NaN' && time != 'null') {
        timekeeping();
    } else {//cookie 没有倒计时
        $('#userPhoneButton').attr("disabled", false);
    }*/

    //
    $('#userPhoneButton').on('click', function () {
        //校验手机号码
        var phone = $('#phone').val();
        if (phone == '') {
            alert('手机号码不能为空');
            return false;
        } else if(/^[Tt][0-9]{6}$/.test($('#phone').val())) {
            alert("请联系管理员为您重置密码")
            return false;
        } else {
            var pre = /^[1][3578][0-9]{9}$/;
            if (!pre.test(phone)) {
                alert('请输入您的11位登录手机号');
                return false;
            }
        }
        $.ajax({
            url: "/systemUserPhone/phoneCheckCode",
            data: {
                phone: phone,
                flag : 'loginChange'
            },
            success: function (data) {
                if (data.code) {
                    $('#checkOverdue').val('true');
                    timekeeping(60);
                    alert(data.message);
                } else {
                    alert(data.message);
                }
            },
            error: function (request, status, error) {
                alert('系统错误，稍候重试');
            },
            complete: function () {
            }
        });
    });

    /*$('#loginSubmit').on('click', function () {

        if (!$("#suixingpayRule").prop("checked")) {
            alert("请勾选《代理商销售系统使用协议》后登录");
            return false;
        }
        return true;
    });*/

    //
    $('#passwordSubmit').on('click', function () {
        if ("false"==($('#checkOverdue').val())){
            alert("短信验证码失效，请重新发送");
            return false
        }
        if (!$('#phone').val() || !$('#smsCode').val() || !$('#newPassword').val() || !$('#confirmPassword').val()) {
            alert("填写有误");
            return false;
        }
        if ($('#phone').val() == '') {
            alert('手机号码不能为空');
            return false;
        } else {
            var pre = /^[1][3578][0-9]{9}$/;
            if (!pre.test($('#phone').val())) {
                alert('手机号码格式有误');
                return false;
            }
        }

        var pa=/^(?=.{8,20}$)[0-9a-zA-Z~!@#$%^&*]+$/;
        if(!pa.test($('#newPassword').val())){
            alert("密码长度8-20位,允许特殊字符、纯数字、纯字母。");
            return false;
        }
        $.ajax({
            url: "/systemUserPassword/forgetPassword",
            //dataType: 'json',
            data: {
                phone: $('#phone').val(),
                smsCode: $('#smsCode').val(),
                newPassword: $('#newPassword').val(),
                confirmPassword: $('#confirmPassword').val()
            },
            success: function (data) {
                if (data.code) {
                    var timer=3
                    var dialog = bootbox.dialog({
                        title: '提示:',
                        message: '重置密码成功，'+timer+'秒后跳转登陆页面!</br>'+'<div style="text-align: center"><button onClick="reload()" type="button"> 直接跳转</button></div>'
                    });
                    function showTime(timer){
                        dialog.init(function(){

                            dialog.find('.bootbox-body').html('重置密码成功，'+timer+'秒后跳转登陆页面!</br>'+'<div style="text-align: center"><button onClick="reload()" type="button"> 直接跳转</button></div>');

                        });
                    }
                    setInterval(function () {
                        timer--;
                        showTime(timer)
                        if(timer ===0){
                            location.reload();
                        }
                    },1000)
                } else {
                    alert(data.message);
                }
            },
            error: function (request, status, error) {
                alert('系统错误，稍候重试');
            },
            complete: function () {

            }
        });
    });


    // $('#passwordSubmit1').on('click', function () {
    //     if (!$('#phone').val() || !$('#smsCode').val() || !$('#newPassword').val() || !$('#confirmPassword').val()) {
    //         alert("填写有误");
    //         return false;
    //     }
    //     if ($('#phone').val() == '') {
    //         alert('手机号码不能为空');
    //         return false;
    //     } else {
    //         var pre = /^[1][3578][0-9]{9}$/;
    //         if (!pre.test($('#phone').val())) {
    //             alert('手机号码格式有误');
    //             return false;
    //         }
    //     }
    //     var pa=/^(?=.{8,20}$)[0-9a-zA-Z~!@#$%^&*]+$/;
    //     if(!pa.test($('#newPassword').val())){
    //         alert("密码长度8-20位,允许特殊字符、纯数字、纯字母。");
    //         return false;
    //     }
    //     $.ajax({
    //         url: "/systemUserPassword/forgetPassword",
    //         //dataType: 'json',
    //         data: {
    //             phone: $('#phone').val(),
    //             smsCode: $('#smsCode').val(),
    //             newPassword: $('#newPassword').val(),
    //             confirmPassword: $('#confirmPassword').val()
    //         },
    //         success: function (data) {
    //             if (data.code) {
    //                 alert("密码重置成功");
    //                 location.reload();
    //             } else {
    //                 alert(data.message);
    //             }
    //         },
    //         error: function (request, status, error) {
    //             alert('系统错误，稍候重试');
    //         },
    //         complete: function () {
    //
    //         }
    //     });
    // });
});
function reload() {
    location.reload();
}
/**
 *
 */
function timekeeping(time) {
    //把按钮设置为不可以点击
    $('#userPhoneButton').attr("disabled", true);
    var interval = setInterval(function () {//每秒读取一次cookie
        //在发送按钮显示剩余倒计时
        $('#userPhoneButton').html('请等待' + time + '秒');
        //把剩余总倒计时减掉1
        time--;
        $("#smsCode").removeAttr("disabled");
        if (time == 0) {//剩余倒计时为零，则显示 重新发送，可点击
            //清除定时器
            clearInterval(interval);
            //删除cookie
            time = null;
            //显示重新发送
            $('#checkOverdue').val('false');
            $('#userPhoneButton').html('重新发送');
            alert('验证码超时失效，请重新获取验证码');
            $("#smsCode").attr("disabled",'disabled');
            //把发送按钮设置为可点击
            $('#userPhoneButton').attr("disabled", false);
        }
    }, 1000);
}

/**
 *
 */
function changeImg() {
    var timestamp = (new Date()).valueOf();
    var imagePath = "/image/index";
    imagePath = imagePath + "?timestamp=" + timestamp;
    $("#imgObj").attr("src", imagePath);
    $("#imgObj1").attr("src", imagePath);

}

