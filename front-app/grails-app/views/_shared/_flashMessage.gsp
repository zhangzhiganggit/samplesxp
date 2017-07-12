<g:if test="${flash.message}">
	<g:set var="flashType" value="${flash.type ? (flash.type in ['success', 'info', 'warning', 'danger'] ? flash.type : 'info' ) : (defaultType != null ? defaultType : 'info') }" />
	<div class="alert alert-${flashType} alert-dismissable">
		<button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
		<strong><g:message code="default.flash.type.${flashType }" /></strong>
		${flash.message}
	</div>
</g:if>
