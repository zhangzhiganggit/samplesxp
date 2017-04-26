<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html >
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Insert title here</title>
  <%@include file="/pages/common/taglib.jsp"%>
</head>
<body>
   <P> HELLO WORLD </P>
   <table>
   <c:forEach items="${PersionList}" var="unIn"  varStatus="status">
    <tr>
        <td style="text-align:center;">${unIn.id}</td>
        <td style="text-align:center;">${unIn.name}</td>
        <td style="text-align:center;">${unIn.sex}</td>
        <td style="text-align:center;">${unIn.fav}</td>
    </tr>
    </table>
</c:forEach> 
</body>
</html>