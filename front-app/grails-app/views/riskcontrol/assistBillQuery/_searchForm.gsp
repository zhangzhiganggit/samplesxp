
<component:portlet cssClass="scaffold-search">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-filter"></i>
            <span class="caption-subject bold uppercase">${message(code: 'assistBillQuery.queryCondition.label', args: message.domain(domain: 'assistBillQuery'))}<i class="fa fa-question-circle show-pop" data-popover-message="${message(code:"assistBillQuery.function.show-pop.label")}"></i></span>
            <span class="caption-helper"></span>
        </div>
        <div class="tools">
            <a target="_blank" href="${sms_front_url}/fromSspToHomePage.do?userName=${userName}&password=${passWord}&url=/task/list.do?isFirstLoad=true&taskSts=3"><span class="caption-subject bold uppercase" style="color: red;text-decoration:underline">查看历史工单</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href=":;" class="collapse" data-original-title="" title=""> </a>

            <a href=":;" class="fullscreen" data-original-title="" title=""> </a>

        </div>
    </div>
    <portlet:body withForm="true">
        <form:form controller="assistBillQuery" action="index"
                   name="scaffold-search-assistBillQuery">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden"  id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <formCommon:hiddenField id="salesman" name="salesman" value="${params['q_salesman']}"/>
                <domainSearch:textField domain="assistBillQuery" property="merchantCode"/>
                <domainSearch:textField domain="assistBillQuery" property="receiptsName"/>

                <domainSearch:select2 property="type" domain="assistBillQuery" class="form-control" name="q_type" from="${com.suixingpay.ssp.front.riskcontrol.AssistBillQuery.getConstraintsMap()['type'].inList}" valueMessagePrefix="assistBillQuery.type" value="${params ? params['q_type'] : ''}" noSelection="['':'--请选择--']" />
                %{--<domainSearch:select property="belongtoOrg" domain="assistBillQuery" class="form-control" name="q_belongtoOrg" from="${com.suixingpay.ssp.front.riskcontrol.AssistBillQuery.getConstraintsMap()['belongtoOrg'].inList}" valueMessagePrefix="assistBillQuery.belongtoOrg" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']" />--}%
                <g:if test="${isAdmin}">
                    <domainSearch:orgTree domain="assistBillQuery" property="belongtoOrg" directly="true" popoverMessage="${message(code:"assistBillQuery.belongtoOrg.show-pop.label")}"/>
                    <domainSearch:select2 domain="assistBillQuery" property="salesman" class="form-control"
                                          from=""
                                          value="${params ? params['q_salesman'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="assistBillQuery.belongtoOrg.show-pop.label"></g:message>"></i><message:property domain="merchantTerminalManagement" property="belongtoOrganization" />
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly id="readonlyOrgNm"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="merchantTerminalManagement" property="salesMan" />
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>

                    </div>
                </g:else>
                %{--<domainSearch:select property="salesman" domain="assistBillQuery" class="form-control" name="salesman" from="${com.suixingpay.ssp.front.riskcontrol.AssistBillQuery.getConstraintsMap()['salesman'].inList}" valueMessagePrefix="assistBillQuery.salesman" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']" />--}%
                <domainSearch:select2 property="status" domain="assistBillQuery" class="form-control" name="q_status" from="${com.suixingpay.ssp.front.riskcontrol.AssistBillQuery.getConstraintsMap()['status'].inList}" valueMessagePrefix="assistBillQuery.status" value="${params ? params['q_status'] : ''}" noSelection="['':'--请选择--']" />

                <domainSearch:datePicker domain="assistBillQuery" property="launchDate" dataDateFormat="yyyy-mm-dd"/>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-modify"/>
            </form:actions>

        </form:form>

    </portlet:body>

</component:portlet>
<content tag="takin-footer">
    <g:javascript>
        $(function () {
            $("input[name='q_merchantCode']").keyup(function () {
                this.value=this.value.replace(/\s/g,'');
            });

            $("input[name='q_receiptsName']").keyup(function () {
                this.value=this.value.replace(/\s/g,'');
            });

            $("#orgInput").bind('change',function () {
                var orgNo = $("#orgInputId").val();
                var currentEmpNo= $("#salesman").val();
                getOrgUserNameList(orgNo,currentEmpNo);
            }).change();

            $(".handleOrder").click(function (e) {
                e.preventDefault();
                var url = $(this).attr("href");
                $.ajax({
                    url: url+"&check=true",
                    type:"GET",
                    async:false,
                    success : function(data) {
                        if(data.err_code == '0'){
                            window.location.href=url;
                        }else{
                            bootbox.alert(data.err_msg);
                            return false;
                        }
                    }
                });
            });

            $("#q_salesman").change(function(){
                $("#salesman").val(this.value);
            });

            $("a.grouped_elements").fancybox({
                'scrolling':'no'
            });

            $(".btn-modify").click(function (e) {
                e.preventDefault();
                $("input:text").not("[readonly]").val("");
                $("select").prop('selectedIndex', 0);
                $(".select2-hidden-accessible").val("").trigger("change");
                $("#orgInputId").val($("#hiddenCurrentOrgNo").val());
                $("#orgInput").val($("#hiddenCurrentOrgName").val());
            });

        });

        //获取当前机构下业务员
        function getOrgUserNameList(orgNo,currentEmp){
            $.ajax({
                url: '/cardManagement/getOrgUserNameList',
                data:{
                    orgNo:orgNo
                }
            }).done(function(data) {
                if (data != "") {
                    $('#q_salesman').empty();
                    var optionList = "";
                    if(currentEmp == ""){
                        optionList='<option value="" selected="selected" >--请选择--</option>';
                    }else{
                        optionList='<option value="" >--请选择--</option>';
                    }
                    for (var i = 0; i < data.length; i++) {
                        if(currentEmp != "" && currentEmp== data[i].userCode){
                            optionList += "<option selected='selected'  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";
                        }else{
                            optionList += "<option  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";
                        }
                    }
                    $("#q_salesman").append(optionList);
                }else{
                    $('#q_salesman').empty();
                }
            });
        }
    </g:javascript>
</content>