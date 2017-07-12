
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'systemOrganizationResult'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>



        <div class="table-toolbar">
            <div class="col-md-12 ">
                <div class="pull-right">
                    <g:link controller="organization" action="create" class="btn btn-add-to">
                        添加
                    </g:link>
                </div>
            </div>
        </div>

        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">


                %{--机构编号	机构编号--}%
                %{--机构名称	机构名称--}%
                %{--机构电话	机构电话要求必须填座机--}%
                %{--机构管理者	显示机构管理者的备注名--}%
                %{--手机号	机构管理者手机号--}%
                %{--所属城市	机构的所属城市--}%
                %{--经营模式	机构的经营模式--}%
                %{--创建日期	创建人员生成的日期--}%
                %{--状态	当前机构状态：正常、停用、信息不全、注销--}%
                %{--操作	默认操作查看、修改、注销--}%
                %{--状态正常：显示停用--}%
                %{--状态停用：显示启用--}%


                <thead>
                <tr>
                    <domainSearchResult:header domain="systemOrganizationResult" property="id" width="80"/>
                    <domainSearchResult:header domain="systemOrganizationResult" property="orgName" width="100"/>
                    <domainSearchResult:header domain="systemOrganizationResult" property="organizationTelephone" width="90"/>
                    <domainSearchResult:header domain="systemOrganizationResult" property="idCardName" width="100"/>
                    <domainSearchResult:header domain="systemOrganizationResult" property="phone" width="100"/>
                    <domainSearchResult:header domain="systemOrganizationResult" property="cityName" width="100"/>
                    <domainSearchResult:header domain="systemOrganizationResult" property="orgRunProp" width="60"/>
                    <domainSearchResult:header domain="systemOrganizationResult" property="dateCreated" width="60"/>
                    <domainSearchResult:header domain="systemOrganizationResult" property="belongToOrg" width="120"/>
                    <domainSearchResult:header domain="systemOrganizationResult" property="orgStatus" width="60"/>

                    <th width="80"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody>

                <g:each var="systemOrganizationResultInstance" in="${systemOrganizationResultInstanceList }">
                    <tr>

                        <domainSearchResult:rowData type="text" domain="systemOrganizationResult" property="id"
                                                    domainInstance="${systemOrganizationResultInstance }" textAlign="center"/>
                        <domainSearchResult:rowData type="text" domain="systemOrganizationResult" property="orgName"
                                                domainInstance="${systemOrganizationResultInstance }" textAlign="left"/>
                        <domainSearchResult:rowData type="text" domain="systemOrganizationResult" property="organizationTelephone"
                                                domainInstance="${systemOrganizationResultInstance }" textAlign="right"/>
                        <domainSearchResult:rowData type="text" domain="systemOrganizationResult" property="idCardName"
                                                domainInstance="${systemOrganizationResultInstance }" textAlign="left"/>
                        <domainSearchResult:rowData type="text" domain="systemOrganizationResult" property="phone"
                                                domainInstance="${systemOrganizationResultInstance }" textAlign="center"/>
                        <domainSearchResult:rowData type="text" domain="systemOrganizationResult" property="cityName"
                                                domainInstance="${systemOrganizationResultInstance }" textAlign="left"/>
                        <domainSearchResult:rowData type="inList" domain="systemOrganizationResult" property="orgRunProp"
                                                domainInstance="${systemOrganizationResultInstance }" textAlign="left"/>

                        <td align="center"> <format:dateValue
                                prefix="systemOrganizationResultInstance.dateCreated"
                                value="${systemOrganizationResultInstance?.dateCreated}"/>
                        </td>

                        <domainSearchResult:rowData type="text" domain="systemOrganizationResult" property="belongToOrg"
                                                domainInstance="${systemOrganizationResultInstance }" textAlign="left"/>

                         <domainSearchResult:rowData type="inList" domain="systemOrganizationResult" property="orgStatus"
                                                domainInstance="${systemOrganizationResultInstance }" textAlign="center"/>
                    <td class="tk-actions" align="left">
                            %{--查看--}%
                            <g:link controller="organization" action="show" id="${systemOrganizationResultInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>

                            <g:if  test = "${systemOrganizationResultInstance?.canManage=='1'}" >
                            <g:link controller="organization" action="edit" id="${systemOrganizationResultInstance?.id}">修改</g:link>
                                <g:if test="${systemOrganizationResultInstance?.orgStatus.toString()=='1'}">
                                    <a  class="ssp-system-organization-stop" name="${systemOrganizationResultInstance?.orgName}" id="${systemOrganizationResultInstance?.id}" >停用</a>
                                </g:if>
                                <g:if test="${systemOrganizationResultInstance?.orgStatus.toString()=='2'}">
                                    <a  class="ssp-system-organization-enable" name="${systemOrganizationResultInstance?.orgName}" id="${systemOrganizationResultInstance?.id}" >启用</a>
                                </g:if>

 %{--                           <a  class="ssp-system-organization-logout" name="${systemOrganizationResultInstance?.orgName}" id="${systemOrganizationResultInstance?.id}" >注销</a>--}%
                            </g:if>


                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>

