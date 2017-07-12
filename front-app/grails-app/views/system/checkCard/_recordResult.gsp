
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'checkCard'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>

                    <domainSearchResult:header domain="checkCard" property="merchantCode" width="120"/>
                    %{--<domainSearchResult:header domain="checkCard" property="registName"/>--}%
                    <domainSearchResult:header domain="checkCard" property="receiptsName" width="120"/>
                    <domainSearchResult:header domain="checkCard" property="terminalNumber" width="120"/>
                    <domainSearchResult:header domain="checkCard" property="tradeTime" width="140"/>
                    <domainSearchResult:header domain="checkCard" property="amount" width="80"/>
                    <domainSearchResult:header domain="checkCard" property="reSalesManName" width="90"/>
                    %{--<domainSearchResult:header domain="checkCard" property="salesMan"/>--}%
                    <domainSearchResult:header domain="checkCard" property="bankCardNum" width="100"/>
                    <th width="30"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="checkCardInstance"
                               in="${checkCardInstanceList }">
                    <tr class="text-nowrap">
                        <domainSearchResult:rowData type="text" domain="checkCard" property="merchantCode"
                                                    domainInstance="${checkCardInstance }" textAlign="center"/>
                        %{--<domainSearchResult:rowData type="text" domain="checkCard" property="registName"--}%
                                                    %{--domainInstance="${checkCardInstance }"/>--}%
                        <domainSearchResult:rowData type="text" domain="checkCard" property="receiptsName"
                                                    domainInstance="${checkCardInstance }" textAlign="left"/>
                        <domainSearchResult:rowData type="text" domain="checkCard" property="terminalNumber"
                                                    domainInstance="${checkCardInstance }" textAlign="center"/>
                        <domainSearchResult:rowData type="text" domain="checkCard" property="tradeTime"
                                                    domainInstance="${checkCardInstance }" textAlign="center"/>
                        <domainSearchResult:rowData type="text" domain="checkCard" property="amount"
                                                    domainInstance="${checkCardInstance }" textAlign="right"/>
                        <domainSearchResult:rowData type="text" domain="checkCard" property="reSalesManName"
                                                    domainInstance="${checkCardInstance }" textAlign="left"/>
                        %{--<domainSearchResult:rowData type="text" domain="checkCard" property="salesMan"--}%
                                                    %{--domainInstance="${checkCardInstance }"/>--}%
                        <domainSearchResult:rowData type="text" domain="checkCard" property="bankCardNum"
                                                    domainInstance="${checkCardInstance }" textAlign="center"/>
                        <td class="tk-actions" align="center">
                        <g:link data-toggle="modal" data-target="#sample_modal1" controller="merchantManagement"
                                action="show" id="${checkCardInstance?.insideMerchantCode}" inm="${checkCardInstance?.insideMerchantCode}" agree="${checkCardInstance?.agreementNo}" class="clickShowList"><g:message code="checkCard.merchantDetail.label"/></g:link>
                    </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${checkCardInstanceCount != -1}">
            <component:paginate total="${checkCardInstanceCount }"/>
        </g:if>
        <component:modals id="sample_modal1" title="查看详情" width="full"/>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/validateLength.js"/>
    <asset:javascript src="userNameList.js"/>
    <asset:javascript src="table-simple.js"/>
    <asset:javascript src="merchant/merchant-query.js"/>
    <asset:javascript src="merchant/ejs/ejs_production.js"/>
    <asset:javascript src="merchant/ejs/ejs_fulljslint.js"/>
    <asset:javascript src="merchant/ejs/products.js"/>
    <asset:javascript src="merchant/form-validation.js"/>
    <asset:javascript src="global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"/>
    <g:javascript>
        $(function(){
            //FormValidation.init();
            SspMerchantQuery.init();

            $(".clickShowList").click(function(e){
                e.preventDefault();
                var inMno = $(this).attr("inm");
                var agreementNo = $(this).attr("agree");
                getCurrentRateAgreement(inMno,agreementNo);
            })

            function getCurrentRateAgreement(inMno,agreementNo){
    		    $.ajax({
                url: "${g.createLink(controller: "merchantManagement", action: "billingWay")}",
                data:{
                    insideMerchantCode: inMno,agreementCode: agreementNo
                }

    	    }).done(function(resultJson) {

    	         resultJson = eval('('+resultJson+')');
                 resultJson.data.justView = true;
                 resultJson.data.preset = false;
                  if(resultJson.data.effDt == undefined){
                        resultJson.data.effDt = '';
                   }

                 var innerHtml = new EJS({
	        		url : '/assets/merchant/ejs/goods.txt'
	        		}).render(resultJson.data);

                setTimeout(function () {
                    // $("#showBillingWay").empty();
                    $("#showBillingWay").append(innerHtml);
                },1000);
    	    });
         }


         $("input[name='q_merchantCode']").attr('maxlength',15);
            // $("input[name='q_receiptsname']").attr('maxlength',20);
            $("input[name='q_merchantCode']").keyup(function () {
                this.value=this.value.replace(/[^+\d]/g,'');
            });

            $("input[name='q_receiptsName']").keyup(function(){
                this.value=this.value.replace(/\s/g,'');
                WidthCheck(this, 40)
            })
            $("input[name='q_terminalNumber']").keyup(function(){
                this.value=this.value.replace(/[^+\d]/g,'');
            })
            $("input[name='q_bankCardNum']").attr('maxlength',20);
            $("input[name='q_bankCardNum']").keyup(function(){
                this.value=this.value.replace(/[^+\d]/g,'');
            })

        });

        $(".btn-reset").click(function(){
            $("#select2-salesmanCode-container").html("");
        })
    </g:javascript>
</content>
