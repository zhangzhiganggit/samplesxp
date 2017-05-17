<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html"%>

<%@ include file="../common/taglib.jsp" %>
<script type="text/javascript" src="${ctx}/js/fanda/scriptMgr.js"></script>
<script type="text/javascript">
	function afterOnload(){
		var afterLoadJs=[
		     			'${ctx}/js/fanda/formdata.js',
		     			'${ctx}/js/fanda/subform.js'
		 ];
		ScriptMgr.load({
			scripts : afterLoadJs
		});
	}
</script>
<table class="table-detail" cellpadding="0" cellspacing="0" border="0">
	
	<tr>
		<th width="20%">body:</th>
		<td>${note.body}</td>
	</tr>
	
	<tr>
		<th width="20%">title:</th>
		<td>${note.title}</td>
	</tr>
</table>
