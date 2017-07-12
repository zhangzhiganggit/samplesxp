<div class="icheck-inline">
	<label>
		<input type="radio" class="icheck" name="${property }" value="true"<%= ( value ) ? ' checked="checked"' : '' %>>
		<g:message code="${domain }.${property }.true" default="${message(code: 'default.boolean.true') }" />
	</label>
	<label>
		<input type="radio" class="icheck" name="${property }" value="false"<%= ( !value ) ? ' checked="checked"' : '' %>>
		<g:message code="${domain }.${property }.false" default="${message(code: 'default.boolean.false') }" />
	</label>
</div>
