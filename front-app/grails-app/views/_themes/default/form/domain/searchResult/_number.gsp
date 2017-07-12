<tk:view domain="${domain }" property="${property }" includes="${includes }" excludes="${excludes }">
	<td ${width?' style=width:'+width+'px;' : ''} title="<format:numberValue prefix="${domain }.${property }" value="${domainInstance ? domainInstance[property] : 0 }"/>">
		<format:numberValue prefix="${domain }.${property }" value="${domainInstance ? domainInstance[property] : 0 }"/>
	</td>
</tk:view>