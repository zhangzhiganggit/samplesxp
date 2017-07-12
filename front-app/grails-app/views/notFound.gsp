<!doctype html>
<html>
<head>
    <title>找不到网页</title>
    <meta name="layout" content="main">
    <asset:stylesheet src="global/plugins/font-awesome/css/font-awesome.min.css"/>
    <asset:stylesheet src="global/plugins/simple-line-icons/simple-line-icons.min.css"/>
    <asset:stylesheet src="global/plugins/bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="global/css/components-md.min.css" id="style_components"/>
    <g:if env="development"><asset:stylesheet src="pages/css/error.min.css"/></g:if>
</head>

<body class=" page-404-full-page">
<div class="row">
    <div class="col-md-12 page-404">
        <div class="number font-red">404</div>

        <div class="details">
            <p>找不到这个页面 ${request.forwardURI}
                <br/>
                <br/>
                <a href="/home/index">返回首页</a></p>
        </div>
    </div>
</div>
</body>
</html>
