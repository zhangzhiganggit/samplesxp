<%@ page import="com.suixingpay.ssp.front.system.SystemUser" %>

<form:form
           id="staffManagementForm"
           controller="staffManagement"
           action="${formAction}"
           name="scaffold-${formAction}-staffManagement">

    <g:if test="${formAction == 'update' }">
        <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
        <formCommon:hiddenField name="systemUserInstance.id" value="${systemUserInstance?.id}"/>
        <formCommon:hiddenField name="systemUserInstance.version" value="${systemUserInstance?.version}"/>
    </g:if>


    <g:each var="systemAuthorityInstance" in="${authorityList }">

        <formCommon:hiddenField name="_hidden_isOpenAuthority" value="${systemAuthorityInstance?.code}"/>

    </g:each>

    <g:each var="systemRoleInstance" in="${roleList }">

        <formCommon:hiddenField name="_hidden_isOpenRole" value="${systemRoleInstance?.code}"/>

    </g:each>



    <formCommon:hiddenField name="privateBankNameHidden" value="${systemUserInstance?.openbankName}"/>
%{--基本信息--}%


    <div class="portlet light portlet-fit bordered">
        <div class="portlet-title">
            <div class="caption"><span class="caption-subject bold font-dark uppercase">基本信息</span></div>
        </div>

        <div class="portlet-body">
            <div class="row">
                <g:if test="${formAction == 'update'}">
                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="col-md-4 control-label">个人编号</label>

                            <div class="col-md-8" align="left">
                                <label class= "control-label">${systemUserInstance.userCode}</label>
                            </div>

                        </div>

                        <div class="col-md-6">
                            <label class="col-md-4 control-label"><span class="required">*</span>登录名称</label>

                            <div class="col-md-8" align="left">
                                <label id="loginName" class= "control-label">${systemUserInstance.loginName}</label>
                            </div>
                        </div>
                    </div>

                </g:if>
            </div>

            <div class="row">
                <div class="form-group">
                    <div class="col-md-6">
                        <label class="col-md-4 control-label"><span class="required">*</span><g:message
                                code="systemUser.idCardName.label"></g:message></label>

                        <div class="col-md-8" align="left" ${hasErrors(bean: systemUserInstance, field: 'idCardName', ' takin-input-errors')} >
                            <input type="text" class="form-control" name="systemUserInstance.idCardName"
                                   value="${systemUserInstance.idCardName}" required="required" id="idCardName">
                            <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                                   field="idCardName"/></span>
                        </div>

                    </div>

                    <div class="col-md-6">
                        <label class="col-md-4 control-label"><span class="required">*</span><g:message
                                code="systemUser.phone.label"></g:message></label>

                        <div class="col-md-8" align="left" ${hasErrors(bean: systemUserInstance, field: 'phone', ' takin-input-errors')} >
                            <input type="text" class="form-control" name="systemUserInstance.phone"
                                   value="${systemUserInstance.phone}"
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
                        <label class="col-md-4 control-label">
                            <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                code="systemUser.remarkName.label.message"></g:message>"></i>
                            <span class="required">*</span><g:message
                                code="systemUser.remarkName.label"></g:message></label>

                        <div class="col-md-8" align="left" ${hasErrors(bean: systemUserInstance, field: 'remarkName', ' takin-input-errors')} >
                            <input type="text" class="form-control" name="systemUserInstance.remarkName"
                                   value="${systemUserInstance.remarkName}"  id="remarkName"  readonly="readonly">
                            <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                                   field="remarkName"/></span>
                        </div>

                    </div>

                    <div class="col-md-6">
                        <label class="col-md-4 control-label"><span class="required">*</span><g:message
                                code="systemUser.idCardNo.label"></g:message></label>

                        <div class="col-md-8" align="left" ${hasErrors(bean: systemUserInstance, field: 'idCardNo', ' takin-input-errors')} >
                            <input type="text" class="form-control" name="systemUserInstance.idCardNo"
                                   value="${systemUserInstance.idCardNo}" required="required" id="idCardNo">
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
                        <label class="col-md-4 control-label"><g:message
                                code="systemUser.birthDate.label"></g:message></label>

                        <div class="col-md-8" align="left">
                            <input type="text" style="border-style:none" readonly="readonly"
                                   class="form-control"
                                   name="systemUserInstance.birthDate" value="${systemUserInstance.birthDate}"
                                   id="birthDate" name ="birthDate" >
                        </div>

                    </div>

                    <div class="col-md-6">
                        <label class="col-md-4 control-label"><g:message
                                code="systemUser.gender.label"></g:message></label>

                        <div class="col-md-8" align="left">

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
                            <input name="systemUserInstance.gender" type="hidden" id="genderValue">
                        </div>
                    </div>
                </div>
            </div>
            %{--第四行邮箱和QQ--}%
            <div class="row">
                <div class="form-group">
                    <div class="col-md-6">
                        <label class="col-md-4 control-label"><g:message
                                code="systemUser.email.label"></g:message></label>

                        <div class="col-md-8" align="left"  ${hasErrors(bean: systemUserInstance, field: 'email', ' takin-input-errors')} >
                            <input type="text" class="form-control" name="systemUserInstance.email"
                                   value="${systemUserInstance.email}"
                                    id="email">
                            <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                                   field="email"/></span>
                        </div>

                    </div>

                    <div class="col-md-6">
                        <label class="col-md-4 control-label"><g:message
                                code="systemUser.qq.label"></g:message></label>

                        <div class="col-md-8" align="left"  ${hasErrors(bean: systemUserInstance, field: 'qq', ' takin-input-errors')} >
                            <input type="text" class="form-control" name="systemUserInstance.qq"
                                   value="${systemUserInstance.qq}"
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
                        <label class="col-md-4 control-label"><g:message
                                code="systemUser.wechat.label"></g:message></label>

                        <div class="col-md-8" align="left" ${hasErrors(bean: systemUserInstance, field: 'wechat', ' takin-input-errors')} >
                            <input type="text" class="form-control" name="systemUserInstance.wechat"
                                   value="${systemUserInstance.wechat}"
                                   id="wechat">
                            <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                                   field="wechat"/></span>
                        </div>

                    </div>


     <g:if test="${formAction == 'update'}">
                    <g:if test="${com.suixingpay.ssp.front.system.SystemUser.constrainedProperties['status'].inList.get(1)==2}">
                        <input type="hidden" value="${com.suixingpay.ssp.front.system.SystemUser.constrainedProperties['status'].inList.remove(1)}">
                    </g:if>
                    <div class="col-md-6">
                        <label class="col-md-4 control-label"><span class="required">*</span><g:message
                                code="systemUser.status.label"></g:message></label>

                        <div class="col-md-8" align="left">
                            <g:select style="margin-bottom: 0.5rem;" class="form-control"
                                      name="status"
                                      from="${com.suixingpay.ssp.front.system.SystemUser.constrainedProperties['status'].inList}"
                                      required="required"
                                      value="${systemUserInstance?.status}"
                                      valueMessagePrefix="systemUser.status"
                                      noSelection="['': '--请选择--']"/>
                        </div>
                    </div>
         </g:if>
                </div>
            </div>
        </div>
    </div>
    <div class="portlet light portlet-fit bordered">
        <div class="portlet-title">
            <div class="caption"><span class="caption-subject bold font-dark uppercase">权限信息</span></div>
        </div>

        <div class="portlet-body">

            <div id="roleDiv" >
            <div class="row">
            <div class="row">
                <label class="col-md-1 control-label">按角色分配</label>
            </div>
                <g:each status="i" var="systemRole" in="${systemRoleListInstance}">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-4">${systemRole.description}</label>

                            <div class="col-md-8">
                                <input type="checkbox"
                                       class="make-switch"
                                       data-on-color="success"
                                       value="${systemRole.code}"
                                       data-off-color="danger"
                                       name="isOpenRole${systemRole.code}"
                                       id="isOpenRole${systemRole.code}">
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
                <span style="font-size:12px;color: #737373">
                    &nbsp;&nbsp;&nbsp;个体结算信息必须整组填写，点击“开户行信息输入框查询结算银行”可以补全联行行号及开户行信息.</span>
            </span>
            </div>
        </div>

        <div class="portlet-body">


            <div class="row">
                <div class="col-md-4">
                    <div class="form-group-sm">
                        <label class="col-sm-5 control-label"style="font-size: 14px">
                            (个体)
                            <message:property domain="systemUser" property="accountName"/>:
                        </label>

                        <div class="col-sm-7 ${hasErrors(bean: systemUserInstance, field: 'accountName', ' takin-input-errors')}">
                            <g:textField class="form-control" name="systemUserInstance.accountName"
                                         id="settleAccountName"
                                         value="${systemUserInstance?.accountName}"/>
                            <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                                   field="accountName"/></span>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group-sm">
                        <label class="col-sm-5 control-label"style="font-size: 14px">

                            (个体)
                            <message:property domain="systemUser" property="settleAccount"/>:
                        </label>

                        <div class="col-sm-7 ${hasErrors(bean: systemUserInstance, field: 'settleAccount', ' takin-input-errors')}">
                            <g:textField class="form-control" name="systemUserInstance.settleAccount"
                                         id="settleAccount"
                                         value="${systemUserInstance?.settleAccount}"/>
                            <span class="help-block "><g:fieldError bean="${systemUserInstance}"
                                                                   field="settleAccount"/></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">

                <g:if test="${formAction == 'update'}">

                    <div class="col-md-4">
                        <div class="form-group-sm">
                            <label class="col-sm-5 control-label"style="font-size: 14px">
                                (个体)
                                <message:property domain="systemUser" property="cnapsCode"/>:
                            </label>

                            <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'toPrivateCnapsCode', ' takin-input-errors')}">
                                <g:textField readonly="readonly" class="form-control" name="systemUserInstance.cnapsCode" id="settletoPrivateCnapsCode"
                                             value="${systemUserInstance?.cnapsCode}"/>
                                <span class="help-block "><g:fieldError bean="${merchantIncomeInstance}" field="toPrivateCnapsCode"/></span>
                            </div>
                        </div>
                    </div>

                </g:if>
                <g:if test="${formAction != 'update'}">
                    <div class="col-md-4">
                        <div class="form-group-sm">
                            <label class="col-sm-5 control-label"style="font-size: 14px">
                                (个体)
                                <message:property domain="systemUser" property="cnapsCode"/>:
                            </label>
                            <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'toPrivateCnapsCode', ' takin-input-errors')}">
                                <g:textField readonly="readonly" class="form-control" name="systemUserInstance.cnapsCode" id="settletoPrivateCnapsCode"
                                             value="${systemUserInstance?.cnapsCode}"/>
                                <span class="help-block "><g:fieldError bean="${merchantIncomeInstance}" field="toPrivateCnapsCode"/></span>
                            </div>
                        </div>
                    </div>
                </g:if>
                <div class="col-md-4">
                    <div class="form-group-sm">
                        <label class="col-sm-5 control-label"style="font-size: 14px">
                            (个体)
                            <message:property domain="systemUser" property="openbankName"/>:
                        </label>

                        <div id="repoHiddenData"></div>

                        <div class="col-sm-7">
                            <tk:autoComplete class="form-control input-xlarge takin-autoComplete"
                                             name="systemUserInstance.openbankName" id="settletoPrivateOpenbankInfomation"
                                             linkParams="[controller: 'merchantIncome', action: 'autoComplete']"
                                             value="${systemUserInstance?.openbankName}"/>
                            <span class="help-block "><g:fieldError bean="${merchantIncomeInstance}"  field="toPrivateOpenbankInfomation"/></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <form:actions>
        <formActions:submit value="${message(code: 'default.button.' + formAction + '.label')}"
                            btnIconClass="fa fa-${formAction}"/>
        <g:link class="btn btn-primary" controller="staffManagement" action="index">
            <i class="fa fa-leaf"></i>
            <g:message code="default.button.back.label"/></g:link>

    </form:actions>

