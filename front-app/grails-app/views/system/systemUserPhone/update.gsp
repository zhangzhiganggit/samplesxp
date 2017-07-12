<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <g:set var="pageTitle" value="${message(code: 'systemUserPhone.check.phone.label')}" />
    <title>${pageTitle }</title>
</head>
<body>
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
                <g:form class="form-horizontal" action="submit" method="PUT">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="form-group">
                                    <label class="control-label col-md-3"><message:property domain="systemUser" property="phone"/></label>
                                    <div class="col-md-9">
                                        <p class="form-control-static">${systemUserInstance?.phone }</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-10">
                                <div class="form-group">
                                    <label class="control-label col-md-3"><g:message code="systemUserPhone.phone.new.label" /></label>
                                    <div class="col-md-3">
                                        <g:textField class="form-control" name="newPhone" maxlength="40" required="required" id="newPhone" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-10">
                                <div class="form-group">
                                    <label class="control-label col-md-3"><g:message code="systemUserPhone.phone.confirm.label" /></label>
                                    <div class="col-md-3">
                                        <g:textField class="form-control" name="confirmPhone" maxlength="40" required="required" id="confirmPhone" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-primary" type="submit" id="userPhoneSubmit"><i class="fa fa-save"></i>&nbsp;<g:message code="default.button.update.label" /></button>
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

            $('#userPhoneSubmit').on('click', function () {
               //校验手机号码
				var confirmPhone = $('#confirmPhone').val();
                var newPhone = $('#newPhone').val();
				var pre=/^[1][358][0-9]{9}$/;
                if(newPhone!=confirmPhone){
                    alert('输入手机号不一致');
                    return;
                }
				if(newPhone=='' || confirmPhone==''){
					alert('手机号码不能为空');
					return;
				}
				if{
					var pre=/^[1][358][0-9]{9}$/;
					if(!pre.test(newPhone) || !pre.test(confirmPhone)){
					    alert('手机号码格式有误');
						return;
					}
				}

                localStorage["total"]=null;
				$('.form-horizontal').submit();

            });
        });
    </g:javascript>
</content>