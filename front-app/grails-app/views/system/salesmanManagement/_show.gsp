<%@ page import="com.suixingpay.ssp.front.system.SystemUser" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'systemUserProfile.default.show.label', args: message.domain(domain: 'systemUser'))}"/>
    <portlet:body withForm="true">
        <form:form controller="staffManagement"
                   action="update"
                   name="scaffold-update-staffManagement">
            <form:body>
                <formCommon:hiddenField name="systemUserInstance.id" value="${systemUserInstance?.id}"/>
                <div class="portlet light portlet-fit bordered">
                    <div class="portlet-title">
                        <div class="caption"><span
                                class="caption-subject bold font-dark uppercase">基本信息</span></div>
                    </div>

                    <div class="portlet-body">

                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">人员编号:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.userCode}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">登录账号:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.loginName}</label>
                                    </div>

                                </div>

                            </div>
                        </div>


                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">身份证姓名:</label>

                                    <div class="col-md-8" align="left">

                                        <div class="col-md-8" align="left">
                                            <label class="control-label">${systemUserInstance.idCardName}</label>
                                        </div>

                                    </label>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">

                                    <label class="col-md-4 control-label">手机号:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.phone}</label>
                                    </div>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">备注名:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.remarkName}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">身份证号:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.idCardNo}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第二行备注名身份证号--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">出生日期:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.birthDate}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">性别:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label"><g:if
                                                test="${systemUserInstance.gender == 1}">男</g:if>
                                            <g:elseif test="${systemUserInstance.gender == 0}">女</g:elseif></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第三行出生日期和性别--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">邮箱:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.email}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">qq:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">
                                            ${systemUserInstance.qq}
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第四行邮箱和QQ--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">微信号:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.wechat}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">状态:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">

                                            <g:if test="${systemUserInstance.status == 0}">待接收</g:if>
                                            <g:elseif test="${systemUserInstance.status == 1}">正常</g:elseif>
                                            <g:elseif test="${systemUserInstance.status == 2}">注销</g:elseif>
                                            <g:elseif test="${systemUserInstance.status == 3}">待启用</g:elseif>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第五行微信和用户状态--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">创建日期:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label"><format:dateValue
                                                prefix="systemUserInstance.dateCreated"
                                                value="${systemUserInstance?.dateCreated}"/></label>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>


                <div class="portlet light portlet-fit bordered">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject bold font-dark uppercase">权限信息</span>
                        </div>
                    </div>

                    <div class="portlet-body">

                    <div class="row">


                        <g:each status="i" var="systemAuthority" in="${systemAuthorityListInstance}">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">${systemAuthority.name}</label>
                                </div>
                            </div>

                            <g:if test="${i % 2 == 1}">
                                </div>
                                <div class="row">
                            </g:if>

                        </g:each>

                    </div>

                    </div>

                </div>

            %{--基本信息--}%
                <div class="portlet light portlet-fit bordered">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject bold font-dark uppercase">个人结算信息</span>
                            %{--<span style="font-size:12px;color: #737373">--}%
                            %{--&nbsp;&nbsp;&nbsp;个体结算信息必须整组填写，点击“开户行信息输入框查询结算银行”可以补全联行行号及开户行信息.</span>--}%
                        </span>
                        </div>
                    </div>

                    <div class="portlet-body">

                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group-sm">
                                    <label class="col-sm-4 control-label"style="font-size: 14px">
                                        账户名:
                                    </label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label"style="font-size: 14px">
                                            ${systemUserInstance?.accountName}
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group-sm">
                                    <label class="col-sm-4 control-label"style="font-size: 14px">
                                        结算帐号:
                                    </label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label"style="font-size: 14px">
                                            ${systemUserInstance?.settleAccount}
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group-sm">
                                    <label class="col-sm-4 control-label"style="font-size: 14px">
                                        %{--(个体)联行行号--}%
                                        <message:property domain="systemUser" property="cnapsCode"/>:
                                    </label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label"style="font-size: 14px">
                                            ${systemUserInstance?.cnapsCode}
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group-sm">
                                    <label class="col-sm-4 control-label"style="font-size: 14px">
                                        %{--(个体)开户行信息--}%
                                        <message:property domain="systemUser" property="openbankName"/>:
                                    </label>

                                    <div class="col-md-8" align="left"style="font-size: 14px">
                                        <label class="control-label">
                                            ${systemUserInstance?.openbankName}
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </form:body>
            <form:actions>
                <g:link class="btn btn-primary" controller="salesmanManagement" action="index">
                    <g:message code="default.button.back.label"/>
                </g:link>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <script>
        $(function () {
            $('.matl').on('click', function (e) {
                e.preventDefault();
                var id = this.href.replace(new RegExp("^(http|https)\:/\/([^\/]*)\/"), "").replace(/\//g, '_');
                var name = this.text;
                var href = this.href;
                parent.$("#ANewWindow").trigger('ANewWindowchanged', [id, name, href]);

            })
            if (checkSucceed()) {
                bootboxAlert("个人信息修改成功")

            }

        });
        function checkSucceed() {
            var message = $("input[name='huifu']").val()

            if (message == "成功") {
                return true
            } else {
                return false
            }
        }
    </script>
</content>