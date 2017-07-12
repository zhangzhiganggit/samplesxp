<g:if test="${message}">
	<g:set var="flashType" value="${type ? (type in ['success', 'info', 'warning', 'danger'] ? type : 'info' ) : (defaultType != null ? defaultType : 'info') }" />
	<div class="alert alert-${flashType} alert-dismissable">
		<button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
		<strong><g:message code="default.flash.type.${flashType }" /></strong>
		${message}
	</div>
</g:if>
