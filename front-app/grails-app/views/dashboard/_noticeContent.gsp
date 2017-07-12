   <div class="tab-pane" id="portlet_comments_2">
        <g:each in="${systemAnnouncementInstanceList}" var="systemAnnouncementInstance">
            <div class="mt-comments">
                <div class="mt-comment">
                    <div class="mt-comment-body">
                        <div class="mt-comment-info">
                            <span class="mt-comment-author">${systemAnnouncementInstance?.name}</span>
                            <span class="mt-comment-date"><format:dateValue prefix="systemAnnouncement.publishDate"
                                                                            value="${systemAnnouncementInstance?.publishDate}"/></span>
                        </div>

                        <div class="mt-comment-text content" id="content_${systemAnnouncementInstance?.id}">
                            ${systemAnnouncementInstance?.keyPoints}
                        </div>

                        <div class="mt-comment-details">
                            <span class="mt-comment-status mt-comment-status-rejected">&nbsp;</span>
                            <ul class="mt-comment-actions">
                                <li>
                                    <g:link controller="systemAnnouncement" action="show" class="matl"  params="[id1:systemAnnouncementInstance?.id]"><g:message
                                            code="default.page.view.more"/></g:link>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </g:each>
   </div>

