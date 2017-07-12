<%@ page import="com.suixingpay.ssp.front.system.SystemOrganization" %>
<%@ page import="com.suixingpay.ssp.front.Province" %>
<component:portlet cssClass="scaffold-search">
    <g:if test="${formAction == 'update'}"><portlet:title title="修改分销机构"/></g:if>
    <g:if test="${formAction == 'save'}"><portlet:title title="添加分销机构"/></g:if>

    <portlet:body withForm="true">
        <form:form
                id="systemOrganizationForm"
                controller="organization"
                action="${formAction}"
                name="scaffold-${formAction}-organization">
            <form:scaffoldSearchProperties/>

            <g:if test="${formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="organizationInstance.id" value="${organizationInstance?.id}"/>
                <formCommon:hiddenField name="systemUserInstance.id" value="${systemUserInstance?.id}"/>
                <formCommon:hiddenField name="provinceHidden" value="${organizationInstance?.province}"/>
                <formCommon:hiddenField name="cityHidden" value="${organizationInstance?.cityCd}"/>
            </g:if>
            <g:if test="${formAction == 'save'}">
            %{--<formCommon:hiddenField name="_method" value="PUT" id="_method"/>--}%
                <formCommon:hiddenField name="organizationInstance.id" value="${organizationInstance?.id}"/>
                <formCommon:hiddenField name="systemUserInstance.id" value="${systemUserInstance?.id}"/>
                <formCommon:hiddenField name="provinceHidden" value="${organizationInstance?.province}"/>
                <formCommon:hiddenField name="cityHidden" value="${organizationInstance?.cityCd}"/>
            </g:if>

            <formCommon:hiddenField name="publicBankNameHidden" value="${organizationInstance?.openbankName}"/>
            <formCommon:hiddenField name="privateBankNameHidden" value="${systemUserInstance?.openbankName}"/>


            <form:body>

            %{--基本信息--}%

                <div class="portlet light portlet-fit bordered">
                    <div class="portlet-title">
                        <div class="caption"><span class="caption-subject bold font-dark uppercase">基本信息</span></div>
                    </div>

                    <div class="portlet-body">

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group-sm">

                                    <label class="col-sm-3 control-label">
                                        <span class="required">*</span><g:message
                                            code="merchantManagement.orgName.label"></g:message>:
                                    </label>

                                    <div class="col-sm-9${hasErrors(bean: organizationInstance, field: 'orgName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="organizationInstance.orgName"
                                                     required="required"
                                                     id="orgName"
                                                     value="${organizationInstance?.orgName}"/>
                                        <span class="help-block "><g:fieldError bean="${organizationInstance}"
                                                                                field="orgName"/></span>
                                    </div>

                                </div>
                            </div>


                            <div class="col-md-6">
                                <div class="form-group-sm">

                                    <label class="col-sm-3 control-label">
                                        <span class="required">*</span><g:message
                                            code="systemOrganizationResult.orgRunProp.label"></g:message>:
                                    </label>

                                    <div class="col-sm-4 ">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control"
                                                  name="orgRunProp"
                                                  required="required"
                                                  from="${com.suixingpay.ssp.front.system.SystemOrganizationAgent.constrainedProperties['orgRunProp'].inList}"
                                                  value="${systemOrganizationAgentInstance?.orgRunProp}"
                                                  valueMessagePrefix="systemOrganizationAgent.orgRunProp"
                                                  noSelection="['': '--请选择--']"/>
                                    </div>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">
                                        <span class="required">*</span><span style="font-size:12px">机构详细地址:</span>
                                    </label>
                                    <div class="col-md-9">
                                        <div class="col-md-6 col-sm-6 col-sx-12${hasErrors(bean: systemReceiptAddressInstance, field: province, ' takin-input-errors')}">
                                            <span required="required" id="provincespan"></span>
                                            <span class="help-block "><g:fieldError bean="${systemReceiptAddressInstance}"
                                                                                    field="province"
                                            /></span>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-sx-12${hasErrors(bean: systemReceiptAddressInstance, field: city, ' takin-input-errors')}">
                                            <span required="required" id="cityspan"></span>
                                            <span class="help-block "><g:fieldError bean="${systemReceiptAddressInstance}"
                                                                                    field="city"/></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group  form-group_margin">
                                    <div class=" col-md-12 col-sm-3${hasErrors(bean: organizationInstance, field: 'orgAddress', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="organizationInstance.orgAddress"
                                                     value="${organizationInstance?.orgAddress}"/>
                                        <span class="help-block "><g:fieldError bean="${organizationInstance}"
                                                                                field="orgAddress"/></span>
                                    </div>

                                    <span class="help-block "><g:fieldError bean="${systemReceiptAddressInstance}"
                                                                            field="${province}"/></span>
                                </div>
                            </div>
                        </div>


                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group-sm">

                                    <label class="col-sm-3 control-label">
                                        邮政编码：
                                    </label>

                                    <div class="col-sm-9${hasErrors(bean: organizationInstance, field: 'orgZip', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="organizationInstance.orgZip"
                                                     value="${organizationInstance?.orgZip}"/>
                                        <span class="help-block "><g:fieldError bean="${organizationInstance}"
                                                                                field="orgZip"/></span>
                                    </div>

                                </div>
                            </div>


                            <div class="col-md-6">
                                <div class="form-group-sm">

                                    <label class="col-sm-3 control-label">
                                        <span class="required">*</span>  机构电话：
                                    </label>

                                    <div class="col-sm-9${hasErrors(bean: organizationInstance, field: 'organizationTelephone', ' takin-input-errors')}">
                                        <g:textField class="form-control"
                                                     name="organizationInstance.organizationTelephone"
                                                     required="required"
                                                     value="${organizationInstance?.organizationTelephone}"/>
                                        <span class="help-block "><g:fieldError bean="${organizationInstance}"
                                                                                field="organizationTelephone"/></span>
                                    </div>

                                </div>
                            </div>
                        </div>


                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group-sm">

                                    <label class="col-sm-3 control-label">
                                        法人身份证姓名：
                                    </label>

                                    <div class="col-sm-9${hasErrors(bean: systemOrganizationAgentInstance, field: 'legalPersonName', ' takin-input-errors')}">
                                        <g:textField class="form-control"
                                                     name="legalPersonName"
                                                     value="${systemOrganizationAgentInstance?.legalPersonName}"/>
                                        <span class="help-block "><g:fieldError bean="${systemOrganizationAgentInstance}"
                                                                                field="legalPersonName"/></span>
                                    </div>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group-sm">

                                    <label class="col-sm-3 control-label">
                                        法人身份证号：
                                    </label>


                                    <div class="col-sm-9${hasErrors(bean: systemOrganizationAgentInstance, field: 'legalPersonCard', ' takin-input-errors')}">
                                        <g:textField class="form-control"
                                                     name="legalPersonCard"
                                                     value="${systemOrganizationAgentInstance?.legalPersonCard}"/>
                                        <span class="help-block "><g:fieldError bean="${systemOrganizationAgentInstance}"
                                                                                field="legalPersonCard"/></span>
                                    </div>

                                </div>
                            </div>


                        </div>


                        <div class="row">
                            %{--过滤停用、快速新增状态--}%
                        %{--以后增加状态一定要改这 业务员 办公人员一样--}%
                            <g:if test="${formAction == 'update'}">
                                <g:if test="${com.suixingpay.ssp.front.system.SystemOrganization.constrainedProperties['orgStatus'].inList.size()>3}">
                                    <g:if test="${com.suixingpay.ssp.front.system.SystemOrganization.constrainedProperties['orgStatus'].inList.get(3)==9}">
                                        <input type="hidden" value="${com.suixingpay.ssp.front.system.SystemOrganization.constrainedProperties['orgStatus'].inList.remove(3)}"/>
                                        <input type="hidden" value="${com.suixingpay.ssp.front.system.SystemOrganization.constrainedProperties['orgStatus'].inList.remove(2)}"/>
                                    </g:if>
                                </g:if>
                                <div class="col-md-6">
                                    <div class="form-group-sm">

                                        <label class="col-sm-3 control-label">
                                            <span class="required">*</span>  机构状态：
                                        </label>

                                        <div class="col-sm-4 control-label">
                                            <g:select style="margin-bottom: 0.5rem;" class="form-control"
                                                      name="organizationInstance.orgStatus"
                                                      from="${com.suixingpay.ssp.front.system.SystemOrganization.constrainedProperties['orgStatus'].inList}"
                                                      value="${organizationInstance?.orgStatus}"
                                                      valueMessagePrefix="systemOrganization.orgStatus"
                                                      noSelection="['': '--请选择--']"/>

                                        </div>
                                    </div>
                                </div>



                                <div class="col-md-6">
                                    <div class="form-group-sm">

                                        <label class="col-sm-3 control-label">
                                            <span class="required">*</span>  创建日期：
                                        </label>

                                        <div class="col-sm-9 control-label ${hasErrors(bean: organizationInstance, field: 'dateCreated', ' takin-input-errors')}">
                                            <p align="left">${organizationInstance?.dateCreated.format("yyyy-MM-dd")}</p>
                                            <span class="help-block "><g:fieldError bean="${organizationInstance}"
                                                                                    field="dateCreated"/></span>
                                        </div>

                                    </div>
                                </div>
                            </g:if>
                        </div>

                    </div>
                </div>


                <div class="portlet light portlet-fit bordered">
                    <div class="portlet-title">
                        <div class="caption"><span class="caption-subject bold font-dark uppercase">机构管理者信息</span></div>
                    </div>

                    <div class="portlet-body">

                        <div class="row">
                            <g:if test="${formAction == 'update'}">
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <label class="col-sm-3 control-label" style="font-size: 12px">个人编号</label>

                                        <div class="col-sm-9" align="left">
                                            <input type="text" class="form-control" name="systemUserInstance.userCode"
                                                   readonly="readonly"
                                                   value="${systemUserInstance?.userCode}" required="required"
                                                   id="systemUserInstance.userCode">
                                            <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                          field="userCode"/></span>
                                        </div>

                                    </div>

                                    <div class="col-md-6">
                                        <label class="col-sm-3 control-label" style="font-size: 12px">登录名称</label>

                                        <div class="col-sm-9" align="left">
                                            <input type="text" class="form-control" name="systemUserInstance.loginName"
                                                   value="${systemUserInstance?.loginName}"
                                                   readonly="readonly" required="required" id="loginName">
                                            <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                          field="loginName"/></span>
                                        </div>
                                    </div>
                                </div>

                            </g:if>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6">

                                    <label class="col-sm-3 control-label" style="font-size: 12px"><span class="required">*</span><g:message
                                            code="systemUser.idCardName.label"></g:message>：</label>

                                    <div class="col-sm-9" align="left">
                                        <input type="text" class="form-control" name="systemUserInstance.idCardName"
                                               value="${systemUserInstance?.idCardName}" required="required"
                                               id="idCardName">

                                        <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                      field="idCardName"/></span>
                                    </div>

                                </div>

                                <div class="col-md-6">
                                    <label class="col-sm-3 control-label" style="font-size: 12px"><span class="required">*</span><g:message
                                            code="systemUser.phone.label"></g:message>：</label>

                                    <div class="col-sm-9" align="left">
                                        <input type="text" class="form-control" name="systemUserInstance.phone"
                                               value="${systemUserInstance?.phone}"
                                               required="required" id="phone">
                                        <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                      field="phone"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第二行备注名身份证号--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6">

                                    <label class="col-sm-3 control-label" style="font-size: 12px"> <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                            code="systemUser.remarkName.show-pop.label"></g:message>"></i><span class="required">*</span><g:message
                                            code="systemUser.remarkName.label"></g:message>：</label>

                                    <div class="col-sm-9" align="left">
                                        <input type="text" class="form-control" name="systemUserInstance.remarkName"
                                               value="${systemUserInstance?.remarkName}"
                                               id="remarkName"
                                               readonly="readonly">
                                        <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                      field="remarkName"/></span>
                                    </div>

                                </div>

                                <div class="col-md-6">
                                    <label class="col-sm-3 control-label" style="font-size: 12px"><span class="required">*</span><g:message
                                            code="systemUser.idCardNo.label"></g:message>：</label>

                                    <div class="col-sm-9" align="left">
                                        <input type="text" class="form-control" name="systemUserInstance.idCardNo"
                                               value="${systemUserInstance?.idCardNo}" required="required"
                                               id="idCardNo">
                                        <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                      field="idCardNo"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第三行出生日期和性别--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label class="col-sm-3 control-label" style="font-size: 12px"><g:message
                                            code="systemUser.birthDate.label"></g:message>：</label>

                                    <div class="col-sm-9" align="left">
                                        <input type="text" style="border-style:none" readonly="readonly"
                                               class="form-control"
                                               name="systemUserInstance.birthDate"
                                               value="${systemUserInstance?.birthDate}"
                                               id="birthDate" name ="birthDate">

                                        <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                      field="birthDaate"/></span>
                                    </div>

                                </div>

                                <div class="col-md-6">
                                    <label class="col-sm-3 control-label" style="font-size: 12px"><g:message
                                            code="systemUser.gender.label"></g:message>：</label>

                                    <div class="col-sm-9" align="left">


                                        <g:if  test="${systemUserInstance.gender == 1}">
                                            <input type="text" style="border-style:none" readonly="readonly"
                                                   class="form-control"
                                                   value="男"
                                                   id="gender">
                                        </g:if>
                                        <g:elseif test="${systemUserInstance.gender == 0}">
                                            <input type="text" style="border-style:none" readonly="readonly"
                                                   class="form-control"
                                                   value="女"
                                                   id="gender">
                                        </g:elseif>

                                        <g:else>
                                            <input type="text" style="border-style:none" readonly="readonly"
                                                   class="form-control"
                                                   value="${systemUserInstance?.gender}"
                                                   id="gender">
                                        </g:else>
                                        <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                      field="gender"/></span>


                                        <input type="hidden" name="systemUserInstance.gender" id="genderValue">
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第四行邮箱和QQ--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label class="col-sm-3 control-label" style="font-size: 12px"><g:message
                                            code="systemUser.email.label"></g:message>：</label>

                                    <div class="col-sm-9" align="left">
                                        <input type="text" class="form-control" name="systemUserInstance.email"
                                               value="${systemUserInstance?.email}"
                                               id="email">
                                        <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                      field="email"/></span>
                                    </div>

                                </div>

                                <div class="col-md-6">
                                    <label class="col-sm-3 control-label" style="font-size: 12px"><g:message
                                            code="systemUser.qq.label"></g:message>：</label>

                                    <div class="col-sm-9" align="left">
                                        <input type="text" class="form-control" name="systemUserInstance.qq"
                                               value="${systemUserInstance?.qq}"
                                               id="qq">
                                        <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                      field="qq"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第五行微信和用户状态--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label class="col-sm-3 control-label" style="font-size: 12px"><g:message
                                            code="systemUser.wechat.label"></g:message>：</label>

                                    <div class="col-sm-9" align="left">
                                        <input type="text" class="form-control" name="systemUserInstance.wechat"
                                               value="${systemUserInstance?.wechat}"
                                               id="wechat">
                                        <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                      field="wechat"/></span>
                                    </div>

                                </div>


                            </div>
                        </div>
                    </div>
                </div>


                <div class="portlet light portlet-fit bordered">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject bold font-dark uppercase">个人结算信息</span>
                            <span style="font-size:12px;color: #737373">
                                &nbsp;&nbsp;&nbsp;个人结算信息必须整组填写，点击“开户行信息输入框查询结算银行”可以补全联行行号及开户行信息.</span>
                        </span>
                        </div>
                    </div>

                    <div class="portlet-body">

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        账户名 :
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: systemUserInstance, field: 'accountName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="systemUserInstance.accountName"
                                                     id="toPrivateAccountName"
                                                     value="${systemUserInstance?.accountName}"/>
                                        <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                                                field="accountName"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">

                                        结算帐号 :
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: systemUserInstance, field: 'settleAccount', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="systemUserInstance.settleAccount"
                                                     id="toPrivateSettleAccount"
                                                     value="${systemUserInstance?.settleAccount}"/>
                                        <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                                                field="settleAccount"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        联行行号 :
                                    </label>


                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'toPrivateCnapsCode', ' takin-input-errors')}">
                                        <g:textField readonly="readonly" class="form-control"
                                                     name="systemUserInstance.cnapsCode" id="toPrivateCnapsCode"
                                                     value="${systemUserInstance?.cnapsCode}"/>
                                        <span class="help-block "><g:fieldError bean="${merchantIncomeInstance}"
                                                                                field="toPrivateCnapsCode"/></span>
                                    </div>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        开户行信息 :
                                    </label>

                                    <div id="repoHiddenData_1"></div>


                                    <div class="col-sm-7">
                                        <tk:autoComplete class="form-control input-xlarge takin-autoComplete"
                                                         name="systemUserInstance.openbankName"
                                                         id="toPrivateOpenbankInfomation"
                                                         linkParams="[controller: 'merchantIncome', action: 'autoComplete']"
                                                         value="${systemUserInstance?.openbankName}"/>
                                        <span class="help-block "><g:fieldError bean="${merchantIncomeInstance}"
                                                                                field="toPrivateOpenbankInfomation"/></span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="portlet light portlet-fit bordered">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject bold font-dark uppercase">对公结算信息</span>
                            <span style="font-size:12px;color: #737373">
                                &nbsp;&nbsp;&nbsp;对公结算信息必须整组填写，点击“开户行信息输入框查询结算银行”可以补全联行行号及开户行信息.</span>
                        </span>
                        </div>
                    </div>

                    <div class="portlet-body">

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        账户名 :
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: organizationInstance, field: 'accountName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="organizationInstance.accountName"
                                                     id="toPublicAccountName"
                                                     value="${organizationInstance?.accountName}"/>
                                        <span class=""><g:fieldError bean="${organizationInstance}"
                                                                     field="accountName"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">

                                        结算帐号 :
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: organizationInstance, field: 'settleAccount', ' takin-input-errors')}">
                                        <g:textField class="form-control"
                                                     name="organizationInstance.settleAccount"
                                                     id="toPublicAccount"
                                                     value="${organizationInstance?.settleAccount}"/>
                                        <span class="help-block "><g:fieldError bean="${organizationInstance}"
                                                                                field="settleAccount"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        联行行号 :
                                    </label>


                                    <div class="col-sm-7 ${hasErrors(bean: organizationInstance, field: 'toPrivateCnapsCode', ' takin-input-errors')}">
                                        <g:textField readonly="readonly" class="form-control"
                                                     name="organizationInstance.cnapsCode" id="toPublicCnapsCode"
                                                     value="${organizationInstance?.cnapsCode}"/>
                                        <span class="help-block "><g:fieldError bean="${organizationInstance}"
                                                                                field="toPrivateCnapsCode"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        开户行信息 :
                                    </label>

                                    <div id="repoHiddenData"></div>

                                    <div class="col-sm-7">
                                        <tk:autoComplete class="form-control input-xlarge takin-autoComplete"
                                                         name="organizationInstance.openbankName"
                                                         id="toPublicOpenbankInfomation"
                                                         linkParams="[controller: 'merchantIncome', action: 'autoComplete']"
                                                         value="${organizationInstance?.openbankName}"/>
                                        <span class="help-block "><g:fieldError bean="${organizationInstance}"
                                                                                field="toPublicOpenbankInfomation"/></span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.' + formAction + '.label')}"
                                    btnIconClass="fa fa-${formAction}"/>

                <g:link class="btn btn-primary" controller="organization" action="index">
                    <i class="fa fa-leaf"></i>
                    <g:message code="default.button.back.label"/></g:link>

            </form:actions>



        </form:form>
    </portlet:body>
