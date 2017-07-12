<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
</head>
<component:portlet cssClass="scaffold-search">
    <portlet:body withForm="true">
        <form action="" method="post">
            <div class="widget-header">
                <h5 class="widget-title bigger">
                    <i class="ace-icon fa fa-table"></i> <g:message code="ordersPay.payReminder.label"></g:message>
                </h5>
            </div>

            <div class="col-md-12 text-center">
                        <span style="color: green"><h3>${resultMsg}</h3></span>
            </div>

            <div class="form-actions text-center widget-color-normal5">
                    <g:link  controller="payCostManagement" action="index" params="[search:true,offset:1]" class="btn btn-next-pay  ace-icon fa fa-floppy-o icon-on-right bigger-110">
                        <g:message code="payCostManagement.toSearch.label" ></g:message>
                    </g:link>
            </div>
        </form>
    </portlet:body>
</component:portlet>

