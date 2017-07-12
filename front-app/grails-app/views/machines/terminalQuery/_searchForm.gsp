<component:portlet cssClass="scaffold-search">
    %{--<portlet:title--}%
            %{--title="${message(code: 'terminalQuery.queryCondition.label', args: message.domain(domain: 'terminalQuery'))}"--}%
            %{--iconCssClass="fa fa-filter"/>--}%
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-filter"></i>
            <span class="caption-subject bold uppercase">查询条件</span>
            <span class="caption-helper"></span>
        </div>
        <div class="tools">
            <a href="${sms_front_url}/fromSspToHomePage.do?userName=${userName}&password=${passWord}&url=/posTransfer/queryTransferList.do" id="showHistory"><span class="caption-subject bold uppercase" style="color: red;text-decoration:underline">查看历史划拨单</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href=":;" class="collapse" data-original-title="" title=""> </a>

            <a href=":;" class="fullscreen" data-original-title="" title=""> </a>

        </div>
    </div>
    <portlet:body withForm="true">
        <form:form controller="terminalQuery" action="index"
                   name="scaffold-search-terminalQuery" id="acTransferForm">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden"  id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>

                <input type="hidden" name="hiddenGoodsNameCode" id="hiddenGoodsNameCode" value="${hiddenGoodsNameCode}"/>
                <input type="hidden" name="hiddenFactShortNameCode" id="hiddenFactShortNameCode" value="${hiddenFactShortNameCode}"/>
                <input type="hidden" name="hiddenModelCode" id="hiddenModelCode" value="${hiddenModelCode}"/>

                <!--商户编号-->
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4">
                            <message:property domain="terminalQuery" property="merchantCode"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>

                        <div class="col-md-8">
                            <g:textField type="text" class="form-control" name="q_merchantCode" value="${params.q_merchantCode}"/>

                        </div>
                    </div>
                </div>
                <!--序列号-->
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4">
                            <message:property domain="terminalQuery" property="sn"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>

                        <div class="col-md-8">
                            <g:textField type="text" class="form-control" name="q_sn" value="${params.q_sn}"/>
                        </div>
                    </div>
                </div>
                <!--终端号-->
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4">
                            <message:property domain="terminalQuery" property="terminalCode"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>

                        <div class="col-md-8">
                            <g:textField type="text" class="form-control" name="q_terminalCode" value="${params.q_terminalCode}"/>
                        </div>
                    </div>
                </div>
            %{--物品名称--}%

                <domainSearch:select2 domain="terminalQuery" property="goodsName" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.TerminalQuery.getConstraintsMap()['goodsName'].inList}"
                                     name="q_goodsName" valueMessagePrefix="terminalQuery.belongtoOrg"
                                     value="${params ? params['q_goodsName'] : ''}" noSelection="['': '--请选择--']"/>

            %{--厂商简称--}%
                <domainSearch:select2 domain="terminalQuery" property="factShortName" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.TerminalQuery.getConstraintsMap()['factShortName'].inList}"
                                     name="q_factShortName" valueMessagePrefix="terminalQuery.factShortName"
                                     value="${params ? params['q_factShortName'] : ''}" noSelection="['': '--请选择--']"/>

            %{--型号--}%

                <domainSearch:select2 domain="terminalQuery" property="model" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.TerminalQuery.getConstraintsMap()['model'].inList}"
                                     name="q_model" valueMessagePrefix="terminalQuery.model"
                                     value="${params ? params['q_model'] : ''}" noSelection="['': '--请选择--']"/>
            %{--通讯方式--}%
                <domainSearch:select2 domain="terminalQuery" property="communicationType" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.TerminalQuery.getConstraintsMap()['communicationType'].inList}"
                                     name="q_communicationType" valueMessagePrefix="terminalQuery.communicationType"
                                     value="${params ? params['q_communicationType'] : ''}"
                                     noSelection="['': '--请选择--']"/>
            %{--电签--}%
                <domainSearch:select2 domain="terminalQuery" property="signa" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.TerminalQuery.getConstraintsMap()['signa'].inList}"
                                     name="q_signa" valueMessagePrefix="terminalQuery.signa"
                                     value="${params ? params['q_signa'] : ''}" noSelection="['': '--请选择--']"/>
            %{--状态--}%

                <domainSearch:select2 domain="terminalQuery" property="status" class="form-control"
                                      from="${com.suixingpay.ssp.front.machines.TerminalQuery.getConstraintsMap()['status'].inList}"
                                      name="q_status" valueMessagePrefix="terminalQuery.status"
                                      value="${params ? params['q_status'] : ''}" noSelection="['': '--请选择--']"/>
                %{----}%
                <domainSearch:datePicker domain="terminalQuery" property="putInStorageDate" dataDateFormat="yyyy-mm-dd"/>

                %{----}%
                <domainSearch:datePicker domain="terminalQuery" property="installDate" dataDateFormat="yyyy-mm-dd"/>
            %{--携机入网--}%
                <domainSearch:select2 popoverMessage="${message(code:"terminalQuery.assistMachineNet.show-pop.label")}" domain="terminalQuery" property="assistMachineNet" class="form-control"
                                      from="${com.suixingpay.ssp.front.machines.TerminalQuery.getConstraintsMap()['assistMachineNet'].inList}"
                                      name="q_assistMachineNet" valueMessagePrefix="terminalQuery.assistMachineNet"
                                      value="${params ? params['q_assistMachineNet'] : ''}"
                                      noSelection="['': '--请选择--']"/>

            %{--隐藏范围--}%
                <g:if test="${isAdmin}">
                    <domainSearch:orgTree popoverMessage="${message(code:"terminalQuery.belongtoOrg.show-pop.label")}" domain="terminalQuery" property="belongtoOrg" name="q_belongtoOrg"  directly="true" class="belongtoOrg"/>
                    <domainSearch:select2 domain="terminalQuery" popoverMessage="${message(code:"terminalQuery.salesMan.show-pop.label")}" property="salesMan" class="form-control belongtoEmp"
                                          from="${com.suixingpay.ssp.front.machines.TerminalQuery.getConstraintsMap()['salesMan'].inList}"
                                          name="q_salesMan" valueMessagePrefix="terminalQuery.salesMan"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="terminalQuery.belongtoOrg.show-pop.label"></g:message>"></i>
                                <message:property domain="terminalQuery" property="belongtoOrg" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly id="readonlyOrgNm"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="terminalQuery.salesMan.show-pop.label"></g:message>"></i> <message:property domain="terminalQuery" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>

                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                code="terminalQuery.prefix.show-pop.label"></g:message>"></i> <g:message
                                code="terminalQuery.prefix.label"></g:message> <g:message code="dashBoard.system.colon"></g:message></label>

                        <div class="col-md-8"><g:textField name="q_prefix" value="${params.q_prefix}"
                                                           class="form-control" placeholder="${message(code: 'terminalQuery.snPrefix.label')}"></g:textField></div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label class="col-md-4 control-label"><i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                code="terminalQuery.snRange.show-pop.label"></g:message>"></i> <g:message code="terminalQuery.snRange.label"></g:message>
                            <g:message code="dashBoard.system.colon"></g:message></label>

                        <div class="col-md-8">
                            <div class="input-group input-daterange">
                                <g:textField class="form-control" name="q_sequence"
                                             value="${params.q_sequence}"></g:textField>
                                <span class="input-group-addon">~</span>
                                <g:textField class="form-control" name="q_checkSequence"
                                             value="${params.q_checkSequence}"></g:textField>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                code="terminalQuery.suffix.show-pop.label"></g:message>"></i> <g:message
                                code="terminalQuery.suffix.label"></g:message> <g:message code="dashBoard.system.colon"></g:message></label>

                        <div class="col-md-8"><g:textField name="q_suffix" value="${params.q_suffix}"
                                                           class="form-control" placeholder="${message(code: 'terminalQuery.snSuffix.label')}"></g:textField></div>
                    </div>
                </div>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
