<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'terminalQuery'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <formCommon:hiddenField id="flag" name="flag" value="${flag}"/>

    %{--begin 自定义模态窗口--}%

        <div class="modal modal-scroll fade" id="sample_modal1" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">${message(code: 'terminalQuery.terminalTransfer.label')}</h4>
                    </div>

                    <div class="modal-body"></div>

                    <div class="modal-footer">
                        %{-- <button type="button" class="btn default" data-dismiss="modal">确定划拨</button>--}%
                        %{-- <button type="button" class="btn blue"><g:message code="default.button.confirm.label"/></button>--}%
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <div class="table-toolbar">
            <div class="pull-right">
                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                        code="terminalQuery.transfer.show-pop.label"></g:message>"></i>
                <label class="button-group bootstro" data-bootstro-title="" data-bootstro-content="${message(code:"terminalQuery.logHistory.pageGuide.label")}<div class='input-view'><input id='terminalQuery.index' type='checkbox' class='popCheck'  onclick='neverShow();'/>下次不要显示<div>" data-bootstro-width="400px" data-bootstro-placement="top" data-bootstro-step="0">
                    <g:link controller="terminalQuery" action="show" data-modal-target="sample_modal1" class="btn btn-transfer transfer">
                        <g:message code="terminalQuery.transfer.label"></g:message></g:link>
                </label>

            </div>
        </div>

        <div class="table-scrollable">

     <table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap table-layout-fixed">
         <thead>
         <tr>
             <th class="left" width="65">
                 %{--<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">--}%
                     <component:checkbox title="" cssClass="group-checkable" property="sn"/><g:message code="cardManagement.checkAll.label"></g:message>
                     %{--<input type="checkbox" class="group-checkable" property="sn">--}%
                     %{--<span><g:message code="cardManagement.checkAll.label"></g:message></span>--}%
                 %{--</label>--}%
             </th>
                <domainSearchResult:header domain="terminalQuery" property="sn" width="80" popoverMessage="${message(code:"terminalQuery.sn.show-pop.label")}"/>
                <domainSearchResult:header domain="terminalQuery" property="goodsName" width="60"/>
                <domainSearchResult:header domain="terminalQuery" property="factShortName" width="100"/>
                <domainSearchResult:header domain="terminalQuery" property="model" width="60"/>
                <domainSearchResult:header domain="terminalQuery" property="communicationType" width="60"/>
                <domainSearchResult:header domain="terminalQuery" property="signa" width="60"/>
    %{--隐藏范围--}%
        <g:if test="${isAdmin}">
                <domainSearchResult:header domain="inventoryManagement" property="belongtoOrg" width="120"  popoverMessage="${message(code:"terminalQuery.belongtoOrg2.show-pop.label")}"/>
                <domainSearchResult:header domain="inventoryManagement" property="directlyOrg" width="120" popoverMessage="${message(code:"terminalQuery.directlyOrg.show-pop.label")}"/>
                <domainSearchResult:header domain="inventoryManagement" property="salesMan" width="80" popoverMessage="${message(code:"terminalQuery.salesMan2.show-pop.label")}"/>
        </g:if>
                <domainSearchResult:header domain="terminalQuery" property="assistMachineNet" width="60"/>
                <domainSearchResult:header domain="terminalQuery" property="putInStorageDate" width="120"/>
                <domainSearchResult:header domain="terminalQuery" property="installDate" width="120"/>
                <domainSearchResult:header domain="terminalQuery" property="merchantCode" width="120"/>
                <domainSearchResult:header domain="terminalQuery" property="terminalCode" width="120"/>
                <domainSearchResult:header domain="terminalQuery" property="status" width="40"/>
            </tr>
            </thead>
            <tbody><g:each var="terminalQueryInstance"
                           in="${terminalQueryInstanceList}">
                <tr class="text-nowrap">
                    <td class="center">
                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                            <input type="checkbox" class="checkboxes" name="sn"
                                   value="${terminalQueryInstance.deviceId}">
                            <span></span>
                        </label>
                    </td>
                    <td class="modId" style ="display:none;">${terminalQueryInstance.modId}</td>
                    <td class="factId" style ="display:none;">${terminalQueryInstance.factId}</td>
                    <td class="goodsId" style ="display:none;">${terminalQueryInstance.goodsId}</td>
                    <td class="status" style ="display:none;">${terminalQueryInstance.status}</td>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="terminalQuery" property="sn"
                                                domainInstance="${terminalQueryInstance}"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="terminalQuery" property="goodsName"
                                                domainInstance="${terminalQueryInstance}" />
                    <domainSearchResult:rowData textAlign="left" type="text" domain="terminalQuery" property="factShortName"
                                                domainInstance="${terminalQueryInstance}"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="terminalQuery" property="model"
                                                domainInstance="${terminalQueryInstance}"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="terminalQuery" property="communicationType"
                                                domainInstance="${terminalQueryInstance}"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="terminalQuery" property="signa"
                                                domainInstance="${terminalQueryInstance}"/>

    %{--隐藏范围--}%
        <g:if test="${isAdmin}">
                    <domainSearchResult:rowData textAlign="left" type="text" domain="inventoryManagement" property="belongtoOrg"
                                                domainInstance="${terminalQueryInstance}"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="inventoryManagement" property="directlyOrg"
                                                domainInstance="${terminalQueryInstance}"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="inventoryManagement" property="salesMan"
                                                domainInstance="${terminalQueryInstance}"/>
        </g:if>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="terminalQuery" property="assistMachineNet"
                                                domainInstance="${terminalQueryInstance}"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="terminalQuery" property="putInStorageString"
                                                domainInstance="${terminalQueryInstance}"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="terminalQuery" property="installString"
                                                domainInstance="${terminalQueryInstance}"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="terminalQuery" property="merchantCode"
                                                domainInstance="${terminalQueryInstance}"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="terminalQuery" property="terminalCode"
                                                domainInstance="${terminalQueryInstance}"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="terminalQuery" property="status"
                                                domainInstance="${terminalQueryInstance}"/>
                </tr></g:each>
            </tbody>
        </table>
        </div>
        <g:if test="${terminalQueryInstanceCount!= -1}">
        <component:paginate total="${terminalQueryInstanceCount }"/>
        </g:if>

        %{--<component:modals id="sample_modal2" title="batchOpen" width="lg"/>--}%



    </portlet:body>
</component:portlet>
<asset:stylesheet src="global/plugins/bootstro/css/bootstro.css"/>
<content tag="takin-footer">
    <asset:javascript src="global/plugins/bootstro/js/bootstro.js"/>
    <asset:javascript src="/machines/inventoryManagement.js"/>
    %{--<asset:javascript src="/machines/date-check.js"/>--}%
    <asset:javascript src="userNameList.js"/>
    <g:javascript>
        $(function () {
            console.log($("#flag").val()=="true")
            if($("#flag").val()=="true"){
                checkIsShowStro("terminalQuery.index");
            }

            initLoading();
            sspInventoryManagement.init();
            $("input").keyup(function(){this.value=this.value.replace(/\s/g,'')});
            //物品类型change
            getGoodsName("0");
            checkCallBack();
            //物品名称change
            $("#q_goodsName").on('change',function () {
                var goodsNameCode=$('#q_goodsName').val();
                $('#hiddenGoodsNameCode').val(goodsNameCode);
                $('#q_factShortName').empty();
                getFactShortName(goodsNameCode);
            })
            $('#showHistory').on('click', function (e) {
                e.preventDefault();
                var id = "queryOrderList";
                var name = this.text;
                var href = this.href;
                parent.$("#ANewWindow").trigger('openNewWindowchanged', [id, name, href]);
            })
        });
    </g:javascript>
</content>
