
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'systemUser'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>

        <div class="table-toolbar">
            <div class="col-md-12 ">
                <a class="btn btn-total" id="showTotalBtn" style="float: left;">显示汇总</a>
                <p style="float: left;margin-left: 20px;display: none" id="may">
                    <span> 已认证 ：</span> <label  id="countNum" style="border: none;width: 150px" type="text"  readonly="readonly" >${userAuthentication}</label>
                    <span> 未认证 ：</span> <label  id="showNum"  style="border: none;width: 300px" type="text"  readonly="readonly" >${userAuthenticationEd}</label>
                </p>
                <div class="pull-right">
                    <g:link controller="salesmanManagement" action="create" class="btn btn-add-to">
                        添加
                    </g:link>
                </div>
            </div>
        </div>


                %{--<div class="portlet-title table-scrollable portlet light portlet-fit bordered">--}%
                    %{--<div class="form-group">--}%
                        %{--<div class="col-md-2">--}%
                            %{--<a class="btn btn-total" id="showTotalBtn" style="float: left;">显示汇总</a>--}%
                        %{--</div>--}%
                        %{--<p style="float: left;margin-left: 20px;display: none" id="may">--}%
                        %{--<div style="margin: 3px;" class="col-md-4">--}%
                            %{--<div class="col-md-6">--}%
                                %{--<span style="font-size:12px;color: #737373"> 已认证 ：</span>${userAuthentication}--}%
                            %{--</div>--}%
                            %{--<div class="col-md-6">--}%
                                %{--<span style="font-size:12px;color: #737373"> 未认证 ：</span>${userAuthenticationEd}--}%
                            %{--</div>--}%
                        %{--</div>--}%
                        %{--</p>--}%
                    %{--</div>--}%
                %{--</div>--}%


     %{--   <div class="table-scrollable">
            <div class="portlet light portlet-fit bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <span class="caption-subject bold font-dark uppercase">显示汇总</span>
                    </div>
                </div>

                <div class="portlet-body">
                    <div class="row">
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label class="col-md-4 control-label">已认证 ： </label>

                                    <div class="col-md-8" align="left">
                                        <p>${userAuthentication}</p>
                                    </div>

                                </div>

                                <div class="col-md-6">
                                    <label class="col-md-4 control-label">未认证 ：</label>

                                    <div class="col-md-8" align="left">
                                        <p>${userAuthenticationEd}</p>
                                    </div>
                                </div>
                            </div>

                    </div>
                    </div>


            </div>
        </div>--}%
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>

                    <domainSearchResult:header domain="systemUser" property="loginName" width="60"/>
                    <domainSearchResult:header domain="systemUser" property="remarkName" width="60"/>
                    <domainSearchResult:header domain="systemUser" property="idCardName" width="80"/>
                    <domainSearchResult:header domain="systemUser" property="phone" width="80"/>
                    %{--<domainSearchResult:header domain="systemUser" property="dateCreated"/>--}%
                    <th property="dateCreated" scope="col" width="60">
                        <g:message code="systemUser.createDate.label"></g:message>
                    </th>
                    <domainSearchResult:header domain="systemUser" property="authentication" width="60"/>
                    <domainSearchResult:header domain="systemUser" property="orgName" width="120"/>
                    <domainSearchResult:header domain="systemUser" property="belongToOrgName" width="120"/>

                    <domainSearchResult:header domain="systemUser" property="status" width="40"/>
                    <th width="140"><g:message code="default.actions.label"/></th>
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
                        <domainSearchResult:rowData type="text" domain="systemUser" property="phone"
                                                    domainInstance="${systemUserInstance}" textAlign="center"/>
                        <td align="center"> <format:dateValue
                                prefix="systemUserInstance.dateCreated"
                                value="${systemUserInstance?.dateCreated}"/>
                        </td>
                        <domainSearchResult:rowData type="inList" domain="systemUser" property="authentication"
                                                    domainInstance="${systemUserInstance}" textAlign="center"/>

                        <domainSearchResult:rowData type="inList" domain="systemUser" property="orgName"
                                                    domainInstance="${systemUserInstance}" textAlign="left"/>
                        <domainSearchResult:rowData type="inList" domain="systemUser" property="belongToOrgName"
                                                    domainInstance="${systemUserInstance}" textAlign="left"/>
                        <domainSearchResult:rowData type="inList" domain="systemUser" property="status"
                                                    domainInstance="${systemUserInstance}" textAlign="center"/>

                        <td class="tk-actions" align="left">

                        <g:if  test="${systemUserInstance?.status==2}">

                            <g:link controller="salesmanManagement" action="show" id="${systemUserInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>

                        </g:if>
                        <g:else>


                            <g:link controller="salesmanManagement" action="show" id="${systemUserInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>

                            <g:if  test="${systemUserInstance?.canManagement == '1' }">


                            <g:link controller="salesmanManagement" action="edit" id="${systemUserInstance?.id}">修改</g:link>

                            %{--注销--}%
                           %{-- <g:link data-toggle="modal" data-target="#sample_modal1" controller="salesmanManagement" action="zhuxiao" id="${systemUserInstance?.id}"><g:message
                                    code="salesmanManagement.button.cancellation.label"/></g:link>
--}%

                            %{--修改密码--}%
                                <g:link  data-target="#sample_modal1" controller="systemUserPassword" action="index" id="${systemUserInstance.id}" params="[flag:1,url:'/salesmanManagement/index']"><g:message
                                        code="salesmanManagement.button.updatepassword.label"/></g:link>


                            %{--启用相关--}%
                            <g:if test="${systemUserInstance?.status==3}">
                                <a class="ssp-system-systemUser-enable"  id="${systemUserInstance?.id}">启用</a>
                             %{--<g:link controller="salesmanManagement" action="enable" id="${systemUserInstance?.id}"><g:message--}%
                                        %{--code="salesmanManagement.button.enable.label"/></g:link>--}%
                            </g:if>
                                %{--停用--}%
                            <g:if test="${systemUserInstance?.status==1}">

                                <a class="ssp-system-systemUser-stop"  id="${systemUserInstance?.id}">停用</a>
                            %{--<g:link controller="salesmanManagement" action="disable" id="${systemUserInstance?.id}"><g:message--}%
                                    %{--code="salesmanManagement.button.disable.label"/></g:link>--}%
                            </g:if>
                                </g:if>
                        </g:else>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>

    %{--业务员注销--}%
        <component:modals id="sample_modal1" title="注销" width="dialog"/>
    </portlet:body>
</component:portlet>

