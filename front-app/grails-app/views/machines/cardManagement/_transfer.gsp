<%@ page import="com.suixingpay.ssp.front.machines.CardManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">
        <div class="widget-header">
            <h5 class="widget-title bigger">
              <g:message code="cardManagement.ICtransfer.label"></g:message>
            </h5>
        </div>
    </h4>
</div>
<div class="modal-body">
    <div class=" col-md-12 text-left">
        <p><g:message code="cardManagement.giveICtransfer.label"></g:message></p>
    </div>
 <div class="row">
<g:if test="${isAdmin}">
    <div class="col-md-5 text-right"><label class="mt-radio">
        <input type="radio" name="optionsRadios" id="toOrg" value="org" checked>
        <g:message code="cardManagement.org.label"></g:message>
        <span></span>
    </label></div>

    <div class="col-md-4">
        <label class="mt-radio">
            <input type="radio" name="optionsRadios" id="toOrgSalesman" value="emp">
            <g:message code="cardManagement.thisOrgSalesman.label"></g:message>
            <span></span>
        </label>
    </div>
</g:if>
<g:else>
    <div class="col-md-5 text-right"><label class="mt-radio">
        <input type="radio" name="optionsRadios" id="toThisOrg" value="empToOrg">
        <g:message code="cardManagement.thisOrg.label"></g:message>
        <span></span>
    </label></div>
</g:else>
</div>
<g:if test="${isAdmin}">
    <form:form>
    <div class="row">
        <label class="control-label col-md-5 ">
            <message:property domain="cardManagement" property="subordinateOrg"/>
        </label>

        <div class="text-center">
            <div class="col-md-4" id="transferEmp" style="display: none">
                <g:select class="form-control q_transferAims"
                          from="${com.suixingpay.ssp.front.machines.CardManagement.getConstraintsMap()['userNameList']?.inList}"
                          name="subordinateOrg" valueMessagePrefix="cardManagement.subordinateOrg" id="subordinateOrg"
                          value="${params ? params['userCode'] : ''}" noSelection="['': '--请选择--']"/>
            </div>
        </div>

        <div class="col-xs-12 col-md-4 col-sm-4" id="transferOrg">
            <domainSearch:transferOrgTree domain="cardManagement" property="belongtoOrg" name="q_belongtoOrg"
                                          directly="false"/>
        </div>
    </div>
    </form:form>
</g:if>

</div>

<div class="modal-footer">
    <button type="button" class="btn btn-transfer transferButton"><g:message
            code="cardManagement.sureTransfer.label"></g:message></button>
    <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message
            code="cardManagement.cancle.label"></g:message></button>
</div>
    <asset:javascript src="/machines/CardManagement.js"/>
    <asset:javascript src="/transfer-organization-tree.js"/>
