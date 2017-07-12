<g:if test="${panels}">
    <g:set var="panelList" value="${new groovy.json.JsonSlurper().parseText(panels)}"/>
    <g:each status="i" var="panel" in="${panelList}">
        <div id="home-panel-column-${i + 1}" class="col-md-4 col-sm-4 col-xs-12 column sortable">
            <g:if test="${panel}">
                <g:each status="j" var="one" in="${panel}">
                    <g:include controller="${one.controller}" action="${one.action}" params='[homePanelRow:"home-panel-row-${j + 1}"]'/>
                </g:each>
            </g:if>
        <!-- empty sortable porlet required for each columns! -->
            <div class="portlet portlet-sortable-empty"></div>
        </div>
    </g:each>
</g:if>

