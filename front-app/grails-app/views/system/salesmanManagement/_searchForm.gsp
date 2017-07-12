<%@ page import="com.suixingpay.ssp.front.system.SystemUser" %>

<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'bondOrder.search.label', args: message.domain(domain: 'systemUser'))}"
            iconCssClass="fa fa-filter" popHelper="${message(code:"systemUser.popHelper.label")}"/>
    <portlet:body withForm="true">
        <form:form
                id="salesmanManagementFrom"
                controller="salesmanManagement" action="index"
                   name="scaffold-search-salesmanManagement">
            <form:scaffoldSearchProperties/>
            <form:body>

                <domainSearch:textField domain="systemUser" property="loginName"/>
                <domainSearch:textField domain="systemUser" property="remarkName" popoverMessage="${message(code:"systemUser.remarkName.show-pop.label")}"/>
                <domainSearch:textField domain="systemUser" property="idCardName"/>

                %{--<domainSearch:textField domain="systemUser" property="status"/>--}%
                <g:if test="${com.suixingpay.ssp.front.system.SystemUser.constrainedProperties['status'].inList.get(1)==2}">
                    <input type="hidden" value="${com.suixingpay.ssp.front.system.SystemUser.constrainedProperties['status'].inList.remove(1)}">
                </g:if>
                <domainSearch:select domain="systemUser" property="status" class="form-control" name="q_status"
                                     from="${com.suixingpay.ssp.front.system.SystemUser.constrainedProperties['status'].inList}" valueMessagePrefix="SystemUser.status" value="${params ? params['q_status'] : ''}" noSelection="['-1':'--请选择--']"/>
                <domainSearch:textField domain="systemUser" property="phone"/>

                %{--<g:if test="${isAdmin}">--}%
                    %{--<domainSearch:orgTree domain="systemUser" property="orgName" name="q_orgName"  directly="true" class="orgName"/>--}%

                %{--</g:if>--}%
                <div class="col-xs-12 col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label col-md-4">
                           <g:message code="systemUser.parentOrg.label"></g:message>
                        </label>

                        <div class="col-md-8">
                            <input class="form-control" type="text" name="q_orgName" id="orgInput">
                            <input class="form-control" type="hidden" name="q_orgName_id" value="5138497260" id="orgInputId">
                            <input class="form-control" type="hidden" name="q_directly"  id="directly">
                            <div id="orgTree" class="pop-box jstree jstree-1 jstree-default" style="display: none;" role="tree" aria-multiselectable="true" tabindex="0" aria-activedescendant="5138497260" aria-busy="false"><ul class="jstree-container-ul jstree-children jstree-wholerow-ul jstree-no-dots" role="group"><li role="treeitem" aria-selected="true" aria-level="1" aria-labelledby="5138497260_anchor" aria-expanded="true" id="5138497260" class="jstree-node  jstree-open jstree-last"><div unselectable="on" role="presentation" class="jstree-wholerow jstree-wholerow-clicked">&nbsp;</div><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor jstree-clicked jstree-search" href="#" tabindex="-1" id="5138497260_anchor"><i class="jstree-icon jstree-themeicon" role="presentation"></i>红豆一代gdl</a><ul role="group" class="jstree-children"><li role="treeitem" aria-selected="false" aria-level="2" aria-labelledby="5138497260_noall_anchor" id="5138497260_noall" class="jstree-node  jstree-leaf"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor jstree-search" href="#" tabindex="-1" id="5138497260_noall_anchor"><i class="jstree-icon jstree-themeicon" role="presentation"></i>红豆一代gdl(直属)</a></li><li role="treeitem" aria-selected="false" aria-level="2" aria-labelledby="1870935264_anchor" aria-expanded="false" id="1870935264" class="jstree-node  jstree-closed"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="1870935264_anchor"><i class="jstree-icon jstree-themeicon" role="presentation"></i>红豆二代gdl2（常用）</a></li><li role="treeitem" aria-selected="false" aria-level="2" aria-labelledby="3725081964_anchor" aria-expanded="false" id="3725081964" class="jstree-node  jstree-closed"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="3725081964_anchor"><i class="jstree-icon jstree-themeicon" role="presentation"></i>的方法给和改好后</a></li><li role="treeitem" aria-selected="false" aria-level="2" aria-labelledby="3945168702_anchor" aria-expanded="false" id="3945168702" class="jstree-node  jstree-closed"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="3945168702_anchor"><i class="jstree-icon jstree-themeicon" role="presentation"></i>二代机构机构</a></li><li role="treeitem" aria-selected="false" aria-level="2" aria-labelledby="6597438021_anchor" aria-expanded="false" id="6597438021" class="jstree-node  jstree-closed"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="6597438021_anchor"><i class="jstree-icon jstree-themeicon" role="presentation"></i>红豆二代</a></li><li role="treeitem" aria-selected="false" aria-level="2" aria-labelledby="8167304592_anchor" aria-expanded="false" id="8167304592" class="jstree-node  jstree-closed jstree-last"><div unselectable="on" role="presentation" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="8167304592_anchor"><i class="jstree-icon jstree-themeicon" role="presentation"></i>1870935264</a></li></ul></li></ul></div>
                        </div>
                    </div>
                </div>


            </form:body>
            <form:actions>


                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-reset"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
