
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'suiYiTongMerchant'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
    %{--修改限额--}%
        <component:modals id="sample_modal1" title="修改额度" width="lg"/>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="suiYiTongMerchant" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="suiYiTongMerchant" property="receiptsName" width="120"/>
                    <domainSearchResult:header domain="suiYiTongMerchant" property="belongtoOrgName" width="120"/>
                    <domainSearchResult:header domain="suiYiTongMerchant" property="directlyOrgName" width="120"/>
                    <domainSearchResult:header domain="suiYiTongMerchant" property="salesManName" width="80"/>
                    <domainSearchResult:header domain="suiYiTongMerchant" property="suiYiTongStatus" width="70"/>
                    <domainSearchResult:header domain="suiYiTongMerchant" property="suiYiTongRate" width="50"/>
                    <domainSearchResult:header domain="suiYiTongMerchant" property="suiYiTongAmount" width="60"/>
                    <domainSearchResult:header domain="suiYiTongMerchant" property="openingDate" width="60"/>
                    <th width="110"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="suiYiTongMerchantInstance"
                               in="${suiYiTongMerchantInstanceList }">
                    <tr class="text-nowrap">
                    <domainSearchResult:rowData type="text" domain="suiYiTongMerchant" property="merchantCode"
                                                domainInstance="${suiYiTongMerchantInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongMerchant" property="receiptsName"
                                                domainInstance="${suiYiTongMerchantInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongMerchant" property="belongtoOrgName"
                                                domainInstance="${suiYiTongMerchantInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongMerchant" property="directlyOrgName"
                                                domainInstance="${suiYiTongMerchantInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongMerchant" property="salesManName"
                                                domainInstance="${suiYiTongMerchantInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="inList" domain="suiYiTongMerchant" property="suiYiTongStatus"
                                                domainInstance="${suiYiTongMerchantInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongMerchant" property="suiYiTongRate"
                                                domainInstance="${suiYiTongMerchantInstance }" textAlign="right"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongMerchant" property="suiYiTongAmount"
                                                domainInstance="${suiYiTongMerchantInstance }" textAlign="right"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongMerchant" property="openingDate"
                                                domainInstance="${suiYiTongMerchantInstance }" textAlign="center"/>
                        <td class="tk-actions" align="left">
                            <g:if test="${suiYiTongMerchantInstance.suiYiTongStatus == '01'}">
                                <a href="javascript:;" onclick="closeMerchantSuiYiTong('${suiYiTongMerchantInstance?.insideMerchantCode}')">
                                    <g:message code="default.button.close.label"/>
                                </a>
                                <a href="javascript:;" onclick="pauseMerchantSuiYiTong('${suiYiTongMerchantInstance?.insideMerchantCode}')">
                                    <g:message code="suiYiTongMerchant.button.pause.label"/>
                                </a>
                                <g:link data-toggle="modal" data-target="#sample_modal1" controller="suiYiTongMerchant" action="toUpdateMerchantSuiYiTongAmount" params="[merchantCode:suiYiTongMerchantInstance?.merchantCode,insideMerchantCode:suiYiTongMerchantInstance?.insideMerchantCode,receiptsName:suiYiTongMerchantInstance?.receiptsName,suiYiTongAmount:suiYiTongMerchantInstance?.suiYiTongAmount,salesManName:suiYiTongMerchantInstance?.salesManName,salesManNo:suiYiTongMerchantInstance?.salesManNo]">
                                    <g:message code="suiYiTongMerchant.button.updateAmounnt.label"/>
                                </g:link>
                            </g:if>
                            <g:if test="${suiYiTongMerchantInstance.suiYiTongStatus == '02'}">
                                <a href="javascript:;" onclick="recoverMerchantSuiYiTong('${suiYiTongMerchantInstance?.insideMerchantCode}')">
                                    <g:message code="suiYiTongMerchant.button.recover.label"/>
                                </a>
                                <a href="javascript:;" onclick="closeMerchantSuiYiTong('${suiYiTongMerchantInstance?.insideMerchantCode}')">
                                    <g:message code="default.button.close.label"/>
                                </a>
                                <g:link data-toggle="modal" data-target="#sample_modal1" controller="suiYiTongMerchant" action="toUpdateMerchantSuiYiTongAmount" params="[merchantCode:suiYiTongMerchantInstance?.merchantCode,insideMerchantCode:suiYiTongMerchantInstance?.insideMerchantCode,receiptsName:suiYiTongMerchantInstance?.receiptsName,suiYiTongAmount:suiYiTongMerchantInstance?.suiYiTongAmount,salesManName:suiYiTongMerchantInstance?.salesManName,salesManNo:suiYiTongMerchantInstance?.salesManNo]">
                                    <g:message code="suiYiTongMerchant.button.updateAmounnt.label"/>
                                </g:link>
                            </g:if>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${suiYiTongMerchantInstanceCount != -1}">
            <component:paginate total="${suiYiTongMerchantInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/products/suiYiTongMerchant.js"/>
    <asset:javascript src="/validateLength.js"/>
    <asset:javascript src="/products/orgTreeLinkAge.js"/>
    <g:javascript>
        $(function () {

            var currentEmpDom = $("#q_salesManNo");
            $("#orgInput").bind('change',function () {
                var orgNo = $("#orgInputId").val();
                var currentEmpNo= $("#reSalesManNo").val();
                getOrgUserNameList(orgNo,currentEmpNo,currentEmpDom);

            })
            $('#orgInput').trigger("change");

            $("input[name='q_merchantCode']").attr('maxlength',15);
            $("input[name='q_merchantCode']").keyup(function () {
                this.value=this.value.replace(/[^+\d]/g,'');
            });

            $("input[name='q_receiptsName']").keyup(function(){
                this.value=this.value.replace(/\s/g,'');
                WidthCheck(this, 40)
            })
        });
    </g:javascript>
</content>
