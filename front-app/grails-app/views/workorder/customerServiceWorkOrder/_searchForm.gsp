<asset:javascript src="global/plugins/jquery.min.js"/>
<component:portlet cssClass="scaffold-search">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-filter"></i>
            <span class="caption-subject bold uppercase">客服协办查询条件</span>
            <span class="caption-helper"></span>
        </div>
        <div class="tools">
            <a href="${sms_front_url}/fromSspToHomePage.do?userName=${userName}&password=${passWord}&url=/workOrder/list.do?isFirst=true" id="showHistory"><span class="caption-subject bold uppercase" style="color: red;text-decoration:underline">处理历史客服工单</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href=":;" class="collapse" data-original-title="" title=""> </a>

            <a href=":;" class="fullscreen" data-original-title="" title=""> </a>

        </div>
    </div>
    <portlet:body withForm="true">
        <form:form controller="customerServiceWorkOrder" action="index"
                   name="scaffold-search-customerServiceWorkOrder">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="customerServiceWorkOrder" property="merchantCode"/>
                <domainSearch:textField domain="customerServiceWorkOrder" property="receiptsName"/>
                %{--<domainSearch:select property="belongToOrg" domain="customerServiceWorkOrder" class="form-control" name="q_belongToOrg" from="${com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder.getConstraintsMap()['orderType'].inList}" valueMessagePrefix="customerServiceWorkOrder.orderType" value="${params ? params['q_belongToOrg'] : ''}" noSelection="['':'--请选择--']" />--}%
                <domainSearch:orgTree domain="customerServiceWorkOrder" property="belongToOrg" directly="true"/>
                <domainSearch:textField domain="customerServiceWorkOrder" property="workOrderNo"/>
                <domainSearch:select2 property="isReminders" domain="customerServiceWorkOrder" class="form-control" name="q_isReminders" from="${com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder.getConstraintsMap()['isReminders'].inList}" valueMessagePrefix="customerServiceWorkOrder.isReminders" value="${params ? params['q_isReminders'] : ''}" noSelection="['':'--请选择--']" />
                <div class="col-xs-12 col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label col-md-4">
                            <message:property domain="customerServiceWorkOrder" property="orderStatus" /><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:select class="form-control select2" name="q_orderStatus" from="${com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder.getConstraintsMap()['orderStatus'].inList}"
                                      value="${params ? params['q_orderStatus']:'' }" valueMessagePrefix="customerServiceWorkOrder.orderStatus" />
                        </div>
                    </div>
                </div>

                %{--<domainSearch:select property="orderStatus" domain="customerServiceWorkOrder" class="form-control" name="q_orderStatus" from="${com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder.getConstraintsMap()['orderStatus'].inList}" valueMessagePrefix="customerServiceWorkOrder.orderStatus" value="${params ? params['q_orderStatus'] : ''}" noSelection="['':'--请选择--']"/>--}%
                <domainSearch:select2 property="orderLevel" domain="customerServiceWorkOrder" class="form-control" name="q_orderLevel" from="${com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder.getConstraintsMap()['orderLevel'].inList}" valueMessagePrefix="customerServiceWorkOrder.orderLevel" value="${params ? params['q_orderLevel'] : ''}" noSelection="['':'--请选择--']" />
                <domainSearch:select2 property="orderType" domain="customerServiceWorkOrder" class="form-control" name="q_orderType" from="${com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder.getConstraintsMap()['orderType'].inList}" valueMessagePrefix="customerServiceWorkOrder.orderType" value="${params ? params['q_orderType'] : ''}" noSelection="['':'--请选择--']" />
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4">
                            <message:property domain="customerServiceWorkOrder" property="questionType" /><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:select class="form-control select2" name="q_questionType" optionKey="dictId" optionValue="dictName"
                                      from="${questionList}" value="${params ? params['q_questionType'] : '' }" noSelection="['':'--请选择--']" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4">
                            <message:property domain="customerServiceWorkOrder" property="questionChildType" /><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:select class="form-control select2" name="q_questionChildType" optionKey="dictId" optionValue="dictName"
                                      from="" value="${params ? params['q_questionChildType'] : '' }" noSelection="['':'--请选择--']" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4">
                            <message:property domain="customerServiceWorkOrder" property="questionTitle" /><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:select class="form-control select2" name="q_questionTitle" optionKey="dictId" optionValue="dictName"
                                      from="" value="${params ? params['q_questionTitle'] : '' }" noSelection="['':'--请选择--']" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4">
                            <message:property domain="customerServiceWorkOrder" property="questionDetail" /><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <g:select class="form-control select2" name="q_questionDetail" optionKey="dictId" optionValue="dictName"
                                      from="" value="${params ? params['q_questionDetail'] : '' }" noSelection="['':'--请选择--']" />
                        </div>
                    </div>
                </div>

                <domainSearch:datePicker domain="customerServiceWorkOrder" property="orderCreateTime" dataDateFormat="yyyy-mm-dd"/>
                <domainSearch:datePicker domain="customerServiceWorkOrder" property="timeLimit" dataDateFormat="yyyy-mm-dd"/>
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
<script type="text/javascript">
    $(function() {
        $('#showHistory').on('click', function (e) {
            e.preventDefault();
            var id = "workOrder_list";
            var name = this.text;
            var href = this.href;
            parent.$("#ANewWindow").trigger('openNewWindowchanged', [id, name, href]);
        })
        $("input").keyup(function () {
            this.value=this.value.replace(/\s/g,'');
        });

        $(".btn-modify").click(function (e) {
            e.preventDefault();
            $("input:text").not("[readonly]").val("");
            $("select").prop('selectedIndex', 0);
            $(".select2-hidden-accessible:not(#q_orderStatus)").val("").trigger("change");
            $("#q_orderStatus").val("1").trigger("change");
            $("#orgInputId").val($("#hiddenCurrentOrgNo").val());
            $("#orgInput").val($("#hiddenCurrentOrgName").val());
        });

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

        console.log(999)
        $("select[name='q_questionType']").change(function () {
            var id = $("select[name='q_questionType']").val();
            $.ajax({ url: "/customerServiceWorkOrder/getQuestionType",
                data:{parentDictId:id,dictGroupId:47},
                async:false,
                success: function(data){
                    if (data !="") {
                        var optionList="<option  value=''>--请选择--</option>";
                        for(var i=0;i<data.length;i++){
                            optionList+="<option  value='"+data[i].dictId+"'>"+data[i].dictName+"</option>";
                        }
                        $("select[name='q_questionChildType']").html(optionList);
                        optionList="<option  value=''>--请选择--</option>";
                        $("select[name='q_questionTitle']").html(optionList);
                        $("select[name='q_questionDetail']").html(optionList);
                    }
                }
            });

        })
        $("select[name='q_questionChildType']").change(function () {
            var id = $("select[name='q_questionChildType']").val();
            $.ajax({ url: "/customerServiceWorkOrder/getQuestionType",
                data:{parentDictId:id,dictGroupId:47},
                async:false,
                success: function(data){
                    if (data !="") {
                        var optionList="<option  value=''>--请选择--</option>";
                        for(var i=0;i<data.length;i++){
                            optionList+="<option  value='"+data[i].dictId+"'>"+data[i].dictName+"</option>";
                        }
                        $("select[name='q_questionTitle']").html(optionList);
                        optionList="<option  value=''>--请选择--</option>";
                        $("select[name='q_questionDetail']").html(optionList);
                    }
                }
            });

        })
        $("select[name='q_questionTitle']").change(function () {
            var id = $("select[name='q_questionTitle']").val();
            $.ajax({ url: "/customerServiceWorkOrder/getQuestionType",
                data:{parentDictId:id,dictGroupId:47},
                async:false,
                success: function(data){
                    if (data !="") {
                        var optionList="<option  value=''>--请选择--</option>";
                        for(var i=0;i<data.length;i++){
                            optionList+="<option  value='"+data[i].dictId+"'>"+data[i].dictName+"</option>";
                        }
                        $("select[name='q_questionDetail']").html(optionList);
                    }
                }
            });

        })

        $("a.fancybox").fancybox({
            'transitionIn'	:	'elastic',
            'transitionOut'	:	'elastic',
            'speedIn'		:	600,
            'speedOut'		:	200,
            'overlayShow'	:	false
        });
    })

</script>