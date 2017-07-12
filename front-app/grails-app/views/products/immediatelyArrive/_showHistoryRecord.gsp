<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title">操作记录</h4>
</div>
<div class="modal-body">

    <div class="row">
<component:portlet cssClass="scaffold-searchResult">
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>

                    <domainSearchResult:header domain="immediatelyArrive" property="merchantCode"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="businessName"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="operationAction"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="operator"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="operationTime"/>

                </tr>
                </thead>
                <tbody><g:each var="immediatelyArriveInstance"
                               in="${immediatelyArriveInstanceList }">
                    <tr>
                        <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="merchantCode"
                                                    domainInstance="${immediatelyArriveInstance }"/>
                        <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="businessName"
                                                    domainInstance="${immediatelyArriveInstance }"/>
                        <domainSearchResult:rowData type="inList" domain="immediatelyArrive" property="operationAction"
                                                    domainInstance="${immediatelyArriveInstance }"/>
                        <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="operator"
                                                    domainInstance="${immediatelyArriveInstance }"/>
                        <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="operationTime"
                                                    domainInstance="${immediatelyArriveInstance }"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
<component:paginate total="${immediatelyArriveInstanceCount }"/>
    </div>
    <div class="row" style="margin: 10px">
        <lable></lable><lable></lable><lable></lable>
    </div>
    <div class="row">
        <div class="col-md-2 right"  style="margin-left:290px"> <lable >  <button type="button" class="btn blue" data-dismiss="modal">&nbsp;&nbsp;&nbsp;&nbsp;确定&nbsp;&nbsp;&nbsp;&nbsp;</button>
        </lable></div>
        <div class="col-md-1"></div>

        <div class="col-md-2 left" style="margin-left: -65px" ><lable>  <button type="button" class="btn default" data-dismiss="modal">&nbsp;&nbsp;&nbsp;&nbsp;取消&nbsp;&nbsp;&nbsp;&nbsp;</button>
        </lable></div>
    </div>


</div>
<div class="modal-footer">
    %{--<button type="button" class="btn default" data-dismiss="modal">Close</button>
    <button type="button" class="btn blue">Save changes</button>--}%
</div>