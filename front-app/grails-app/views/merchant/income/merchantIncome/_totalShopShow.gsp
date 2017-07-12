<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.TotalShop" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">总店信息</h4>
</div>

<div class="modal-body" style="padding: 0px">
    <%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.TotalShop" %>
    <component:portlet cssClass="scaffold-search">
        %{--<portlet:title title="查询总店信息"/>--}%
        <portlet:body withForm="true">
            <form:form controller="totalShop" action="indexModel" name="scaffold-${formAction}-totalShop">
                %{--<form:scaffoldSearchProperties/>--}%
                <form:body>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group-sm">
                                <label class="col-sm-3 control-label">
                                    商户编号：
                                </label>
                                <div class="col-sm-7${hasErrors(bean: totalShopInstance, field: 'merchantCodeTotalShop', ' takin-input-errors')}">
                                    <g:textField class="form-control bootstrap-switch-readonly" name="merchantCodeTotalShop" value="${totalShopInstance?.merchantCodeTotalShop}"/>
                                    <span class="help-block"><g:fieldError bean="${totalShopInstance}" field="merchantCodeTotalShop"/></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group-sm">
                                <label class="col-sm-3 control-label">
                                    签购单名称：
                                </label>
                                <div class="col-sm-7${hasErrors(bean: totalShopInstance, field: 'receiptsNameTotalShop', ' takin-input-errors')}">
                                    <g:textField class="form-control bootstrap-switch-readonly" name="receiptsNameTotalShop" value="${totalShopInstance?.receiptsNameTotalShop}"/>
                                    <span class="help-block"><g:fieldError bean="${totalShopInstance}" field="receiptsNameTotalShop"/></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group-sm">
                                <label class="col-sm-3 control-label">
                                    注册名称：
                                </label>
                                <div class="col-sm-7${hasErrors(bean: totalShopInstance, field: 'registNameTotalShop', ' takin-input-errors')}">
                                    <g:textField class="form-control bootstrap-switch-readonly" name="registNameTotalShop" value="${totalShopInstance?.registNameTotalShop}"/>
                                    <span class="help-block"><g:fieldError bean="${totalShopInstance}" field="registNameTotalShop"/></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <button id="doFind" type="button" class="btn btn-search btn-sm">查  询</button>
                            &nbsp;&nbsp;
                            <button id="doreset" type="reset" class="btn btn-reset btn-sm">重  置</button>
                        </div>
                    </div>
                </form:body>
            </form:form>
        </portlet:body>
    </component:portlet>
    <component:portlet cssClass="scaffold-searchResult" style="padding: 2px">
        <portlet:body>
            <div class="table-scrollable" style="max-height: 50rem; overflow-y: auto;" >
                <table class="table table-striped table-bordered table-hover dataTable no-footer">
                    <thead>
                    <tr>
                        <domainSearchResult:header domain="totalShop" property="merchantCodeTotalShop"/>
                        <domainSearchResult:header domain="totalShop" property="receiptsNameTotalShop"/>
                        <domainSearchResult:header domain="totalShop" property="registNameTotalShop"/>
                        <th><g:message code="default.actions.label"/></th>
                    </tr>
                    </thead>
                    <tbody class="modelIdentify class-my-data">

                    </tbody>
                </table>
            </div>
        </portlet:body>
    </component:portlet>
