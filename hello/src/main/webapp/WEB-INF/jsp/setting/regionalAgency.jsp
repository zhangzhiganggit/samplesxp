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
	<h3 class="header smaller lighter green">代理区域</h3>
	<c:forEach items="${areaList }" var="area">
		<div class="col-sm-3 no-padding">
			<label> <input type="checkbox" value="${area.areaId }" htmlText="${area.areaNm }"
				id="${area.areaNm }" class="ace ace-switch ace-switch-6 btn-flat"
				<c:forEach items="${areas }" var="areaNm">
																	<c:if test="${areaNm eq area.areaId }">
																		checked
																	</c:if>
																</c:forEach>
				onclick="checkNum()" name="regionalAgencyStr"> <span
				class="lbl">${area.areaNm }</span>
			</label>
		</div>
	</c:forEach>

</body>
</html>