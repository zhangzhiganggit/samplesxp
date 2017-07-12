<!DOCTYPE html>
<html>
<head>
</head>

<body>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="历史评价"/>
    <portlet:body>
        <form:form action="create">
            <form:scaffoldSearchProperties/>
        </form:form>
        <table class="table table-striped table-bordered table-hover dataTable no-footer">
            <g:each var="systemAppraisalInstance"
                    in="${systemAppraisalInstanceList}">
                <component:portlet cssClass="scaffold-searchResult">
                    <div class="row">
                        <div class="col-md-8">${systemAppraisalInstance.opinionType}
                            <span id="${systemAppraisalInstance.lever}" name="stars"></span>
                        </div>

                        <div class="col-md-4 text-right">${systemAppraisalInstance.belongToOrgName}</div>
                    </div>

                    <div class="row">
                        <label class="col-md-10">
                            ${systemAppraisalInstance.opinion}
                        </label>

                    </div>
                    <div class="row">
                        <g:if test="${systemAppraisalInstance?.imagesOne != null}">
                            <g:set var="imagesOnePath" value="${systemAppraisalInstance.imagesOne}"/>
                            <img style="width: 100px;height: 80px"  id="commentImg_1"  src="<g:createLink controller="systemAppraisal" action="viewImage" params="[title: imagesOnePath]"/>"/>

                        </g:if>
                        <g:if test="${systemAppraisalInstance?.imagesTwo != null}">
                            <g:set var="imagesTwoPath" value="${systemAppraisalInstance.imagesTwo}"/>
                            <img style="width: 100px;height: 80px" id="commentImg_2"  src="<g:createLink controller="systemAppraisal" action="viewImage" params="[title: imagesTwoPath]" />"/>
                        </g:if>
                        <g:if test="${systemAppraisalInstance?.imagesThree != null}">
                            <g:set var="imagesThreePath" value="${systemAppraisalInstance.imagesThree}"/>
                            <img style="width: 100px;height: 80px" id="commentImg_3" src="<g:createLink controller="systemAppraisal" action="viewImage" params="[title: imagesThreePath]" />"/>
                        </g:if>
                    </div>
                    <div class="row">
                        <format:dateValue
                                prefix="systemAppraisalInstance.appraisalTime"
                                value="${systemAppraisalInstance?.appraisalTime}"/>
                        %{--${systemAppraisalInstance.appraisalTime}--}%
                    </div>
                </component:portlet>
            </g:each>
        </table>
        <component:paginate total="${systemAppraisalInstanceCount }"/>
    </portlet:body>
</component:portlet>

%{--<content tag="takin-footer">
<asset:stylesheet src="global/plugins/jquery-raty/jquery.raty.css"/>
<asset:javascript src="global/plugins/jquery-raty/jquery.raty.js"/>
<g:javascript>
    $(function () {
        $('#recordID').raty({path: '/assets/global/plugins/jquery-raty/images'});
    })
   /* $(document).ready(function(){


    });*/
</g:javascript>
</content>--}%
</body>
</html>
