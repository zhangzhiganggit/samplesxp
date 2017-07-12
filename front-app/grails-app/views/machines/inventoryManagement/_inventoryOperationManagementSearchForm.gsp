<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="查询条件"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="inventoryManagement" action="inventoryOperationManagement"
                   name="scaffold-search-inventoryManagement" id="acTransferForm">
            %{--<form:scaffoldSearchProperties/>--}%
            <input type="hidden" id="scaffold_sort" name="sort" value="${params?.sort ?: 'id' }" />
            <input type="hidden" id="scaffold_order" name="order" value="${params?.order ?: 'desc' }" />
            <input type="hidden" id="scaffold_offset" name="offset" value="${params?.offset ?: 0 }" />
            <input type="hidden" id="scaffold_max" name="max" value="${params?.max ?: 100 }" />
            <form:body>
                <input type="hidden"  id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>


                <input type="hidden" name="mecFactShortNameCode" id="mecFactShortNameCode" value="${mecFactShortNameCode}"/>
                <input type="hidden" name="mecModelCode" id="mecModelCode" value="${mecModelCode}"/>
                <input type="hidden" name="mecGoodsId" id="mecGoodsId" value="${mecGoodsId}"/>

                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"> <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                code="inventoryManagement.sn.show-pop.label"></g:message>"></i><g:message code="inventoryManagement.sn.label"></g:message> </label>
                        <div class="col-md-8"><g:textField name="q_sn" value="${params.q_sn}"  class="form-control"></g:textField> </div>
                    </div>
                </div>
                    <div class="col-md-4">
                        <div class="form-group">
                        <label class="control-label col-md-4"> <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                code="inventoryManagement.prefix.show-pop.label"></g:message>"></i><g:message code="inventoryManagement.prefix.label"></g:message> </label>
                        <div class="col-md-8"><g:textField name="q_prefix" value="${params.q_prefix}"  class="form-control"></g:textField> </div>
                </div>
                    </div>

                    <div class="col-md-4">

                        <div class="form-group">
                        <label class="col-md-4 control-label"><i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                code="inventoryManagement.snRange.show-pop.label"></g:message>"></i><g:message code="inventoryManagement.snRange.label"></g:message> </label>
                        <div class="col-md-8">
                            <div class="input-group input-daterange">
                                <g:textField  class="form-control" name="q_sequence" value="${params.q_sequence}"></g:textField>
                                <span class="input-group-addon"> ~ </span>
                                <g:textField  class="form-control" name="q_checkSequence" value="${params.q_checkSequence}"></g:textField>
                            </div>
                        </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                        <label class="control-label col-md-4"><i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                code="inventoryManagement.suffix.show-pop.label"></g:message>"></i><g:message code="inventoryManagement.suffix.label"></g:message> </label>
                        <div class="col-md-8"><g:textField name="q_suffix" value="${params.q_suffix}" class="form-control"></g:textField> </div>
                </div>
                    </div>

                <g:if test="${isAdmin}">
                    <domainSearch:orgTree domain="inventoryManagement" popoverMessage="${message(code:"inventoryManagement.belongtoOrg.show-pop.label")}" property="belongtoOrg" name="q_belongtoOrg"  directly="true" class="belongtoOrg"/>
                    <domainSearch:select2 domain="inventoryManagement" popoverMessage="${message(code:"inventoryManagement.salesMan.show-pop.label")}" property="salesMan" class="form-control belongtoEmp"
                                          from="${com.suixingpay.ssp.front.machines.InventoryManagement.getConstraintsMap()['salesMan'].inList}"
                                          name="q_salesMan" valueMessagePrefix="InventoryManagement.salesman"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="inventoryManagement.belongtoOrg.show-pop.label"></g:message>"></i> <message:property domain="inventoryManagement" property="belongtoOrg" /><g:message code="dashBoard.system.colon"></g:message>
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
                                        code="inventoryManagement.salesMan.show-pop.label"></g:message>"></i>  <message:property domain="inventoryManagement" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
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
