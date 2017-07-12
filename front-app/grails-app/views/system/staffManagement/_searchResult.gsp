
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'systemUser'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>

        <div class="table-toolbar">
            <div class="col-md-12 ">
                <div class="pull-right">
                    <g:link controller="staffManagement" action="create" class="btn btn-add-to">
                        添加
                    </g:link>
                </div>
            </div>
        </div>
        <div class="table-scrollable">
                <div class="table-scrollable">
                    <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                        <thead>
                        <tr>

                    <domainSearchResult:header domain="systemUser" property="loginName" width="60"/>

                    <domainSearchResult:header domain="systemUser" property="remarkName" width="70"/>
                    <domainSearchResult:header domain="systemUser" property="idCardName" width="70"/>

                    <domainSearchResult:header domain="systemUser" property="phone" width="80"/>
                    <th property="dateCreated" scope="col" width="80">
                        <g:message code="systemUser.createDate.label"></g:message>
                    </th>
                    <domainSearchResult:header domain="systemUser" property="status" width="30"/>

                    %{--<domainSearchResult:header domain="systemUser" property="password"/>
                    <domainSearchResult:header domain="systemUser" property="email"/>
                    <domainSearchResult:header domain="systemUser" property="accountCity"/>
                    <domainSearchResult:header domain="systemUser" property="accountExpired"/>
                    <domainSearchResult:header domain="systemUser" property="accountLocked"/>
                    <domainSearchResult:header domain="systemUser" property="accountName"/>
                    <domainSearchResult:header domain="systemUser" property="accountOpenBranch"/>
                    <domainSearchResult:header domain="systemUser" property="accountProvince"/>
                    <domainSearchResult:header domain="systemUser" property="cnapsCode"/>
                    <domainSearchResult:header domain="systemUser" property="enabled"/>
                    <domainSearchResult:header domain="systemUser" property="gender"/>
                    <domainSearchResult:header domain="systemUser" property="idCardNo"/>
                    <domainSearchResult:header domain="systemUser" property="officeTelephone"/>
                    <domainSearchResult:header domain="systemUser" property="openbankName"/>
                    <domainSearchResult:header domain="systemUser" property="orgName"/>
                    <domainSearchResult:header domain="systemUser" property="orgNo"/>
                    <domainSearchResult:header domain="systemUser" property="passwordChanged"/>
                    <domainSearchResult:header domain="systemUser" property="passwordExpired"/>
                    <domainSearchResult:header domain="systemUser" property="qq"/>
                    <domainSearchResult:header domain="systemUser" property="settleAccount"/>
                    <domainSearchResult:header domain="systemUser" property="settleAccountType"/>
                    <domainSearchResult:header domain="systemUser" property="wechat"/>--}%



                    <th width="120"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="systemUserInstance" in="${systemUserInstanceList }">
                    <tr>

                        <domainSearchResult:rowData type="text" domain="systemUser" property="loginName"
                                                    domainInstance="${systemUserInstance}" textAlign="center"/>

                        <domainSearchResult:rowData type="text" domain="systemUser" property="remarkName"
                                                    domainInstance="${systemUserInstance}" textAlign="left"/>

                        <domainSearchResult:rowData type="text" domain="systemUser" property="idCardName"
                                                    domainInstance="${systemUserInstance}" textAlign="left"/>

                        <domainSearchResult:rowData textAlign="center" type="text" domain="systemUser" property="phone"
                                                    domainInstance="${systemUserInstance}"/>
                        <td align="center"> <format:dateValue
                                prefix="systemUserInstance.dateCreated"
                                value="${systemUserInstance?.dateCreated}"/>
                        </td>
                        <domainSearchResult:rowData type="inList" domain="systemUser" property="status"
                                                    domainInstance="${systemUserInstance}" textAlign="center"/>



                        %{--  <domainSearchResult:rowData type="text" domain="systemUser" property="email"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="accountCity"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="boolean" domain="systemUser" property="accountExpired"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="boolean" domain="systemUser" property="accountLocked"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="accountName"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="accountOpenBranch"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="accountProvince"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="cnapsCode"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="boolean" domain="systemUser" property="enabled"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="number" domain="systemUser" property="gender"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="idCardNo"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="officeTelephone"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="openbankName"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="orgName"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="orgNo"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="boolean" domain="systemUser" property="passwordChanged"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="boolean" domain="systemUser" property="passwordExpired"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="qq"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="settleAccount"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="number" domain="systemUser" property="settleAccountType"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="userCode"
                                                      domainInstance="${systemUserInstance }"/>
                          <domainSearchResult:rowData type="text" domain="systemUser" property="wechat"
                                                      domainInstance="${systemUserInstance }"/>--}%



                        <td class="tk-actions">
                            <g:if  test="${systemUserInstance?.status==2}">

                                <g:link controller="staffManagement" action="show" id="${systemUserInstance?.id}"><g:message
                                        code="default.button.show.label"/></g:link>

                            </g:if>
                            <g:else>
                                <g:link controller="staffManagement" action="show" id="${systemUserInstance?.id}"><g:message
                                        code="default.button.show.label"/></g:link>


                                <g:if  test="${systemUserInstance?.canManagement == '1' }">


                                    <g:link controller="staffManagement" action="edit" id="${systemUserInstance?.id}">修改</g:link>

                                %{--修改密码--}%
                                    <g:link controller="systemUserPassword" action="index" id="${systemUserInstance.id}" params="[flag:1,url:'/staffManagement/index']"><g:message
                                            code="salesmanManagement.button.updatepassword.label"/></g:link>

                                %{--注销--}%
                                    %{--<g:link data-toggle="modal" data-target="#sample_modal1" controller="staffManagement" action="zhuxiao" id="${systemUserInstance?.id}"><g:message
                                            code="staffManagement.button.cancellation.label"/></g:link>--}%


                                %{--启用相关--}%
                                    <g:if test="${systemUserInstance?.status==3}">

                                        <a class="ssp-system-systemUser-enable"  id="${systemUserInstance?.id}">启用</a>

                                    %{--<g:link controller="staffManagement" action="enable" id="${systemUserInstance?.id}"><g:message
                                            code="salesmanManagement.button.enable.label"/></g:link>--}%
                                    </g:if>
                                    <g:if test="${systemUserInstance?.status==1}">

                                        <a class="ssp-system-systemUser-stop"  id="${systemUserInstance?.id}">停用</a>
                                    %{--    <g:link controller="staffManagement" action="disable" id="${systemUserInstance?.id}"><g:message
                                                code="salesmanManagement.button.disable.label"/></g:link>--}%
                                    </g:if>
                                </g:if>
                            </g:else>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
                </div>

        </div>
        <component:modals id="sample_modal1" title="注销" width="dialog"/>
    </portlet:body>
</component:portlet>
