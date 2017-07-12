<%@ page import="com.suixingpay.ssp.front.products.SecondsReceived" %>
<div class="modal-header ">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"><g:message code="secondsReceived.closeRate.label"></g:message> </h4>
</div>
<component:portlet>
    <portlet:body withForm="false">

        <div class="modal-body" >
            %{--<g:form>--}%
            <div class="row">
                <div class="col-md-12">
                    <label class="col-md-12 text-center form-control-static" style="color:red"><h4><g:message code="secondsReceived.closeInfo.label"></g:message></h4></label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="col-md-5 text-right form-control-static"><g:message code="secondsReceived.merchantCode.label"></g:message><g:message code="dashBoard.system.colon"></g:message></label>
                    <div class="col-md-7 text-left">
                        <lable id = "merchantCode">${merchantCode}</lable>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label class="col-md-5 text-right form-control-static " ><g:message code="assistBillQuery.receiptsName.label"></g:message><g:message code="dashBoard.system.colon"></g:message></label>
                    <div class="col-md-7 text-left">
                        <lable id = "receiptsName">${receiptsName}</lable>
                    </div>
                </div>
            </div>
            %{--</g:form>--}%
        </div>
        <div class="modal-footer">
            <div class="col-md-12 text-center">
                %{--<a href="javascript:;" onclick="closeMaintenance()" class="btn btn-ok"> </a>--}%
%{--
                <g:link controller="secondsReceived" action="closePosMd" class="btn btn-ok" params="[merchantCode:secondsReceivedInstance?.merchantCode,receiptsName:secondsReceivedInstance?.receiptsName]"><g:message code="suiYiTongAuditDataQueryInstance.ok.label"/></g:link>
--}%
                %{--<g:link class="closeMaintenance" mc="${merchantCode}" rn="${receiptsName}">
                    <div class="btn btn-ok"><g:message code="secondsReceived.ok.label"/></div>
                </g:link>--}%
                <a href="javascript:;" onclick="closeMaintenance()" class="btn btn-ok"><g:message code="secondsReceived.ok.label"/> </a>
                <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="secondsReceived.cancle.label"/></button>
            </div>
        </div>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/products/secondsReceived.js"/>
</content>
