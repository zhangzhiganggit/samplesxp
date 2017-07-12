<tk:view domain="${domain }" property="${property }" includes="${includes }" excludes="${excludes }">
	<td align="center"  ${width?' style=width:'+width+'px;' : ''} title="<format:dateValue prefix="${domain }.${property }" value="${domainInstance ? domainInstance[property] : null }"/>">
		<format:dateValue prefix="${domain }.${property }" value="${domainInstance ? domainInstance[property] : null }"/>
	</td>
</tk:view>
