<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'salesmanAuthentication')]"/></title>
</head>
<body>
<component:portlet>
    <portlet:body withForm="true" >
        <g:uploadForm class="form-horizontal ng-pristine ng-valid form-bordered" role="form" controller="salesmanAuthentication" action="submitAuthentication">
            <g:hiddenField name="empUuid" value="${salesmanAuthenticationInstance?.empUuid}"/>
            <g:hiddenField name="status" id="hideStatus" value="${salesmanAuthenticationInstance?.status}"/>
            %{--<div class="form-body">--}%

                %{--认证结果信息--}%

                <div class="portlet light">
                <div class="portlet-title">
                    <div class="caption">
                        %{--<div class="margin-bottom-5 margin-top-20">--}%
                            <span class="caption-subject bold uppercase"> <g:message code="salesmanAuthentication.AuthenticationResult.label"/> </span>
                        %{--</div>--}%
                    </div>
                    <div class="tools">
                        <a href=":;" class="collapse" data-original-title="" title=""> </a>
                        <a href=":;" class="fullscreen" data-original-title="" title=""> </a>
                    </div>
                </div>
                %{--<div class="form-group  border border-grey "></div>--}%
                <div class="portlet-body form">
                <div class="form-group text-nowrap">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <label class="col-md-4 text-right">
                                <message:property domain="salesmanAuthentication" property="status"/>
                            </label>
                            <div class="col-md-8 text-left">
                                <g:if test="${salesmanAuthenticationInstance?.status == '00'}">未认证</g:if>
                                <g:if test="${salesmanAuthenticationInstance?.status == '01'}">未审核</g:if>
                                <g:if test="${salesmanAuthenticationInstance?.status == '02'}">审核通过</g:if>
                                <g:if test="${salesmanAuthenticationInstance?.status == '03'}">审核不通过</g:if>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4 text-right">
                            </label>
                            <div class="col-md-8">
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>

                %{--基本信息--}%
                <div class="margin-bottom-5">
                    <span class="label label-success" style="font-size: large"> <g:message code="salesmanAuthentication.baseInfo.label"/> </span>
                </div>
                <div class="form-group  border border-grey "></div>
                <div class="form-group">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <label class="col-md-4 text-right form-control-static">
                                <span aria-required="true" class="required">*</span><message:property domain="salesmanAuthentication" property="idName"/>
                            </label>
                            <div class="col-md-6 text-left">
                               <g:textField name="idName" class="form-control" required="required" value="${salesmanAuthenticationInstance?.idName}"></g:textField>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4 text-right form-control-static">
                                <span aria-required="true" class="required">*</span><message:property domain="salesmanAuthentication" property="idNumber"/>
                            </label>
                            <div class="col-md-6">
                                <g:textField name="idNumber" class="form-control" required="required" value="${salesmanAuthenticationInstance?.idNumber}"></g:textField>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <label class="col-md-4 text-right form-control-static">
                                <span aria-required="true" class="required">*</span><message:property domain="salesmanAuthentication" property="mail"/>
                            </label>
                            <div class="col-md-6 text-left">
                                <g:textField name="mail" class="form-control" required="required" value="${salesmanAuthenticationInstance?.mail}"></g:textField>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4 text-right">
                            </label>
                            <div class="col-md-6">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <label class="col-md-4 text-right form-control-static">
                                <span aria-required="true" class="required">*</span><message:property domain="salesmanAuthentication" property="mobileNo"/>
                            </label>
                            <div class="col-md-6 text-left">
                                <g:textField name="mobileNo" class="form-control" required="required" value="${salesmanAuthenticationInstance?.mobileNo}"></g:textField>
                            </div>

                        </div>
                        <g:if test="${salesmanAuthenticationInstance?.status == '00' || salesmanAuthenticationInstance?.status == '03'}">
                        <div class="col-md-6">
                            <label class="col-md-4 text-right form-control-static">
                                <span aria-required="true" class="required">*</span><message:property domain="salesmanAuthentication" property="checknum"/>
                            </label>
                            <div class="col-md-6">
                                <g:textField name="checknum" class="form-control" required="required" value="${salesmanAuthenticationInstance?.checknum}"></g:textField>
                            </div>
                            <div class="col-md-2">
                                <button class="btn btn-check-code" id="phoneButton">发送验证码</button>
                            </div>
                        </div>
                        </g:if>
                    </div>
                </div>


                <div class="form-group  border border-grey "></div>
                <div class="form-group margin-top-30">
                   <label class="col-md-12"><span style="font-size: large;color: red"><g:message code="salesmanAuthentication.promptInfo.label"/> </span>：如果图片大小超过300k，请点击<g:link>这里</g:link>下载浏览器进行转化</label>
                </div>
                %{--图片上传--}%
                <div class="form-group last">
                    <div class="col-md-12">
                        <div class="col-sm-3">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">

                            <g:if test="${salesmanAuthenticationInstance?.idCardPositive != null}">
                                <g:set var="idCardPositivePath" value="${salesmanAuthenticationInstance.idCardPositive}"/>
                                <img style="width: 200px;height: 150px" src="<g:createLink controller="salesmanAuthentication" action="viewImage" params="[title: idCardPositivePath]"/>"/>
                            </g:if>
                                    <div style="margin-top: 30%;color: #2a4d6c"><g:message code="salesmanAuthentication.cardPositive.label"/> </div>
                            </div>
                                    <g:if test="${salesmanAuthenticationInstance?.idCardPositive == null || salesmanAuthenticationInstance?.status == '03'}">
                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"> </div>
                            <div>
                                <span class="btn default btn-file">
                                    <span class="fileinput-new"> <g:message code="salesmanAuthentication.upLoad.label"/> </span>
                                    <span class="fileinput-exists"> <g:message code="salesmanAuthentication.alter.label"/> </span>
                                       <input type="file" name="idCardPositive" id="idCardPositive"> </span>
                                        %{--<component:simpleFileupload title="" name="idCardPositive" withInput="true"/>--}%
                                <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> <g:message code="salesmanAuthentication.delete.label"/> </a>
                            </div>
                                    </g:if>
                        </div>
                    </div>
                        <div class="col-sm-3">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                         <g:if test="${salesmanAuthenticationInstance?.idcardOpposite != null}">
                             <g:set var="idcardOppositePath" value="${salesmanAuthenticationInstance?.idcardOpposite}"/>
                             <img style="width: 200px;height: 150px" src="<g:createLink controller="salesmanAuthentication" action="viewImage" params="[title: idcardOppositePath]"/>"/>
                         </g:if>
                                    <div style="margin-top: 30%;color: #2a4d6c"><g:message code="salesmanAuthentication.cardOpposite.label"/> </div>
                            </div>
                    <g:if test="${salesmanAuthenticationInstance?.idcardOpposite == null || salesmanAuthenticationInstance?.status == '03'}">
                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"> </div>
                            <div>
                                <span class="btn default btn-file">
                                    <span class="fileinput-new"> <g:message code="salesmanAuthentication.upLoad.label"/> </span>
                                    <span class="fileinput-exists"> <g:message code="salesmanAuthentication.alter.label"/> </span>
                                    <input type="file" name="idcardOpposite" id="idcardOpposite"> </span>
                                    %{--<component:simpleFileupload title="" name="idcardOpposite" withInput="true"/>--}%
                                <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><g:message code="salesmanAuthentication.delete.label"/>  </a>
                            </div>
                        </g:if>
                        </div>
                    </div>
                    </div>
                </div>
                %{--<g:if test="${salesmanAuthenticationInstance?.status == '00'}">--}%
                <div class="form-actions">
                    <div class="left-button pull-left">
                        <div class="col-md-6 text-right">
                            <g:submitButton name="subButton" class="btn btn-submit" value="${message(code: 'salesmanAuthentication.submitAuthentication.label')}">
                            </g:submitButton>
                        </div>
                        <div class="col-md-6 text-left">
                            <botton class="btn btn-skip"><g:message code="salesmanAuthentication.skip.label"/> </botton>
                        </div>

                    </div>

                </div>


            %{--会签意见--}%
                <g:if test="${flowList != null}">
                    <div class="margin-bottom-5">
                        <span class="label label-success " style="font-size: large"> <g:message code="salesmanAuthentication.authenticationInfo.label"/> </span>
                    </div>
                    <div class="form-group  border border-grey "></div>

                    <g:each in="${flowList}" var="flow">
                        <div class="form-group text-nowrap">
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <label class="col-md-4 text-right">
                                        <message:property domain="salesmanAuthentication" property="operator"/>
                                    </label>
                                    <div class="col-md-8 text-left">
                                        ${flow.operator}
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="col-md-5 text-right">
                                        <message:property domain="salesmanAuthentication" property="operationTime"/>
                                    </label>
                                    <div class="col-md-7">
                                        ${flow.operationTime}
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="col-md-6 text-right">
                                        <message:property domain="salesmanAuthentication" property="flowStatus"/>
                                    </label>
                                    <div class="col-md-6">
                                        <g:if test="${flow?.flowStatus == '00'}"><g:message code="salesmanAuthentication.noApprove.label"/> </g:if>
                                        <g:if test="${flow?.flowStatus == '01'}"><g:message code="salesmanAuthentication.noExamine.label"/> </g:if>
                                        <g:if test="${flow?.flowStatus == '02'}"><g:message code="salesmanAuthentication.examine.label"/> </g:if>
                                        <g:if test="${flow?.flowStatus == '03'}"><g:message code="salesmanAuthentication.noExaminePass.label"/> </g:if>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="col-md-4 text-right">
                                        <message:property domain="salesmanAuthentication" property="suggestion"/>
                                    </label>
                                    <div class="col-md-8">
                                        ${flow.suggestion}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </g:each>
                </g:if>

               %{-- </g:if>--}%
                <g:if test="${checks != null}">
                %{--审核信息--}%
                <div class="margin-bottom-5">
                    <span class="label label-success " style="font-size: large"> <g:message code="salesmanAuthentication.examineInfo.label"/> </span>
                </div>
                <div class="form-group  border border-grey "></div>

                    <g:each in="${checks}" var="check">
                <div class="form-group text-nowrap">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <label class="col-md-4 text-right">
                                <message:property domain="salesmanAuthentication" property="inputError"/>
                            </label>
                            <div class="col-md-8 text-left">
                                ${check.inputError}
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label class="col-md-5 text-right">
                                <message:property domain="salesmanAuthentication" property="materialMissing"/>
                            </label>
                            <div class="col-md-7">
                                ${check.materialMissing}
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label class="col-md-6 text-right">
                                <message:property domain="salesmanAuthentication" property="materialDisqualification"/>
                            </label>
                            <div class="col-md-6">
                                ${check.materialDisqualification}
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label class="col-md-4 text-right">
                                <message:property domain="salesmanAuthentication" property="authenticationError"/>
                            </label>
                            <div class="col-md-8">
                                ${check.authenticationError}
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label class="col-md-4 text-right">
                                <message:property domain="salesmanAuthentication" property="other"/>
                            </label>
                            <div class="col-md-8">
                                ${check.other}
                            </div>
                        </div>
                    </div>
                </div>
                    </g:each>

                </g:if>

                %{--<div class="form-group"></div>--}%
                %{--<div class="form-group text-nowrap">--}%
                    %{--<div class="col-md-12">--}%
                        %{--<div class="col-md-6">--}%
                            %{--<label class="col-md-4 text-right"><g:message code="salesmanAuthentication.user.label"/> </label>--}%
                            %{--<div class="col-md-8 text-left ">${salesmanAuthenticationInstance?.idName}</div>--}%
                        %{--</div>--}%
                        %{--<div class="col-md-6">--}%
                            %{--<label class="col-md-4 text-right"><g:message code="salesmanAuthentication.status.label"/> </label>--}%
                            %{--<div class="col-md-8 text-left">--}%
                                %{--<g:if test="${salesmanAuthenticationInstance?.status == '00'}"><g:message code="salesmanAuthentication.noApprove.label"/> </g:if>--}%
                                %{--<g:if test="${salesmanAuthenticationInstance?.status == '01'}"><g:message code="salesmanAuthentication.noExamine.label"/> </g:if>--}%
                                %{--<g:if test="${salesmanAuthenticationInstance?.status == '02'}"><g:message code="salesmanAuthentication.examine.label"/> </g:if>--}%
                                %{--<g:if test="${salesmanAuthenticationInstance?.status == '03'}"><g:message code="salesmanAuthentication.noExaminePass.label"/> </g:if>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</div>--}%
                %{--</g:if>--}%

</div>


        </g:uploadForm>
    </portlet:body>
</component:portlet>
</body>
</html>
<content tag="takin-footer">
    <asset:javascript src="/system/salesmanAuthentication.js"/>
</content>




