<%@page language="java" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<html>
<head>
<title>note明细</title>
<%@include file="../layout/common.jsp"%>
<script type="text/javascript">
	//放置脚本
</script>
</head>
<body>
	<div class="panel">
		<div class="panel-top">
			<div class="tbar-title">
				<span class="tbar-label">note详细信息</span>
			</div>
			<div class="panel-toolbar">
				<div class="toolBar">
					<div class="group">
						<a class="link back" href="list.ht"><span></span>返回</a>
					</div>
				</div>
			</div>
		</div>
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
		</div>
	</div>
</body>
</html>

