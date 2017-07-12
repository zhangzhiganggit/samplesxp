<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'attachedQuery'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <formCommon:hiddenField id="flag" name="flag" value="${flag}"/>

            %{--begin 自定义模态窗口--}%

            <div class="modal modal-scroll fade" id="sample_modal1" tabindex="-1" role="basic" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">${message(code: 'attachedQuery.attachedTransfer.label')}</h4>
                        </div>

                        <div class="modal-body"></div>

                        <div class="modal-footer"></div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        <div class="table-toolbar">
            <div class="pull-right" >
                %{-- <button type="button" class="btn btn-primary">

                 </button>--}%
                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                        code="attachedQuery.transfer.show-pop.label"></g:message>"></i>
                <label class="button-group bootstro" data-bootstro-title="" data-bootstro-content="${message(code:"attachedQuery.transfer.pageGuide.label")}<div class='input-view'><input id='attachedQuery.index' type='checkbox' class='popCheck'  onclick='neverShow();'/>下次不要显示<div>" data-bootstro-width="400px" data-bootstro-placement="top" data-bootstro-step="0">
                    <g:link data-modal-target="sample_modal1" class="btn btn-transfer transfer"
                            controller="attachedQuery" action="show">
                        <g:message code="attachedQuery.transfer.label"></g:message></g:link>
                </label>

            </div>
        </div>
        <div class="table-scrollable text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    <th class="left" width="65">
                        %{--<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">--}%
                            %{--<input type="checkbox" class="group-checkable" property="sn">--}%
                            %{--<span></span>--}%
                        %{--</label>--}%
                        <component:checkbox title="" cssClass="group-checkable" property="sn"/><g:message code="attachedQuery.checkAll.label"></g:message>
                    </th>
                    <domainSearchResult:header domain="attachedQuery" property="sn" width="90" popoverMessage="${message(code:"attachedQuery.sn.show-pop.label")}"/>
                    <domainSearchResult:header domain="attachedQuery" property="goodsName" width="60"/>
                    <domainSearchResult:header domain="attachedQuery" property="factShortName" width="100"/>
                    <domainSearchResult:header domain="attachedQuery" property="model" width="60"/>

                    <domainSearchResult:header domain="attachedQuery" property="putInStorageDate" width="120"/>
                    <domainSearchResult:header domain="attachedQuery" property="installDate" width="120"/>
                %{--隐藏范围--}%
                <g:if test="${isAdmin}">
                    <domainSearchResult:header domain="attachedQuery" property="belongToOrg" width="120" popoverMessage="${message(code:"attachedQuery.belongToOrg2.show-pop.label")}"/>
                    <domainSearchResult:header domain="attachedQuery" property="directlyOrg" width="120" popoverMessage="${message(code:"attachedQuery.directlyOrg2.show-pop.label")}"/>
                    <domainSearchResult:header domain="attachedQuery" property="salesMan" width="80" popoverMessage="${message(code:"attachedQuery.salesMan2.show-pop.label")}"/>
                </g:if>
                    <domainSearchResult:header domain="attachedQuery" property="status" width="30"/>
                    %{--<th><g:message code="default.actions.label"/></th>--}%
                </tr>
                </thead>
                <tbody><g:each var="attachedQueryInstance"
                               in="${attachedQueryInstanceList}">
                    <tr class="text-nowrap">
                        <td align="center">
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="checkboxes" name="sn"
                                       value="${attachedQueryInstance.deviceId}">
                                <span></span>
                            </label>
                        </td>
                        <td class="modId" style ="display:none;">${attachedQueryInstance.modId}</td>
                        <td class="factId" style ="display:none;">${attachedQueryInstance.factId}</td>
                        <td class="goodsId" style ="display:none;">${attachedQueryInstance.goodsId}</td>
                        <td class="status" style ="display:none;">${attachedQueryInstance.status}</td>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="attachedQuery" property="sn"
                                                    domainInstance="${attachedQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="attachedQuery" property="goodsName"
                                                    domainInstance="${attachedQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="attachedQuery" property="factShortName"
                                                    domainInstance="${attachedQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="attachedQuery" property="model"
                                                    domainInstance="${attachedQueryInstance}"/>

                        <domainSearchResult:rowData textAlign="center" type="text" domain="attachedQuery" property="putInStorageDate"
                                                    domainInstance="${attachedQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="attachedQuery" property="installDate"
                                                    domainInstance="${attachedQueryInstance}"/>
                 %{--隐藏范围--}%
                <g:if test="${isAdmin}">
                        <domainSearchResult:rowData textAlign="left" type="text" domain="attachedQuery" property="belongToOrg"
                                                    domainInstance="${attachedQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="attachedQuery" property="directlyOrg"
                                                    domainInstance="${attachedQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="attachedQuery" property="salesMan"
                                                    domainInstance="${attachedQueryInstance}"/>
                </g:if>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="attachedQuery" property="status"
                                                    domainInstance="${attachedQueryInstance}"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${attachedQueryInstanceCount!= -1 }">
             <component:paginate total="${attachedQueryInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
<asset:stylesheet src="global/plugins/bootstro/css/bootstro.css"/>
<content tag="takin-footer">
    <asset:javascript src="global/plugins/bootstro/js/bootstro.js"/>
    <asset:javascript src="/machines/inventoryManagement.js"/>
    <asset:javascript src="userNameList.js"/>
    <asset:javascript src="/machines/date-check.js"/>
    <g:javascript>
        $(function () {
            initLoading();
            console.log($("#flag").val()=="true")
            if($("#flag").val()=="true"){
                checkIsShowStro("attachedQuery.index");
            }

            sspInventoryManagement.init();
            $("input").keyup(function(){this.value=this.value.replace(/\s/g,'')});
            //物品类型change
            getGoodsName("1");
            checkCallBack();
            //物品名称change
            $("#q_goodsName").on('change',function () {
                var goodsNameCode=$('#q_goodsName').val();
                $('#hiddenGoodsNameCode').val(goodsNameCode);
                getFactShortName(goodsNameCode);
            })
        });
    </g:javascript>
</content>