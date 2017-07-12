<component:portlet cssClass="scaffold-search">
	<portlet:title title="${formTitle}" />
	<portlet:body withForm="true">
		<form:form controller="demo" action="${formAction}" name="scaffold-search-demo">
			<form:scaffoldSearchProperties/>
			<g:if test="${ formAction == 'update' }">
				<formCommon:hiddenField name="_method" value="PUT" id="_method"/>
				<formCommon:hiddenField name="id" value="${demoInstance?.id}" />
				<formCommon:hiddenField name="version" value="${demoInstance?.version}" />
			</g:if>
			<form:body>
				<domainEdit:textField domain="demo" property="stringValue" domainInstance="${demoInstance}" required="true" />
				<domainEdit:textField domain="demo" property="intValue" domainInstance="${demoInstance}" required="true" />
				<domainEdit:textField domain="demo" property="longValue" domainInstance="${demoInstance}" required="true" />
				<domainEdit:textField domain="demo" property="bigDecimalValue" domainInstance="${demoInstance}" required="true" />
				<domainEdit:textField domain="demo" property="dateValue" domainInstance="${demoInstance}" required="true" placeholder="yyyy-MM-dd" />
				<domainEdit:textField domain="demo" property="datetimeValue" domainInstance="${demoInstance}" required="true" placeholder="yyyy-MM-dd HH:mm:ss" />
				<domainEdit:comboBox domain="demo" property="rangeValue" domainInstance="${demoInstance}" required="true" />
				<domainEdit:booleanType domain="demo" property="booleanValue" value="${demoInstance?.booleanValue}" required="true" />
			</form:body>
			<form:actions>
				<formActions:submit value="${message(code: 'default.button.save.label')}" btnIconClass="fa fa-search" />
			</form:actions>
		</form:form>
	</portlet:body>
</component:portlet>
