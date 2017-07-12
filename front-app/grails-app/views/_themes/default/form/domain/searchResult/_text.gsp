<tk:view domain="${domain }" property="${property }" includes="${includes }" excludes="${excludes }">
	<td${textAlign?' align='+textAlign : ''}  ${width?' style=width:'+width+'px;' : ''}  title="${domainInstance ? domainInstance[property] : '' }">
		${domainInstance ? domainInstance[property] : '' }
	</td>
</tk:view>
