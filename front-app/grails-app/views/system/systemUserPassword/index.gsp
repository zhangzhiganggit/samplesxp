<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="scaffold">
	<g:set var="pageTitle" value="${message(code: 'controller.takinPassword.label')}" />
	<title>${pageTitle }</title>
</head>
<body>
<input type="hidden" id="loginName" value="${systemUserInstance?.loginName }"/>
<input type="hidden" id="flag" value="${flag}"/>
<input type="hidden" id="url" value="${url}"/>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-user"></i>
			<span class="caption-subject font-blue-hoki bold uppercase">${pageTitle }</span>
			<span class="caption-helper">&nbsp;</span>
		</div>
	</div>
	<div class="portlet-body form">
		<g:render template="/_shared/flashMessage" />
		<div class="tab-content">
			<div class="tab-pane active" id="tab-1">
				<div class="form-horizontal">
					<div class="form-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label col-md-2"><message:property domain="systemUser" property="loginName"/></label>
									<div class="col-md-9">
										<p class="form-control-static">${systemUserInstance?.loginName }</p>
									</div>
								</div>
							</div>
						</div>
						<g:if test="${flag==null || flag==''||flag!='1'}">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label col-md-2"><g:message code="takinProfile.password.old.label" /></label>
									<div class="col-md-3">
										<g:passwordField class="form-control" name="oldPassword" maxlength="40" required="required" />
									</div>
								</div>
							</div>
						</div>
						</g:if>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label col-md-2"><g:message code="takinProfile.password.new.label" /></label>
									<div class="col-md-3">
										<g:passwordField class="form-control" name="newPassword" maxlength="40" required="required" />
									</div>
									<p class="control-label col-md-7" style="color: red;text-align: left"><span>密码规则：密码长度8-20位，包含数字字母和特殊字符，空格不允许作为密码。</span>
									</p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label col-md-2"><g:message code="takinProfile.password.confirm.label" /></label>
									<div class="col-md-3">
										<g:passwordField class="form-control" name="confirmPassword" maxlength="40" required="required" />
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="form-actions">
						<div class="row">
							<div class="col-md-6">
								<div class="col-md-offset-3 col-md-9">
									<button id="submitButton" class="btn btn-primary" type="submit"><i class="fa fa-save"></i>&nbsp;<g:message code="default.button.submit.label" /></button>
									<g:if test="${flag!=null}">
									<button id="btn" class="btn btn-close" value="${message(code: 'merchantTerminalManagement.back.label')}">${message(code: 'merchantTerminalManagement.back.label')}
									</button>
									</g:if>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<content tag="takin-footer">
	<g:javascript>
        $(function () {
            $("#btn").on('click', function () {
           		 var url = $("input[id='url']").val();
                window.location.href=url;
            });

            $('#submitButton').on('click', function () {

                var loginName = $("input[id='loginName']").val();
                var oldPassword = $("input[name='oldPassword']").val();
                var newPassword=$("input[name='newPassword']").val();
                var confirmPassword=$("input[name='confirmPassword']").val();

				var flag=$("input[id='flag']").val();

				if (null==flag|| flag==''||flag!=1){
					if (!oldPassword || !newPassword || !confirmPassword) {
						bootboxAlert("密码不能为空");
						return false;
					}
				}

				if(newPassword!=confirmPassword){
					bootboxAlert("两次输入密码不一致");
					return false;
				}
				if (oldPassword==newPassword) {
					bootboxAlert("新密码不能与旧密码相同");
					return false;
				}

				//^(?![\d]+$)(?![a-zA-Z]+$)(?![!#$%^&*]+$)[\da-zA-Z!#$%^&*]{8,20}$
				var pa=/^(?=.{8,20}$)[0-9a-zA-Z~!@#$%^&*]+$/;
				if(!pa.test(newPassword)){
					bootboxAlert("密码长度8-20位,允许特殊字符、纯数字、纯字母。");
					return false;
				}

                $.ajax({
                    url: "${g.createLink(controller: "systemUserPassword", action: "update")}",
                    //dataType: 'json',
                    data: {
                        oldPassword: oldPassword,
                        newPassword:newPassword,
                        confirmPassword:confirmPassword,
                        userLoginName : loginName,
                        flag:flag

                    },
                    success: function(data) {
                        bootbox.dialog({
                            message: data.message,
                            title: '${message(code: 'default.flash.type.info')}',
                            buttons: {
                                danger: {
                                    label:  '${message(code: 'default.button.enter.label')}',
                                    className: "red",
                                    callback: function () {
                                        if (data.code) {

                                        if (data.flag == ''||data.flag==null){
                                        	top.location.href='/logout';

                                        }
                                        location.reload();

                                        }
                                    }
                                }
                            }
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