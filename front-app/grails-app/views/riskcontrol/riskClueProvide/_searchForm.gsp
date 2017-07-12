<component:portlet cssClass="scaffold-search">

    %{--<portlet:title title="Mayday"/>--}%
    <portlet:body>
        <navtabs:tabs>
            <navtabs:tab title="${message(code: 'riskClueProvide.addRiskClue.label')}" tabUrl="tab_1_1" dataToggle="tab"/>
            <navtabs:tab title="${message(code: 'riskClueProvide.riskClueList.label')}" tabUrl="tab_1_2" dataToggle="tab" active="active"/>
        </navtabs:tabs>
        <navtabs:content>
            <navtabs:pane tabId="tab_1_1">
                <g:render template="/riskcontrol/riskClueProvide/provide"/>
            </navtabs:pane>
            <navtabs:pane tabId="tab_1_2" active="active">
                <g:render template="/riskcontrol/riskClueProvide/query"/>
            </navtabs:pane>
        </navtabs:content>
    </portlet:body>
</component:portlet>
