<%@ page import="com.suixingpay.ssp.front.merchant.MerchantTerminalManagement" %>
<div class="modal fade modal-dialog modal-lg" id="removeResultModal" tabindex="-1" role="basic" aria-hidden="true">

    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            <h4 class="modal-title">${returnTitle}</h4>
        </div>

        <div class="modal-body">

            <portlet:body>
            <g:if test="${code != '0'}">
                <h5 style="color: red">${message}</h5>
            </g:if>
            <g:if test="${code == '0'}">
                <h5 style="color: green">${message}</h5>
            </g:if>
                <div >
                    <table class="table table-striped table-bordered table-hover dataTable no-footer">
                        <tbody><g:each var="resultStr"
                                       in="${resultList}" status="index">
                            <tr>
                                <td align="center">${resultStr}</td>
                                %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement"--}%
                                                            %{--property="posSerialNumber"--}%
                                                            %{--domainInstance="${result}"/>--}%
                                %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement"--}%
                                                            %{--property="terminalNumber"--}%
                                                            %{--domainInstance="${result}"/>--}%
                            </tr></g:each>
                        </tbody>
                    </table>
                </div>
                <div hidden="hidden">
                    <form action="getPdfReport" method="post" data-action="getPdfReport" id="getRemovePdfReport" target="_blank">
                        <form:body>
                            <formCommon:hiddenField name="merchantCode" id="merchantCode" value="${merchantTerminalManagementInstance?.merchantCode}"/>
                            <formCommon:hiddenField name="insideMerchantCode" id="insideMerchantCode" value="${merchantTerminalManagementInstance?.insideMerchantCode}"/>

                            <formCommon:hiddenField name="postyp" id="postyp" value="3"/>
                            <formCommon:hiddenField name="sign" id="sign88" value="1"/>
                            <formCommon:hiddenField id="attSnSim88" name="attSnSim" value="${merchantTerminalManagementInstance?.attSnSim}"/>
                            <formCommon:hiddenField id="attSnKey88" name="attSnKey" value="${merchantTerminalManagementInstance?.attSnKey}"/>
                            <formCommon:hiddenField id="trmSn88" name="trmSn" value="${merchantTerminalManagementInstance?.trmSn}"/>
                            <formCommon:hiddenField id="trmNo88" name="trmNo" value="${merchantTerminalManagementInstance?.trmNo}"/>
                            <formCommon:hiddenField id="modNm88" name="modNm" value="${merchantTerminalManagementInstance?.modNm}"/>

                        </form:body>
                        %{--</form:form>--}%
                    </form>
                </div>
                <div>
                    <div class="row">
                        <g:if test="${code==0}">
                            <div class="col-md-6 text-right">
                                %{--<button type="button" class="btn blue" data-dismiss="modal">确定</button>--}%
                                 <button type="button" class="btn btn-ok" onclick="merchantTerminalManagementSearchForm()">确定</button>
                            </div>

                            <div class="col-md-6 text-left">
                                %{--<button type="button" class="btn blue">打印</button>--}%
                                <button type="button" class="btn btn-print" onclick="printRemoveOrder()">打印</button>
                            </div>
                        </g:if>
                        <g:if test="${code!=0}">
                            <div class="col-md-12 text-center">
                                %{--<button type="button" class="btn blue" data-dismiss="modal">确定</button>--}%
                                <button type="button" class="btn btn-ok" onclick="merchantTerminalManagementSearchForm()">确定</button>
                            </div>
                        </g:if>
                    </div>
                </div>
            </portlet:body>
        </div>

        <div class="modal-footer">
        </div>
    </div>
</div>
<script type="text/javascript">
    function merchantTerminalManagementSearchForm(){
        $('#merchantTerminalManagementSearchForm').submit();
    }

    function printRemoveOrder(){
        $('#getRemovePdfReport').submit();
    }
</script>