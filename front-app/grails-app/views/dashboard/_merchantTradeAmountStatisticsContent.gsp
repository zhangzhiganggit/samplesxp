    <input type="text" hidden="true" value="${jsonString}"id="jsonString">
    <g:if test="${jsonString==""}">
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
        <div id="chart_3" class="chart" > </div>
    </g:else>