</form:form>
<content tag="takin-footer">
    <asset:javascript src="jquery.validate.min.js"/>
    <asset:javascript src="system/staffManagenment/form-validation.js"/>
    <g:javascript>
        $(function () {

         $("#settletoPrivateOpenbankInfomation").append(new Option($("[name=privateBankNameHidden]").val(), $("[name=privateBankNameHidden]").val(), false, true));

            if($("[name^=_hidden_isOpenAuthority]").size()!=0){

                $("[name^=_hidden_isOpenAuthority]").each(function () {

                    var flag = "isOpenAuthority"+$(this).val();


                    $('input[name="'+flag+'"]').bootstrapSwitch('state', true);


                });

            }




            /**  对公  联行号信息-下拉框改变    */
            $('#toPublicOpenbankInfomation').change(function(){

                if(null==$('#toPublicOpenbankInfomation').val()){
                    $('#toPublicCnapsCode').val(" ");
                }else {
                    var selectObj = $("#toPublicOpenbankInfomation").select2("data");
                    $('#toPublicCnapsCode').val(selectObj[0].linkBankNo);//设置联行行号
                }
            });

            /**  个体  联行号信息-下拉框改变    */
            $('#settletoPrivateOpenbankInfomation').change(function(){
                if(null==$('#settletoPrivateOpenbankInfomation').val()){
                    $('#settletoPrivateCnapsCode').val(" ");
                }else {
                    var selectObj = $("#settletoPrivateOpenbankInfomation").select2("data");
                    $('#settletoPrivateCnapsCode').val(selectObj[0].linkBankNo);//设置联行行号
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




            if($("[name^=_hidden_isOpenRole]").size()!=0){

                $("[name^=_hidden_isOpenRole]").each(function () {

                    var flag = "isOpenRole"+$(this).val();

                    $('input[name="'+flag+'"]').bootstrapSwitch('state', true);


                });

            }

            // $("#gaoJi").click(function (e) {
            //     //阻止默认事件提交，防止点击高级设置按钮时提交表单
            //     e.preventDefault();
            //
            //     $("#authorityDiv").toggle();
            //     $("#roleDiv").toggle();
            //
            //
            // });

            $('input[name^="isOpenAuthority"]').on('switchChange.bootstrapSwitch', function(event, state) {
                //console.log(this); // DOM element
                //console.log(event); // jQuery event
                //console.log(state); // true | false
                console.log("isOpenAuthority is change");
                $('input[name^="isOpenRole"]').bootstrapSwitch('state', false);
            });

            $('input[name^="isOpenRole"]').on('switchChange.bootstrapSwitch', function(event, state) {
                //console.log(this); // DOM element
                //console.log(event); // jQuery event
                //console.log(state); // true | false
                console.log("isOpenAuthority is change");
                $('input[name^="isOpenAuthority"]').bootstrapSwitch('state', false);
            });






            $("select[id=settleOpenbankName]").on('change', function () {
                $("input[id=settleCnapsCode]").attr('value', $(this).val());
            });


            $('#idCardNo').on('change', function () {


                var idCartNoVal = $("#idCardNo").val();

                var genderValue = $("#genderValue");

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
            });


            var remarkNameVal = $("#remarkName").val();
            var idCartNameVal = $("#idCardName").val();

            if (idCartNameVal != remarkNameVal) {
                $('#remarkName').attr("readonly", "readonly")
            }
            $('#remarkName').attr("readonly", "readonly")

            $('#staffManagementForm').attr("onsubmit", "return checkForm()")
        })

        function isCardNo(card) {
            var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
            return pattern.test(card);
        }


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



    </g:javascript>
</content>