<%@ page import="com.suixingpay.ssp.front.products.SecondsReceived" %>
<div class="modal-header ">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"><g:message code="secondsReceived.updateRateTitle.label"></g:message> </h4>
</div>
<component:portlet>
    <portlet:body withForm="true">
        %{--<g:uploadForm controller="secondsReceived" action="updateRate"
                      name="scaffold-search-secondsReceived">
            <form:scaffoldSearchProperties/>
            <form:body>
            --}%%{--商户编号--}%%{--
                <formCommon:hiddenField name="merchantCode" value="${secondsReceivedInstance?.merchantCode}"/>
            --}%%{--内部商户编号--}%%{--
                <formCommon:hiddenField name="insideMerchantCode" value="${secondsReceivedInstance?.insideMerchantCode}"/>
            --}%%{--签购单名称--}%%{--
                <formCommon:hiddenField name="receiptsName" value="${secondsReceivedInstance?.receiptsName}"/>
            --}%%{--商户编号--}%%{--
                <formCommon:hiddenField name="handIdcardPicFlag" value="${handIdcardPic}" id="handIdcardPicFlag"/>
            --}%%{--生效日期--}%%{--
                <formCommon:hiddenField name="effectiveDate" value="${secondsReceivedInstance?.effectiveDate}" id="effectiveDate"/>
            --}%%{--费率信息--}%%{--
                <formCommon:hiddenField name="posMdStr" id="posMdStr"/>--}%
    %{--<div  class="col-sm-12">--}%
    %{--<h3 class="header smaller lighter green">费率信息</h3>--}%
    %{--<div id="newMccInfoDiv"></div>--}%
    %{--</div>--}%

        <div class="modal-body" >
            <input type="hidden" id="insideMerchantCode" value="${insideMerchantCode}"/>
            <input type="hidden" id="posMdStr" name="posMdStr"/>
            %{--<g:form>--}%
            <div class="row" style="margin:0px auto;width:35%;">
                <div class="col-md-12">
                    <label class="col-md-12 text-left form-control-static" style="color:red"><h4><g:message code="secondsReceived.updateInfo.label"></g:message></h4></label>
                </div>
            </div>
            <div class="row" style="margin:0px auto;width:50%;margin-left:19%">
                <div class="col-md-12" >
                    <label class="col-sm-5 control-label widget-color-normal5 width-100px text-right"><g:message code="secondsReceived.merchantCode.label"></g:message><g:message code="dashBoard.system.colon"></g:message></label>
                    <div class="col-sm-7  no-padding-left has-feedback" >
                        <lable id = "merchantCode">
                            ${merchantCode}
                        </lable>
                    </div>
                </div>
            </div>
            <div id="posMdRateInfo" class="row" >
                <div id="newPosMdInfoDiv" class="col-md-12"  style="margin:0px auto;width:50%;margin-left:18%"></div>
            </div>
            %{--</g:form>--}%
        </div>
        %{--<div class="modal-footer">
            <div class="col-md-12 text-center">
                --}%%{--<a href="javascript:;" onclick="closeMaintenance()" class="btn btn-ok"> </a>--}%%{--
                --}%%{--
                                <g:link controller="secondsReceived" action="closePosMd" class="btn btn-ok" params="[merchantCode:secondsReceivedInstance?.merchantCode,receiptsName:secondsReceivedInstance?.receiptsName]"><g:message code="suiYiTongAuditDataQueryInstance.ok.label"/></g:link>
                --}%%{--
                <g:link class="closeMaintenance" mc="${secondsReceivedInstance?.merchantCode}" rn="${secondsReceivedInstance?.receiptsName}">
                    <g:message code="secondsReceived.ok.label"/>
                </g:link>
r
                <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="secondsReceived.cancle.label"/></button>
            </div>
        </div>--}%
                <div class="modal-footer">
                    <div class="col-md-12 text-center">
                    %{--<a href="javascript:;" onclick="closeMaintenance()" class="btn btn-ok"> </a>--}%
                    %{--
                                    <g:link controller="secondsReceived" action="closePosMd" class="btn btn-ok" params="[merchantCode:secondsReceivedInstance?.merchantCode,receiptsName:secondsReceivedInstance?.receiptsName]"><g:message code="suiYiTongAuditDataQueryInstance.ok.label"/></g:link>
                    --}%
                        %{--<g:link class="updateCommitButton" imc="${secondsReceivedInstance?.insideMerchantCode}" ed="${secondsReceivedInstance?.effectiveDate}">
                            <g:message code="secondsReceived.ok.label"/>
                        </g:link>--}%

                        <a href="javascript:;" onclick="updateRate()" class="btn btn-ok"><g:message code="secondsReceived.ok.label"/> </a>
                        <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="secondsReceived.cancle.label"/></button>
                    </div>
                </div>
            %{--</form:body>
            <form:actions>
                <div class="form-actions">
                    <div class="col-md-12 text-center">
                        <div class="col-md-6 text-right">
                            --}%%{--<button name="subButton" class="btn btn-submit" onclick="return validateForm();">--}%%{--
                            --}%%{--${message(code: 'secondsReceived.ok.label')}--}%%{--
                            --}%%{--</button>--}%%{--
                            <formActions:submit class="btn btn-submit" id="updateCommitButton" value="${message(code: 'secondsReceived.ok.label')}"/>
                        </div>
                        <div class="col-md-6 text-left"><button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="secondsReceived.cancle.label"></g:message> </button></div>
                    </div>

                </div>
            </form:actions>
        </g:uploadForm>--}%
    </portlet:body>
</component:portlet>