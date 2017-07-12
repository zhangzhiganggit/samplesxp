<%@ page import="com.suixingpay.ssp.front.merchant.MerchantTerminalManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title"> <g:message code="merchantTerminalManagement.replace.label"/></h4>
</div>

<div class="modal-body">
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
                    <formCommon:hiddenField name="belongtoOrganization" id="belongtoOrganizationRep"
                                            value="${merchantTerminalManagementInstance?.belongtoOrganization}"/>
                    <formCommon:hiddenField name="organizationCode"
                                            value="${merchantTerminalManagementInstance?.organizationCode}"/>
                    <formCommon:hiddenField name="salesManCode" id="salesManCodeRep"
                                            value="${merchantTerminalManagementInstance?.salesManCode}"/>
                    <formCommon:hiddenField name="userCode"
                                            value="${merchantTerminalManagementInstance?.userCode}"/>
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
                title="${message(code: 'merchantTerminalManagement.installMachinesInformation.label', args: message.domain(domain: 'merchantTerminalManagement'))}"/>
        <portlet:body withForm="true">
            <form:form action="index">
                <form:body>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <span class="required">*</span><message:property domain="merchantTerminalManagement" property="oldPosSerialNumber" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <g:select class="form-control" name="oldPosSerialNumber" optionKey="oldPosSerialNumber" optionValue="posSerialNumber"
                                          from="${installMachinesList}" value="${oldPosSerialNumber}" noSelection="['':'请选择...']" />
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
                %{--<form:actions>--}%
                    %{--<formActions:submit value="${message(code: 'default.button.back.label')}"/>--}%
                %{--</form:actions>--}%
            </form:form>
        </portlet:body>
    </component:portlet>
    <component:portlet>
        <portlet:title
                title="${message(code: 'merchantTerminalManagement.newInstallInformation.label', args: message.domain(domain: 'merchantTerminalManagement'))}"/>
        <portlet:body withForm="true">
            <form:form action="changePos" id="replaceForm">
                <formCommon:hiddenField name="merchantCode" value="${merchantTerminalManagementInstance?.merchantCode}"/>
                <formCommon:hiddenField name="insideMerchantCode" value="${merchantTerminalManagementInstance?.insideMerchantCode}"/>
                <formCommon:hiddenField name="oldPosSerialNumberSubmit" value=""/>
                <formCommon:hiddenField name="oldCommunicationWaySubmit" value=""/>
                <form:body>
                    <div class="info">
                        %{--<domainSearch:textField domain="merchantTerminalManagement" property="posSerialNumber"/>--}%
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4"><span class="required">*</span><message:property domain="merchantTerminalManagement"
                                                                                        property="posSerialNumber"/><g:message code="dashBoard.system.colon"></g:message>
                                    </label>

                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="q_posSerialNumber" value=""/>

                                </div>
                            </div>
                        </div>
                        <domainSearch:select property="communicationWay" domain="merchantTerminalManagement" class="form-control" name="q_communicationWay" from="${com.suixingpay.ssp.front.merchant.MerchantTerminalManagement.getConstraintsMap()['communicationWay'].inList}" valueMessagePrefix="merchantTerminalManagement.communicationWay" value="${params ? params['q_communicationWay'] : ''}" noSelection="['':'请选择...']" />

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4">
                                    <message:property domain="merchantTerminalManagement" property="factory" /><g:message code="dashBoard.system.colon"></g:message>
                                </label>
                                <div class="col-md-8">
                                    <g:select class="form-control" name="q_factory" optionKey="factory" optionValue="factoryshortName"
                                              from="${factoryList}" value="${params ? params['q_factory'] : '' }" noSelection="['':'请选择...']" />
                                </div>
                            </div>
                        </div>

                        %{--<domainSearch:select property="
                        " domain="merchantTerminalManagement" class="form-control" name="q_result" from="${com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement.getConstraintsMap()['merchantStatus'].inList}" valueMessagePrefix="merchantRiskControlStatusManagement.merchantStatus" value="${params ? params['q_result'] : ''}" noSelection="['':'']" />--}%
                        <domainSearch:select property="terminalModel" domain="merchantTerminalManagement" class="form-control" name="q_terminalModel" from="" value="${params ? params['q_terminalModel'] : ''}" noSelection="['':'请选择...']" />
                        <domainSearch:select domain="merchantTerminalManagement" property="passwordKeyboardModel" class="form-control" name="q_passwordKeyboardModel" from="" value="${params ? params['q_passwordKeyboardModel'] : ''}" noSelection="['':'请选择...']" />
                        <domainSearch:textField property="keyboardSerialNumber" domain="merchantTerminalManagement" />
                        <domainSearch:textField domain="merchantTerminalManagement" property="simNumber"/>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4">
                                    <message:property domain="merchantTerminalManagement" property="whetherIndependentProcurement"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-8">
                                    <g:select disabled="true" class="form-control" name="q_whetherIndependentProcurement"
                                              from="${com.suixingpay.ssp.front.merchant.MerchantTerminalManagement.getConstraintsMap()['whetherIndependentProcurement'].inList}"
                                              valueMessagePrefix="merchantTerminalManagement.whetherIndependentProcurement"
                                              value="${params ? params['q_whetherIndependentProcurement'] : ''}"
                                              noSelection="['': '请选择...']"/>
                                </div>
                            </div>
                        </div>
                        %{--<domainSearch:select property="whetherIndependentProcurement" domain="merchantTerminalManagement" class="form-control" name="q_whetherIndependentProcurement" from="${com.suixingpay.ssp.front.merchant.MerchantTerminalManagement.getConstraintsMap()['whetherIndependentProcurement'].inList}" valueMessagePrefix="merchantTerminalManagement.whetherIndependentProcurement" value="${params ? params['q_whetherIndependentProcurement'] : ''}" noSelection="['':'请选择...']" />--}%

                    </div>
                </form:body>

                <form:actions>
                    <button class="btn btn-machine ssp-merchant-replacepos-button" id="replaceButton" onclick="changePos(event)">${message(code: 'merchantTerminalManagement.replace.label')}</button>

                %{--<formActions:submit value="${message(code: 'merchantTerminalManagement.cancel.label')}"/>--}%
                    <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message
                            code="merchantTerminalManagement.cancel.label"/></button>
                </form:actions>
            </form:form>
        </portlet:body>
        </component:portlet>
</div>
<div class="modal-footer">
</div>
<script type="text/javascript">
    $(function(){

        $('#oldPosSerialNumber').change(function(){
            var insideMerchantCode = $("input[name='insideMerchantCode']").val();
            $("select[name='oldCommunicationWay']").val("");
            $("input[name='oldFactory']").val("");
            $("input[name='oldTerminalModel']").val("");
            $("input[name='oldKeyboardSerialNumber']").val("");
            $("input[name='oldPasswordKeyboardModel']").val("");
            $("input[name='oldSimNumber']").val("");
            $("input[name='oldWhetherIndependentProcurement']").val("");
            $("input[name='oldTerminalNumber']").val("");
            $("input[name='oldPosSerialNumberSubmit']").val("");
            $("input[name='oldCommunicationWaySubmit']").val("");
            if( this.value != "" ) {
                $.ajax({
                    url: "/merchantTerminalManagement/getPosInfoByPosSerialNumber.do",
                    data: {insideMerchantCode: insideMerchantCode,posSerialNumber:this.value},
                    async: false,
                    success: function (data) {
                        $("select[name='oldCommunicationWay']").val(data.communicationWay);
                        $("input[name='oldFactory']").val(data.factoryshortName);
                        $("input[name='oldTerminalModel']").val(data.terminalModelName);
                        $("input[name='oldKeyboardSerialNumber']").val(data.keyboardSerialNumber);
                        $("input[name='oldPasswordKeyboardModel']").val(data.passwordKeyboardModel);
                        $("input[name='oldSimNumber']").val(data.simNumber);
                        if( data.simNumber!= null && data.simNumber != "" ){
                            $("input[name='oldWhetherIndependentProcurement']").val(data.whetherIndependentProcurement==true?"是":"否");
                        }else{
                            $("input[name='oldWhetherIndependentProcurement']").val("");
                        }
                        $("input[name='oldTerminalNumber']").val(data.terminalNumber);
                        $("input[name='oldPosSerialNumberSubmit']").val(data.terminalNumber);
                        $("input[name='oldCommunicationWaySubmit']").val(data.communicationWay);
                    }
                });
            }
        })

        $("input[name='q_posSerialNumber']").change(function(){
            posSerialNumberChanged(this)
        })
        $("select[name='q_factory']").change(function () {
            factoryChanged(this);
        })
        $("select[name='q_terminalModel']").change(function () {
            terminalModelChanged(this);
        })
        $("select[name='q_communicationWay']").change(function(){
            communicationWayChanged(this);
        })

        $("input[name='q_simNumber']").change(function(){
            simNumberChanged(this);
        })

        if( $('#oldPosSerialNumber').val() != '' ){
            $('#oldPosSerialNumber').change();
        }

    })
    function posSerialNumberChanged(node){
        var parent = $(node).parents("div.info");
        var posSerialNumber = parent.find("input[name='q_posSerialNumber']").val();
        var belongtoOrganization = $("#belongtoOrganizationRep").val();
        var salesManCode = $("#salesManCodeRep").val();
        parent.find("select[name='q_communicationWay']").val("");
        parent.find("select[name='q_factory']").val("");
        parent.find("select[name='q_terminalModel']").val("");
        resetDataValue(parent);
        if(""!= posSerialNumber){
            $.ajax({ url: "/merchantTerminalManagement/getPosInfo",
                data:{posSerialNumber:posSerialNumber,belongtoOrganization:belongtoOrganization,salesManCode:salesManCode},
                async:false,
                success: function(data){
                    if ('' == data || null == data || data.length == 0) {
                        bootbox.alert("该序列号无信息，请确认序列号归属是否正确或已被绑定。",function (){
                            parent.find("input[name='q_posSerialNumber']").val("");
                        });
                    } else if (data.length > 1) {
                        bootbox.alert("该序列号有多条信息，请手动设置通讯方式、厂商和终端型号。");
                    } else {
                        resetDataValue(parent);
                        parent.find("select[name='q_communicationWay']").val(data[0].communicationWay);
                        parent.find("select[name='q_factory']").val(data[0].factory).change();
                        parent.find("select[name='q_terminalModel']").val(data[0].terminalModel).change();
                    }
                }
            });
        }
    }

    function factoryChanged(node){
        var parent = $(node).parents("div.info");
        resetDataValue(parent);
        var communicationWay = parent.find("select[name='q_communicationWay']").val();
        if(communicationWay == "" ||  communicationWay<0){
            bootbox.alert("请选择pos通讯方式")
            parent.find("select[name='q_factory']").find("option[value='']").attr("selected",true);
            return ;
        }
        var factory = parent.find("select[name='q_factory']").find('option:selected').val();
        var insideMerchantCode = $("input[name='insideMerchantCode']").val();

        parent.find("select[name='q_terminalModel']").children("option[value!='']").remove().change();
        if(factory!='') {
            $.ajax({ url: "/merchantTerminalManagement/getModByfactAndConnNo.do", data:{communicationWay:communicationWay,factory:factory,machineType:'001',insideMerchantCode:insideMerchantCode},async:false,success: function(data){
                if (data !="") {
                    var optionList="<option  value=''>请选择</option>";
                    for(var i=0;i<data.length;i++){
                        optionList+="<option  value='"+data[i].terminalModel+"'>"+data[i].terminalModelName+"</option>";
                    }
                    parent.find("select[name='q_terminalModel']").html(optionList);
                }
            }});
        }
    }

    function terminalModelChanged(node){
        var parent = $(node).parents("div.info");
        resetDataValue(parent);
        var terminalModel = parent.find("select[name='q_terminalModel']").val();
        parent.find("select[name='q_passwordKeyboardModel']").children("option[value!='']").remove();
        $.ajax({ url: "/merchantTerminalManagement/getBoardAndSimInfobyTerminalModel.do", data:{terminalModel:terminalModel},
            async:false,
            success: function(data){
                var keyBoardOption='<option value="" selected="selected" >请选择...</option>';
                var simOption='<option   value="" selected="selected"  >请选择...</option>';
                for(var i=0;i<data.length;i++){
                    if(data[i].goodsId=='011'){
                        keyBoardOption+="<option  value='"+data[i].terminalModel+"'>"+data[i].terminalModelName+"</option>";
                    }
                    if(data[i].goodsId=='012'){
                        simOption+="<option  value='"+data[i].terminalModel+"'>"+data[i].terminalModelName+"</option>";
                    }
                }
                parent.find("select[name='q_passwordKeyboardModel']").html(keyBoardOption);
            }});

    }

    function communicationWayChanged(node){
        var parent = $(node).parents("div.info");
        if( "" != parent.find("select[name='q_communicationWay']").val() ){
            resetDataValue(parent);
            factoryChanged(node);
        }
    }

    function simNumberChanged(node) {
        var parent = $(node).parents("div.info");
        var simNumber = parent.find("input[name='q_simNumber']").val();
        var insideMerchantCode = $("input[name='insideMerchantCode']").val();
        parent.find("select[name='q_whetherIndependentProcurement']").val("");
        if( "" != simNumber ){
            $.ajax({
                url: "/merchantTerminalManagement/getSimWhetherIndependentProcurement.do",
                data: {simNumber: simNumber,insideMerchantCode:insideMerchantCode},
                async: false,
                success: function (data) {
                    parent.find("select[name='q_whetherIndependentProcurement']").val(data.whetherIndependentProcurement+"");
                }
            });
        }
    }

    function addPosRow(){
        $(".info:last").parent().parent().append($(".info:first").parent()[0].outerHTML);
    }

    /**
     * 发送
     * @param node
     */
    function dataFormatCheckAndBind(){
        return false
    }

    function resetDataValue(node){
        //清空键盘序列号 密码键盘序列号 sim卡型号 键盘型号
        $(node).find("input[name='q_keyboardSerialNumber']").val("");
        $(node).find("input[name='q_passwordKeyboardModel']").val("");
        $(node).find("input[name='q_simNumber']").val("");
        $(node).find("select[name='q_passwordKeyboardModel']").children("option[value!='']").remove();
    }
</script>