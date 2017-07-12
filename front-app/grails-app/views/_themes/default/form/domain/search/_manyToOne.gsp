<div class="col-xs-12 col-md-4 col-sm-4">
	<div class="form-group">
		<label class="control-label col-md-4"><message:property domain="${domain }" property="${property }" /><g:message code="dashBoard.system.colon"></g:message>
		</label>
		<div class="col-md-8">
			<g:select id="q_${property}" name="q_${property}.id" from="${type.list()}" optionKey="id" value="${params ? params['q_' + property] : '' }" class="form-control" noSelection="['': '']"/>
		</div>
	</div>
</div>
