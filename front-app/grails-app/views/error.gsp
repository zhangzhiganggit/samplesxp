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
<g:if env="development">
    <g:if test="${Throwable.isInstance(exception)}">
        <g:renderException exception="${exception}"/>
    </g:if>
    <g:elseif test="${request.getAttribute('javax.servlet.error.exception')}">
        <g:renderException exception="${request.getAttribute('javax.servlet.error.exception')}"/>
    </g:elseif>
    <g:else>
        <ul class="errors">
            <li>An error has occurred</li>
            <li>Exception: ${exception}</li>
            <li>Message: ${message}</li>
            <li>Path: ${path}</li>
        </ul>
    </g:else>
</g:if>
<g:else>
%{-- <ul class="errors">
     <li>An error has occurred</li>
 </ul>--}%
    <div class="col-md-12 col-sm-12 col-xs-12 text-center" style="margin-top:90px;">
        <i class="fa fa-exclamation-circle text-center" style="color:#f08024;font-size:60px;"></i>

        <div class="col-md-12 col-sm-12 col-xs-12 text-center"
             style="height:85px;line-height:85px">对不起，系统网络故障，请稍后再试或联系管理员。</div>
    </div>
</g:else>
</body>
</html>
