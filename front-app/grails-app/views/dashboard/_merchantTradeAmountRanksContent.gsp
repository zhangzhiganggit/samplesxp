    <div id="typediv6" style="display: block;">
        <div class="portlet-body form">
            <div  style="height: 350px;">
                <g:if test="${dashBoardInstanceList.size()==0}">
                    <div class="row">
                        <a class="dashboard-stat dashboard-stat-v2 blue" href="javascript:void(0)">
                            <div class="visual">
                                <i class="fa fa-comments"></i>
                            </div>
                            <div class="details">
                                <div class="number">无数据
                                </div>
                            </div>
                        </a>
                    </div>
                </g:if>
                <g:each var="dashBoardInstance" in="${dashBoardInstanceList}" status="i">
                    <g:if test="${i == 0}">
                        <tr>
                            <div class="row">
                                <a class="dashboard-stat dashboard-stat-v2 blue" href="javascript:void(0)">
                                    <div class="visual">
                                        <i class="fa fa-comments"></i>
                                    </div>
                                    <div class="details">
                                        <div class="number">交易额（元）:
                                        <g:formatNumber number="${dashBoardInstance.tradingVolume}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
                                        </div>
                                        <div class="desc">${dashBoardInstance.signName} ${dashBoardInstance.businessSeries}</div>
                                    </div>
                                </a>
                            </div>
                        </tr>
                    </g:if>
                </g:each>

            </div>
        </div>
    </div>
    <div id="typediv5" style="display: none;">
        <div class="portlet-body form">
            <div class="table-scrollable" style="height: auto;overflow-y :auto">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <domainSearchResult:header domain="dashBoard" property="businessSeries"/>
                        <domainSearchResult:header domain="dashBoard" property="signName"/>
                        <domainSearchResult:header domain="dashBoard" property="tradingVolume"/>
                    </tr>
                    </thead>
                    <tbody><g:each var="dashBoardInstance"
                                   in="${dashBoardInstanceList}">
                        <tr>
                            <domainSearchResult:rowData type="text" domain="dashBoard" property="businessSeries"
                                                        domainInstance="${dashBoardInstance}" textAlign="left"/>
                            <domainSearchResult:rowData type="text" domain="dashBoard" property="signName"
                                                        domainInstance="${dashBoardInstance}" textAlign="left"/>
                           <td align="right"> <g:formatNumber number="${dashBoardInstance.tradingVolume}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
