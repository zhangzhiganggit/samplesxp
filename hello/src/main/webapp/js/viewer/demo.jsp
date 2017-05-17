<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="A simple jQuery image viewing plugin.">
  <meta name="keywords" content="HTML, CSS, JS, JavaScript, jQuery plugin, image viewing, front-end, frontend, web development">
  <meta name="author" content="Fengyuan Chen">
  <title>Viewer</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/js/viewer/assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/js/viewer/assets/css/viewer.min.css">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
  <!--[if lt IE 8]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
  <![endif]-->

  <!-- Header -->
 

	<div class="col-sm-8 col-md-6">
        <h3 class="page-header">Demo</h3>
        <div class="docs-galley">
          <ul class="docs-pictures clearfix">
            <li><img data-original="<%=request.getContextPath()%>/js/viewer/assets/img/tibet-1.jpg" src="<%=request.getContextPath()%>/js/viewer/assets/img/thumbnails/tibet-1.jpg" alt="图片1"></li>
            <li><img data-original="<%=request.getContextPath()%>/js/viewer/assets/img/tibet-2.jpg" src="<%=request.getContextPath()%>/js/viewer/assets/img/thumbnails/tibet-2.jpg" alt="图片2"></li>
            <li><img data-original="<%=request.getContextPath()%>/js/viewer/assets/img/tibet-3.jpg" src="<%=request.getContextPath()%>/js/viewer/assets/img/thumbnails/tibet-3.jpg" alt="图片3"></li>
          </ul>
        </div>
      </div>
     

  <!-- Footer -->
  <footer class="docs-footer">
    <div class="container">
      <p class="heart"></p>
    </div>
  </footer>

  <!-- Scripts -->
  <script src="<%=request.getContextPath()%>/js/viewer/dist/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/viewer/dist/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/viewer/dist/viewer.js"></script>
  <script src="<%=request.getContextPath()%>/js/viewer/main.js"></script>
</body>
</html>
