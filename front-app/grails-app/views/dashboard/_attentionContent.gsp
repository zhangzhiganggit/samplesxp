    <g:if test="${role!='twoSALESMAN'}">
        <div class="row">
            <a class="dashboard-stat dashboard-stat-v2 blue" href="javascript:void(0)">
                <div class="visual">
                    <i class="fa fa-comments"></i>
                </div>

                <div class="details">
                    <div class="number">
                        <span data-counter="counterup" data-value="1349">${numberMerchant}</span>
                    </div>

                    <div class="desc">本月新增POS商户数</div>
                </div>
            </a>
        </div>
    </g:if>
        <br>
    <g:if test="${role=='administrator'}">
        <div class="row">
            <a class="dashboard-stat dashboard-stat-v2 red" href="javascript:void(0)">
                <div class="visual">
                    <i class="fa fa-bar-chart-o"></i>
                </div>

                <div class="details">
                    <div class="number">
                        ￥ <span data-counter="counterup" data-value="2,1200.00">${profit}</span></div>

                    <div class="desc">本月分润</div>
                </div>
            </a>
        </div>
    </g:if>

