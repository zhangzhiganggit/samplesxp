<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="box">
		<table
			class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
			<thead class="thin-border-bottom">
				<tr>
					<th>联行行号</th>
					<th>详细信息</th>
					<th>所在省</th>
					<th>所在市</th>
					<th>操作</th>

				</tr>
			</thead>

			<tbody>
				<c:forEach items="${bnkLinkList }" var="bnk">

					<tr onclick="chooseBnkInfo('${bnk.bnkNm }','${bnk.lbnkProvName }','${bnk.lbnkCityName }','${bnk.lbnkNm }','${bnk.lbnkNo }')">
						<td class="">${bnk.lbnkNo }</td>

						<td>${bnk.lbnkNm }</td>
						<td>${bnk.lbnkProvName }</td>
						<td>${bnk.lbnkCityName }</td>
						<td>
							<div class=" action-buttons">
								<a href="javascript:;" onclick="chooseBnkInfo('${bnk.bnkNm }','${bnk.lbnkProvName }','${bnk.lbnkCityName }','${bnk.lbnkNm }','${bnk.lbnkNo }')" class="blue "> 添加 </a>
							</div>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

	</div>
								<%@include file="../layout/modelPagination.jsp" %>
	
</body>
</html>