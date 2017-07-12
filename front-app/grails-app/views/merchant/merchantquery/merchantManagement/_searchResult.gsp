<component:portlet cssClass="scaffold-searchResult">
    <portlet:title
            title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'merchantManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body>
    %{--begin 自定义模态窗口--}%

        <div class="modal modal-scroll fade" id="myModal" tabindex="-1" role="basic" aria-hidden="true" width="full">
            <div class="modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">批量修改归属</h4>
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
            <div class="col-md-12 ">
                <div class="pull-right">
                    <g:link controller="merchantIncome" action="create" class="btn btn-add-to">
                        添加
                    </g:link>
                    <g:link controller="merchantManagement" action="edit"
                            class="btn btn-batch-belong batchEditor" data-modal-target="myModal">批量修改归属</g:link>
                    %{--<component:modals id="myModal" title="批量修改归属" width="lg"/>--}%

                    <div class="btn-group ">
                        <select class="form-control takin-simpleTable  pull-right">
                            <option><g:message code="default.simpleTable.label"/></option>
                            <option><g:message code="default.generalTable.label"/></option>
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <div class="table-scrollable text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed" id="ss_1">
                <thead>
                <tr class="text-nowrap">
                    %{--<th>--}%
                    %{--<component:checkbox title="全选" cssClass="group-checkable" property="stringValue" dataSet="#ss_1 .checkboxes"/>--}%
                    %{--</th>--}%
                    <th align="left" width="65">
                        %{--<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">--}%
                            %{--<input type="checkbox" class="group-checkable" property="merchantCode">--}%
                            %{--<span></span>--}%
                        %{--</label>--}%
                    <component:checkbox title="" cssClass="group-checkable" property="merchantCode"/><g:message code="merchantManagement.checkAll.label"></g:message>
                    </th>

                    <domainSearchResult:header domain="merchantManagement" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="merchantManagement" property="merchantType" dataSimpleColumn="true" width="60"/>
                    <domainSearchResult:header domain="merchantManagement" property="specialMerchant" dataSimpleColumn="true" width="60"/>
                    <domainSearchResult:header domain="merchantManagement" property="merchantMark" dataSimpleColumn="true" width="60"/>
                    <domainSearchResult:header domain="merchantManagement" property="mecNormalLevel" dataSimpleColumn="true" width="60"/>
                    <domainSearchResult:header domain="merchantManagement" property="receiptsName" width="120"/>
                    <domainSearchResult:header domain="merchantManagement" property="localarea" dataSimpleColumn="true" width="90"/>
                    <domainSearchResult:header domain="merchantManagement" property="merchantLinkMan" width="80"/>
                    <domainSearchResult:header domain="merchantManagement" property="linkmanTelephone" dataSimpleColumn="true" width="90"/>
                    <domainSearchResult:header domain="merchantManagement" property="belongToOrg" popoverMessage="${message(code:"merchantManagement.belongToOrgResult.show-pop.label")}" width="120"/>
                    <domainSearchResult:header domain="merchantManagement" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="merchantManagement" property="salesMan" width="60"/>
                    <domainSearchResult:header domain="merchantManagement" property="merchantStatus" width="60"/>
                    <domainSearchResult:header domain="merchantManagement" property="startDate" width="60"/>
                    %{--<domainSearchResult:header domain="merchantManagement" property="comeInChannel" dataSimpleColumn="true"/>--}%
                    <domainSearchResult:header domain="merchantManagement" property="MCC" dataSimpleColumn="true" width="60"/>
                    <domainSearchResult:header domain="merchantManagement" property="businessClassify" dataSimpleColumn="true" width="60"/>
                    <domainSearchResult:header domain="merchantManagement" property="tradeStatus" dataSimpleColumn="true" width="60"/>
                    <domainSearchResult:header domain="merchantManagement" property="payStatus" dataSimpleColumn="true" width="60"/>



                    <th width="50"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="merchantManagementInstance"
                               in="${merchantManagementInstanceList}">
                    <tr class="text-nowrap">
                        <td align="center">
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="checkboxes" name="merchantCode"
                                       value="${merchantManagementInstance.insideMerchantCode}">
                                <span></span>
                            </label>
                        </td>

                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantManagement" property="merchantCode"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantManagement" property="merchantType"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantManagement" property="specialMerchant"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantManagement" property="merchantMark"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantManagement" property="mecNormalLevel"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantManagement" property="receiptsName"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantManagement" property="localarea"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantManagement" property="merchantLinkMan"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantManagement" property="linkmanTelephone"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantManagement" property="belongToOrg"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantManagement" property="directlyOrg"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantManagement" property="salesMan"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantManagement" property="merchantStatus"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantManagement" property="startDate"
                                                    domainInstance="${merchantManagementInstance}"/>

                        %{--<domainSearchResult:rowData type="text" domain="merchantManagement" property="comeInChannel"--}%
                        %{--domainInstance="${merchantManagementInstance}"/>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantManagement" property="MCC"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantManagement" property="businessClassify"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantManagement" property="tradeStatus"
                                                    domainInstance="${merchantManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantManagement" property="payStatus"
                                                    domainInstance="${merchantManagementInstance}"/>

                        <td class="tk-actions" align="left">
                            <g:link data-toggle="modal" data-target="#sample_modal1" controller="merchantManagement"
                                    action="show" id="${merchantManagementInstance?.insideMerchantCode}"><span class="clickShowList" id="${merchantManagementInstance.insideMerchantCode}" data="${merchantManagementInstance.agreementCode}"><g:message code="default.button.show.label"/></span></g:link>
                            <g:if test="${merchantManagementInstance.specialMerchant!='小微商户'}">
                                <g:link class="matl" controller="merchantIncomeModify" params='[merchantCode:"${merchantManagementInstance?.merchantCode}"]'
                                    action="edit" ><span class="clickShowList">修改</span></g:link>
                            </g:if>
                            <g:if test="${merchantManagementInstance.mecNormalLevel=='二类小微'}">
                                <g:link class="matl2" controller="merchantSmallAndMicroModify" params='[merchantCode:"${merchantManagementInstance?.merchantCode}"]'
                                        action="index" ><span class="clickShowList">修改</span></g:link>
                            </g:if>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${merchantManagementInstanceCount != -1}">
            <component:paginate total="${merchantManagementInstanceCount }"/>
        </g:if>
    %{--pos商户详情--}%
        <component:modals id="sample_modal1" title="查看详情" width="full"/>


    </portlet:body>
</component:portlet>
<content tag="takin-footer">

    <asset:javascript src="userNameList.js"/>
    <asset:javascript src="table-simple.js"/>
    <asset:javascript src="merchant/merchant-query.js"/>
    <asset:javascript src="merchant/ejs/ejs_production.js"/>
    <asset:javascript src="merchant/ejs/ejs_fulljslint.js"/>
    <asset:javascript src="merchant/ejs/products.js"/>
    <asset:javascript src="merchant/form-validation.js"/>
    <asset:javascript src="global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"/>
    <g:javascript>
        $(function(){
            $('.matl').on('click', function (e) {
                e.preventDefault();
                var id = this.href.replace(new RegExp("^(http|https)\:/\/([^\/]*)\/"), "").replace(/\//g, '_');
                var name = "商户修改";
                var href = this.href;
                parent.$("#ANewWindow").trigger('ANewWindowchanged', [id, name, href]);

            });
            $('.matl2').on('click', function (e) {
                e.preventDefault();
                var id = this.href.replace(new RegExp("^(http|https)\:/\/([^\/]*)\/"), "").replace(/\//g, '_');
                var name = "二类小微信息修改";
                var href = this.href;
                parent.$("#ANewWindow").trigger('ANewWindowchanged', [id, name, href]);

            });
            initLoading();
            SspMerchantQuery.init();

            $(".clickShowList").on('click',function () {
                var inMno=$(this).attr("id");
                var agreementNo=$(this).attr("data");
                getCurrentRateAgreement(inMno,agreementNo);
            });
            function getCurrentRateAgreement(inMno,agreementNo){
    		    $.ajax({
                url: "${g.createLink(controller: "merchantManagement", action: "billingWay")}",
                data:{
                    insideMerchantCode: inMno,agreementCode: agreementNo
                }

    	    }).done(function(resultJson) {

    	         resultJson = eval('('+resultJson+')');
                 resultJson.data.justView = true;
                 resultJson.data.preset = false;
                  if(resultJson.data.effDt == undefined){
                        resultJson.data.effDt = '';
                   }

                 var innerHtml = new EJS({
	        		url : '/assets/merchant/ejs/goods.txt'
	        		}).render(resultJson.data);

                setTimeout(function () {
                    // $("#showBillingWay").empty();
                    $("#showBillingWay").append(innerHtml);
                },1000);
    	    });
         }

        });
    </g:javascript>
</content>

