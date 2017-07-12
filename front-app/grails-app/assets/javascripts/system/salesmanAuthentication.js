/**
 * Created by krupp on 16/9/24.
 */



$(function(){

    var auStatus =$("#auStatus").val();
    judgeStatus(auStatus);

    $("#checknum").val("");

    $("input[name='subButton']").click(function(e){
        e.preventDefault();
        submitNext();
    });

    var status = $("#hideStatus").val();
    if(status == '01' || status == '02'){
        $("#subButton").attr("disabled","disabled");
    }

    // var time = window.localStorage["authentication"];
//发送验证码
//     if (time && time != undefined && time != 'NaN' && time != 'null') {
//
//         timekeeping();
//
//     } else {//cookie 没有倒计时
//
//         $('#phoneButton').attr("disabled", false);
//     }
    function timekeeping(time) {
        //把按钮设置为不可以点击
        $('#phoneButton').attr("disabled", true);
        var interval = setInterval(function () {//每秒读取一次cookie
            //从cookie 中读取剩余倒计时
            // total = localStorage["authentication"];
            //在发送按钮显示剩余倒计时
            $('#phoneButton').html('请等待' + time + '秒');
            //把剩余总倒计时减掉1
            time--;

            if (time == 0) {//剩余倒计时为零，则显示 重新发送，可点击
                //清除定时器
                clearInterval(interval);
                //删除cookie
                // localStorage["authentication"] = null;
                time = null;
                //显示重新发送
                $('#phoneButton').html('重新发送');
                alert('验证码超时失效，请重新获取验证码');
                $("#random").val("");
                //把发送按钮设置为可点击
                $('#phoneButton').attr("disabled", false);
            }

        }, 1000);

    }

    $('#phoneButton').on('click', function () {
        // e.preventDefault();
        //校验手机号码
        var phone = $('#mobileNo').val();
        if (phone == '') {
            bootbox.alert('手机号码不能为空').css({
                'top': '50%',
                'margin-top': function () {
                    return -($(this).height() / 2);
                }
            });
            return false;
        } else {
            var pre = /^[1][3578][0-9]{9}$/;
            if (!pre.test(phone)) {
                bootbox.alert('手机号码格式有误');
                return false;
            }
        }
        $.ajax({
            url:"/salesmanAuthentication/phoneCheckCode",
            data: {phone: phone},
            async:false,
            success: function (data) {
                if (data.message != "发送失败") {
                    $("#random").val(data.message);
                    timekeeping(120);
                    bootbox.alert("发送短信验证码成功，请注意查看您的手机");
                    return false;
                }else{
                    bootbox.alert(data.message);
                    return false;
                }
            },
            error: function (request, status, error) {
                alert('系统错误，稍候重试');
            }
        });
    });


    $("input[name='idNumber']").keyup(function () {
        this.value=this.value.replace(/\s/g,'');
    });

    $("input[name='idName']").keyup(function(){
        this.value=this.value.replace(/\s/g,'');

    })
    $("input[name='idName']").keyup(function(){
        WidthCheck(this, 20);
    })
    $("input[name='mail']").keyup(function(){
        this.value=this.value.replace(/\s/g,'');
    })
    $("input[name='mobileNo']").keyup(function(){
        this.value=this.value.replace(/[^+\d]/g,'');
    })

    //身份证姓名校验
    $("input[name='idName']").blur(function(){
       var reg =  /^[a-zA-Z\u4e00-\u9fa5\·]+$/;
        if(reg.test(this.value) === false){
            bootbox.alert("身份证姓名不合法！");
            return false;
        }
    });

    // 身份证校验
    $("input[name='idNumber']").blur(function(){
        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if(reg.test(this.value) === false)
        {
            bootbox.alert("身份证号不合法！");
            return  false;
        }
        $.ajax({
            url: '/salesmanAuthentication/checkAge',
            data: {idNumber: this.value},
            type: "POST",
            dataType:"json",
            success: function (json) {
                if (json.resultFlag == true) {
                    console.log(json.resultMessage)
                } else {
                    bootbox.alert("业务员年龄不符合要求，请重新录入");
                }
            },
            error: function (xhr, status) {
                console.log("--------------业务员年龄限制校验,异常.--------------------")
            }
        });
    })
    // 邮箱校验
    $("input[name='mail']").blur(function(){
    var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if(!reg.test(this.value)) {
            bootbox.alert('请输入有效的E_mail！');
            return false;
        }
    })

    // 手机号校验
    $("input[name='mobileNo']").blur(function(){
        var reg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if(!reg.test(this.value)) {
            bootbox.alert('请输入有效的手机号码！');
            return false;
        }
    })
})

    function submitNext(){
        var empUuid = $("#empUuid").val().trim();
        var empName = $("#idName").val().trim();
        var empIdcard = $("#idNumber").val().trim();
        var empTel = $("#mobileNo").val().trim();
        var empMail = $("#mail").val().trim();
        var verificationNo = $("#checknum").val().trim();
        var idCardPositive = $("#idCardPositive").val();
        var idcardOpposite = $("#idcardOpposite").val();
        var hideStatus = $("#hideStatus").val();
        console.log(idCardPositive);
        console.log(idcardOpposite);
        //非空验证
        if (empUuid == null || empUuid == '' || empUuid == undefined) {
            bootbox.alert("系统有误，请稍后再尝试");
            return false;
        }
        if (empName == null || empName == '' || empName == undefined) {
            bootbox.alert("身份证姓名不能为空");
            return false;
        }
        if (empIdcard == null || empIdcard == '' || empIdcard == undefined) {
            bootbox.alert("身份证号不能为空");
            return false;
        }
        if (empMail == null || empMail == '' || empMail == undefined) {
            bootbox.alert("邮箱不能为空");
            return false;
        }
        if (empTel == null || empTel == '' || empTel == undefined) {
            bootbox.alert("手机号不能为空");
            return false;
        }
        if (verificationNo == null || verificationNo == ''
            || verificationNo == undefined) {
            bootbox.alert("验证码不能为空");
            return false;
        }
        if(hideStatus != '03'){
            if(idCardPositive == null || idCardPositive == '' || idCardPositive == undefined ){
                bootbox.alert("请上传身份证正面照片");
                return false;
            }
            if(idcardOpposite == null || idcardOpposite == '' || idcardOpposite == undefined ){
                bootbox.alert("请上传身份证反面照片");
                return false;
            }
        }
        var random = $("#random").val();
        var code = $("#checknum").val();
        console.log(random);
        if(code != random){
            bootbox.alert("验证码错误！");
            return false;
        }
        var flag = false;
        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if(reg.test(empIdcard) === false)
        {
            bootbox.alert("身份证号不合法！");
            return  false;
        }
        $.ajax({
            url: '/salesmanAuthentication/checkAge',
            data: {idNumber: empIdcard},
            type: "POST",
            dataType:"json",
            async: false,
            success: function (json) {
                if (json.resultFlag == true) {
                    console.log(json.resultMessage)
                    flag = true;
                } else {
                    bootbox.alert("业务员年龄不符合要求，请重新录入");
                }
            },
            error: function (xhr, status) {
                bootbox.alert("业务员年龄限制校验异常,请联系管理员.");
                console.log("--------------业务员年龄限制校验,异常.--------------------")
            }
        });
        if(!flag){
            return false;
        }
        bootbox.confirm({
            title: "提示框",
            message: "保存后将更新原有信息，是否保存？",
            buttons: {
                cancel: {
                    label: '<i class="fa fa-times"></i> 取消'
                },
                confirm: {
                    label: '<i class="fa fa-check"></i> 确认'
                }
            },
            callback: function (result) {
                if(result){
                    document.getElementsByTagName("form")[0].submit();
                }
            }
        });

    }

    function judgeStatus(auStatus){
        if(auStatus == '01' || auStatus == '02'){
            $("#idName").attr("readonly",'readonly');
            $("#idNumber").attr("readonly",'readonly');
            $("#mail").attr("readonly",'readonly');
            $("#mobileNo").attr("readonly",'readonly');
        }
    }
