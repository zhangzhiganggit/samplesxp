<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
function init(){
	alert("下载失败:电子协议图片不存在！");
	window.location.href="<%=request.getContextPath()%>/mecIf/findAgreement.do";
}
</script>
<title>Insert title here</title>
</head>
<body onload="init();">

</body>
</html>