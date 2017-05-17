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

<table class="table-detail" cellpadding="0" cellspacing="0" border="0" type="main">
	<tr>
		<th width="20%">body: </th>
		<td><input type="text" id="body" name="body" value="${note.body}" validate="{required:false,maxlength:765}" class="inputText"/></td>
	</tr>
	<tr>
		<th width="20%">title: </th>
		<td><input type="text" id="title" name="title" value="${note.title}" validate="{required:false,maxlength:765}" class="inputText"/></td>
	</tr>
</table>
<input type="hidden" name="id" value="${note.id}" />