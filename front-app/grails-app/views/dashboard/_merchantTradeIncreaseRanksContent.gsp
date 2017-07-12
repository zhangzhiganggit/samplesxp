    <div id="typediv25" style="display: block;">
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
                <g:else>
                    <g:each var="dashBoardInstance" in="${dashBoardInstanceList}" status="i">
                        <g:if test="${i == 0}">
                            <tr>
                                <div class="row">
                                    <a class="dashboard-stat dashboard-stat-v2 blue" href="javascript:void(0)">
                                        <div class="visual">
                                            <i class="fa fa-comments"></i>
                                        </div>
                                        <div class="details">
                                            <div class="number">涨幅金额:
                                                <span data-counter="counterup" data-value="1349">
                                                    <g:formatNumber number="${dashBoardInstance.riseFallRatio}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
                                                </span>
                                            </div>
                                            <div class="desc">${dashBoardInstance.signName} ${dashBoardInstance.businessSeries}</div>
                                        </div>
                                    </a>
                                </div>
                            </tr>
                        </g:if>
                    </g:each>
                </g:else>
            </div>
        </div>
    </div>
    <div id="typediv15" style="display: none;">
        <div class="portlet-body form">
            <div class="table-scrollable" style="height: auto;overflow-y :auto">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <domainSearchResult:header domain="dashBoard" property="ranking"/>
                        <domainSearchResult:header domain="dashBoard" property="businessSeries"/>
                        <domainSearchResult:header domain="dashBoard" property="signName"/>
                        <domainSearchResult:header domain="dashBoard" property="increaseRanks"/>
                    </tr>
                    </thead>
                    <tbody><g:each var="dashBoardInstance" status="i"
                                   in="${dashBoardInstanceList}">
                        <tr>
                            <td align="left">${i + 1}</td>
                            <domainSearchResult:rowData type="text" domain="dashBoard" property="businessSeries"
                                                        domainInstance="${dashBoardInstance}" textAlign="left"/>
                            <domainSearchResult:rowData type="text" domain="dashBoard" property="signName"
                                                        domainInstance="${dashBoardInstance}" textAlign="left"/>
                            <td align="right" style="color: red;"> <g:formatNumber number="${dashBoardInstance.riseFallRatio}" type="number" minFractionDigits="2" maxFractionDigits="2"/></td>
                        </tr>
                    </g:each>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
</div>



