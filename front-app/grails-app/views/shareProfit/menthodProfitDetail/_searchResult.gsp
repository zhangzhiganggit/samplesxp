<component:portlet cssClass="scaffold-searchResult">
    <portlet:title
            title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'menthodProfitDetail'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body>
        <input type="hidden" value="${orgOrSalesmanName}" id="orgOrSalesmanName">
        <input type="hidden" value="${orgOrSalesmanCode}" id="orgOrSalesmanCode">

        <div class="table-toolbar">

            <input type="hidden" value="${level}" id="levelID1">


            <div class="button-group pull-right">
                <g:link class="btn btn-primary"
                        data-toggle="modal" data-target="#sample_modal1"
                        controller="menthodProfitDetail" action="export" params="${params}"><li
                        class="fa fa-download"></li>导出结果</g:link>
                <button type="button" class="btn btn-primary" id="detaile_1" params="${params}"><li
                        class="fa fa-download"></li>导出交易明细</button>
            </div>
        </div>



        <script type="text/ng-template" id="tree_node">
        <tr tt-node is-branch="node.type == 'folder'">
            <td><span ng-bind="node.orgOrSalesmanName" class="name"></span></td>
            <td ng-bind="node.orgOrSalesmanCode" class="code"></td>
            <td class="text-right" ng-bind="node.tradingAmount"></td>
            <td class="text-right" ng-bind="node.basicHProfitAmount"></td>
            <td class="text-right" ng-bind="node.highHProfitAmount"></td>
            <td class="text-right" ng-bind="node.basicProfitAmount"></td>
            <td class="text-right" ng-bind="node.highProfitAmount"></td>
        </tr>
        </script>



        <div class="table-scrollable">
                <table class="table table-striped table-bordered dataTable  no-footer text-nowrap"
                       style=" border: 1px solid #e7ecf1;" tt-table tt-params="expanded_params">
                    <thead>
                    <tr>
                        <th style=" border: 1px solid #e7ecf1;"><g:message
                        code="menthodProfitDetail.orgOrSalesmanName.label"></g:message></th>

                <th style=" border: 1px solid #e7ecf1;"><g:message
                        code="menthodProfitDetail.orgOrSalesmanCode.label"></g:message></th>
                <th style=" border: 1px solid #e7ecf1;"><g:message
                        code="menthodProfitDetail.tradingAmount.label"></g:message></th>
                <th style=" border: 1px solid #e7ecf1;"><g:message
                        code="menthodProfitDetail.basicHProfitAmount.label"></g:message></th>
                <th style=" border: 1px solid #e7ecf1;"><g:message
                        code="menthodProfitDetail.highHProfitAmount.label"></g:message></th>
                <th style=" border: 1px solid #e7ecf1;"><g:message
                        code="menthodProfitDetail.basicProfitAmount.label"></g:message></th>
                <th style=" border: 1px solid #e7ecf1;"><g:message
                        code="menthodProfitDetail.highProfitAmount.label"></g:message></th>

            </tr>
            </thead>
            <tbody></tbody>
        </table>

        <component:modals id="sample_modal1" title="" width="content"/>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">

    <asset:javascript src="/shareProfit/shareProfit.js"/>
    <g:javascript>
        $(function () {
            $(".btn-reset").on('click', function (e) {
                e.preventDefault();
                resetDetailDate();
            });
        });
    </g:javascript>


%{--检索条件js--}%
%{--<g:javascript>
    $(function () {
        /*var aa = -1;
        $(".btn-search").on('click', function (e) {

            $.ajax(function () {
                url:"#"
            }).done(function () {
                var q_orgOrSalesmanCode = $("input[name=q_orgOrSalesmanCode]").val();
                var q_orgOrSalesmanName = $("input[name=q_orgOrSalesmanName]").val();
                var name = $(".name");
                var code = $(".code");

                $(name).each(function (index, data) {
                    if (q_orgOrSalesmanName.trim() == name.eq(index).text().trim() &&
                            code.eq(index).text().trim() == q_orgOrSalesmanCode.trim()) {
                        if (aa != -1) {
                            name.eq(aa).parent(0).removeAttr('style')
                        }
                        name.eq(index).parent(0).css('background-color', 'blue')
                        aa = index;
                    }
                })
            });

        })*/
        // $('*[data-tt-parent-id]').attr("class","ng-scope ng-isolate-scope collapsed leaf")
        // $(".leaf").css("display","none");








       $("table tr").each(function () {
           if(typeof $(this).attr("data-tt-parent-id") =='undefined'){
               $(this).attr("class","ng-scope ng-isolate-scope collapsed leaf")
           }else{
               $(this).hide();
           }

       })



        var q_orgOrSalesmanCode = $("#orgOrSalesmanCode").val();
        var q_orgOrSalesmanName = $("#orgOrSalesmanName").val();
        var name = $(".name");
        var code = $(".code");


        $(name).each(function (index, data) {
            if (q_orgOrSalesmanName.trim() == name.eq(index).text().trim() &&
                    code.eq(index).text().trim() == q_orgOrSalesmanCode.trim()) {
                // name.eq(index).parent(1).css("display","block");
                // name.eq(index).parent(1).show()
                name.eq(index).parent(0).parent(0).removeAttr('style')
                name.eq(index).parent(0).parent(0).prev().attr("class","ng-scope ng-isolate-scope expanded branch")
                name.eq(index).parent(0).parent(0).css("background-color","red");
            }
        })



    })

</g:javascript>--}%


    <g:javascript>
        $(function () {
            // var months = $(".datepicker-months").clone();
            $(".datepicker-dropdown").children().remove();
            // $(".datepicker-dropdown").append(months)

            var optionsize = $("#levelID1").val()
            for (var i = 2; i <= optionsize; i++) {
                $("#q_showLevel").append("<option value=" + i + ">第" + i + "代</option>")
            }

        })
        $("#detaile_1").on('click', function () {
            $.ajax({
                url: '/menthodProfitDetail/detaile',
                //data : {optionVal :optionVal},
            }).done(function (data) {
                debugger
                bootbox.alert("<div style='text-align: center'><b>数据正在导出！</b></div><div style='text-align: center'><img style='width: 50px;height: 50px' class='lazy' data-original='/deviceOrder/viewImage?title=%2Fnfs%2F2016%2F11%2F16%2Fbig%2F388%2F' src='/assets/profit.jpg'/>【 机构POS商户分润交易明细】数据正在导出,导出完毕请进入导出数据下载中下载您的数据</div>");
                setTimeout(function () {
                    bootbox.hideAll();
                }, 3000)
            })


        })

        var url = "/menthodProfitDetail/export";
        var target = "sample_modal1";
        $.ajax({
            url: url,
        }).success(function (data) {
            $('.modal-body').empty();
            $('.modal-footer').remove();
            $('.modal-header').remove();
            $('.modal-content').html(data);
        })




    </g:javascript>

</content>