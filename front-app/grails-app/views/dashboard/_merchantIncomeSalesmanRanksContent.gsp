    <div id="typediv2" style="display: block;">
        <div class="portlet-body form">
            <div style="height: 350px;">
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
                                    <div class="number">进件成功数:
                                        <span data-counter="counterup" data-value="1349">${dashBoardInstance.numberSuccess}</span>
                                    </div>
                                    <div class="desc">${dashBoardInstance.salesman} </div>
                                </div>
                            </a>
                        </div>
                    </tr>
                    </g:if>
                </g:each>
            </div>
        </div>
    </div>
    <div id="typediv1" style="display: none;">
        <div class="portlet-body form">
            <div class="table-scrollable" style="height: auto;width:auto">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <domainSearchResult:header domain="dashBoard" property="salesman"/>
                        <domainSearchResult:header domain="dashBoard" property="numberSuccess"/>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each var="dashBoardInstance" in="${dashBoardInstanceList}" begin="0" end="3" >
                        <tr>
                            <domainSearchResult:rowData type="text" domain="dashBoard" property="salesman"
                                                        domainInstance="${dashBoardInstance}" textAlign="left"/>
                            <domainSearchResult:rowData type="text" domain="dashBoard" property="numberSuccess"
                                                        domainInstance="${dashBoardInstance}" textAlign="right"/>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>

