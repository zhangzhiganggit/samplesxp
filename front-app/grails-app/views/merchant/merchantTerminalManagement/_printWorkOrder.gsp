<%@ page import="com.suixingpay.ssp.front.merchant.MerchantTerminalManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title"><g:message code="merchantTerminalManagement.printWorkOrder.label"/>&nbsp;<h6><g:message code="merchantTerminalManagement.singleSupplement.info.label"/></h6></h4>
</div>

<div class="modal-body">
    <component:portlet>
        <portlet:title
                title="${message(code: 'merchantTerminalManagement.merchantInformation.label', args: message.domain(domain: 'merchantTerminalManagement'))}"/>
        <portlet:body withForm="true">
            <form action="getPdfReport" method="post" data-action="getPdfReport" id="getPdfReport" target="_blank">
            %{--<form:form id="getPdfReport" action="getPdfReport" ta>--}%
                <form:body>
                    <formCommon:hiddenField name="merchantCode" id="merchantCode" value="${merchantTerminalManagementInstance?.merchantCode}"/>
                    <formCommon:hiddenField name="insideMerchantCode" id="insideMerchantCode" value="${merchantTerminalManagementInstance?.insideMerchantCode}"/>
                    <input type="hidden" name="printPosData" id="printPosData" />
                    <input type="hidden" name="postyp" id="postyp" />
                    <formCommon:hiddenField name="id" value="${merchantTerminalManagementInstance?.id}"/>

                    <domainShow:displayString domain="merchantTerminalManagement" property="merchantCode"
                                              domainInstance="${merchantTerminalManagementInstance}"/>
                    <domainShow:displayString domain="merchantTerminalManagement" property="businessName"
                                              domainInstance="${merchantTerminalManagementInstance}"/>

                    <domainShow:displayString domain="merchantTerminalManagement" property="registName"
                                              domainInstance="${merchantTerminalManagementInstance}"/>

                    <domainShow:displayString domain="merchantTerminalManagement" property="installMachinesAddress"
                                              domainInstance="${merchantTerminalManagementInstance}"/>
                </form:body>
            %{--</form:form>--}%
            </form>
            <div class="table-toolbar">
                <div class="col-md-12">
                    <div class="pull-left">
                        <button  class="btn btn-print" onclick="printOrder()" >${message(code: 'merchantTerminalManagement.print.label')}</button>
                    </div>
                </div>
            </div>
        </portlet:body>
    </component:portlet>
    %{--<component:portlet cssClass="scaffold-search hide">--}%
        %{--<portlet:body withForm="true">--}%
            %{--<form:form id="merchantTerminalManagementPrintOrderForm" controller="merchantTerminalManagement" action="printWorkOrder"--}%
                       %{--name="scaffold-search-merchantTerminalManagementPrint">--}%
                %{--<form:scaffoldSearchProperties/>--}%
                %{--<form:body>--}%
                    %{--<formCommon:hiddenField name="merchantCode" id="merchantCode" value="${merchantTerminalManagementInstance?.merchantCode}"/>--}%
                    %{--<formCommon:hiddenField name="insideMerchantCode" id="insideMerchantCode" value="${merchantTerminalManagementInstance?.insideMerchantCode}"/>--}%
                %{--</form:body>--}%
                %{--<form:actions>--}%
                    %{--<formActions:submit value="${message(code: 'default.button.search.label')}"--}%
                                        %{--btnCssClass="btn btn-search"/>--}%
                    %{--<formActions:reset value="${message(code: 'default.button.reset.label')}"--}%
                                       %{--btnCssClass="btn btn-reset"/>--}%
                %{--</form:actions>--}%
            %{--</form:form>--}%
        %{--</portlet:body>--}%
    %{--</component:portlet>--}%
    <component:portlet cssClass="scaffold-searchResult">
        <portlet:title
                title="${message(code: 'merchantTerminalManagement.singleSupplement.label')}"/>
    <portlet:body>

        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <th>
                        %{--<component:checkbox cssClass="group-checkable" property="stringValue" dataSet="#sample_1 .checkboxes"/>全选--}%
                    </th>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="terminalNumber"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="operationDate"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="operationType"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="communicationWay"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="factory"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="terminalModel"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="posSerialNumber"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="passwordKeyboardModel"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="keyboardSerialNumber"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="simNumber"/>

                    %{--<th><g:message code="default.actions.label"/></th>--}%
                </tr>
                </thead>
                <tbody><g:each var="merchantTerminalManagementInstance"
                               in="${orderPrintList }">
                    <tr class="trRow">
                        <td><component:checkbox title="" cssClass="checkboxes" property="stringValue" dataSet="#sample_1 .checkboxes"/></td>

                        </td>
                        <td class="trmNo" textAlign="center">${merchantTerminalManagementInstance.terminalNumber}</td>
                        %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement" property="terminalNumber"--}%
                        %{--domainInstance="${merchantTerminalManagementInstance }"/>--}%
                        <td style="display:none;" class="outTm">${merchantTerminalManagementInstance.operationTime}</td>
                        <td class="outTemp" textAlign="center">${merchantTerminalManagementInstance.operationDate}</td>
                         %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement" property="operationDate"--}%
                        %{--domainInstance="${merchantTerminalManagementInstance }"/>--}%
                        <td class="logType" textAlign="center">${merchantTerminalManagementInstance.operationType}</td>
                         %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement" property="operationType"--}%
                        %{--domainInstance="${merchantTerminalManagementInstance }"/>--}%
                        <td class="connTyp" textAlign="center"><g:message
                            code="merchantTerminalManagement.communicationWay.${merchantTerminalManagementInstance.communicationWay}"/></td>
                        %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement" property="communicationWay"--}%
                        %{--domainInstance="${merchantTerminalManagementInstance }"/>--}%
                        <td class="mfrNm" textAlign="center">${merchantTerminalManagementInstance.factory}</td>
                        %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement" property="factory"--}%
                        %{--domainInstance="${merchantTerminalManagementInstance }"/>--}%
                        <td class="modNo" textAlign="center">${merchantTerminalManagementInstance.terminalModel}</td>
                        %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement" property="terminalModel"--}%
                        %{--domainInstance="${merchantTerminalManagementInstance }"/>--}%
                        <td class="trmSn" textAlign="center">${merchantTerminalManagementInstance.posSerialNumber}</td>
                        %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement" property="posSerialNumber"--}%
                        %{--domainInstance="${merchantTerminalManagementInstance }"/>--}%
                        <td class="modKeyNm" textAlign="center">${merchantTerminalManagementInstance.passwordKeyboardModel}</td>
                        %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement" property="passwordKeyboardModel"--}%
                        %{--domainInstance="${merchantTerminalManagementInstance }"/>--}%
                        <td class="modKeyNo" textAlign="center">${merchantTerminalManagementInstance.keyboardSerialNumber}</td>
                        %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement" property="keyboardSerialNumber"--}%
                        %{--domainInstance="${merchantTerminalManagementInstance }"/>--}%
                        <td class="simNo" textAlign="center">${merchantTerminalManagementInstance.simNumber}</td>
                        %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement" property="simNumber"--}%
                        %{--domainInstance="${merchantTerminalManagementInstance }"/>--}%
                        <td style="display:none;" class="deviceType">${merchantTerminalManagementInstance.deviceType}</td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        %{--<component:paginate total="${orderPrintListCount}" offset="${params?.modal_offset ?: 0 }" max="${params?.modal_max ?: 10 }"/>--}%
    </portlet:body>
