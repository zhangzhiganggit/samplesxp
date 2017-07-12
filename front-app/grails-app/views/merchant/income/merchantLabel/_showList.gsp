<div class="modal-header ">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title label-modal-title">标签管理</h4>
</div>
<div class="modal-body" style="padding: 0px">
<component:portlet cssClass="scaffold-searchResult">
    <portlet:body>
        <div class="table-toolbar">
            <div class="btn-group pull-right">
                <button id="btnAdd" style="margin-right: 2rem;" class="btn btn-ok"><g:message code="merchantLabel.button.add.label"/></button>
                <button id="btnBack" class="btn btn-cancle"><g:message code="merchantLabel.button.back.label"/></button>
            </div>
        </div>
        <div id="labelShowDiv" class="table-scrollable" style="max-height: 50rem; overflow-y: auto;" >
            <table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap">
                <thead>
                <tr>
                    %{--<domainSearchResult:header domain="merchantLabel" property="typeCode"/>--}%
                    <g:if test="${typeCode == 2}">
                        <domainSearchResult:header domain="merchantLabel" property="nameBank"/>
                    </g:if>
                    <g:else>
                        <domainSearchResult:header domain="merchantLabel" property="name"/>
                        <domainSearchResult:header domain="merchantLabel" property="describe"/>
                    </g:else>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody>
                <tr id="trAddInfo" class="hidden">
                    <td>
                        <g:textField class="form-control" name="name" id="addName" data-maxLen="20" title="最多输入20字符或10个汉字" value=""/>
                        <input type="hidden" id="typeCode" value="${typeCode}"/>
                    </td>
                    <g:if test="${typeCode != 2}">
                        <td>
                            <g:textField class="form-control" name="describe" id="addDescribe" data-maxLen="30" title="最多输入30字符或15个汉字" value=""/>
                        </td>
                    </g:if>
                    <td class="tk-actions" style="padding-top: 1rem;">
                        <a id="btnCommit" href="#"><g:message code="merchantLabel.button.commit.label"/></a>
                        &nbsp;&nbsp;
                        <a id="btnCancel" href="#"><g:message code="merchantLabel.button.cancel.label"/></a>
                    </td>
                </tr>
                <g:if test="${typeCode == 2}">
                    <g:each var="merchantLabelInstance" in="${merchantLabelInstanceList }">
                        <tr>
                            <domainSearchResult:rowData type="text" domain="merchantLabel" property="name" domainInstance="${merchantLabelInstance }"/>
                            <td class="tk-actions">
                                <a class="data-del" disabled="true" onclick="deleteFun(this);" id="${merchantLabelInstance?.id}" href="#"><g:message code="merchantLabel.button.delete.label"/></a>
                            </td>
                        </tr>
                    </g:each>
                </g:if>
                <g:else>
                    <g:each var="merchantLabelInstance" in="${merchantLabelInstanceList }">
                        <tr>
                            <domainSearchResult:rowData type="text" domain="merchantLabel" property="name" domainInstance="${merchantLabelInstance }"/>
                            <domainSearchResult:rowData type="text" domain="merchantLabel" property="describe" domainInstance="${merchantLabelInstance }"/>
                            <td class="tk-actions">
                                <a class="data-del" onclick="deleteFun(this);" id="${merchantLabelInstance?.id}" href="#"><g:message code="merchantLabel.button.delete.label"/></a>
                            </td>
                        </tr>
                    </g:each>
                </g:else>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
</div>
<script>
    $(function(){
        var typeCode=$('#typeCode').val();
        if(typeCode=="1"){
            $('.label-modal-title').html("业务员标签管理");
        }else if(typeCode=="2"){
            $('.label-modal-title').html("银行合作标识标签管理");
        }else{
            $('.label-modal-title').html("自定义分类标签管理");
        }

        $("#addName,#addDescribe").keyup(function(){
            this.value=this.value.replace(/\s/gi,'');//去除空格

            var maxLen=$(this).attr("data-maxLen");
            console.log(maxLen)
            WidthCheck(this, maxLen)
        });

        //添加
        $('#btnAdd').click(function () {
            $('#trAddInfo').removeClass('hidden');
        });

        //返回(关闭)
        $('#btnBack').click(function () {
            $('#customLabelModal').modal('hide');
        });


        //提交
        $('#btnCommit').click(function () {
            var name=$('#addName').val();
            var des=$('#addDescribe').val();
            var codeVal=typeCode;

            optionButton(true);//禁止操作其他按钮
            var data;
            console.log("==================>UUU:"+codeVal)
            if(codeVal=='2'){
                if(name==''){
                    alert('请填写完整!');
                    return false;
                }
                data={typeCode:codeVal,name:name};
            }else{
                if(name=='' || des==''){
                    alert('请填写完整!')
                    return false;
                }
                data={typeCode:codeVal,name:name,describe:des};
            }
            console.log("====>"+data)
            $.ajax({
                url:"/merchantLabel/saveLabelAjax",
                data:data,
                type:"POST",
                dataType:"json",
                success:function(json){
                    console.log(json)
                    if(json.result==1){
                        //重新查询列表信息
                        $.ajax({
                            url:"/merchantLabel/queryLabelList",
                            data:{typeCode:codeVal},
                            type:"POST",
                            success:function(htmlDom){
                                $('#customLabelModal .modal-content').empty();
                                $('#customLabelModal .modal-content').html(htmlDom);
                            },
                            error:function(xhr, status){
                                optionButton(false);//放开其他按钮操作
                                alert("刷新失败.");
                            }
                        })
                    }else{
                        optionButton(false);//放开其他按钮操作
                        alert("添加失败!");
                    }
                },
                error:function(xhr, status){
                    optionButton(false);//放开其他按钮操作
                    alert("添加异常!");
                }
            })
        });

        //放弃
        $('#btnCancel').click(function () {
            $('#trAddInfo').addClass('hidden');
            $('#trAddInfo input[type=text]').val("");
        });
    })

    function deleteFun(obj){
        var uid=$(obj).attr("id");
        var typeCode=$('#typeCode').val();
        optionButton(true);//禁止操作其他按钮
        $.ajax({
            url:"/merchantLabel/deleteLabelAjax",
            data:{uuid:uid},
            type:"POST",
            dataType:"json",
            success:function(json){
                console.log(json);
                if(json.result==1){
                    //刷新列表数据
                    $.ajax({
                        url:"/merchantLabel/queryLabelList",
                        data:{typeCode:typeCode},
                        type:"POST",
                        success:function(htmlDom){
                            $('#customLabelModal .modal-content').empty();
                            $('#customLabelModal .modal-content').html(htmlDom);
                        },
                        error:function(xhr, status){
                            $('.data-del').removeClass('hidden');
                            alert("刷新失败.");
                        }
                    })
                }else{
                    console.log("======返回错误的值==========");
                    optionButton(false);//放开其他按钮操作
                    alert("删除失败!");
                }
            },
            error:function(xhr, status){
                optionButton(false);//放开其他按钮操作
                alert("删除异常!");
            }
        })
    }

    //控制其余按钮的显示与隐藏
    function optionButton(bl){
        if(bl){
            $('.data-del').addClass('hidden');
            $('#btnAdd').prop('disabled',true);
            $('#btnBack').prop('disabled',true);
            $('#btnCommit').addClass('hidden');
            $('#btnCancel').addClass('hidden');
        }else{
            $('.data-del').removeClass('hidden');
            $('#btnAdd').prop('disabled',false);
            $('#btnBack').prop('disabled',false);
            $('#btnCommit').removeClass('hidden');
            $('#btnCancel').removeClass('hidden');
        }
    }
</script>