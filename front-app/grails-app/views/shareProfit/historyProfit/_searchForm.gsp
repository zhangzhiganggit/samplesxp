
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'historyProfit'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="historyProfit" action="index"
                   name="scaffold-search-historyProfit">
            <form:scaffoldSearchProperties/>
            <form:body>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">月份:</label>
                            <div class="col-md-8">
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="form-control" name="q_month_from" id="q_month_from"  value="${params.q_month_from}" readonly/>
                                    <span class="input-group-addon">至</span>
                                    <input type="text" class="form-control" name="q_month_to" id="q_month_to" value="${params.q_month_to}" readonly/>
                                </div>
                            </div>
                        </div>
                    </div>

             %{--
                <domainSearch:datePicker domain="historyProfit" property="month"
                                         dataDateFormat="yyyy-mm"/>--}%


            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-reset"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/shareProfit/shareProfit.js"/>
    <g:javascript>
        $(function(){
            $(".btn-reset").on('click',function(e) {
                e.preventDefault();
                resetHistoryDate();
            });

                $('.matl').on('click', function (e) {
                e.preventDefault();
                var id = this.href.replace(new RegExp("^(http|https)\:/\/([^\/]*)\/"), "").replace(/\//g, '_');
                var href = this.href;
                parent.$("#ANewWindow").trigger('ANewWindowchanged', [id, "月分润明细查询管理", href]);

            })
        });

        function DateTimePicker(beginSelector,endSelector){
            $(beginSelector).datetimepicker(
                    {
                        language:  "zh",
                        autoclose: true,
                        format: "yyyy-mm",
                        clearBtn:false,
                        todayBtn:true,
                        startView: 'year',
                        minView:'year',
                        maxView:'decade',
                        endDate:new Date()
                    }).on('changeDate', function(ev){
                if(ev.date){
                    $(endSelector).datetimepicker('setStartDate', new Date(ev.date.valueOf()))
                }else{
                    $(endSelector).datetimepicker('setStartDate',null);
                }
            })

            $(endSelector).datetimepicker(
                    {
                        language:  "zh",
                        autoclose: true,
                        format: "yyyy-mm",
                        clearBtn:false,
                        todayBtn:true,
                        startView: 'year',
                        minView:'year',
                        maxView:'decade',
                        endDate:new Date()
                    }).on('changeDate', function(ev){
                if(ev.date){
                    $(beginSelector).datetimepicker('setEndDate', new Date(ev.date.valueOf()))
                }else{
                    $(beginSelector).datetimepicker('setEndDate',new Date());
                }
            })
        }
        DateTimePicker("#q_month_from","#q_month_to");

    </g:javascript>
</content>