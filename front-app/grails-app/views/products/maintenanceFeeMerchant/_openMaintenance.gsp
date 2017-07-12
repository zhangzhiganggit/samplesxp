
<div class="modal-header ">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title"><g:message code="maintenanceFeeMerchant.openOne.label"/> </h4>
</div>
<div class="modal-body" >
    %{--<g:form>--}%
        <input type="hidden" id="merchantCode" value="${merchantCode}"/>
        <input type="hidden" id="insideMerchantCode" value="${insideMerchantCode}"/>
        <div class="row">
            <div class="col-md-12">
            <label class="col-md-4 text-right form-control-static"><span style="color: red">*</span><message:property domain="maintenanceFeeMerchant" property="openType"/><g:message code="dashBoard.system.colon"></g:message></label>
            <div class="col-md-6 text-left">
                <g:select id="operationTypeOpen" class="form-control" required="required" name="operationType" from="[[key:'00',value:'维护通'],[key:'01',value:'POS维护费-按日累计扣费'],[key:'02',value:'POS维护费-按日非累计扣费']]" optionKey="key" optionValue="value" noSelection="${['':'--请选择--']}"/>
            </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
            <label class="col-md-4 text-right form-control-static " ><span style="color: red">*</span><message:property domain="maintenanceFeeMerchant" property="collectAmount"/><g:message code="dashBoard.system.colon"></g:message></label>
            <div class="col-md-6 text-left">
                <lable>
                    <g:textField name="collectAmountOpen" required="required" class="form-control"/>
                </lable>
            </div>
            </div>
        </div>
    %{--</g:form>--}%
</div>

<div class="modal-footer">

    %{--<div class="col-md-2 right"  style="margin-left:150px">
        <lable >
            --}%%{--<g:submitButton name="batchModifyAmountFile" value="确定" class="btn blue"/>--}%%{--
            <a href="javascript:;" onclick="openMaintenance()" class="btn btn-ok"><g:message code="intradayPay.affirm.label"/> </a>
        </lable>
    </div>
    <div class="col-md-1"></div>
    <div class="col-md-2 left" style="margin-left: -2px" >
        <lable>
            <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="intradayPay.cancel.label"/></button>
        </lable>
    </div>--}%

    <div class="col-md-12 text-center">
        <a href="javascript:;" onclick="openMaintenance()" class="btn btn-ok"><g:message code="intradayPay.affirm.label"/> </a>
        <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="intradayPay.cancel.label"/></button>
    </div>
</div>
<content tag="takin-footer">
    <asset:javascript src="/products/maintenanceFeeMerchant.js"/>
</content>
%{--<script type="text/javascript">--}%
    %{--$(function () {--}%
        %{--$("input[name='collectAmountOpen']").keyup(function () {--}%
            %{--this.value=this.value.replace(/[^\d.]/g,'');--}%
        %{--});--}%
    %{--});--}%
%{--</script>--}%
