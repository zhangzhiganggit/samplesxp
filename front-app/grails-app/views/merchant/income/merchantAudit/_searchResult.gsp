
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'merchantAudit'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>

        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    <domainSearchResult:header domain="merchantAudit" property="taskCode" width="230"/>
                    <domainSearchResult:header domain="merchantAudit" property="taskType" width="100"/>
                    <domainSearchResult:header domain="merchantAudit" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="merchantAudit" property="registName" width="120"/>
                    <domainSearchResult:header domain="merchantAudit" property="startPerson" width="80"/>
                    <domainSearchResult:header domain="merchantAudit" property="startPersonOrg" width="80"/>
                    <domainSearchResult:header domain="merchantAudit" property="startFlowTime" width="60"/>
                    <domainSearchResult:header domain="merchantAudit" property="updateFlowTime" width="120"/>
                    <domainSearchResult:header domain="merchantAudit" property="taskStatus" width="60"/>
                    <th width="80"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody>
                <g:each var="merchantAuditInstance"  in="${merchantAuditInstanceList }">
                    <tr>
                        <domainSearchResult:rowData type="text" domain="merchantAudit" property="taskCode" textAlign="center"
                                                    domainInstance="${merchantAuditInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantAudit" property="taskType" textAlign="center"
                                                    domainInstance="${merchantAuditInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantAudit" property="merchantCode" textAlign="center"
                                                    domainInstance="${merchantAuditInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantAudit" property="registName" textAlign="left"
                                                    domainInstance="${merchantAuditInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantAudit" property="startPerson" textAlign="left"
                                                    domainInstance="${merchantAuditInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantAudit" property="startPersonOrg" textAlign="left"
                                                    domainInstance="${merchantAuditInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantAudit" property="startFlowTime" textAlign="center"
                                                    domainInstance="${merchantAuditInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantAudit" property="updateFlowTime" textAlign="center"
                                                    domainInstance="${merchantAuditInstance }"/>
                        <domainSearchResult:rowData type="inList" domain="merchantAudit" property="taskStatus" textAlign="center"
                                                    domainInstance="${merchantAuditInstance }"/>

                        <td class="tk-actions" textAlign="center">

                            <g:if test="${merchantAuditInstance?.taskType == '商户录入流程'}">
                                %{--大pos商户--}%
                                <g:if test="${merchantAuditInstance?.jinjianType =='1'}">
                                <g:link class="showMerchant" controller="merchantIncome" action="forwardShow" uuid="${merchantAuditInstance?.id}" id="${merchantAuditInstance?.id}" taskStatus="${merchantAuditInstance?.taskStatus}" flowVersion="${merchantAuditInstance?.flowVersion}" flowNo="${merchantAuditInstance?.flowNo}">
                                    <g:message code="default.button.show.label"/>
                                </g:link>
                                    <g:if test="${merchantAuditInstance?.taskStatus == '7' || merchantAuditInstance?.taskStatus == '10'}">
                                        <g:link class="editMerchant" controller="merchantIncome" action="edit" uuid="${merchantAuditInstance?.id}"  id="${merchantAuditInstance?.id}" flowVersion="${merchantAuditInstance?.flowVersion}" flowNo="${merchantAuditInstance?.flowNo}">
                                            <g:message code="default.button.edit.label"/>
                                        </g:link>
                                    </g:if>
                                </g:if>

                                %{--//pc小微商户--}%
                                <g:if test="${merchantAuditInstance?.jinjianType =='2'}">
                                    <g:link controller="merchantSmallAndMicro" action="edit" id="${merchantAuditInstance?.id}" params="['taskCode':merchantAuditInstance?.taskCode,'handle':'show','flowNo':merchantAuditInstance?.flowNo]">
                                        <g:message code="default.button.show.label"/>
                                    </g:link>

                                    <g:if test="${merchantAuditInstance?.taskStatus == '7' || merchantAuditInstance?.taskStatus == '10'}">
                                    <g:link controller="merchantSmallAndMicro" action="edit" id="${merchantAuditInstance?.id}" params="['taskCode':merchantAuditInstance?.taskCode,'flowVersion':merchantAuditInstance?.flowVersion,'flowNo':merchantAuditInstance?.flowNo]">
                                        <g:message code="default.button.edit.label"/>
                                    </g:link>

                                    </g:if>
                                </g:if>


                            </g:if>

                    <g:if test="${merchantAuditInstance?.taskType == '小微转普通商户'}">
                            %{--pc小微转pos--}%
                            <g:if test="${merchantAuditInstance?.jinjianType =='3' && 'Pc'.equalsIgnoreCase(merchantAuditInstance?.equipType)}">
                                <g:link controller="merchantSmallTransPos" action="edit" id="${merchantAuditInstance?.id}" params="['taskCode':merchantAuditInstance?.taskCode,'handle':'show','flowNo':merchantAuditInstance?.flowNo]">
                                    <g:message code="default.button.show.label"/>
                                </g:link>

                                <g:if test="${merchantAuditInstance?.taskStatus == '7' || merchantAuditInstance?.taskStatus == '10'}">
                                    <g:link controller="merchantSmallTransPos" action="edit" id="${merchantAuditInstance?.id}" params="['taskCode':merchantAuditInstance?.taskCode,'flowVersion':merchantAuditInstance?.flowVersion,'flowNo':merchantAuditInstance?.flowNo]">
                                        <g:message code="default.button.edit.label"/>
                                    </g:link>

                                </g:if>
                            </g:if>
                    </g:if>
                            <g:if test="${merchantAuditInstance?.taskType == '商户信息变更流程'}">

                                %{--//商户修改流程--}%
                                <g:link class="showMerchantModify" controller="merchantIncomeModify" action="forwardShow" uuid="${merchantAuditInstance?.id}" id="${merchantAuditInstance?.id}" taskStatus="${merchantAuditInstance?.taskStatus}" flowVersion="${merchantAuditInstance?.flowVersion}" flowNo="${merchantAuditInstance?.flowNo}">
                                    <g:message code="default.button.show.label"/>
                                </g:link>

                                <g:if test="${merchantAuditInstance?.taskStatus == '7' || merchantAuditInstance?.taskStatus == '10'}">

                                    <g:link class="editMerchantModify" controller="merchantIncomeModify" action="edit" uuid="${merchantAuditInstance?.id}"  id="${merchantAuditInstance?.id}" flowVersion="${merchantAuditInstance?.flowVersion}" flowNo="${merchantAuditInstance?.flowNo}">
                                        <g:message code="default.button.edit.label"/>
                                    </g:link>
                                </g:if>
                            </g:if>
                            <g:if test="${merchantAuditInstance?.taskType == '二类小微信息修改'}">

                            %{--//二类小微信息修改--}%
                                <g:link class="showMerchantSmallAndMicroModify" controller="merchantSmallAndMicroModify" action="forwardShow"  uuid="${merchantAuditInstance?.id}" id="${merchantAuditInstance?.id}" taskStatus="${merchantAuditInstance?.taskStatus}" flowVersion="${merchantAuditInstance?.flowVersion}" flowNo="${merchantAuditInstance?.flowNo}">
                                    <g:message code="default.button.show.label"/>
                                </g:link>

                                <g:if test="${merchantAuditInstance?.taskStatus == '7' || merchantAuditInstance?.taskStatus == '10'}">
                                    <g:link controller="merchantSmallAndMicroModify" action="edit" id="${merchantAuditInstance?.id}" params="['taskCode':merchantAuditInstance?.taskCode,'flowVersion':merchantAuditInstance?.flowVersion,'flowNo':merchantAuditInstance?.flowNo,'handle':'edit']">
                                        <g:message code="default.button.edit.label"/>
                                    </g:link>

                                </g:if>
                            </g:if>

                            %{--结束工单--}%
                            <g:if test="${merchantAuditInstance?.taskStatus == '7' || merchantAuditInstance?.taskStatus == '10'}">
                                <g:link class="closeTask" controller="merchantIncomeModify" action="closeTask" taskCode="${merchantAuditInstance?.taskCode}"  flowNo="${merchantAuditInstance?.flowNo}" id="${merchantAuditInstance?.id}" flowVersion="${merchantAuditInstance?.flowVersion}" >
                                    <g:message code="merchantAudit.link.closeTask.label"/>
                                </g:link>
                            </g:if>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <component:paginate total="${merchantAuditInstanceCount }"/>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <script>
        $(function(){
            $('#showHistory').on('click', function (e) {
                e.preventDefault();
                var id = "task_list";
                var name = this.text;
                var href = this.href;
                parent.$("#ANewWindow").trigger('openNewWindowchanged', [id, name, href]);
            })

            //-------商户新增流程----
            //显示商户
            $('.showMerchant').click(function(e){
                e.preventDefault();
                var uuid=$(this).attr('uuid');
                var flowVersion=$(this).attr('flowVersion');
                var flowNo=$(this).attr('flowNo');
                console.log(uuid);
                if(uuid==''){
                    alert("无效的数据.")
                    return false;
                }
                var taskStatus = $(this).attr('taskStatus');
                window.location.href="/merchantIncome/forwardShow?uuidParam="+uuid+"&taskStatus="+taskStatus+"&flowVersion="+flowVersion+"&flowNo="+flowNo;
            })
            //编辑商户
            $('.editMerchant').click(function(e){
                e.preventDefault();
                var uuid=$(this).attr('uuid');
                var flowVersion=$(this).attr('flowVersion');
                var flowNo=$(this).attr('flowNo');
                window.location.href="/merchantIncome/edit?uuidParam="+uuid+"&flowVersion="+flowVersion+"&pageType=auditIncome&flowNo="+flowNo;
            })
            //-------小微信息修改流程----
            //显示商户
            $('.showMerchantSmallAndMicroModify').click(function(e){
                e.preventDefault();
                var uuid=$(this).attr('uuid');
                var flowVersion=$(this).attr('flowVersion');
                var flowNo=$(this).attr('flowNo');
                console.log(uuid);
                if(uuid==''){
                    alert("无效的数据.")
                    return false;
                }
                var taskStatus = $(this).attr('taskStatus');
                window.location.href="/merchantSmallAndMicroModify/forwardShow?uuidParam="+uuid+"&taskStatus="+taskStatus+"&flowVersion="+flowVersion+"&flowNo="+flowNo;
            })

            //-------商户修改流程----
            //显示商户
            $('.showMerchantModify').click(function(e){
                e.preventDefault();
                var uuid=$(this).attr('uuid');
                var flowVersion=$(this).attr('flowVersion');
                var flowNo=$(this).attr('flowNo');
                console.log(uuid);
                if(uuid==''){
                    alert("无效的数据.")
                    return false;
                }
                var taskStatus = $(this).attr('taskStatus');
                window.location.href="/merchantIncomeModify/forwardShow?uuidParam="+uuid+"&taskStatus="+taskStatus+"&flowVersion="+flowVersion+"&flowNo="+flowNo;
            })
            //编辑商户
            $('.editMerchantModify').click(function(e){
                e.preventDefault();
                var uuid=$(this).attr('uuid');
                var flowVersion=$(this).attr('flowVersion');
                var flowNo=$(this).attr('flowNo');
                window.location.href="/merchantIncomeModify/modifyMerchantEdit?uuidParam="+uuid+"&flowVersion="+flowVersion+"&flowNo="+flowNo;
            })

            //结束工单
            $('.closeTask').click(function(e){
                e.preventDefault();
                var taskCode=$(this).attr('taskCode');
                var flowVersion=$(this).attr('flowVersion');
                var flowNo=$(this).attr('flowNo');
                console.log(flowNo);
                if(flowNo==''){
                    alert("无效的数据.")
                    return false;
                }else{
                    bootbox.setLocale("zh_CN");
                    bootbox.confirm("确定结束工单？", function (result) {
                        if(result){
                            $.ajax({
                                url: '/merchantAudit/closeTask',
                                data : {
                                    taskCode : taskCode,
                                    flowVersion : flowVersion,
                                    flowNo:flowNo
                                },
                                async:false,
                                cache: true,
                                success : function() {
                                    location.reload();
                                }
                            });
                        }
                    })
                }
            })

        })//end
    </script>
</content>
