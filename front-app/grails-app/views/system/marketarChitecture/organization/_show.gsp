<%@ page import="com.suixingpay.ssp.front.system.SystemOrganization" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'systemOrganization'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>

                <div class="portlet light portlet-fit bordered">
                    <div class="portlet-title">
                        <div class="caption"><span
                                class="caption-subject bold font-dark uppercase">机构基本信息</span></div>
                    </div>

                    <div class="portlet-body">

                        <div class="row">
                            <div class="form-group">

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">机构名称:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${organizationInstance?.orgName}</label>
                                    </div>

                                </div>


                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">机构编号:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${organizationInstance?.id}</label>
                                    </div>

                                </div>

                            </div>
                        </div>
                        %{--row结束--}%

                        <div class="row">
                            <div class="form-group">

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">机构经营模式:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">

                                            <g:if test="${systemOrganizationAgentInstance?.orgRunProp == 1}">个人</g:if>
                                            <g:elseif
                                                    test="${systemOrganizationAgentInstance?.orgRunProp == 2}">机构</g:elseif>

                                        </label>
                                    </div>

                                </div>

                            </div>
                        </div>
                        %{--row结束--}%
                        <div class="row">
                            <div class="form-group">

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">机构详细地址:</label>

                                    <div class="col-md-8 text-nowrap" align="left">
                                        <label class="control-label">${organizationInstance?.provinceName}&nbsp;&nbsp;${organizationInstance?.cityName}&nbsp;&nbsp;${organizationInstance?.orgAddress}</label>
                                    </div>

                                </div>

                            </div>
                        </div>
                        %{--row结束--}%
                        <div class="row">
                            <div class="form-group">

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">邮政编码:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${organizationInstance?.orgZip}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">机构电话:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${organizationInstance?.organizationTelephone}</label>
                                    </div>

                                </div>

                            </div>
                        </div>
                        %{--row结束--}%
                        <div class="row">
                            <div class="form-group">

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">法人身份证姓名:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemOrganizationAgentInstance?.legalPersonName}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">法人身份证:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemOrganizationAgentInstance?.legalPersonCard}</label>
                                    </div>

                                </div>

                            </div>
                        </div>
                        %{--row结束--}%
                        <div class="row">
                            <div class="form-group">

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">状态:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">

                                            <g:if test="${organizationInstance?.orgStatus == 1}">正常</g:if>
                                            <g:elseif test="${organizationInstance?.orgStatus == 2}">停用</g:elseif>
                                            <g:elseif test="${organizationInstance?.orgStatus == 3}">信息不全</g:elseif>
                                            <g:elseif test="${organizationInstance?.orgStatus == 9}">注销</g:elseif>

                                        </label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">创建日期:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label"><td><format:dateValue
                                                prefix="organizationInstance.dateCreated"
                                                value="${organizationInstance?.dateCreated}"/>
                                        </td>
                                        </label>
                                    </div>

                                </div>

                            </div>
                        </div>
                        %{--row结束--}%

                    </div>
                </div>


            %{----------------------------------------------------------------}%


                <div class="portlet light portlet-fit bordered">
                    <div class="portlet-title">
                        <div class="caption"><span
                                class="caption-subject bold font-dark uppercase">机构管理者信息</span></div>
                    </div>

                    <div class="portlet-body">

                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">身份证姓名:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance?.idCardName}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">电话:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance?.phone}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第二行备注名身份证号--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">备注名:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance?.remarkName}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">身份证号:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance?.idCardNo}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第三行出生日期和性别--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">出生日期:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance?.birthDate}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">性别:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label"><g:if
                                                test="${systemUserInstance?.gender == 1}">男</g:if>
                                            <g:elseif test="${systemUserInstance?.gender == 0}">女</g:elseif></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第四行邮箱和QQ--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">邮箱:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance?.email}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">qq:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label"> ${systemUserInstance?.qq}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第五行微信和用户状态--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">微信:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label"> ${systemUserInstance?.wechat}</label>
                                    </div>

                                </div>


                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">登录名称:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance?.loginName}</label>
                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>
                </div>


                </div>

                <div class="portlet light portlet-fit bordered">
                    <div class="portlet-title">
                        <div class="caption"><span
                                class="caption-subject bold font-dark uppercase">个人结算信息</span></div>
                    </div>

                    <div class="portlet-body">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">账户名:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance?.accountName}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">结算账号:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance?.settleAccount}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--row结束--}%

                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">联行行号:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance?.cnapsCode}</label>
                                    </div>

                                </div>
                            </div>
                        </div>
                        %{--row结束--}%

                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label class="col-md-4 control-label">开户行信息:</label>

                                <div class="col-md-8 text-nowrap" align="left">
                                    <label class="control-label">${systemUserInstance?.openbankName}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    %{--row结束--}%

                </div>
                </div>

            %{----------------------------------------------------------------}%


                <div class="portlet light portlet-fit bordered">
                    <div class="portlet-title">
                        <div class="caption"><span
                                class="caption-subject bold font-dark uppercase">对公结算信息</span></div>
                    </div>

                    <div class="portlet-body">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">账户名:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${organizationInstance?.accountName}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">结算账号:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${organizationInstance?.settleAccount}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--row结束--}%

                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">联行行号:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${organizationInstance?.cnapsCode}</label>
                                    </div>

                                </div>
                            </div>
                        </div>
                        %{--row结束--}%

                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label class="col-md-4 control-label">开户行信息:</label>

                                <div class="col-md-8 text-nowrap" align="left">
                                    <label class="control-label">${organizationInstance?.openbankName}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    %{--row结束--}%

                </div>




                <g:if test="${flag == 'show'}">
                    <div class="portlet light portlet-fit bordered">
                        <div class="portlet-title">
                            <div class="caption"><span
                                    class="caption-subject bold font-dark uppercase">评级信息</span></div>
                        </div>

                        <table class="table table-striped table-bordered table-hover dataTable no-footer">
                            <thead>
                            <tr>

                                <domainSearchResult:header domain="RatingInfo" property="ratingTime"/>
                                <domainSearchResult:header domain="RatingInfo" property="rateResult"/>

                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    ${ratingInfoListInstance[0]?.rateYear} &nbsp;${ratingInfoListInstance[0]?.rateQuarter}
                                </td>
                                <td>
                                    ${ratingInfoListInstance[0]?.rateResult}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    ${ratingInfoListInstance[1]?.rateYear} &nbsp;${ratingInfoListInstance[1]?.rateQuarter}
                                </td>
                                <td>
                                    ${ratingInfoListInstance[1]?.rateResult}
                                </td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </g:if>




                </div>

            </form:body>
            <form:actions>
                <g:if test="${flag != 'show'}">
                <g:link class="btn btn-primary" controller="organization" action="index">
                    <g:message code="default.button.back.label"/>
                </g:link>
                    </g:if>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
