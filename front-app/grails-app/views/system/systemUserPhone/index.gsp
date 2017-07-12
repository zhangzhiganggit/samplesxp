<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <g:set var="pageTitle" value="${message(code: 'systemUserPhone.check.phone.label')}"/>
    <title>${pageTitle}</title>
</head>

<body>
<div class="portlet light bordered">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-user"></i>
            <span class="caption-subject font-blue-hoki bold uppercase">${pageTitle}</span>
            <span class="caption-helper">&nbsp;提示：手机号验证通过后可作为登录名使用，能收到公司活动消息并且可找回密码。</span>
        </div>
    </div>

    <div class="portlet-body form">
        <g:render template="/_shared/flashMessage"/>
        <div class="tab-content">
            <div class="tab-pane active" id="tab-1">
                <g:form class="form-horizontal" action="update" method="PUT">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">原登陆账号：</label>

                                    <div class="col-md-6">
                                        <p class="form-control-static"><span
                                                class="phoneclass">${systemUserInstance?.loginName}</span></p>
                                        <input type="hidden" id="beginPhone" value="${systemUserInstance?.phone}"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4"><span
                                            class="required">*</span><message:property domain="systemUser"
                                                                                            property="password"/>：</label>

                                    <div class="col-md-6">
                                        <g:passwordField class="form-control" name="password" maxlength="40"
                                                         required="required" type="password"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4"><span class="required">*</span>新手机号：</label>

                                    <div class="col-md-6">
                                        <g:textField class="form-control" name="phone" maxlength="15"
                                                     required="required"/>
                                        %{-- <input type="button" style="display: inline-block" class="btn btn-primary btn-xs" id="userPhoneButton"
                                                value="获取验证码"/>--}%
                                    </div>
                                    <input type="button" class="btn btn-primary btn-xs" id="userPhoneButton"
                                           value="获取验证码"/>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4"><span class="required">*</span>新手机短信验证码：
                                    </label>

                                    <div class="col-md-6">
                                        <p class="form-control-static">
                                            <g:textField class="form-control" name="smsCode" maxlength="40"
                                                         required="required"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-primary" id="submitButton" type="button"><i
                                            class="fa fa-save"></i>&nbsp;<g:message code="default.button.submit.label"/>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<content tag="takin-footer">
    <g:javascript>
        $(function () {
            var time;

           if(time&&time!=undefined&&time!='NaN'&&time!='null'){
				timekeeping();
			}else{//cookie 没有倒计时
				$('#userPhoneButton').attr("disabled", false);
			}

			function timekeeping(){
				//把按钮设置为不可以点击
				$('#userPhoneButton').attr("disabled", true);
				var interval=setInterval(function(){//每秒读取一次cookie
					//从cookie 中读取剩余倒计时
					total=time;
					//在发送按钮显示剩余倒计时
					$('#userPhoneButton').val('请等待'+total+'秒');
					//把剩余总倒计时减掉1
					total--;

					if(total==0){//剩余倒计时为零，则显示 重新发送，可点击
						//清除定时器
						clearInterval(interval);
						//删除cookie
						time=null;

						//显示重新发送
						$('#userPhoneButton').val('重新发送');
						//把发送按钮设置为可点击
							$('#userPhoneButton').attr("disabled", false);
					}else{//剩余倒计时不为零
						//重新写入总倒计时
						time=total;
					}

				},1000);
		}

            $('#userPhoneButton').on('click', function () {
               //校验手机号码
				var phone =  $("input[name='phone']").val();
				var beginPhone=$("input[id='beginPhone']").val();
				var pre=/^[1][3578][0-9]{9}$/;
				if (phone==beginPhone){
				    bootboxAlert("新手机号不能与旧手机号相同");
				    return false;
				}
				if(!phone){
					bootboxAlert('手机号码不能为空');
					return false;
				}else{
					var pre=/^[1][3578][0-9]{9}$/;
					if(!pre.test(phone)){
					    bootboxAlert('手机号码格式有误');
						return false;
					}
				}

                $.ajax({
                    url: "${g.createLink(controller: "systemUserPhone", action: "phoneCheckCode")}",
                    //dataType: 'json',
                    data: {
                        phone: phone,
                        flag : 'systemChange'
                    },
                    success: function (data) {
						if(data.code){
							time=60;
							bootboxAlert(data.message);
							timekeeping();

						}else {
						    bootboxAlert(data.message);
						}
                    },
                    error: function (request, status, error) {

                        bootboxAlert(error);
                    },
                    complete: function () {
                    }
                });
            });

            $('#submitButton').on('click', function () {

                var phone = $("input[name='phone']").val();
                var smsCode=$("input[name='smsCode']").val();
                var password=$("input[name='password']").val();
				var pre=/^[1][3578][0-9]{9}$/;
				if(!phone){
					bootboxAlert('手机号码不能为空');
					return false;
				}else{
					var pre=/^[1][3578][0-9]{9}$/;
					if(!pre.test(phone)){
					    bootboxAlert('手机号码格式有误');
						return false;
					}
				}
				if (time==null){
				    bootboxAlert("验证码超时");
				    return false;
				}

				if(!smsCode){
				    bootboxAlert('短信验证码不能为空');
				    return false;
				}
				if(!password){
				    bootboxAlert('密码不能为空');
				    return false;
				}

                $.ajax({
                    url: "${g.createLink(controller: "systemUserPhone", action: "submit")}",
                    //dataType: 'json',
                    data: {
                        phone: phone,
                        smsCode:smsCode,
                        password:password
                    },
                    success: function(data) {

                    bootbox.alert({
                                buttons: {
                                    ok: {
                                        label: '确定'
                                    }
                                },
                                message: data.message,
                                 callback: function() {
                                     if (data.code) {
                                         top.location.href='/logout';
                                     }
                                 },
                                title: "提示",
                            });

                    },
                    error: function (request, status, error) {
                        bootboxAlert('系统错误，稍候重试')
                    },
                    complete: function () {
                    }
                });
            });
        });

    </g:javascript>
</content>