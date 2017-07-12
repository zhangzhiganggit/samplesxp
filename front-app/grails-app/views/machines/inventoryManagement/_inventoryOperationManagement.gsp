<%@ page import="com.suixingpay.ssp.front.machines.InventoryManagement" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'inventoryManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <formCommon:hiddenField id="flag" name="flag" value="${flag}"/>

        %{--begin 自定义模态窗口--}%

        <div class="modal modal-scroll fade" id="sample_modal1" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">${message(code: 'inventoryManagement.inventoryTransfer1.label')}</h4>
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
        <!-- /.modal -->
    %{--end 自定义模态窗口--}%
    %{--在库存中查询结果--}%

        <div class="table-toolbar">
            <div class="button-group pull-right">
                %{-- <button type="button" class="btn btn-primary">

                 </button>--}%
                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                        code="inventoryManagement.transfer.show-pop.label"></g:message>"></i>
                <label class="button-group bootstro" data-bootstro-title="" data-bootstro-content="${message(code:"inventoryManagement.logHistory.pageGuide.label")}<div class='input-view'><input id='inventoryManagement.index' type='checkbox' class='popCheck'  onclick='neverShow();'/>下次不要显示<div>" data-bootstro-width="400px" data-bootstro-placement="top" data-bootstro-step="0">
                <g:link data-modal-target="sample_modal1" class="btn btn-transfer transfer" controller="inventoryManagement" action="inventoryTransfer">
                      <g:message code="inventoryManagement.transfer.label"></g:message></g:link>
            </div>
        </div>

        <div class="table-scrollable text-nowrap "  >
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <th class="sorting_disabled" rowspan="1" colspan="1" aria-label=" " style="width: 66px;">
                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                            <input type="checkbox" class="group-checkable" property="sn">
                            <span></span>
                        </label>
                    </th>
                    <domainSearchResult:header domain="inventoryManagement" property="sn" popoverMessage="${message(code:"inventoryManagement.sn.show-pop.label")}"/>
                    <domainSearchResult:header domain="inventoryManagement" property="goodsName"/>
                    <domainSearchResult:header domain="inventoryManagement" property="factShortName"/>
                    <domainSearchResult:header domain="inventoryManagement" property="model"/>
                    <domainSearchResult:header domain="inventoryManagement" property="communicationType"/>
                    <domainSearchResult:header domain="inventoryManagement" property="signa"/>

                    <g:if test="${isAdmin}">
                    <domainSearchResult:header domain="inventoryManagement" property="belongtoOrg" popoverMessage="${message(code:"inventoryManagement.belongtoOrg2.show-pop.label")}"/>
                    <domainSearchResult:header domain="inventoryManagement" property="directlyOrg" popoverMessage="${message(code:"inventoryManagement.directlyOrg.show-pop.label")}"/>
                    <domainSearchResult:header domain="inventoryManagement" property="salesMan" popoverMessage="${message(code:"inventoryManagement.salesMan2.show-pop.label")}"/>
                    </g:if>
                    <domainSearchResult:header domain="inventoryManagement" property="assistMachineNet"/>
                    <domainSearchResult:header domain="inventoryManagement" property="putInStorageString"/>
                    <domainSearchResult:header domain="inventoryManagement" property="status"/>
                </tr>
                </thead>
                <tbody><g:each var="inventoryManagementInstance"
                               in="${inventoryManagementInstanceList}">
                    <tr class="text-nowrap">

                        <td>
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="checkboxes" name="sn"
                                       value="${inventoryManagementInstance.deviceId}">
                                <span></span>
                            </label>
                        </td>
                        <td calss="factSn">
                            ${inventoryManagementInstance['sn']}
                        </td>
                        <td class="modId" style ="display:none;">${inventoryManagementInstance.modId}</td>
                        <td class="factId" style ="display:none;">${inventoryManagementInstance.factId}</td>
                        <td class="goodsId" style ="display:none;">${inventoryManagementInstance.goodsId}</td>
                        <td class="status" style ="display:none;">${inventoryManagementInstance.status}</td>
          %{--              <domainSearchResult:rowData type="text" domain="inventoryManagement" property="sn"
                                                    domainInstance="${inventoryManagementInstance}"/>--}%
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="goodsName"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="factShortName"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="model"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement"
                                                    property="communicationType"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="signa"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        %{--隐藏范围--}%
                        <g:if test="${isAdmin}">
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="belongtoOrg"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="directlyOrg"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="salesMan"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        </g:if>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="inventoryManagement" property="assistMachineNet"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="inventoryManagement" property="putInStorageString"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="status"
                                                    domainInstance="${inventoryManagementInstance}"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>



    %{--     <div class="row">

             <div class="col-md-12" align="right">
                 <a class="bootbox btn blue btn-outline sbold uppercase" id="demo_1">确定划拨</a>
                 <button type="button" class="btn btn-default red btn-outline">
                     <g:message code="merchantTerminalManagement.back.label"></g:message></button>
             </div>
         </div>--}%
        <component:paginate total="${inventoryManagementInstanceCount}" pageSizeChoose="true" />

    </portlet:body>
</component:portlet>
<asset:stylesheet src="global/plugins/bootstro/css/bootstro.css"/>
<content tag="takin-footer">
 <asset:javascript src="global/plugins/bootstro/js/bootstro.js"/>
 <asset:javascript src="/machines/newInventoryManagement.js"/>
 <asset:javascript src="userNameList.js"/>
 <g:javascript>
    $(function(){
        console.log($("#flag").val()=="true")
        if($("#flag").val()=="true"){
            checkIsShowStro("inventoryManagement.index");
        }        initLoading();
        sspInventoryManagement.init();
        $("input").keyup(function(){this.value=this.value.replace(/\s/g,'')});
/*        $(".group-checkable").on('click', function () {
            $("input[name='sn']").prop("checked", this.checked);
        })
        $(".checkboxes").on('click', function () {
            var $subs = $(".checkboxes");
            $(".group-checkable").prop("checked", $subs.length == $subs.filter(":checked").length ? true : false);
        });*/
    });

</g:javascript>
</content>

