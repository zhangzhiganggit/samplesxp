
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'happyToSendMerchantQuery'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="businessName" width="120"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="mobileNo" width="70"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="belongtoOrgName" width="120"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="directlyOrgName" width="120"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="salesManName" width="60"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="merchantStatus" width="60"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="happyStatus" width="80"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="happyType" width="80"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="operationDate" width="80"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="openingDate" width="80"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="confirmOpeningDate" width="90"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="endDate" width="80"/>
                    <domainSearchResult:header domain="happyToSendMerchantQuery" property="sumAmount" width="80"/>
                </tr>
                </thead>
                <tbody><g:each var="happyToSendMerchantQueryInstance"
                               in="${happyToSendMerchantQueryInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="happyToSendMerchantQuery" property="merchantCode" textAlign="center"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendMerchantQuery" property="businessName" textAlign="left"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendMerchantQuery" property="mobileNo" textAlign="center"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendMerchantQuery" property="belongtoOrgName" textAlign="left"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendMerchantQuery" property="directlyOrgName" textAlign="left"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendMerchantQuery" property="salesManName" textAlign="left"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="inList" domain="happyToSendMerchantQuery" property="merchantStatus" textAlign="center"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="inList" domain="happyToSendMerchantQuery" property="happyStatus" textAlign="center"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="inList" domain="happyToSendMerchantQuery" property="happyType" textAlign="center"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendMerchantQuery" property="operationDate" textAlign="center"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendMerchantQuery" property="openingDate" textAlign="center"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendMerchantQuery" property="confirmOpeningDate" textAlign="center"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendMerchantQuery" property="endDate" textAlign="center"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendMerchantQuery" property="sumAmount" textAlign="right"
                                                domainInstance="${happyToSendMerchantQueryInstance }"/>
                        %{--<td class="tk-actions">--}%
                            %{--<g:link controller="happyToSendMerchantQuery" action="show" id="${happyToSendMerchantQueryInstance?.id}"><g:message--}%
                                    %{--code="default.button.show.label"/></g:link>--}%
                            %{--<g:link controller="happyToSendMerchantQuery" action="edit" id="${happyToSendMerchantQueryInstance?.id}"><g:message--}%
                                    %{--code="default.button.edit.label"/></g:link>--}%
                        %{--</td>--}%
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${happyToSendMerchantQueryInstanceCount != -1}">
            <component:paginate total="${happyToSendMerchantQueryInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
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
            // $("input[name='q_receiptsname']").attr('maxlength',20);
            $("input[name='q_merchantCode']").keyup(function () {
            this.value=this.value.replace(/[^+\d]/g,'');
            });

            $("input[name='q_businessName']").keyup(function(){
            this.value=this.value.replace(/\s/g,'');
            WidthCheck(this, 40)
            })

        });
    </g:javascript>
</content>
