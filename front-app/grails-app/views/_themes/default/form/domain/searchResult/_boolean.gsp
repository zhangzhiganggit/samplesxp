<tk:view domain="${domain }" property="${property }" includes="${includes }" excludes="${excludes }">
	<td ${width?' style=width:'+width+'px;' : ''} title="<format:booleanValue prefix="${domain }.${property }" value="${domainInstance? domainInstance[property] : null }"/>">
		<format:booleanValue prefix="${domain }.${property }" value="${domainInstance? domainInstance[property] : null }"/>
	</td>
</tk:view>