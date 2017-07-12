
<component:portlet>
    <portlet:title title="${message(code: 'handBrushMerchantManagement.batchEditTitle.label', args: message.domain(domain: 'handBrushMerchantManagement'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>

        <div class="col-md-12">
            <div class="form-group-sm">
                <div class="col-sm-4">
                    <input type="radio" name="belong"   value="emp" checked="" id="gritter-light" />人员
                    <input type="radio" name="belong" value="org"  style="margin-left: 20px" checked="" id="gritter-left" />机构


                </div>

                <div class="col-sm-4" id="p1" style="display: none">
                    <p >销售人员：<select class="form-control " style="float: left" name="q_salman" id="q_salmans">
                    </select></p>
                </div>
                <div class="col-sm-4 row " id="p2" style="display: none">
                    <p >下级销售组：<domainSearch:transferOrgTree domain="merchantManagement" property="belongToOrg" name="q_orgs"  directly="false"/>
                    </p>
                </div>


            </div>
        </div>



        <div class="table-scrollable text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="merchantCode"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="merchantName"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="merchantLinkMan"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="salesMan"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="merchantStatus" />
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="startDate" />




                </tr>
                </thead>
                <tbody><g:each var="handBrushMerchantManagementInstance"
                               in="${handBrushMerchantManagementInstanceList }">
                    <tr>

                        <domainSearchResult:rowData type="text" domain="merchantManagement" property="merchantCode"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantManagement" property="merchantName"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantManagement" property="merchantLinkMan"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantManagement" property="salesMan"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantManagement" property="merchantStatus"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantManagement" property="startDate"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>

                        <input type="text" name="inside" value="${handBrushMerchantManagementInstanceList.insideMerchantCode[0]}" style="display: none">

                    </tr></g:each>
                </tbody>
            </table>
        </div>

    </portlet:body>
    <div class="col-md-12 text-center">
        <button class="btn btn-modify Editor" id="${handBrushMerchantManagementInstanceList.insideMerchantCode[0]}">修改</button>
        <button class="btn btn-cancle" data-dismiss="modal" id="closed" >关闭</button>
    </div>
</component:portlet>
<asset:javascript src="merchant/merchant-query.js"/>
<asset:javascript src="/transfer-organization-tree.js"/>