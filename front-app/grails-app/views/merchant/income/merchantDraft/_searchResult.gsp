
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="草稿列表"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div>
            <button id="addNewMerchant" type="button" class="col-md-offset-11 btn btn-primary">新增商户</button>
        </div>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap">
                <thead>
                <tr>
                    <domainSearchResult:header domain="merchantIncome" property="taskCode"/>
                    <domainSearchResult:header domain="merchantIncome" property="receiptsName"/>
                    <domainSearchResult:header domain="merchantIncome" property="registName"/>
                    <domainSearchResult:header domain="merchantIncome" property="mainManageBusiness"/>
                    <domainSearchResult:header domain="merchantIncome" property="legalPersonName"/>
                    <domainSearchResult:header domain="merchantIncome" property="linkmanMobileNo"/>
                    <domainSearchResult:header domain="merchantIncome" property="salesmanName"/>
                    <domainSearchResult:header domain="merchantIncome" property="createUser"/>
                    <domainSearchResult:header domain="merchantIncome" property="customClassify"/>
                    <domainSearchResult:header domain="merchantIncome" property="updateTime"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody>
                    <g:each var="merchantIncomeInstance"  in="${merchantIncomeInstanceList }">
                        <tr>
                        <domainSearchResult:rowData type="text" domain="merchantIncome" property="taskCode"
                                                    domainInstance="${merchantIncomeInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantIncome" property="receiptsName"
                                                    domainInstance="${merchantIncomeInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantIncome" property="registName" class="text-nowrap"
                                                    domainInstance="${merchantIncomeInstance }"/>

                        <g:if test="${merchantIncomeInstance.mainManageBusiness == null || merchantIncomeInstance.mainManageBusiness == ""}">
                            <domainSearchResult:rowData type="text" domain="merchantIncome" property="mainManageBusiness"
                                                        domainInstance="${merchantIncomeInstance }"/>
                        </g:if>
                        <g:else>
                            <g:if test="${merchantIncomeInstance.mainManageBusiness.length() > 30}">
                                <g:set var="mainManageBusiness" value="${merchantIncomeInstance.mainManageBusiness.substring(0, 30)}"/>
                                <td>${mainManageBusiness}...<span class="tdtip">${merchantIncomeInstance.mainManageBusiness}</span></td>
                            </g:if>
                            <g:else>
                                <domainSearchResult:rowData type="text" domain="merchantIncome" property="mainManageBusiness"
                                                            domainInstance="${merchantIncomeInstance }"/>
                            </g:else>
                        </g:else>
                        <domainSearchResult:rowData type="text" domain="merchantIncome" property="legalPersonName"
                                                    domainInstance="${merchantIncomeInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantIncome" property="linkmanMobileNo"
                                                    domainInstance="${merchantIncomeInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantIncome" property="salesmanName"
                                                    domainInstance="${merchantIncomeInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantIncome" property="createUser"
                                                    domainInstance="${merchantIncomeInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantIncome" property="customClassify"
                                                    domainInstance="${merchantIncomeInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantIncome" property="updateTime" textAlign="center"
                                                    domainInstance="${merchantIncomeInstance }"/>
                        <td class="tk-actions">
                            <g:link class="showMerchant" controller="merchantIncome" action="forwardShow" uuid="${merchantIncomeInstance?.id}" id="${merchantIncomeInstance?.id}">
                                <g:message code="default.button.show.label"/>
                            </g:link>
                            <g:if test="${currentUser == merchantIncomeInstance.createUserId}">
                                <g:link class="editDraft" controller="merchantIncome" action="edit"  uuid="${merchantIncomeInstance?.id}"  id="${merchantIncomeInstance?.id}" >
                                    <g:message code="default.button.edit.label"/>
                                </g:link>
                                <g:link class="delDraft" controller="merchantIncome" action="deleteDraft" uuid="${merchantIncomeInstance?.id}" id="${merchantIncomeInstance?.id}">
                                    <g:message code="default.button.delete.label"/>
                                </g:link>
                            </g:if>

                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        %{--<component:paginate total="${merchantIncomeInstanceCount }"/>--}%
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <script>
        $(function(){
            //新增商户
            $('#addNewMerchant').click(function(){
                window.location.href="/merchantIncome/create?ifNew=1";
            })
//             //显示商户
            $('.showMerchant').click(function(e){
                e.preventDefault();
                var uuid=$(this).attr('uuid');
                console.log(uuid);
                if(uuid==''){
                    alert("无效的数据.")
                    return false;
                }
                window.location.href="/merchantIncome/forwardShow?uuidParam="+uuid;
            })
            //删除商户
            $('.delDraft').click(function(e){
                e.preventDefault();
                var uuid=$(this).attr('uuid');
                console.log("====>要删除的id:"+uuid);
                bootbox.confirm({
                    buttons: {
                        cancel: {
                            label: '取消',
                            className: "green"
                        },
                        confirm: {
                            label: '确定',
                            className: "blue"
                        }
                    },
                    message: '确定删除选定草稿吗？',
                    callback: function(result) {
                        if(result) {
                            $.ajax({
                                url:"/merchantIncome/deleteDraft",
                                data:{uuid:uuid},
                                type:"POST",
                                dataType:"json",
                                success:function(json){
                                    if(json.result=="success"){
                                        bootbox.dialog({
                                            message: "删除成功！"
                                        });
                                        location.reload();
                                    }else{
                                        OKDialog("删除失败！");
                                    }
                                },
                                error:function(xhr, status){
                                    OKDialog("删除异常！");
                                }
                            })
                        } else {
                            //alert('点击取消按钮了');
                        }
                    },
                    title: "删除确认",
                });
            })

            //编辑商户
            $('.editDraft').click(function(e){
                e.preventDefault();
                var uuid=$(this).attr('uuid');
                window.location.href="/merchantIncome/edit?uuidParam="+uuid+"&pageType=draftEdit";
            })


            /**
             * alert提示信息封装
             * @param msg 要提示的信息内容
             */
            function OKDialog(msg) {
                bootbox.dialog({
                    message: msg,
                    buttons: {
                        success: {
                            label: "确定",
                            className: "green"
                        }
                    }
                });
            }
        })//end
    </script>
</content>
