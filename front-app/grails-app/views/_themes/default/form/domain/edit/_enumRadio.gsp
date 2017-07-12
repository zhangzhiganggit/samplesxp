<div class="col-md-6 col-sm-6 col-xs-12">
	<div class="form-group">
		<label class="col-md-3 col-sm-3 col-xs-12 control-label"><span class="${required ? 'required' : 'hide' }">*</span><message:property domain="${domain }" property="${property }"/><g:message code="dashBoard.system.colon"></g:message>
		</label>
		<div class="col-md-9 col-sm-9 col-xs-12${hasErrors(bean: domainInstance, field: property, ' takin-input-errors')}">
			<div class="icheck-inline">
				<g:each var="value" in="${values }" status="i">
					<label>
						<input type="radio" class="icheck" name="${property }" value="${value.name() }"<%= ( checkedIndex == i ) ? ' checked="checked"' : '' %>>
						${value }
					</label>
				</g:each>
			</div>
			<span class="help-block"><g:fieldError bean="${domainInstance }" field="${property }" /></span>
		</div>
	</div>
</div>