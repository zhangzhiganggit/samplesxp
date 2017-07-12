<%@ page import="com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder; com.suixingpay.ssp.front.Province" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${message(code: 'default.search.label', args: message.domain(domain: 'demo'))}"
                   iconCssClass="fa fa-filter"
                   actions="['collapse', 'config', 'reload', 'remove', 'fullscreen']"/>
    <portlet:body withForm="true">
        <form:form controller="demo" action="index" name="scaffold-search-demo">
            <form:scaffoldSearchProperties/>
            <form:body>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">
                                <message:property domain="demo" property="stringValue"/>
                            </label>

                            <div class=" col-lg-4 col-md-6 col-sm-6 col-sm-12">
                                <tk:autoComplete class="form-control takin-autoComplete"
                                                 name="q_stringValue"
                                                 linkParams="[controller: 'demo', action: 'autoComplete']"
                                                 value="${params ? params['q_stringValue'] : ''}"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <component:multipleSelectBoxes id="select2-input-group-append"
                                                       name="noticePerson" title="多选下拉框"
                                                       from="${CustomerServiceWorkOrder.constraintsMap['noticePerson'].inList}"
                                                       valueMessagePrefix="customerServiceWorkOrder.noticePerson"
                                                       noSelection="['': '请选择...']"/>

                        %{--<component:multipleSelectBoxes id="select2-input-group-append" name="stringValue" title="多选下拉框"--}%
                        %{--from="${Province.listOrderByName()}"--}%
                        %{--optionKey="name" optionValue="name"--}%
                        %{--noSelection="['': '请选择...']"/>--}%

                        %{--<img src="<g:createLink controller="displayGraph" action="viewImage"--}%
                        %{--params="[title: '/merchant-income/2016/10/10/1.jpg']"/>"/>--}%
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3"><message:property domain="demo"
                                                                                    property="dateValue"/></label>

                            <div class="col-md-9">
                                <div class="input-group date-picker input-daterange" data-date-format="yyyy/mm/dd">
                                    <input type="text" class="form-control" name="q_dateValue_from"
                                           value="${params ? params['q_dateValue_from'] : ''}"/>
                                    <span class="input-group-addon">to</span>
                                    <input type="text" class="form-control" name="q_dateValue_to"
                                           value="${params ? params['q_dateValue_to'] : ''}"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="btn-group" data-datepicker-target="dateValue"
                             data-datepicker-format="yyyy-MM-dd HH:mm">
                            <button type="button" class="btn btn-primary ssp-datepicker-today">本日</button>
                            <button type="button" class="btn btn-primary ssp-datepicker-yesterday">昨日</button>
                            <button type="button" class="btn btn-primary ssp-datepicker-thisweek">本周</button>
                            <button type="button" class="btn btn-primary ssp-datepicker-lastweek">上周</button>
                            <button type="button" class="btn btn-primary ssp-datepicker-thismonth">本月</button>
                            <button type="button" class="btn btn-primary ssp-datepicker-lastmonth">上月</button>
                            <button type="button" class="btn btn-primary ssp-datepicker-last1month">近一月</button>
                            <button type="button" class="btn btn-primary ssp-datepicker-last3month">近三月</button>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <domainSearch:orgTree domain="demo" property="stringValue" directly="false"/>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">
                                机构
                            </label>

                            <div class=" col-lg-4 col-md-6 col-sm-6 col-sm-12">
                                <tk:autoComplete class="form-control takin-autoComplete"
                                                 name="q_stringValue"
                                                 linkParams="[controller: 'SystemOrganization', action: 'autoComplete']"
                                                 value="${params ? params['q_stringValue'] : ''}"/>
                            </div>
                        </div>
                    </div>

                </div>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnIconClass="fa fa-search"/>
                <formActions:action action="create" value="${message(code: 'default.button.create.label')}"
                                    btnIconClass="fa fa-clone"/>

                <a class="btn btn-primary" data-toggle="modal" href="#sampleUpload" btnIconClass="fa fa-file">
                    <i class="fa fa-file"></i>${message(code: 'default.uploadFiles.label')}</a>

                <g:link class="btn btn-primary" controller="demo" action="exportExcel" params="${params}"><li
                        class="fa fa-download"></li>(导出Excel)</g:link>
                <g:link class="btn btn-primary ssp-ajaxmodal" controller="demo" action="showElectronicSignature"
                        data-modal-target="eSignatureModal">显示电子协议</g:link>
                <component:modals id="eSignatureModal" title="电子协议"/>
                <g:link class="btn btn-primary ssp-ajaxmodal" controller="demo" action="sampleAjaxShow"
                        data-modal-target="myModal">ajax modal</g:link>
                <component:modals id="myModal" title="Ajax Modal"/>
                <button type="button" class="btn green" id="showtoast">Show Toast</button>

                <button id="helloButton">hello</button>

                <div id="helloDiv"></div>
            </form:actions>
        </form:form>

    %{----}%
        <component:modals id="sampleUpload" title="${message(code: 'default.uploadFile.title.label')}">

            <component:multipleFileupload title="${message(code: 'default.uploadFile.title.label')}" controller="demo"
                                          action="fileupload"
                                          name="files[]"/>
        %{--<asset:image--}%
        %{--<div class="row">--}%
        %{--<component:download filePath="merchant_income/2016/09/20/9390d8d7-a49e-46fe-931d-661de65feb4a.jpg"--}%
        %{--fileName="filename.png"--}%
        %{--title="${message(code: 'default.download.action.label')}"/>--}%
        %{--</div>--}%
        %{--<img src="/assets/merchant_income/2016/09/20/7fb7f033-5fd7-4f52-bdc2-75678349a541.jpg" />--}%
        %{--<g:assetPath src="/merchant_income/2016/09/20/97be84ac-a359-4756-be5d-46277ac5e5cb.jpg"/>--}%
        %{--<img src="<g:assetPath src="/merchant_income/2016/09/20/97be84ac-a359-4756-be5d-46277ac5e5cb.jpg"/>"/>--}%
        %{--<g:link controller="download" params="[filePath: 'merchant_income/2016/09/20/87bd33d0-98d3-4fca-bb86-31ca9480de7d.jpg']">文件下载</g:link>--}%
            <component:portlet cssClass="form-fit">
                <portlet:title title="${message(code: 'default.upload.action.select.label')}"
                               iconCssClass="icon-folder font-green"
                               actions="[]"/>
                <portlet:body withForm="true">
                    <g:uploadForm controller="#" action="#" class="form-horizontal form-bordered">
                        <form:body>
                            <component:simpleFileupload title="${message(code: 'default.uploadFile.title.label')}"
                                                        name="files[]" withInput="false"/>
                            <component:simpleFileupload title="${message(code: 'default.uploadFile.title.label')}"
                                                        name="files[]" withInput="true"/>
                        </form:body>
                        <form:actions>
                            <formActions:submit value="${message(code: 'default.button.submit.label')}"
                                                btnIconClass="fa fa-check"/>
                            <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                               btnIconClass="fa fa-check"/>
                        </form:actions>
                    </g:uploadForm>
                </portlet:body>
            </component:portlet>

        </component:modals>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    %{--简洁模式--}%
    <asset:javascript src="table-simple.js"/>
    <g:javascript>

        SspFrontDemo.init();

        $(function () {
            $('input[name=file1]').on('change.bs.fileinput', function () {
                var fileInput = $('#someFile').clone().attr('name', 'file2');
                $('#fileinput-container').append(fileInput);
            });
        });

        $(function () {
            $("#helloButton").on('click', function (e) {
                e.preventDefault();

                bootbox.confirm({
                    title: "提示框",
                    message: "1	提示框：标题居右，提示信息居中，按钮居中。如果单纯的提示框如保存成功下方按钮名称为“关闭”。",
                    buttons: {
                        cancel: {
                            label: '<i class="fa fa-times"></i> 取消'
                        },
                        confirm: {
                            label: '<i class="fa fa-check"></i> 确认'
                        }
                    },
                    callback: function (result) {
                        console.log('This was logged in the callback: ' + result);
                    }
                }).css({
                    'top': '50%',
                    'margin-top': function () {
                        return -($(this).height() / 2);
                    }
                });
            })
        })

    </g:javascript>
</content>
