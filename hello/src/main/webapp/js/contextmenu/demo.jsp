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
   <script src="<%=request.getContextPath()%>/js/viewer/dist/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/contextmenu/jquery.contextmenu.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/js/contextmenu/jquery.contextmenu.css">

</head>


<body>
  <div id="mythingy" class="m">

      <li value="3333">ddddd</li>

    </div>
 
 <script>

      $(function() {

        $('#mythingy').contextPopup({

          title: '',

          items: [

            {label:'另存为', action:function(e) {var target=e.target;var v=$(target).attr("value");console.debug(v); } },

           
          ]

        });

      });

    </script>


  <!-- Scripts -->
 
 
</body>
</html>
