<component:portlet cssClass="scaffold-search">
	<portlet:title title="${message(code: 'default.search.label', args: message.domain(domain: 'systemAnnouncement'))}" iconCssClass="fa fa-filter"
	/>
	<portlet:body withForm="true">
		<form:form controller="systemAnnouncement" action="index" name="scaffold-search-systemAnnouncement">
			<form:scaffoldSearchProperties/>
			<form:body>
				<domainSearch:textField domain="systemAnnouncement" property="name" />
			</form:body>
			<form:actions>
			</form:actions>
		</form:form>
	</portlet:body>
</component:portlet>