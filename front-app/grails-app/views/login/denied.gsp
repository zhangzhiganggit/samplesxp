<!doctype html>
<html>
<head>
    <title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
    <asset:stylesheet src="global/plugins/font-awesome/css/font-awesome.min.css"/>
    <asset:stylesheet src="global/plugins/simple-line-icons/simple-line-icons.min.css"/>
    <asset:stylesheet src="global/plugins/bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="global/css/components-md.min.css" id="style_components"/>
    <meta name="layout" content="main">
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>

<body>

<div class="col-md-12 col-sm-12 col-xs-12 text-center" style="margin-top:90px;">
    <i class="fa fa-exclamation-circle text-center" style="color:#f08024;font-size:60px;"></i>

    <div class="col-md-12 col-sm-12 col-xs-12 text-center"
         style="height:85px;line-height:85px">对不起，您的权限不足。</div>
</div>

</body>
</html>
