<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'demo'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-toolbar">
            <div class="row">
            <div class="col-md-6">
                <div class="btn-group">
                    <button class="btn btn-default btn-sm">打印</button>
                    <button class="btn btn-default btn-sm">导出PDF</button>
                    <button class="btn btn-default btn-sm">导出EXCEL</button>
                </div>
            </div>

            <div class="col-md-6">
                <div class="btn-group pull-right">
                    <select class="form-control takin-simpleTable">
                        <option><g:message code="default.simpleTable.label"/></option>
                        <option><g:message code="default.generalTable.label"/></option>
                    </select>
                </div>
            </div>
        </div>
        </div>

        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover order-column">
                <thead>
                <tr>
                    <domainSearchResult:header domain="demo" property="stringValue"/>
                    <domainSearchResult:header domain="demo" property="intValue"/>
                    <domainSearchResult:header domain="demo" property="longValue" dataSimpleColumn="true"/>
                    <domainSearchResult:header domain="demo" property="bigDecimalValue"/>
                    <domainSearchResult:header domain="demo" property="rangeValue" dataSimpleColumn="true"/>
                    <domainSearchResult:header domain="demo" property="booleanValue"/>
                    <domainSearchResult:header domain="demo" property="dateValue"/>
                    <domainSearchResult:header domain="demo" property="datetimeValue" dataSimpleColumn="true"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="demoInstance" in="${demoInstanceList}">
                    <tr>
                        <domainSearchResult:rowData type="text" domain="demo" property="stringValue" domainInstance="${demoInstance}"/>
                        <domainSearchResult:rowData type="number" domain="demo" property="intValue" domainInstance="${demoInstance}"/>
                        <domainSearchResult:rowData type="number" domain="demo" property="longValue" domainInstance="${demoInstance}"/>
                        <domainSearchResult:rowData type="number" domain="demo" property="bigDecimalValue" domainInstance="${demoInstance}"/>
                        <domainSearchResult:rowData type="text" domain="demo" property="rangeValue" domainInstance="${demoInstance}"/>
                        <domainSearchResult:rowData type="boolean" domain="demo" property="booleanValue" domainInstance="${demoInstance}"/>
                        <domainSearchResult:rowData type="date" domain="demo" property="dateValue" domainInstance="${demoInstance}"/>
                        <domainSearchResult:rowData type="date" domain="demo" property="datetimeValue" domainInstance="${demoInstance}"/>
                        <td class="tk-actions">
                            <g:link controller="demo" action="show" id="${demoInstance?.id}"><g:message code="default.button.show.label"/></g:link>
                            <g:link controller="demo" action="edit" id="${demoInstance?.id}"><g:message code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <component:paginate total="${demoInstanceCount}"/>
        %{--<g:paginate controller="demo" action="index" total="${demoInstanceCount}"/>--}%
    </portlet:body>
</component:portlet>
