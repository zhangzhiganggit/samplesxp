
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'holidayPay'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>


        <div class="table-toolbar">
            %{--批量开通假日付--}%
            <g:render template="/products/holidayPay/batchOpen"></g:render>
            <div class="batchOpenResult"></div>
            <div class="btn-group pull-right">
                <button class="btn btn-batch-on" onclick="toBatchBu()" data-toggle="modal" data-target="#batchOpenholidayPayModal"><g:message code="holidayPay.button.batchOpen.label"/></button>
            </div>
        </div>

        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover no-footer dataTable table-layout-fixed" id="ss_1">
                <thead>
                <tr>
                    <domainSearchResult:header domain="holidayPay" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="holidayPay" property="receiptsname" width="120"/>
                    <domainSearchResult:header domain="holidayPay" property="belongtoOrgName" width="120"/>
                    <domainSearchResult:header domain="holidayPay" property="directlyOrgName" width="120"/>
                    <domainSearchResult:header domain="holidayPay" property="salesManName" width="80"/>
                    <domainSearchResult:header domain="holidayPay" property="status" width="30"/>
                    <domainSearchResult:header domain="holidayPay" property="rate" width="50"/>
                    <domainSearchResult:header domain="holidayPay" property="openingDate" width="60"/>
                    <th width="80"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>

                <tbody>
                <g:each var="holidayPayInstance" in="${holidayPayInstanceList }">
                    <tr class="text-nowrap">
                    <domainSearchResult:rowData type="text" domain="holidayPay" property="merchantCode"
                                                domainInstance="${holidayPayInstance }" id="mno" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="holidayPay" property="receiptsname"
                                                domainInstance="${holidayPayInstance }" textAlign="left" width="60"/>
                    <domainSearchResult:rowData type="text" domain="holidayPay" property="belongtoOrgName"
                                                domainInstance="${holidayPayInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="holidayPay" property="directlyOrgName"
                                                domainInstance="${holidayPayInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="holidayPay" property="salesManName"
                                                domainInstance="${holidayPayInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="inList" domain="holidayPay" property="status"
                                                domainInstance="${holidayPayInstance }"/>
                    <g:if test="${holidayPayInstance?.status == '3'}">
                        <td value=""></td>
                    </g:if>
                    <g:else>
                        <domainSearchResult:rowData type="text" domain="holidayPay" property="rate"
                                            domainInstance="${holidayPayInstance }" textAlign="right"/>

                    </g:else>
                    <g:if test="${holidayPayInstance?.status == '3'}">
                        <td value=""></td>
                    </g:if>
                    <g:else>
                        <domainSearchResult:rowData type="text" domain="holidayPay" property="openingDate"
                                            domainInstance="${holidayPayInstance }" textAlign="center"/>

                    </g:else>

                        <td class="tk-actions" align="left">
                            <g:if test="${holidayPayInstance?.status == '3'}">
                                <g:link class="openHolidayPay" mc="${holidayPayInstance?.merchantCode}">
                                    <g:message code="holidayPay.button.edit.label"/>
                                </g:link>
                            </g:if>
                            <g:link data-toggle="modal" data-target="#sample_modal" controller="holidayPay" action="showHistory" id="${holidayPayInstance?.merchantCode}"><g:message
                                    code="holidayPay.button.show.label"/></g:link>
                            <g:hiddenField name="merchantCode" value="${holidayPayInstance?.merchantCode}"/>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${holidayPayInstanceCount != -1}">
            <component:paginate total="${holidayPayInstanceCount }"/>
        </g:if>
        <component:modals id="sample_modal" title="操作记录"
                          width="lg"/>
    </portlet:body>

</component:portlet>

<content tag="takin-footer">
    %{--<asset:javascript src="table-simple.js"/>--}%
    <asset:javascript src="/validateLength.js"/>
    <asset:javascript src="/products/holidaypay.js"/>
    <asset:javascript src="/products/orgTreeLinkAge.js"/>
    <g:javascript>
        SspHolidayPay.init();
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

            $("input[name='q_receiptsname']").keyup(function(){
                this.value=this.value.replace(/\s/g,'');
                WidthCheck(this, 40)
            })

        });
    </g:javascript>

</content>
