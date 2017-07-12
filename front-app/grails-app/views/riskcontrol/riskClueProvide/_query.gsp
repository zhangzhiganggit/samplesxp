<component:portlet cssClass="scaffold-search hide">
    <portlet:body withForm="true">
        <form:form controller="riskClueProvide" action="query"
                   name="scaffold-search-riskClueProvideQuery">
            <form:scaffoldSearchProperties/>
            </form:form>
        </portlet:body>
</component:portlet>

<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'riskClueProvide.listTitle.label')}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable  text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <domainSearchResult:header domain="riskClueProvide" property="serialNumber"/>
                    <domainSearchResult:header domain="riskClueProvide" property="theme"/>
                    <domainSearchResult:header domain="riskClueProvide" property="detailedContent"/>
                    <domainSearchResult:header domain="riskClueProvide" property="linkman"/>
                    <domainSearchResult:header domain="riskClueProvide" property="contactNumber"/>
                    <domainSearchResult:header domain="riskClueProvide" property="proposeTime"/>
                    <domainSearchResult:header domain="riskClueProvide" property="feedback"/>
                </tr>
                </thead>
                <tbody><g:each var="riskClueProvideInstance" status="i"
                               in="${riskClueProvideInstanceList}">
                    <tr>
                        <td align="center">${i + 1}</td>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="riskClueProvide" property="theme"
                                                    domainInstance="${riskClueProvideInstance}"/>
                        <g:if test="${riskClueProvideInstance.detailedContent.length() > 20}">
                            <td align="left"><p class="show-riskclue-pop" data-popover-message="${riskClueProvideInstance.detailedContent}">${riskClueProvideInstance.detailedContent.substring(0, 20)}...</p></td>
                        </g:if>
                        <g:else>
                            <td align="left">${riskClueProvideInstance.detailedContent}</td>
                        </g:else>


                        <domainSearchResult:rowData textAlign="left" type="text" domain="riskClueProvide" property="linkman"
                                                    domainInstance="${riskClueProvideInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="riskClueProvide" property="contactNumber"
                                                    domainInstance="${riskClueProvideInstance}"/>

                        <domainSearchResult:rowData textAlign="center" type="text" domain="riskClueProvide" property="proposeTime"
                                                    domainInstance="${riskClueProvideInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="riskClueProvide" property="feedback"
                                                    domainInstance="${riskClueProvideInstance}"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <component:paginate total="${riskClueProvideInstanceCount }"/>
    </portlet:body>
</component:portlet>

<div class="text-center">
    <button id="btn" class="btn btn-close" value="${message(code: 'merchantTerminalManagement.back.label')}">${message(code: 'merchantTerminalManagement.back.label')}
    </button>
</div>
<content tag="takin-footer">
    <g:javascript>
        // 后退
        $(function () {
            $("#btn").on('click', function () {
                window.location.href="/riskClueProvide/index";
            });


        })
    </g:javascript>
</content>