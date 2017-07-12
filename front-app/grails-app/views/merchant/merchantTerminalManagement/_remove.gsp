<%@ page import="com.suixingpay.ssp.front.merchant.MerchantTerminalManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title"> <g:message code="merchantTerminalManagement.remove.label"/></h4>
</div>

<div class="modal-body">
%{--<component:portlet cssClass="scaffold-show">--}%
    <component:portlet>
        <portlet:title
                title="${message(code: 'merchantTerminalManagement.merchantInformation.label', args: message.domain(domain: 'merchantTerminalManagement'))}"/>
        <portlet:body withForm="true">
            <form:form action="index">
                <form:body>
                    %{--<formCommon:hiddenField name="id" value="${merchantTerminalManagementInstance?.id}"/>--}%

                    %{--<domainShow:displayString domain="merchantTerminalManagement" property="merchantCode"--}%
                                              %{--domainInstance="${merchantTerminalManagementInstance}"/>--}%
                    %{--<domainShow:displayString domain="merchantTerminalManagement" property="merchantName"--}%
                                              %{--domainInstance="${merchantTerminalManagementInstance}"/>--}%
                    %{--<domainShow:displayString domain="merchantTerminalManagement" property="linkman"--}%
                                              %{--domainInstance="${merchantTerminalManagementInstance}"/>--}%

                    %{--<domainShow:displayString domain="merchantTerminalManagement" property="installMachinesAddress"--}%
                                              %{--domainInstance="${merchantTerminalManagementInstance}"/>--}%
                    %{--<domainShow:displayString domain="merchantTerminalManagement" property="contactTelephone"--}%
                                              %{--domainInstance="${merchantTerminalManagementInstance}"/>--}%
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="merchantTerminalManagement" property="merchantCode" /><g:message code="dashBoard.system.colon"></g:message></label>
                            <div class="col-md-8">
                                <p class="form-control-static">${merchantTerminalManagementInstance?.merchantCode}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="merchantTerminalManagement" property="merchantName" /><g:message code="dashBoard.system.colon"></g:message></label>
                            <div class="col-md-8">
                                <p class="form-control-static">${merchantTerminalManagementInstance?.merchantName}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="merchantTerminalManagement" property="linkman" /><g:message code="dashBoard.system.colon"></g:message></label>
                            <div class="col-md-8">
                                <p class="form-control-static">${merchantTerminalManagementInstance?.linkman}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="control-label col-md-2"><message:property domain="merchantTerminalManagement" property="installMachinesAddress" /><g:message code="dashBoard.system.colon"></g:message></label>
                            <div class="col-md-10">
                                <p class="form-control-static">${merchantTerminalManagementInstance?.installMachinesAddress}</p>
                            </div>
                        </div>
                    </div>
                    %{--<div class="col-md-4">--}%
                        %{--<div class="form-group">--}%
                        %{--<label class="control-label col-md-4"><message:property domain="merchantTerminalManagement" property="installMachinesAddress" /></label>--}%
                        %{--<div class="col-md-8">--}%
                        %{--<p class="form-control-static">${merchantTerminalManagementInstance?.installMachinesAddress}</p>--}%
                        %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="merchantTerminalManagement" property="contactTelephone" /><g:message code="dashBoard.system.colon"></g:message></label>
                            <div class="col-md-8">
                                <p class="form-control-static">${merchantTerminalManagementInstance?.contactTelephone}</p>
                            </div>
                        </div>
                    </div>
                </form:body>
                %{--<form:actions>--}%
                    %{--<formActions:submit value="${message(code: 'default.button.back.label')}"/>--}%
                %{--</form:actions>--}%
            </form:form>
        </portlet:body>
    </component:portlet>
    <component:portlet>
        <portlet:title
            title="${message(code: 'merchantTerminalManagement.installInformation.label', args: message.domain(domain: 'merchantTerminalManagement'))}"/>
        <portlet:body withForm="true">
        <form:form action="unbindPos" id="removeForm">
            <form:body>
                <formCommon:hiddenField name="merchantCode" value="${merchantTerminalManagementInstance?.merchantCode}"/>
                <formCommon:hiddenField name="insideMerchantCode" value="${merchantTerminalManagementInstance?.insideMerchantCode}"/>
                <formCommon:hiddenField name="oldTerminalNumberSubmit" value=""/>
                <formCommon:hiddenField name="oldCommunicationWaySubmit" value=""/>
                <formCommon:hiddenField name="oldPosSerialNumberSubmit" value="" />
                <formCommon:hiddenField name="posListsBindedSize" value="${installMachinesList.size()}"/>
                <formCommon:hiddenField name="ifBalanceSet" value="" />
                <formCommon:hiddenField name="merchantAccount" value="" />

                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4">
                            <span class="required">*</span><message:property domain="merchantTerminalManagement" property="oldPosSerialNumber" /><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:select class="form-control" id="oldPosSerialNumberRE" name="oldPosSerialNumberRE" optionKey="oldPosSerialNumber" optionValue="posSerialNumber"
                                      from="${installMachinesList}"  value="${oldPosSerialNumber}" noSelection="['':'请选择...']" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4">
                            <message:property domain="merchantTerminalManagement" property="communicationWay" /><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:select class="form-control" name="oldCommunicationWay" from="${com.suixingpay.ssp.front.merchant.MerchantTerminalManagement.getConstraintsMap()['communicationWay'].inList}" valueMessagePrefix="merchantTerminalManagement.communicationWay" readonly="readonly" disabled="disabled" noSelection="['':'']" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="col-md-4 control-label">
                            <message:property domain="merchantTerminalManagement" property="factory"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:textField class="form-control" name="oldFactory" value="" readonly="readonly" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="col-md-4 control-label">
                            <message:property domain="merchantTerminalManagement" property="terminalModel"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:textField class="form-control" name="oldTerminalModel" value="" readonly="readonly" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="col-md-4 control-label">
                            <message:property domain="merchantTerminalManagement" property="passwordKeyboardModel"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:textField class="form-control" name="oldPasswordKeyboardModel" value="" readonly="readonly" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="col-md-4 control-label">
                            <message:property domain="merchantTerminalManagement" property="keyboardSerialNumber"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:textField class="form-control" name="oldKeyboardSerialNumber" value="" readonly="readonly" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="col-md-4 control-label">
                            <message:property domain="merchantTerminalManagement" property="simNumber"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:textField class="form-control" name="oldSimNumber" value="" readonly="readonly" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="col-md-4 control-label">
                            <message:property domain="merchantTerminalManagement" property="whetherIndependentProcurement"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:textField class="form-control" name="oldWhetherIndependentProcurement" value="" readonly="readonly" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="col-md-4 control-label">
                            <message:property domain="merchantTerminalManagement" property="terminalNumber"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:textField class="form-control" name="oldTerminalNumber" value="" readonly="readonly" />
                        </div>
                    </div>
                </div>
            </form:body>
            <form:actions>
                %{--<button id="unbindPos" type="button" class="btn btn-primary"><g:message code="merchantTerminalManagement.unbundling.label"/></button>--}%
                <button  class="btn btn-machine ssp-merchant-removepos-button" id="removeButton" onclick="ubBindPos(event)">${message(code: 'merchantTerminalManagement.unbundling.label')}</button>

                %{--<formActions:submit value="${message(code: 'merchantTerminalManagement.print.label')}"/>--}%
                %{--<formActions:submit value="${message(code: 'default.button.back.label')}"/>--}%
                <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message
                        code="default.button.cancel.label"/></button>
            </form:actions>
        </form:form>
    </portlet:body>
    </component:portlet>
