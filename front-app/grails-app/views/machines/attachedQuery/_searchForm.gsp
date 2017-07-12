
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'attachedQuery.queryCondition.label', args: message.domain(domain: 'attachedQuery'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="attachedQuery" action="index"
                   name="scaffold-search-attachedQuery" id="acTransferForm">
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
            %{--物品名称--}%
                %{--<domainSearch:textField domain="attachedQuery" property="goodsName"/>--}%
                <domainSearch:select2 property="goodsName" domain="attachedQuery" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.machines.AttachedQuery.getConstraintsMap()['goodsName'].inList}"
                                     valueMessagePrefix="attachedQuery.goodsName" value="${params ? params['q_result'] : ''}"
                                     noSelection="['':'请选择']" />
            %{--厂商简称--}%
                %{--<domainSearch:textField domain="attachedQuery" property="factShortName"/>--}%
                <domainSearch:select2 property="factShortName" domain="attachedQuery" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.machines.AttachedQuery.getConstraintsMap()['factShortName'].inList}"
                                     valueMessagePrefix="attachedQuery.factShortName" value="${params ? params['q_result'] : ''}"
                                     noSelection="['':'请选择']" />
            %{--型号--}%
                %{--<domainSearch:textField domain="attachedQuery" property="model"/>--}%
                <domainSearch:select2 property="model" domain="attachedQuery" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.machines.AttachedQuery.getConstraintsMap()['model'].inList}"
                                     valueMessagePrefix="attachedQuery.model" value="${params ? params['q_result'] : ''}"
                                     noSelection="['':'请选择']" />
                <domainSearch:datePicker2 domain="attachedQuery" property="putInStorageDate" dataDateFormat="yyyy-mm-dd"/>
                <domainSearch:datePicker domain="attachedQuery" property="installDate" dataDateFormat="yyyy-mm-dd"/>
            %{--状态--}%
                %{--<domainSearch:textField domain="attachedQuery" property="status"/>--}%
                <domainSearch:select2 property="status" domain="attachedQuery" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.machines.AttachedQuery.getConstraintsMap()['status'].inList}"
                                     valueMessagePrefix="attachedQuery.status" value="${params ? params['q_result'] : ''}"
                                     noSelection="['':'请选择']" />

                %{--<domainSearch:textField domain="attachedQuery" property="prefix"/>--}%
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                code="attachedQuery.prefix.show-pop.label"></g:message>"></i><g:message
                                code="attachedQuery.prefix.label"></g:message></label>

                        <div class="col-md-8"><g:textField name="q_prefix" value="${params.q_prefix}"
                                                           class="form-control" placeholder="${message(code: 'attachedQuery.snPrefix.label')}"></g:textField></div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="col-md-4 control-label"><i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                code="attachedQuery.snRange.show-pop.label"></g:message>"></i><g:message code="attachedQuery.snRange.label"></g:message> </label>

                        <div class="col-md-8">
                            <div class="input-group input-daterange">
                                <g:textField class="form-control" name="q_sequence" placeholder="${message(code: 'attachedQuery.sequence.label')}"
                                             value="${params.q_sequence}"></g:textField>
                                <span class="input-group-addon">~</span>
                                <g:textField class="form-control" name="q_checkSequence" placeholder="${message(code: 'attachedQuery.checkSequence.label')}"
                                             value="${params.q_checkSequence}"></g:textField>
                            </div>
                        </div>
                    </div>
                </div>
                %{--<domainSearch:textField domain="attachedQuery" property="suffix"/>--}%
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                code="attachedQuery.suffix.show-pop.label"></g:message>"></i><g:message
                                code="attachedQuery.suffix.label"></g:message></label>

                        <div class="col-md-8"><g:textField name="q_suffix" value="${params.q_suffix}"
                                                           class="form-control" placeholder="${message(code: 'attachedQuery.snSuffix.label')}"></g:textField></div>
                    </div>
                </div>
                <g:if test="${isAdmin}">
                    <domainSearch:orgTree popoverMessage="${message(code:"attachedQuery.belongToOrg.show-pop.label")}"  domain="attachedQuery" property="belongToOrg" name="q_belongToOrg"  directly="true" class="belongToOrg"/>
                    <domainSearch:select2 popoverMessage="${message(code:"attachedQuery.salesMan.show-pop.label")}" domain="attachedQuery" property="salesMan" class="form-control belongtoEmp"
                                          from="${com.suixingpay.ssp.front.machines.AttachedQuery.getConstraintsMap()['salesMan'].inList}"
                                          name="q_salesMan" valueMessagePrefix="attachedQuery.salesMan"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="attachedQuery.belongToOrg.show-pop.label"></g:message>"></i>  <message:property domain="attachedQuery" property="belongToOrg" /><g:message code="dashBoard.system.colon"></g:message>
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
                                        code="attachedQuery.salesMan.show-pop.label"></g:message>"></i> <message:property domain="attachedQuery" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>

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

