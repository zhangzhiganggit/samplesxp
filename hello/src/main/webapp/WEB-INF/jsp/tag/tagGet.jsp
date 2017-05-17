<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<%@include file="/commons/include/html_doctype.html"%>
<html>
<head>
<title>tag明细</title>
<%@include file="../layout/common.jsp"%>
<%@include file="/commons/include/get.jsp"%>
<script type="text/javascript">
	//放置脚本
</script>
</head>
<body>
	<div class="panel">
		<div class="panel-top">
			<div class="tbar-title">
				<span class="tbar-label">tag详细信息</span>
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
				<th width="20%">name:</th>
				<td>${tag.name}</td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>

