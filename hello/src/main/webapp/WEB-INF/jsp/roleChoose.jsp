<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/toHomePage.do"
		method="post">
		<div align="center" >
			<select name="empUuid" style="font-size: 18px;">
				<c:forEach items="${employeeList }" var="emp">
					<option value="${emp.empUuid }">${emp.orgNm }机构的${emp.roleNm }--${emp.deptNm}--${emp.empNm }</option>
				</c:forEach>
			</select>
			<input type="submit" value="进入系统">
		</div>
		
	</form>
</body>
</html>