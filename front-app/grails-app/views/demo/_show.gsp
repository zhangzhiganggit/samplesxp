<component:portlet cssClass="scaffold-show">
	<portlet:title title="${message(code: 'default.show.label', args: message.domain(domain: 'demo'))}" />
	<portlet:body withForm="true">
		<form:form action="index">
			<form:body>
				<formCommon:hiddenField name="id" value="${demoInstance?.id}" />
				<domainShow:displayString domain="demo" property="stringValue" domainInstance="${demoInstance}" />
				<domainShow:displayNumber domain="demo" property="intValue" domainInstance="${demoInstance}" />
				<domainShow:displayNumber domain="demo" property="longValue" domainInstance="${demoInstance}" />
				<domainShow:displayNumber domain="demo" property="bigDecimalValue" domainInstance="${demoInstance}" />
				<domainShow:displayDate domain="demo" property="dateValue" domainInstance="${demoInstance}" />
				<domainShow:displayBoolean domain="demo" property="booleanValue" domainInstance="${demoInstance}" />
			</form:body>
			<form:actions>
				<formActions:submit value="${message(code: 'default.button.back.label')}" />
			</form:actions>
		</form:form>
	</portlet:body>
</component:portlet>
