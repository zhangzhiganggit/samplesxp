<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'checkCard'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>

                    <domainSearchResult:header domain="checkCard" property="bankCardNum" width="100"/>
                    %{--<domainSearchResult:header domain="checkCard" property="startDate"/>--}%
                    <domainSearchResult:header domain="checkCard" property="salesManName" width="100"/>
                    <domainSearchResult:header domain="checkCard" property="takeDate" width="60"/>
                    <th width="60"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="checkCardInstance"
                               in="${checkCardInstanceList }">
                    <tr>
                        <g:if test="${checkCardInstance.bankCardNum != null && checkCardInstance?.bankCardNum.length() >= 10}">
                            <g:set var="ak" value="${checkCardInstance?.bankCardNum.substring(0, 6)}"/>
                            <g:set var="bk" value="${checkCardInstance?.bankCardNum.substring((checkCardInstance?.bankCardNum.length() - 4),checkCardInstance?.bankCardNum.length() )}"/>
                            <td style="text-align: center" align="center">${ak}******${bk}</td>
                        </g:if>
                        <g:else>
                            <domainSearchResult:rowData type="text" domain="checkCard" property="bankCardNum" textAlign="center"
                                                        domainInstance="${checkCardInstance }"/>
                        </g:else>
                        %{--<domainSearchResult:rowData type="text" domain="checkCard" property="bankCardNum"--}%
                                            %{--domainInstance="${checkCardInstance }"/>--}%
                    %{--<domainSearchResult:rowData type="text" domain="checkCard" property="startDate" format="yyyy-MM-dd"--}%
                                                %{--domainInstance="${checkCardInstance }"/>--}%
                    <domainSearchResult:rowData type="text" domain="checkCard" property="salesManName"
                                                domainInstance="${checkCardInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="checkCard" property="takeDate" format="yyyy-MM-dd" textAlign="center"
                                                domainInstance="${checkCardInstance }"/>
                        <td class="tk-actions" align="center">
                            <g:link controller="checkCard" action="edit" params="[cardId:checkCardInstance?.cardId,salesmanCode:checkCardInstance?.salesmanCode,offsetHid:offsetHid,maxHid:maxHid]"><g:message
                                    code="checkCard.alter.label"/></g:link>
                            <g:link class="deleteCard" cardId="${checkCardInstance?.cardId}"><g:message code="default.button.delete.label"/></g:link>
                            <g:hiddenField name="cardId" value="${checkCardInstance?.cardId}"/>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${checkCardInstanceCount != -1}">
            <component:paginate total="${checkCardInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/system/checkCard.js"/>
    <g:javascript>
        // $(function () {
        //     $('.hiddenMainInfo').each(function(){
        //         debugger
        //         var child = $(this)[0];
        //         var span=document.createElement("span");
        //         var font=document.createElement("font");
        //         span.innerHTML=child.innerHTML;
        //         font.innerHTML=child.innerHTML;
        //         if(child.innerHTML.length>7){
        //             font.innerHTML = 	child.innerHTML.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2');
        //             // font.innerHTML = 	child.innerHTML.replace(/(\d{4})\d{*}(\d{4})/, '****$1****');
        //             child.innerHTML = "";
        //         }
        //         span.style.display= "none";
        //         child.appendChild(span);
        //         child.appendChild(font);
        //         $(this).click(function(){
        //             $(this).find("span").attr("style","display:inline");

        //             $(this).find("font").attr("style","display:none");
        //         });
        //     });
        // })
        $(function () {
            $("input[name='q_bankCardNum']").keyup(function () {
                this.value=this.value.replace(/[^+\d]/g,'');
            });
            $("input[name='q_bankCardNum']").attr('maxlength',20);

        });

        $(".btn-modify").click(function (e) {
            e.preventDefault();
            $("input:text").not("[readonly]").val("");
            // $("select").prop('selectedIndex', 0);
            $(".select2-hidden-accessible").val("").trigger("change");
            // $("#beginDate").val(getNowFormatDate());
            // $("#endDate").val(getNowFormatDate());
            // $("#orgInputId").val($("#hiddenCurrentOrgNo").val());
            // console.log($("#hiddenCurrentOrgNo").val());
            // $("#orgInput").val($("#hiddenCurrentOrgName").val());
            // console.log($("#hiddenCurrentOrgName").val());
        });
    </g:javascript>
</content>