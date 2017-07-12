<tk:view domain="${domain }" property="${property }" includes="${includes }" excludes="${excludes }">
	<td align="right" ${width?' style=width:'+width+'px;' : ''} title="<format:currencyValue prefix="${domain }.${property }" value="${domainInstance ? domainInstance[property] : 0 }"/>">
		<format:currencyValue prefix="${domain }.${property }" value="${domainInstance ? domainInstance[property] : 0 }"/>
	</td>
</tk:view>
