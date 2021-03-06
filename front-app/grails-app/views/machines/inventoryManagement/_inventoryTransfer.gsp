<component:portlet cssClass="scaffold-show">
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <div class="form-group">
                    <label class="col-md-4  control-label">
                        <g:message code="inventoryManagement.machinesEdit.label"></g:message>
                    </label>
                </div>

                <div class="form-group">
                    <label class="col-md-2 control-label"></label>
                    <div class="mt-radio-inline col-md-6">
                        <label class="mt-radio">
                            <input type="radio" name="optionsRadios" id="optionsRadios4" value="org"
                                   checked=""><g:message code="inventoryManagement.org.label"></g:message>
                            <span></span>
                        </label>
                        <g:if test="${isAdmin}">
                        <label class="mt-radio">
                            <input type="radio" name="optionsRadios" id="optionsRadios5" value="emp"> <g:message code="inventoryManagement.thisOrgSalesman.label"></g:message>
                            <span></span>
                        </label>
                        </g:if>
                    </div>
                </div>
                <g:if test="${isAdmin}">
                <div class="form-group">
                    <label class="control-label col-md-4"  align="right">
                        <message:property domain="inventoryManagement" property="transferAim" />
                    </label>
                    <div class="col-md-4">
                        <select class="form-control select2" style="float: left" name="q_transferAim" id="q_transferAims">
                        </select>
                        %{--<domainSearch:select2 domain="merchantManagement" property="salesMan" class="form-control belongtoEmp"
                                              name="q_salesMan" valueMessagePrefix="merchantManagement.salesMan"
                                              from="${com.suixingpay.ssp.front.merchant.merchantquery.MerchantManagement.getConstraintsMap()['salesMan'].inList}"
                                              value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>--}%
                        <domainSearch:transferOrgTree domain="inventoryManagement" property="belongtoOrg" name="q_transferAims"  directly="false"/>
                    </div>
                </div>
                </g:if>
            </form:body>
            <form:actions>
                <div class="pull-right">
                    <button type="button" class="btn btn-ok " id="transferButton"><g:message code="inventoryManagement.sureTransfer.label"></g:message> </button>
                    <button type="button" class="btn btn-cancle" data-dismiss="modal" id="closed"><g:message code="inventoryManagement.cancel.label"></g:message></button>
                </div>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<asset:javascript src="/machines/newInventoryManagement.js"/>
<asset:javascript src="/transfer-organization-tree.js"/>