</component:portlet>

<button type="button" class="btn btn-close" data-dismiss="modal"><g:message
        code="default.button.close.label"/></button>
</div>
<div class="modal-footer">
</div>
<script type="text/javascript">

    function printOrder(){
        var dataArray = [];
        $(":checkbox:checked").each(function(){
            var parent = $(this).parents(".trRow");
            dataArray.push(
                    new trObject(parent.find(".trmNo").text(),
                            parent.find(".outTm").text(),
                            parent.find(".outTemp").text(),
                            parent.find(".logType").text(),
                            parent.find(".connTyp").text(),
                            parent.find(".trmSn").text(),
                            parent.find(".mfrNm").text(),
                            parent.find(".modNo").text(),
                            parent.find(".modKeyNm").text(),
                            parent.find(".modKeyNo").text(),
                            parent.find(".simNo").text()));
        });
        console.log(dataArray);
        console.log("~~~~~~~~~~~~~~");
        if(dataArray.length == 0){
            bootbox.alert("没有要打印的信息！");
            return;
        }
        if(!validateValue(dataArray)){
            return ;
        }
        if(dataArray[0].logType == "换机"){
            if(dataArray.length == 2){
                if(dataArray[0].outTm != dataArray[1].outTm){
                    bootbox.alert("请正确选择配套的Pos信息！");
                    return ;
                }
            }else{

            }
        }else{
            var modNo = dataArray[0].modNo;
            for(var i=0;i<dataArray.length;i++){
                if( modNo != dataArray[i].modNo ){
                    bootbox.alert("请选择同一种POS！");
                    return;
                }
            }
        }
        var postyp = 1;
        if(dataArray[0].logType == "换机"){
            postyp =2;
        }else if(dataArray[0].logType == "撤机"){
            postyp =3;
        }
        $("#postyp").val(postyp);
        $("#printPosData").val(JSON.stringify(dataArray));
        $("#getPdfReport").submit();
    }

    function validateValue(dataArray){
        var outTm = dataArray[0].tmSmp;
        var logType = dataArray[0].logType;
        var modNo = dataArray[0].modNo;
        for(var i=0;i<dataArray.length;i++){
            if(outTm != dataArray[i].tmSmp){
                bootbox.alert("请选择同一天的Pos信息！");
                return false;
            }
            if(logType != dataArray[i].logType){
                bootbox.alert("请选择同一操作类型！");
                return false;
            }
//            if( modNo != dataArray[i].modNo ){
//                bootbox.alert("请选择同一种POS！");
//                return false;
//            }
        }
        return true;
    }

    function trObject(trmNo,outTm,outTemp,logType,connTyp,trmSn,mfrNm,
                      modNo,modKeyNm,modKeyNo,simNo){
        this.trmNo = trmNo;
        this.outTm = outTm;
        this.tmSmp = outTemp;
        this.logType = logType;
        this.connTyp = connTyp;
        this.trmSn = trmSn;
        this.mfrNm = mfrNm;
        this.modNo = modNo;
        this.modKeyNm = modKeyNm;
        this.attSnKey = modKeyNo;
        this.attSnSim = simNo;
        return this;
    }

</script>

