
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'salesmanAuthentication.AuthenticationResult.label', args: message.domain(domain: 'salesmanAuthentication'))}"/>
    <portlet:body withForm="true">
        <g:uploadForm controller="salesmanAuthentication" action="submitAuthentication"
                   name="scaffold-search-salesmanAuthentication">
            <form:scaffoldSearchProperties/>
            <form:body>
                <g:hiddenField name="empUuid" value="${salesmanAuthenticationInstance?.empUuid}"/>
                <g:hiddenField name="status" id="hideStatus" value="${salesmanAuthenticationInstance?.status}"/>
                <g:hiddenField name="random" id="random"/>
                <g:if test="${returnMessage != null && returnMessage != ''}">
                    <g:hiddenField name="mess" id="mess" value="${returnMessage}"/>
                </g:if>
                %{--认证结果信息--}%
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-sm-2 control-label text-right padding-top0">
                                <message:property domain="salesmanAuthentication" property="status"/>
                            </label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <g:if test="${salesmanAuthenticationInstance?.status == '00'}"><g:message code="salesmanAuthentication.noApprove.label"/></g:if>
                                <g:if test="${salesmanAuthenticationInstance?.status == '01'}"><g:message code="salesmanAuthentication.noExamine.label"/></g:if>
                                <g:if test="${salesmanAuthenticationInstance?.status == '02'}"><g:message code="salesmanAuthentication.examine.label"/></g:if>
                                <g:if test="${salesmanAuthenticationInstance?.status == '03'}"><g:message code="salesmanAuthentication.noExaminePass.label"/></g:if>
                            </div>
                            <input type="hidden" id="auStatus" value="${salesmanAuthenticationInstance?.status}"/>
                        </div>
                    </div>
                </div>
                %{--审核信息--}%
                <g:if test="${salesmanAuthenticationInstance?.status == '03'}">
                    <g:if test="${flowList != null}">
                        <component:portlet cssClass="scaffold-search">
                            <portlet:title
                                    title="${message(code: 'salesmanAuthentication.examineInfo.label', args: message.domain(domain: 'salesmanAuthentication'))}"/>
                            <portlet:body withForm="true">
                                <div class="form-group" style="overflow-y:auto;">

                                    <g:each in="${checks}" var="check">
                                        <div class="form-group text-nowrap">
                                            %{--<div class="col-md-12">--}%
                                            <div class="col-md-12">
                                                <label class="col-md-1 text-left">
                                                    <message:property domain="salesmanAuthentication" property="inputError"/>
                                                </label>
                                                <div class="col-md-11 text-left">
                                                    ${check.inputError}
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="col-md-1 text-left">
                                                    <message:property domain="salesmanAuthentication" property="materialMissing"/>
                                                </label>
                                                <div class="col-md-11 text-left">
                                                    ${check.materialMissing}
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="col-md-1 text-left">
                                                    <message:property domain="salesmanAuthentication" property="materialDisqualification"/>
                                                </label>
                                                <div class="col-md-11 text-left">
                                                    ${check.materialDisqualification}
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="col-md-1 text-left">
                                                    <message:property domain="salesmanAuthentication" property="authenticationError"/>
                                                </label>
                                                <div class="col-md-11 text-left">
                                                    ${check.authenticationError}
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="col-md-1 text-left">
                                                    <message:property domain="salesmanAuthentication" property="other"/>
                                                </label>
                                                <div class="col-md-11 text-left">
                                                    ${check.other}
                                                </div>
                                            </div>
                                            %{--</div>--}%
                                        </div>
                                        <br/>
                                    </g:each>
                                </div>
                            </portlet:body>
                        </component:portlet>
                    </g:if>
                </g:if>

                    %{--基本信息--}%
                    <component:portlet cssClass="scaffold-search">
                        <portlet:title
                                title="${message(code: 'salesmanAuthentication.baseInfo.label', args: message.domain(domain: 'salesmanAuthentication'))}"/>
                        <portlet:body withForm="true">
                            <div class="form-group" style="overflow-y:auto;overflow-x:hidden;">
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
                                            <g:if test="${auFlag == '0'}">
                                                <g:textField name="mobileNo" class="form-control" required="required" readOnly="true" value="${salesmanAuthenticationInstance?.mobileNo}"></g:textField>
                                            </g:if>
                                            <g:else>
                                                <g:textField name="mobileNo" class="form-control" required="required" value="${phone}"></g:textField>
                                            </g:else>
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
                                                <button class="btn btn-check-code" id="phoneButton"><g:message code="salesmanAuthentication.sendCode.label"/></button>
                                            </div>
                                        </div>
                                    </g:if>
                                </div>
                            </div>
                        </portlet:body>
                    </component:portlet>

                %{--附件信息--}%
                <component:portlet cssClass="scaffold-search">
                    <portlet:title
                            title="${message(code: 'salesmanAuthentication.personalInfo.label', args: message.domain(domain: 'salesmanAuthentication'))}"/>
                    <portlet:body withForm="true">
                        <div class="form-group" style="overflow-y:auto;overflow-x:hidden;">
                        %{--<div class="form-group">--}%
                            %{--<label class="col-md-12"><span style="font-size: large;color: red;padding-left:15px"><g:message code="salesmanAuthentication.promptInfo.label"/> </span>：如果图片大小超过300k，请点击<g:link>这里</g:link>下载浏览器进行转化</label>--}%
                        %{--</div>--}%
                    <g:message code="salesmanAuthentication.imageStartInfo.label"/>
                        <component:download filePath="imageTool/JPGCompress.zip" class="btn btn-download"
                                            fileName="${message(code: 'salesmanAuthentication.imageChange.label')}.zip"
                                            title="${message(code: 'salesmanAuthentication.imageInfo.label')}" />
                        <g:message code="salesmanAuthentication.imageEndInfo.label"/>
                        <div class="form-group last">
                            <div class="col-md-12">
                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <g:set var="imgPath" value="${imgPath}"/>
                                            <g:if test="${salesmanAuthenticationInstance?.idCardPositive != null}">
                                                <g:set var="idCardPositivePath" value="${salesmanAuthenticationInstance.idCardPositive}"/>
                                                <img style="width: 200px;height: 150px" src="<g:createLink controller="salesmanAuthentication" action="viewImage" params="[title: idCardPositivePath,imgPath:imgPath]"/>"/>
                                            </g:if>
                                            <div style="margin-top: 30%;color: #2a4d6c"><g:message code="salesmanAuthentication.cardPositive.label"/> </div>
                                        </div>
                                        <g:if test="${salesmanAuthenticationInstance?.idCardPositive == null || salesmanAuthenticationInstance?.status == '03' || salesmanAuthenticationInstance?.status == '00'}">
                                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"> </div>
                                            <div>
                                                <span class="btn default btn-file">
                                                    <span class="fileinput-new"> <g:message code="salesmanAuthentication.upLoad.label"/> </span>
                                                    <span class="fileinput-exists"> <g:message code="salesmanAuthentication.alter.label"/> </span>
                                                    <img id="idCardPositiveTempimg" dynsrc="" src="" style="display:none" />
                                                    <input type="file" name="idCardPositive" id="idCardPositive" onchange="checkfile(this,'1','idCardPositiveTempimg');"> </span>
                                                <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput" id="firstImg"> <g:message code="salesmanAuthentication.delete.label"/> </a>
                                            </div>
                                        </g:if>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <g:if test="${salesmanAuthenticationInstance?.idcardOpposite != null}">
                                                <g:set var="idcardOppositePath" value="${salesmanAuthenticationInstance?.idcardOpposite}"/>
                                                <img style="width: 200px;height: 150px" src="<g:createLink controller="salesmanAuthentication" action="viewImage" params="[title: idcardOppositePath,imgPath:imgPath]"/>"/>
                                            </g:if>
                                            <div style="margin-top: 30%;color: #2a4d6c"><g:message code="salesmanAuthentication.cardOpposite.label"/> </div>
                                        </div>
                                        <g:if test="${salesmanAuthenticationInstance?.idcardOpposite == null || salesmanAuthenticationInstance?.status == '03' || salesmanAuthenticationInstance?.status == '00'}">
                                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"> </div>
                                            <div>
                                                <span class="btn default btn-file">
                                                    <span class="fileinput-new"> <g:message code="salesmanAuthentication.upLoad.label"/> </span>
                                                    <span class="fileinput-exists"> <g:message code="salesmanAuthentication.alter.label"/> </span>
                                                    <img id="idcardOppositeTempimg" dynsrc="" src="" style="display:none" />
                                                    <input type="file" name="idcardOpposite" id="idcardOpposite" onchange="checkfile(this,'2','idcardOppositeTempimg');"> </span>
                                                <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput" id="secondImg"><g:message code="salesmanAuthentication.delete.label"/>  </a>
                                            </div>
                                        </g:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    %{--<g:if test="${salesmanAuthenticationInstance?.status == '00'}">--}%
                        %{--<div class="form-actions">--}%
                            %{--<div class="left-button pull-left">--}%
                                %{--<div class="col-md-6 text-right">--}%
                                    %{--<g:submitButton name="subButton" class="btn btn-submit" value="${message(code: 'salesmanAuthentication.submitAuthentication.label')}">--}%
                                    %{--</g:submitButton>--}%
                                %{--</div>--}%
                                %{--<div class="col-md-6 text-left">--}%
                                    %{--<botton class="btn btn-skip"><g:message code="salesmanAuthentication.skip.label"/> </botton>--}%
                                %{--</div>--}%

                            %{--</div>--}%

                        %{--</div>--}%
                        %{--</g:if>--}%
                    %{--</div>--}%
                    </portlet:body>
                </component:portlet>
                %{--会签意见区--}%
                <g:if test="${salesmanAuthenticationInstance?.status != '01' && salesmanAuthenticationInstance?.status != '00'}">
                    <g:if test="${flowList != null}">
                        <component:portlet cssClass="scaffold-search">
                            <portlet:title
                                    title="${message(code: 'salesmanAuthentication.authenticationInfo.label', args: message.domain(domain: 'salesmanAuthentication'))}"/>
                            <portlet:body withForm="true">
                                <div class="form-group" style="overflow-y:auto;">

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
                                                    <label class="col-md-4 text-right">
                                                        <message:property domain="salesmanAuthentication" property="operationTime"/>
                                                    </label>
                                                    <div class="col-md-8">
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
                                </div>
                            </portlet:body>
                        </component:portlet>
                    </g:if>
                </g:if>
            </form:body>
            <form:actions>
                <div class="form-actions">
                    <div class="left-button pull-left">
                        <g:if test="${salesmanAuthenticationInstance?.status == '01'}">
                            <div class="btn btn-cancle">
                                <g:link controller="salesmanAuthentication" action="backAuthentication" params="[flowNo:salesmanAuthenticationInstance?.flowNo]">
                                    <g:message code="salesmanAuthentication.backButton.label"/>
                                </g:link>
                            </div>
                        </g:if>
                        <g:if test="${salesmanAuthenticationInstance?.status == '00' || salesmanAuthenticationInstance?.status == '03'}">
                            <div class="col-md-6 text-right">
                                <g:submitButton data-toggle="modal" data-target="#sample_modal" name="subButton" class="btn btn-submit" value="${message(code: 'salesmanAuthentication.submitAuthentication.label')}">
                                </g:submitButton>
                            </div>
                        </g:if>
                    </div>

                </div>
            </form:actions>
        </g:uploadForm>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/system/salesmanAuthentication.js"/>
    <script type="text/javascript">
        $(function(){
            var message = $("#mess").val();
            bootbox.alert(message);
        })
    </script>
</content>
