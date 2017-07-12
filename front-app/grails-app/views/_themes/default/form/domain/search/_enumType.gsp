<div class="col-xs-12 col-md-4 col-sm-4">
	<div class="form-group">
		<label class="control-label col-md-4"><message:property domain="${domain }" property="${property }" /><g:message code="dashBoard.system.colon"></g:message>
		</label>
		<div class="col-md-8">
			<div class="icheck-inline">
				<g:each var="keyValue" in="${keyValues }" status="i">
					<label>
						<input type="radio" class="icheck" name="q_${property }" value="${keyValue.key }"<%= ( params['q_' + property] == keyValue.key ) ? ' checked="checked"' : '' %>>
						${keyValue.value }
					</label>
				</g:each>
			</div>
		</div>
	</div>
</div>
