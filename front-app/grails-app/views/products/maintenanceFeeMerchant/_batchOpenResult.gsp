<div class="modal fade" id="batchOpenResult" tabindex="-1" role="basic" aria-hidden="true" style="margin-left: 225px;margin-top: 30px">
    <div class="modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
                <h4 class="modal-title">批量开通结果</h4>
            </div>
            <div class="modal-body">
                <component:portlet cssClass="scaffold-searchResult">
                    <portlet:body>

                        <div class="table-scrollable" style="max-height: 40rem; overflow-y: auto;">
                            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                                <thead>
                                <tr >

                                    <th style="text-align:center">编号</th>
                                    <domainSearchResult:header domain="maintenanceFeeMerchant" property="merchantCode"/>
                                    <domainSearchResult:header domain="maintenanceFeeMerchant" property="failureReason"/>

                                </tr>
                                </thead>
                                <tbody><g:each var="result"
                                               in="${resultList}" status="index">

                                    <tr>
                                        <td>${index+1}</td>
                                        <domainSearchResult:rowData type="text" domain="maintenanceFeeMerchant" property="merchantCode"
                                                                    domainInstance="${result }"/>
                                        <domainSearchResult:rowData type="text" domain="maintenanceFeeMerchant" property="failureReason"
                                                                    domainInstance="${result }"/>

                                    </tr></g:each>
                                </tbody>
                            </table>
                        </div>
                    </portlet:body>
                </component:portlet>
            %{--<component:paginate total="${intradayPayInstanceCount }"/>--}%
            </div>
            <div class="modal-footer">
                %{--<button type="button" class="btn default" data-dismiss="modal">Close</button>
                <button type="button" class="btn blue">Save changes</button>--}%
                <div class="row">
                    <div class="col-md-6 text-right">
                        <button type="button" class="btn blue" data-dismiss="modal">确定</button>
                        %{-- <g:link class="btn blue" controller="intradayPay" action="search">确定</g:link>--}%
                    </div>
                    <div class="col-md-6 text-left">
                        <button type="button" class="btn blue">导出</button>
                        %{-- <g:link class="btn blue" controller="intradayPay" action="" id="">导出</g:link>--}%
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>