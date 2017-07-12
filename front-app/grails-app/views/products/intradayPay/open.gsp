<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    %{--<g:set var="entityName" value="${message(code: 'applyFor.label', default: 'ApplyFor')}" />--}%
    %{-- <title><g:message code="default.create.label" args="[entityName]" /></title>--}%
</head>


<body>
%{-- <a href="#create-applyFor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
<div class="nav" role="navigation">
    <ul>
        %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
        <li><g:link class="list" action="index">显示所有信息</g:link></li>
    </ul>
</div>
<div id="create-applyFor" class="content scaffold-create" role="main">
    <h4 ><g:message code="default.create.label" args="[entityName]" /></h4>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.applyFor}">
        <ul class="errors" role="alert">
            ${errorMesage}

            <g:eachError bean="${this.applyFor}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>


    <div class="portlet-body">
    <!-- BEGIN FORM-->
        <g:form novalidate="novalidate" action="form_validation.html#" id="form_sample_2" class="form-horizontal">
            <div class="form-body">
                <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button> You have some form errors. Please check below. </div>
                <div class="alert alert-success display-hide">
                    <button class="close" data-close="alert"></button> Your form validation is successful! </div>
                <div class="form-group  margin-top-20">
                    <label class="control-label col-md-3">商户编号
                        <span aria-required="true" class="required"> * </span>
                    </label>
                    <div class="col-md-4">
                        <div class="input-icon right">
                            <i class="fa"></i>
                            %{--<input class="form-control" name="name" type="text">--}%
                            <g:textField name="IntradayPay.merchantCode" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">商户名称
                        <span aria-required="true" class="required"> * </span>
                    </label>
                    <div class="col-md-4">
                        <div class="input-icon right">
                            <i class="fa"></i>
                            %{--<input class="form-control" name="digits" type="text">--}%
                            <g:textField name="IntradayPay.merchantSalesSlipName"  />小时
                        </div>
                    </div>
                </div>
                <div class="form-group  margin-top-20">
                    <label class="control-label col-md-3">备注
                        <span aria-required="true" class="required"> * </span>
                    </label>
                    <div class="col-md-4">
                        <div class="input-icon right">
                            <i class="fa"></i>
                            <textarea class="form-control" rows="3"></textarea>
                        </div>

                    </div>
                </div>


            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-3 col-md-9">
                        %{--<button type="submit" class="btn green">Submit</button>--}%

                        <g:actionSubmit value="确认" action="save" class="btn green"/>

                        <button type="button" class="btn default">取消</button>
                    </div>
                </div>
            </div>
        </g:form>
    <!-- END FORM-->
    </div>



</div>
</body>
</html>