function WidthCheck(str, maxLen){
    var w = 0;
    var tempCount = 0;
    //length 获取字数数，不区分汉子和英文
    for (var i=0; i<str.value.length; i++) {
        //charCodeAt()获取字符串中某一个字符的编码
        var c = str.value.charCodeAt(i);
        //单字节加1
        if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {
            w++;
        }
        else {
            w+=2;
        }
        if (w > maxLen) {
            str.value = str.value.substr(0,i);
            break;
        }
    }
}


function checkfile(sender,num,srcImg) {
    var validExts = new Array(".jpg", ".jpeg",".png",".gif",".JPG",".JPEG",".PNG",".GIF");
    var fileExt = sender.value;
    fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
    if(fileExt == ''){
        return true;
    }
    if (validExts.indexOf(fileExt) < 0) {
        bootbox.alert("文件格式错误！");
        if(num == '1'){
            document.getElementById("firstImg").click();
        }
        if(num == '2'){
            document.getElementById("secondImg").click();
        }
        return false;
    }
    var flag = validateImg(sender.id,srcImg);
    if(flag == false && num == '1'){
        document.getElementById("firstImg").click();
        return false;
    }
    if(flag == false && num == '2'){
        document.getElementById("secondImg").click();
        return false;
    }
    if(flag == '-1'){
        //bootbox.alert('您的浏览器暂不支持计算上传文件的大小，确保上传文件不要超过300k，建议使用IE、火狐、谷歌浏览器。')
        return true;
    }
     if(flag == true){
         return true
     }
}


function validateImg(fileUpLoadId,imgSrcId){
    var maxsize = 300*1024;//300kb
    var errMsg = "单个上传的图片不能超过300k！！！";
    var tipMsg = "您的浏览器暂不支持计算上传文件的大小，确保上传文件不要超过300k，建议使用IE、火狐、谷歌浏览器。";
    var  browserCfg = {};
    var ua = window.navigator.userAgent;
    if (ua.indexOf("MSIE")>=1){
        browserCfg.ie = true;
    }
    var obj_file = document.getElementById(fileUpLoadId);
    var filesize = 0;
    filesize = obj_file.files[0].size;
    if(browserCfg.ie){
        var obj_img = document.getElementById(imgSrcId);
        obj_img.dynsrc=obj_file.value;
        filesize = obj_img.fileSize;
    }
    if(filesize==-1){
        bootbox.alert(tipMsg);
        return '-1';
    }else if(filesize>maxsize){
        bootbox.alert(errMsg);
        return false;
    }else{
        return true;
    }
}