<component:portlet cssClass="scaffold-search">
    <form:form controller="systemAnnouncement" action="index" name="scaffold-search-systemAnnouncement">
        <form:scaffoldSearchProperties/>
        <form:body>
        </form:body>
        <form:actions>
        </form:actions>
    </form:form>

    <div class="portlet-title">
        <div class="caption">
            <i class="icon-bar-chart font-dark hide"></i>
            <span class="caption-subject font-dark bold uppercase">系统公告</span>
        </div>
    </div>

    <portlet:body>

        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap table-layout-fixed">
                <thead>
                <tr>

                    <domainSearchResult:header domain="systemAnnouncement" property="name" width="120"/>
                    <domainSearchResult:header domain="systemAnnouncement" property="type" width="60"/>
                    <domainSearchResult:header domain="systemAnnouncement" property="publishDate" width="30"/>
                    <domainSearchResult:header domain="systemAnnouncement" property="keyPoints" width="200"/>
                    <th width="30"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="systemAnnouncementInstance"
                               in="${systemAnnouncementInstanceList}">
                    <tr>
                        <domainSearchResult:rowData type="text" domain="systemAnnouncement" property="name"
                                                    domainInstance="${systemAnnouncementInstance}" textAlign="left"/>
                        <domainSearchResult:rowData type="text" domain="systemAnnouncement" property="type"
                                                    domainInstance="${systemAnnouncementInstance}" textAlign="left"/>
                        <domainSearchResult:rowData type="date" domain="systemAnnouncement" property="publishDate"
                                                    domainInstance="${systemAnnouncementInstance}" textAlign="center"/>
                        <domainSearchResult:rowData type="text" domain="systemAnnouncement" property="keyPoints"
                                                    domainInstance="${systemAnnouncementInstance}" textAlign="left"/>

                        <td class="tk-actions center" align="center">

                            <g:link controller="systemAnnouncement" action="show" params="[id1:systemAnnouncementInstance?.id]" ><g:message
                                    code="default.button.show.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    %{--page--}%

        <component:paginate total="${systemAnnouncementInstanceCount}"/>
    </portlet:body>
</component:portlet>