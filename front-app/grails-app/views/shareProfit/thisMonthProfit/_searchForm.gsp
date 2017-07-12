<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
</head>
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'thisMonthProfit'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form>
            <form:scaffoldSearchProperties/>
            <form:body>

                <div class="row">
                    <div class="col-md-6 text-right thisMonthProfit_warning_font" style="line-height: 100px">
                        <label class="col-md-8">本月交易预计可分润金额：</label>

                        <p class="col-md-4 text-left">${thisMonthProfitInstance.profitAmount}元</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-5 text-right">
                        注：当前显示金额为系统估算，请以实际发放金额为准
                    </div>
                </div>

                <div class="row portlet light ">
                    <div class="col-md-12 portlet-title">
                        <h4><strong>当前分润规则</strong></h4>
                    </div>
                </div>

                <div class="from-group">
                    <div class="col-md-12 portlet light ">
                        基础分润规则
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-1"></div>

                    <div class="col-md-10">
                        基础分润部分：部分手续费的分润比例为100%
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-3 portlet light">核算价格：</div>

                </div>
                <table class="table table-striped table-bordered table-hover dataTable no-footer">
                    <thead>
                    <tr>
                        <th>分类</th><th>核算价</th><th>市场价</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    <td>
                    <div class="col-md-4 text-center">标准类</div>
                        <div class="col-md-8 text-center">借记卡</div>
                    </td>
                        <td class="text-center">0.435%，18.75封顶</td>
                        <td class="text-center">0.5%，22封顶</td>
                    </tr>

                    <tr>
                        <td>
                            <div class="col-md-4"><p></p></div>
                            <div class="col-md-8 text-center">贷记卡</div>
                        </td>
                        <td class="text-center">0.535%</td>
                        <td class="text-center">0.6%</td>
                    </tr>

                    <tr>
                        <td>
                            <div class="col-md-4 text-center">优惠类</div>
                            <div class="col-md-8 text-center">借记卡</div>
                        </td>
                        <td class="text-center">0.32%，14封顶</td>
                        <td class="text-center">--</td>
                    </tr>

                    <tr>
                        <td>
                            <div class="col-md-4"><p></p></div>
                            <div class="col-md-8 text-center">贷记卡</div>
                        </td>
                        <td class="text-center">0.42%</td>
                        <td class="text-center">--</td>
                    </tr>

                    <tr>
                        <td>
                            <div class="col-md-4 text-center">减免类</div>
                            <div class="col-md-8 text-center">借记卡</div>
                        </td>
                        <td class="text-center">0</td>
                        <td class="text-center">--</td>
                    </tr>

                    <tr>
                        <td>
                            <div class="col-md-4"><p></p></div>
                            <div class="col-md-8 text-center">贷记卡</div>
                        </td>
                        <td class="text-center">0</td>
                        <td class="text-center">--</td>
                    </tr>

                    </tbody>
                    
                </table>
                <div class="col-md-5">
                    <label class="control-label">计算公式</label>
                </div>
                <div class="form-group thisMonthProfit_indent">
                    <label class="col-md-12 ">
                        代理商分润=标准类商户分润金额+优惠类商户分润金额+减免类商户分润金额
                    </label>
                    <label class="col-md-12">
                        <strong>标准类计算公式</strong>
                    </label>
                    <label class="col-md-12">
                        1.签约费率 > 市场费率
                    </label>
                    <label class="col-md-12">
                        商户分润=基础分润金额+高签固定分润金额+高签浮动分润金额
                    </label>
                    <label class="col-md-12">
                        基础分润=[(市场价-核算价)*交易金额（或笔数）]*基础比例
                    </label>
                    <label class="col-md-12">
                        高签固定分润=[(签约价-市场价)*交易金额（或笔数）]*30%
                    </label>

                    <label class="col-md-12">
                        高签浮动分润=[(签约价-市场价)*交易金额（或笔数）]*n%(目前系统仅展示基础分润和高签固定分润，浮动部分线下统计)
                    </label>

                    <label class="col-md-12">
                        2.签约费率 < 市场费率
                    </label>
                    <label class="col-md-12">
                        商户分润=基础分润
                    </label>
                    <label class="col-md-12">
                        基础分润=[(签约价-核算价)*交易金额（或笔数）]*基础比例
                    </label>
                    <label class="col-md-12">
                        <strong>优惠/减免类商户计算公式</strong>
                    </label>
                    <label class="col-md-12">
                        商户分润=基础分润
                    </label>
                    <label class="col-md-12">
                        基础分润=[(签约价-核算价)*交易金额（或笔数）]*基础比例
                    </label>

                </div>

            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>
