<%@ page import="com.suixingpay.ssp.front.system.SystemUser" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'systemUserProfile.default.show.label', args: message.domain(domain: 'systemUser'))}"/>
    <portlet:body withForm="true">
        <form:form id="systemUserProfileForm"
                    controller="systemUserProfile"
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
                                    <label class="col-md-4 control-label">归属机构:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.orgName}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">个人编号:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.userCode}</label>
                                    </div>

                                </div>

                            </div>
                        </div>


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
                                    <label class="col-md-4 control-label"><g:message
                                            code="systemUser.idCardName.label"></g:message>:</label>

                                    <div class="col-md-8" align="left">
                                        <label id="idCardName" class="control-label">${systemUserInstance.idCardName}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label"><g:message
                                            code="systemUser.phone.label"></g:message>:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.phone}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第二行备注名身份证号--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label"><g:message
                                            code="systemUser.remarkName.label"></g:message>:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.remarkName}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label"><g:message
                                            code="systemUser.idCardNo.label"></g:message>:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.idCardNo}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第三行出生日期和性别--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label"><g:message
                                            code="systemUser.birthDate.label"></g:message>:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${systemUserInstance.birthDate}</label>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label"><g:message
                                            code="systemUser.gender.label"></g:message>:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label"><g:if
                                                test="${systemUserInstance.gender == 1}">男</g:if>
                                            <g:elseif test="${systemUserInstance.gender == 0}">女</g:elseif></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第四行邮箱和QQ--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label"><g:message
                                            code="systemUser.email.label"></g:message>:</label>

                                    <div class="col-md-8" align="left">
                                        <input type="text" class="form-control" name="systemUserInstance.email"
                                               value="${systemUserInstance.email}"
                                               id="email">
                                        <span class="help-block"><g:fieldError bean="${systemUserInstance}"

                                                                               field="email"/></span>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label"><g:message
                                            code="systemUser.qq.label"></g:message>:</label>

                                    <div class="col-md-8" align="left">
                                        <input type="text" class="form-control" name="systemUserInstance.qq"
                                               value="${systemUserInstance.qq}"
                                               id="qq">
                                        <span class="help-block"><g:fieldError bean="${systemUserInstance}"
                                                                               field="qq"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %{--第五行微信和用户状态--}%
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label"><g:message
                                            code="systemUser.wechat.label"></g:message>:</label>

                                    <div class="col-md-8" align="left">
                                        <input type="text" class="form-control" name="systemUserInstance.wechat"
                                               value="${systemUserInstance.wechat}"
                                              id="wechat">
                                        <span class="help-block"><g:fieldError bean="${systemUserInstance}"
                                                                               field="wechat"/></span>
                                    </div>

                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">推荐业务员人数:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="control-label">${recommendCount}</label>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label class="col-md-4 control-label">实名认证:</label>

                                    <div class="col-md-8" align="left">
                                        <label class="">

                                            <g:if test="${systemUserInstance.authentication == '01'}"><label class="control-label">未审核</label></g:if>
                                            <g:elseif
                                                    test="${systemUserInstance.authentication == '02'}"><label class="control-label">审核通过</label></g:elseif>
                                            <g:elseif
                                                    test="${systemUserInstance.authentication == '03'}">审核不通过&nbsp;&nbsp;<g:link
                                                    class="btn btn-primary matl" controller="salesmanAuthentication"
                                                    action="index">实名认证</g:link></g:elseif>
                                            <g:elseif test="${systemUserInstance.authentication == '00'}">
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                                            未认证&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <g:link class="btn btn-primary matl"
                                                                    controller="salesmanAuthentication"
                                                                    action="index">实名认证</g:link>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </g:elseif>
                                            <g:else>
                                               未认证&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <g:link class="btn btn-primary matl"
                                                                        controller="salesmanAuthentication"
                                                                        action="index">实名认证</g:link>

                                            </g:else>
                                        </label>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>


                <div class="portlet light portlet-fit bordered">
                    <div class="portlet-title">
                        <div class="caption"><span class="caption-subject bold font-dark uppercase">权限信息</span></div>
                    </div>

                    <div class="portlet-body">

                    <div id="roleDiv">
                    <div class="row">
                        <div class="row">
                            <label class="col-md-1 control-label">角色</label>
                        </div>

                        <g:each status="i" var="systemRole" in="${systemRoleListInstance}">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">${systemRole.name}</label>
                                </div>
                            </div>
                            <g:if test="${i % 2 == 1}">
                                </div>
                                <div class="row">
                            </g:if>
                        </g:each>
                        <g:each status="i" var="systemAuthority" in="${systemAuthorityListInstance}">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label col-md-4">${systemAuthority.name}</label>
                                </div>
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
                                    <label class="col-sm-5 control-label">
                                        (个体) 账户名:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: systemUserInstance, field: 'accountName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="systemUserInstance.accountName"
                                                     id="settleAccountName"
                                                     value="${systemUserInstance?.accountName}"/>
                                        <span class="help-block"><g:fieldError bean="${systemUserInstance}"
                                                                               field="accountName"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        (个体)结算帐号:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: systemUserInstance, field: 'settleAccount', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="systemUserInstance.settleAccount"
                                                     id="settleAccount"
                                                     value="${systemUserInstance?.settleAccount}"/>
                                        <span class="help-block"><g:fieldError bean="${systemUserInstance}"
                                                                               field="settleAccount"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)联行行号--}%
                                        (个体) <message:property domain="systemUser" property="cnapsCode"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'toPrivateCnapsCode', ' takin-input-errors')}">
                                        <g:textField readonly="readonly" class="form-control"
                                                     name="systemUserInstance.cnapsCode" id="settletoPrivateCnapsCode"
                                                     value="${systemUserInstance?.cnapsCode}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"
                                                                               field="toPrivateCnapsCode"/></span>
                                    </div>

                                </div>
                            </div>

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)开户行信息--}%
                                        (个体) <message:property domain="systemUser" property="openbankName"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <tk:autoComplete class="form-control  takin-autoComplete"
                                                         name="systemUserInstance.openbankName"
                                                         id="settletoPrivateOpenbankInfomation"
                                                         linkParams="[controller: 'merchantIncome', action: 'autoComplete']"
                                                         value="${systemUserInstance?.openbankName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"
                                                                               field="toPrivateOpenbankInfomation"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form:body>
            <form:actions>
                <button class="btn btn-primary" id="submitButton" type="submit"><g:message
                        code="default.button.submit.label"/>
                </button>
                %{--修改成功弹窗用--}%
                <input type="hidden" name="huifu" id="huifu" value="${huifu}"/>
                <g:link class="btn btn-primary matl" controller="systemUserPassword" action="index">修改密码</g:link>
                <g:link class="btn btn-primary matl" controller="systemUserPhone" action="index">更换登录手机号</g:link>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="jquery.validate.min.js"/>
    <asset:javascript src="system/systemUserProfile/form-validation.js"/>
    <g:javascript>


        $(function () {
            var itemPublic=$('#settletoPrivateOpenbankInfomation').attr('value');
            $("#settletoPrivateOpenbankInfomation").append(new Option(itemPublic, itemPublic, false, true));
            $('.matl').on('click', function (e) {
                e.preventDefault();
                var id = this.href.replace(new RegExp("^(http|https)\:/\/([^\/]*)\/"), "").replace(/\//g, '_');
                var name = this.text;
                var href = this.href;
                parent.$("#ANewWindow").trigger('ANewWindowchanged', [id, name, href]);

            })


            /**  个体  联行号信息-下拉框改变    */
            $('#settletoPrivateOpenbankInfomation').change(function(){
                if(null==$('#settletoPrivateOpenbankInfomation').val()){
                    $('#settletoPrivateCnapsCode').val(" ");
                }else {
                    var selectObj = $("#settletoPrivateOpenbankInfomation").select2("data");
                    $('#settletoPrivateCnapsCode').val(selectObj[0].linkBankNo);//设置联行行号
                }
            });
            $('#systemUserProfileForm').attr("onsubmit", "return checkForm()")
            if (checkSucceed()) {
                bootboxAlert("个人信息修改成功")
                $("input[name='huifu']").val(" ");
                return false;

            }


        });

        function checkForm() {

            var settleList = $("[id^=settle]");


            var blank1 = settleList[0].value.trim() == '';
            var blank2 = settleList[1].value.trim() == '';
            var blank3 = settleList[2].value.trim() == '';
            var blank4 = settleList[3].value.trim() == '';


            if ((blank1 && blank2 && blank3 && blank4) | (!(blank1 || blank2 || blank3 || blank4))) {
                return true;
            } else {

                bootboxAlert("请完整的填写结算信息");
                return false;
            }
        }
        function checkSucceed() {
            var message = $("input[name='huifu']").val()

            if (message == "成功") {
                return true
            } else {
                return false
            }
        }
    </g:javascript>

</content>