</div>
<script>
    $(function(){

        //弹出总店查询窗口列表
        $('#doFind').click(function(){
            var merchantCode=$('#merchantCodeTotalShop').val();
            var receiptsName=$('#receiptsNameTotalShop').val();
            var registName=$('#registNameTotalShop').val();
            var mecTypeFlag=$('#merchantType').val();

            //总店类型(01=连锁总店或者03=1+N总店)
            if(mecTypeFlag=='3'){
                mecTypeFlag='01';
            }else if(mecTypeFlag=='5'){
                mecTypeFlag='03';
            }else{
                console.log("****商户类型参数异常******");
                return;
            }

            $('#doFind').prop('disabled',true);
            $.ajax({
                url:"/totalShop/indexModel",
                data:{mecTypeFlag:mecTypeFlag,merchantCode:merchantCode,receiptsName:receiptsName,registName:registName},
                type:"POST",
                //dataType:"json",
                success:function(htmlDom){
                    $("div").find('.modelIdentify').next().empty();
                    $("div").find('.modelIdentify').html(htmlDom);
                    $('#doFind').prop('disabled',false);
                },
                error:function(xhr, status){
                    console.log("查询内部异常....。");
                    $('#doFind').prop('disabled',false);
                }
            })
        })

        //禁止输入空格
        $("#merchantCodeTotalShop,#receiptsNameTotalShop,#registNameTotalShop").keyup(function(){
            this.value=this.value.replace(/\s/gi,'');//去除空格

            //输入的最大字节数判断
            //var maxLen=$(this).attr("data-maxLen");
            //console.log(maxLen)
            //WidthCheck(this, maxLen)
        });
    })

    //回显"隶属商户编码"与"隶属商户名称"信息
    function chooseTotalShop(merchantCode,shopCode,shopName){
       // $('#subjectionMerchantCode').val(shopCode);
//        $('#subjectionMerchantName').val(shopName);
//        merchantCode='836121058120149';

        console.log("=========>商户编号:"+merchantCode);

        //TODO 根据商户编号，查询其他商户基本信息-(调用接口)
        //
        $.ajax({
            url:"/totalShop/findMerchantInfo",
            data:{merchantCode:merchantCode},
            type:"POST",
            dataType:"json",
            success:function(json){
                console.log(json);
                var resultCode = json.msgCd;
                if("MEC00000"!=resultCode){
                    return false;
                }
                data = json.retMercIfPo;
                data1 = json.tBapUsrStmIfPo;

                /**
                 * 商户基本信息
                 */
                var parentMercId = data.tBapMecIfPo.mno;
                var parentMercNm = data.tBapMecIfPo.cprRegNmCn;
                $("#subjectionMerchantCode").val(parentMercId);	// 隶属总店商编
                $('#subjectionMerchantName').val(parentMercNm);// 隶属总店注册名称
                // 如果接口返回信息中隶属商户注册名称为空，则重新查询获取隶属商户注册名称 TODO 待完善
//                if(parentMercNm = undefined || parentMercNm ==''){
//                    $.ajax({
//                        url: '/mercInfoUpdate/getAffiliatedMerchantRegNmByMercId.do?mno='+parentMercId+'&mecTypeFlag='+mecTypeFlag,
//                        cache: false,
//                        async:true,
//                        success: function(parentMercNm) {
//                            if(parentMercNm == null || parentMercNm==''){
//                                alert('无法获取隶属商户名称!');
//                            }else{
//                                $("#parentMercNm").val(parentMercNm);
//                            }
//                        }
//                    });
//                }

                $('#businessName').val(data.tBapMecIfPo.cprOperNmCn);// 商户经营名称
                $('#receiptsName').val(data.tBapMecIfPo.mecDisNm);// 签购单名称

                // 回填-营业地址(装机地址)
                var merctrddesc=data.tBapMecIfDetailPo.busAddr;
                var mercProv=data.tBapMecIfPo.mecProvCd;
                var mercCity=data.tBapMecIfPo.mecCityCd;
                var mercTown=data.tBapMecIfPo.mecDistCd;
                $('[name=bindAddrProvinceHidden]').val(mercProv);
                $('[name=bindAddrCityHidden]').val(mercCity);
                $('[name=bindAddrAreaHidden]').val(mercTown);
                $('[name=bindAddressStreet]').val(merctrddesc);
                startPCA("provincespan","cityspan",      "areaspan",  "bindAddressProvince",  "bindAddressCity", "bindAddressArea",   "bindAddrProvinceHidden", "bindAddrCityHidden",  "bindAddrAreaHidden");

                $('#mainManageBusiness').val(data.tBapMecIfDetailPo.operScope);// (主营业务=经营范围)
                $('#linkmanName').val(data.tBapUsrIfCrpPo.contNmCn);// 联系人姓名
                $('#linkmanMobileNo').val(data.tBapUsrIfCrpPo.contTelNo);// 联系人手机号
                $('#serviceTel').val(data.tBapMecIfPo.csTelNo);// 商户客服电话
                $('#managerPhone').val(data.tBapMecIfDetailPo.mecAdminTel);// 管理员手机号

                // 商户归属机构 TODO 待确认
                //var orgNo = data.tBapMecItnAttrIfPo.orgNo;
                //$('#orgNo').val(orgNo);

                console.log("---总店查询业务员编号:"+data.tBapMecItnAttrIfPo.empNo);
                //$('#busManName').val(data.tBapMecItnAttrIfPo.empNm);// 业务员名称
                $('#salesmanName').val(data.tBapMecItnAttrIfPo.empNo);// 业务员编号
                $('#registName').val(data.tBapMecIfPo.cprRegNmCn);// 注册名称
                $('#registCode').val(data.tBapMecIfDetailPo.operLicNo);// 注册登记号
                $('#legalPersonName').val(data.tBapMecIfDetailPo.legPerNm);// 法人姓名
                $('#legalPersonCode').val(data.tBapMecIfDetailPo.legPerCrdNo);// 证件号码

                //=========================================TODO 结算信息回填===============================================
                var stmBanks = data.stmBnks;
                if(($("#merchantType").val()=='3' || $("#merchantType").val()=='5') && stmBanks!=null && stmBanks!=undefined && stmBanks.length>0){
                    // 默认结算账号序号
                    var defaultSettleCardIndex = 0;
                    for(var i=0;i<stmBanks.length;i++){
                        var stmBank = stmBanks[i];
                        if(stmBank.stmMetNo != undefined && stmBank.stmMetNo == '01'){
                            defaultSettleCardIndex = i;
                        }
                    }
                    var stmActTyp1=stmBanks[defaultSettleCardIndex].actTyp;// 结算账户类型
                    var startWord = 'toPrivate';
                    if(stmActTyp1=='00'){
                        startWord = 'toPublic';
                    }
                    backSettleCardInfo(startWord,stmBanks,defaultSettleCardIndex,'默认结算卡');

                    // 如果存在两张结算卡，需要获取非默认结算卡的下标
                    if(stmBanks.length >= 2){
                        var secondSettleCardIndex = 0;
                        if(defaultSettleCardIndex == 0)
                            secondSettleCardIndex = 1;
                        var stmActTyp2=stmBanks[secondSettleCardIndex].actTyp;// 结算账户类型
                        if(stmActTyp1 != stmActTyp2){
                            if(stmActTyp2=='00'){
                                startWord = 'toPublic';
                            }else{
                                startWord = 'toPrivate';
                            }
                            backSettleCardInfo(startWord,stmBanks,secondSettleCardIndex,'非默认结算卡');
                        }
                    }
                }

            },
            error:function(xhr, status){
                alert("查询内部异常....。");
            }
        })
    }

    /**
     * 回填结算信息
     * 1.若选择统一结算，把总店的信息回填到控件中
     * 2.若选择独立结算，把结算信息保存到隐藏域,当去掉'独立结算'时显示出来
     */
    function backSettleCardInfo(startWord,stmBanks,settleCardIndex,isDefault){

        //***************************************
        //如果是统一结算，需要带出结算信息--jingxl
        //***************************************
        if(!$("#branchShopSet1").prop('checked')){
            $('#'+startWord+'AccountName').val(stmBanks[settleCardIndex].actNm);// 结算账户名
            $('#'+startWord+'SettleAccountNo').val(stmBanks[settleCardIndex].actNo); // 结算账号
            $('#'+startWord+'CnapsCode').val(stmBanks[settleCardIndex].lbnkNo);// 联行行号
            var bankDetail=stmBanks[settleCardIndex].lbnkDesc;// 结算银行详细
            setSelect2Value(startWord+'OpenbankInfomation',bankDetail,bankDetail);//对公开户行信息设置
            $('#settleManidNumber').val(stmBanks[settleCardIndex].idCardNo);//结算人身份证号(只有个体存在账户法人姓名所以ID固定)

            if(isDefault=='默认结算卡' && stmBanks[settleCardIndex].actTyp=='00'){//统一结算的默认结算卡为对公
                $("#accountLegalNmDiv").show();
                $("#accountLegalPersonName").val(stmBanks[settleCardIndex].legPerNm);// 账户法人姓名
            }else{
                $("#accountLegalNmDiv").hide();
            }
            //ctrlAccountLegalName();// ****>显示隐藏'账户法人姓名'属性
            if(stmBanks.length==1 && stmBanks[settleCardIndex].actTyp=='00'){//只有一个结算卡（默认）对公
                var settleInfoInputIds = ['toPrivateAccountName','toPrivateSettleAccountNo','toPrivateCnapsCode','toPrivateOpenbankInfomation'];
                $("#accountLegalNmDiv").show();
                $('#accountLegalPersonName').val(stmBanks[settleCardIndex].legPerNm);// 账户法人姓名
                for(var i=0;i<settleInfoInputIds.length;i++){
                    $('#'+settleInfoInputIds[i]).val(null);
                }
            }else if(stmBanks.length==1 && stmBanks[settleCardIndex].actTyp=='01'){//只有一个结算卡（默认）对私
                var settleInfoInputIds = ['toPublicAccountName','toPublicSettleAccountNo','toPublicCnapsCode','toPublicOpenbankInfomation','accountLegalPersonName'];
                $("#accountLegalNmDiv").hide();
                for(var i=0;i<settleInfoInputIds.length;i++){
                    $('#'+settleInfoInputIds[i]).val(null);
                }
            }

            // 将结算信息输入框设置为不可编辑
            var settleInfoInputIds = [startWord+'AccountName',startWord+'SettleAccountNo',startWord+'CnapsCode',startWord+'OpenbankInfomation','accountLegalPersonName'];
            for(var i=0;i<settleInfoInputIds.length;i++){
                $('#'+settleInfoInputIds[i]).prop('disabled',true);
            }
        }else{
            //清空结算信息控件，避免上次选择的数据存在
            var settleInfoInputIds = ['toPrivateAccountName','toPrivateSettleAccountNo','toPrivateCnapsCode','toPublicAccountName','toPublicSettleAccountNo','toPublicCnapsCode','accountLegalPersonName'];
            for(var i=0;i<settleInfoInputIds.length;i++){
                $('#'+settleInfoInputIds[i]).val(null);
            }
            setSelect2Value('toPrivateOpenbankInfomation',"","");//个体开户行信息清空
            setSelect2Value('toPublicOpenbankInfomation',"","");//对公开户行信息清空
        }

        console.log("-------结算信息保存到隐藏域-----------");
        $('#'+startWord+'IfSetValue').val("Y");// 标识是否设置了隐藏值
        $('#'+startWord+'HiddenAccountName').val(stmBanks[settleCardIndex].actNm);// 结算账户名
        $('#'+startWord+'HiddenSettleAccountNo').val(stmBanks[settleCardIndex].actNo); // 结算账号
        $('#'+startWord+'HiddenCnapsCode').val(stmBanks[settleCardIndex].lbnkNo);// 联行行号
        $('#'+startWord+'HiddenOpenbankInfomation').val(stmBanks[settleCardIndex].lbnkDesc);// 结算银行详细
        $('#settleManidNumberHidden').val(stmBanks[settleCardIndex].idCardNo);//结算人身份证号(只有个体存在账户法人姓名所以ID固定)
        $("#accountLegalPersonNameHidden").val(stmBanks[settleCardIndex].legPerNm);// 账户法人姓名
    }
</script>