%{--</component:portlet>--}%
</div>
<div class="modal-footer">
</div>
<script type="text/javascript">
    $(function() {
        $('#oldPosSerialNumberRE').change(function () {
            var insideMerchantCode = $("input[name='insideMerchantCode']").val();
            $("select[name='oldCommunicationWay']").val("");
            $("input[name='oldFactory']").val("");
            $("input[name='oldTerminalModel']").val("");
            $("input[name='oldKeyboardSerialNumber']").val("");
            $("input[name='oldPasswordKeyboardModel']").val("");
            $("input[name='oldSimNumber']").val("");
            $("input[name='oldWhetherIndependentProcurement']").val("");
            $("input[name='oldTerminalNumber']").val("");
            $("input[name='oldTerminalNumberSubmit']").val("");
            $("input[name='oldCommunicationWaySubmit']").val("");
            $("input[name='oldPosSerialNumberSubmit']").val("");
            if (this.value != "") {
                $.ajax({
                    url: "/merchantTerminalManagement/getPosInfoByPosSerialNumber.do",
                    data: {insideMerchantCode: insideMerchantCode, posSerialNumber: this.value},
                    async: false,
                    success: function (data) {
                        $("select[name='oldCommunicationWay']").val(data.communicationWay);
                        $("input[name='oldFactory']").val(data.factoryshortName);
                        $("input[name='oldTerminalModel']").val(data.terminalModelName);
                        $("input[name='oldKeyboardSerialNumber']").val(data.keyboardSerialNumber);
                        $("input[name='oldPasswordKeyboardModel']").val(data.passwordKeyboardModel);
                        $("input[name='oldSimNumber']").val(data.simNumber);
                        if( data.simNumber!= null && data.simNumber != "" ){
                            $("input[name='oldWhetherIndependentProcurement']").val(data.whetherIndependentProcurement == true ? "是" : "否");
                        }else{
                            $("input[name='oldWhetherIndependentProcurement']").val("");
                        }
                        $("input[name='oldTerminalNumber']").val(data.terminalNumber);
                        $("input[name='oldTerminalNumberSubmit']").val(data.terminalNumber);
                        $("input[name='oldCommunicationWaySubmit']").val(data.communicationWay);
                        $("input[name='oldPosSerialNumberSubmit']").val(data.posSerialNumber);
                    }
                });
            }
        })
        if( $('#oldPosSerialNumberRE').val() != '' ){
            $('#oldPosSerialNumberRE').change();
        }

        $('#unbindPos').click(function(){
            ubBindPos();
        });
    })


</script>