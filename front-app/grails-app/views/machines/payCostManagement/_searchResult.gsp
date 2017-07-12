<component:portlet cssClass="scaffold-searchResult">
    <portlet:title
            title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'payCostManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body>
        <formCommon:hiddenField id="flag" name="flag" value="${flag}"/>

        <div class="table-toolbar">
            <div class="pull-right" data-bootstro-title="" >
                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                        code="payCostManagement.payCost.show-pop.label"></g:message>"></i>
                <label class="button-group bootstro" data-bootstro-content="${message(code:"payCostManagement.payCost.pageGuide.label")}<div class='input-view'><input id='payCostManagement.index' type='checkbox' class='popCheck'  onclick='neverShow();'/>下次不要显示<div>" data-bootstro-width="400px" data-bootstro-placement="top" data-bootstro-step="0">
                    <button class="btn btn-primary" data-toggle="modal" id="batchPay"> <g:message code="payCostManagement.payCost.label"></g:message></button>
                </label>
            </div>
        </div>

        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                   %{-- <th class="sorting_disabled" rowspan="1" colspan="1" aria-label=" " style="width: 66px;">
                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                            <input type="checkbox" class="group-checkable" property="merchantCode">
                            <span></span><g:message code="payCostManagement.checkAll.label"></g:message>
                        </label>
                    </th>--}%
                    <th width="65"><component:checkbox title="" cssClass="group-checkable" property="stringValue"
                                            dataSet="#sample_1 .checkboxes"/><g:message code="cardManagement.checkAll.label"></g:message> </th>
                    <domainSearchResult:header domain="payCostManagement" property="validDate" width="60"/>
                    <domainSearchResult:header domain="payCostManagement" property="cardNumber" width="160"/>
                    <domainSearchResult:header domain="payCostManagement" property="status" width="50"/>
                    <domainSearchResult:header domain="payCostManagement" property="belongtoOrg" width="120"/>
                    <domainSearchResult:header domain="payCostManagement" property="mno" width="120"/>
                    <domainSearchResult:header domain="payCostManagement" property="signPurchaseUnit" width="120"/>
                    <domainSearchResult:header domain="payCostManagement" property="posSn" width="70"/>
                    <domainSearchResult:header domain="payCostManagement" property="terminalSnNumber" width="60"/>
                    <th width="30"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="payCostManagementInstance"
                               in="${payCostManagementInstanceList}">
                    <tr class="text-nowrap">
                        <td class="center">
                           <g:if test="${payCostManagementInstance.status !='12'}"> <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="checkboxes" name="checkItem" value="${payCostManagementInstance.deviceId+'/'+payCostManagementInstance.cardNumber}">
                                <span></span>
                            </label></g:if>
                        </td>

                        <domainSearchResult:rowData textAlign="center" type="date" domain="payCostManagement" property="validDate"
                                                    domainInstance="${payCostManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="payCostManagement" property="cardNumber"
                                                    domainInstance="${payCostManagementInstance}" textAlign="center"/>
                        <domainSearchResult:rowData type="inList" domain="payCostManagement" property="status"
                                                    domainInstance="${payCostManagementInstance}" textAlign="center"/>
                        <domainSearchResult:rowData type="text" domain="payCostManagement" property="belongtoOrg" textAlign="left"
                                                    domainInstance="${payCostManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="payCostManagement" property="mno"
                                                    domainInstance="${payCostManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="payCostManagement" property="signPurchaseUnit"
                                                    domainInstance="${payCostManagementInstance}" textAlign="left"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="payCostManagement" property="posSn"
                                                    domainInstance="${payCostManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="payCostManagement" property="terminalSnNumber"
                                                    domainInstance="${payCostManagementInstance}"/>

                        <td class="tk-actions text-center">
                            <g:link data-toggle="modal" data-target="#sample_modal1"
                                    controller="payCostManagement" action="payCostRecord"
                                    id="${payCostManagementInstance?.cardNumber}"><g:message code="default.button.show.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <component:modals id="sample_modal1" title="" width="full"/>
        <g:if test="${payCostManagementInstanceCount != -1}">
            <component:paginate total="${payCostManagementInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
<asset:stylesheet src="global/plugins/bootstro/css/bootstro.css"/>
<content tag="takin-footer">
    <asset:javascript src="global/plugins/bootstro/js/bootstro.js"/>
    <g:javascript>
        $(function(){
            $(".group-checkable").on('click',function(){
                $("input[name='checkItem']").prop("checked", this.checked);
            });
            $("#batchPay").on('click',function(){
                batchPay()
            })
        });
        console.log($("#flag").val()=="true")
        if($("#flag").val()=="true"){
            checkIsShowStro("payCostManagement.index");
            }
        $(".checkboxes").on('click',function(){
            debugger
            var $subs = $(".checkboxes");
            $(".group-checkable").prop("checked", $subs.length == $subs.filter(":checked").length ? true : false);
        });

        function batchPay() {
            var flag = false;
            var selectItems = $("input[name='checkItem']:checkbox:checked");
            var deviceIds = [];
            selectItems.each(function() {
                deviceIds.push($(this).val());
                flag = true;
            });
            if(!flag){
                bootbox.alert("请先选择SIM卡，进行缴费!");
            }else{
                window.location.href='/payCostManagement/getBatchPayInfo?deviceIds='+deviceIds;
            }
        }

    </g:javascript>
</content>