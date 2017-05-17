<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="en">

<body>

<form action="file/upload.do" method="post" enctype="multipart/form-data">
<input type="file" name="myfile" id="myfile" value="" /><br/>
<input type="submit" value="确认提交">
    </form>
	
</body>

</html>