</component:portlet>

<content tag="takin-footer">
    <asset:javascript src="jquery.validate.min.js"/>
    <asset:javascript src="system/systemOrg/form-validation.js"/>

    <g:javascript>
        $(function () {



        // $("#toPrivateOpenbankInfomation").append(new Option($("[name=privateBankNameHidden]").val(), $("[name=privateBankNameHidden]").val(), false, true));

          $.ajax({
       url: "${g.createLink(controller: "co" +
            "mmon", action: "getProvince")}",
       data: {q_province:$('[name=provinceHidden]').val()},
   }).done(function(data) {
       $("#provincespan").html(data);
       var province = $("#province").val();
       // getCity(province,'');
   }).fail(function (e, data)   {
       console.log("error");
   }).always(function() {
       console.log("complete");
   });
var province = $("#province").val();
getCity(province,'');
var cityHidden = $('[name=cityHidden]').val();
if(cityHidden){
    getCity($('[name=provinceHidden]').val(),cityHidden);
}

$("#provincespan").on('change',function () {

   var province = $("#province").val();

   if(!province){
      return false;
   }

    getCity(province,'');

  });





/**  对公  联行号信息-下拉框改变    */
        $('#toPublicOpenbankInfomation').change(function(){

        if(null==$('#toPublicOpenbankInfomation').val()){
            $('#toPublicCnapsCode').val(" ");
        }else {
            $('[name=bankNameHidden]').val($("#toPublicOpenbankInfomation").val());
            var selectObj = $("#toPublicOpenbankInfomation").select2("data");
            $('#toPublicCnapsCode').val(selectObj[0].linkBankNo);//设置联行行号
        }
        });

        /**  个体  联行号信息-下拉框改变    */
        $('#toPrivateOpenbankInfomation').change(function(){
          if(null==$('#toPrivateOpenbankInfomation').val()){
            $('#toPrivateCnapsCode').val(" ");
        }else {
            var selectObj = $("#toPrivateOpenbankInfomation").select2("data");
            $('#toPrivateCnapsCode').val(selectObj[0].linkBankNo);//设置联行行号
            }
        });




            $("select[id=settleOpenbankName]").on('change', function () {
                $("input[id=settleCnapsCode]").attr('value', $(this).val());
            });


        /*    var opBankHidden = $('[name=bankNameHidden]').val();

            if(!opBankHidden){
             $("#toPublicOpenbankInfomation").append(new Option(opBankHidden, '', false, true));
            }
*/
            $('#idCardNo').on('change', function () {


                var idCartNoVal = $("#idCardNo").val();
                var genderValue =  $("#genderValue");

                if (isCardNo(idCartNoVal)) {


                if(idCartNoVal.length==15){
                     $("#birthDate").val("19"+idCartNoVal.slice(6, 12));
                      var value = idCartNoVal.charAt(idCartNoVal.length - 1);
                     if (value % 2 == 0) {
                        $("#gender").val("女")
                        genderValue.val(0)
                    } else {
                        $("#gender").val("男")
                        genderValue.val(1)
                    }
                }else{


                    var value = idCartNoVal.charAt(idCartNoVal.length - 2);
                    $("#birthDate").val(idCartNoVal.slice(6, 14));

                    if (value % 2 == 0) {
                        $("#gender").val("女")
                        genderValue.val(0)
                    } else {
                        $("#gender").val("男")
                        genderValue.val(1)
                    }

                }


                }
            });


             $('#idCardName').on('change', function () {
                 $.ajax({
                       url: "${g.createLink(controller: "co" +
            "mmon", action: "getRemartName")}",
                       data: {q_idCardName:$("#idCardName").val()},
                   }).done(function(data) {
                       $("#remarkName").val(data);
                   }).fail(function (e, data)   {
                       $("#remarkName").val(data);
                   });

            });



        function isCardNo(card) {
            var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
            return pattern.test(card);
        }

          $("#gaoJi").click(function (e) {
                //阻止默认事件提交，防止点击高级设置按钮时提交表单
                e.preventDefault();

                $("#authorityDiv").toggle();
                $("#roleDiv").toggle();

            });


        });

         $("#toPublicOpenbankInfomation").append(new Option($("[name=publicBankNameHidden]").val(), $("[name=publicBankNameHidden]").val(), false, true));

         $("#toPrivateOpenbankInfomation").append(new Option($("[name=privateBankNameHidden]").val(), $("[name=privateBankNameHidden]").val(), false, true));

        $('#systemOrganizationForm').attr("onsubmit", "return checkForm()")


        function checkForm() {
                    // console.log(checkInfo("toPublic"));
                    // console.log(checkInfo("toPrivate"));

                  if((1==checkInfo("toPublic") &&1==checkInfo("toPrivate"))|(0==checkInfo("toPublic") &&1==checkInfo("toPrivate"))
                  |(1==checkInfo("toPublic") &&0==checkInfo("toPrivate"))){

                        return true;
                  }else{
                        bootboxAlert("请至少填写一组结算信息");
                        return false;
                  }

         }

         function checkInfo(id){

                var settleList = $("[id^="+id+"]");

                    var blank1 = settleList[0].value.trim() == '';
                    var blank2 = settleList[1].value.trim() == '';
                    var blank3 = settleList[2].value.trim() == '';
                    var blank4 = settleList[3].value.trim() == '';


                    //0是都不为空 1都是空   2是其他
                    if ((blank1 && blank2 && blank3 && blank4)) {
                        return 0;
                    }else if((!(blank1 || blank2 || blank3 || blank4))) {
                        return 1;

                    } else{
                        return 2;
                    }

         }


function getCity(province,q_city) {
    $.ajax({
        url: "${g.createLink(controller: "common", action: "getCity")}",
        data: {province:province,q_city:q_city},
     }).done(function(data) {
            //alert(data.val);
           $("#cityspan").html(data);
           var city = $("#city").val();
        }).fail(function (e, data)   {
           console.log("error");
        }).always(function() {
           console.log("complete");
        });
}




    </g:javascript>



</content>