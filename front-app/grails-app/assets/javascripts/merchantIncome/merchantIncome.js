/**
 * create by jingxinli
 * 修改商户界面脚本
 */
var loadTime = new Date().getTime()-6000;
if (typeof jQuery !== 'undefined') {
    $(function () {
        //反写
        var ifPosMdVal=$('#ifPosMd').val();//闪电到账-自动秒到
        console.log('ifPosMdVal:'+ifPosMdVal)
        $('#ifPosMd').attr('checked', ifPosMdVal == "00" ? true : false);
        //商户审核管理编辑
        var ifPosMd = $('#ifPosMd').is(':checked');
        if(ifPosMd){
            $('#ifPosMd').val("on");
        }else{
            $('#ifPosMd').val("01");
        }

        /**加载后自动触发元素状态*/

            //判断是否是服务器校验失败，回显的数据
        var serverError = $('#serverError').val();
        if ("yes" != serverError) {
            initSetAddDeaultCheckbox();//设置默认选中的checkbox值
        }
        mtchange();//商户类型
        ifChecked('ifMaintainFeeOfPos', 'posDiv');//费用信息->POS维护费
        ifChecked('ifWeiHuTong', 'whtDiv');//费用信息->维护通
        // ifChecked('ifPrepaidCard', 'preH', 'preDiv1', 'preDiv2');// 预付卡
        // ifChecked('ifOutBCMCard', 'bcmH', 'bcmDiv1', 'bcmDiv2', 'bcmDiv3');//交行外卡
        ifChecked('ifSuiYiTongSettle', 'sytDiv1', 'sytDiv2');//随意通
        ifChecked('ifIntradaySettle', 'jrfDiv1');//即日付
        ifChecked('ifPosMd', 'ifPosMd');//pos秒到
        var itemPrivate = $('#toPrivateOpenbankInfomation').attr('value');
        setSelect2Value('toPrivateOpenbankInfomation', itemPrivate, itemPrivate);//个体开户行信息设置
        var itemPublic = $('#toPublicOpenbankInfomation').attr('value');
        setSelect2Value('toPublicOpenbankInfomation', itemPublic, itemPublic);//对公开户行信息设置
        //-------------------end-----------------

        //判断银行合作的"随行付合作"是否显示
        var bankCount = $('#ifShowBank').val();
        if (bankCount <= 0) {
            $("#bankTeamwork option[value='1']").remove();
            console.log("没有银行客户经理,隐藏--随行付合作选项.")
        }
        /**  对公  联行号信息-下拉框改变    */
        $('#toPublicOpenbankInfomation').change(function () {
            var selectObj = $("#toPublicOpenbankInfomation").select2("data");
            if(selectObj==''){
                $('#toPublicCnapsCode').val('');
            }
            $('#toPublicBankName').val(selectObj[0].bankName);//设置个体的银行名称隐藏域
            $('#toPublicCnapsCode').val(selectObj[0].linkBankNo);//设置联行行号
        });

        /**  个体  联行号信息-下拉框改变    */
        $('#toPrivateOpenbankInfomation').change(function () {
            var selectObj = $("#toPrivateOpenbankInfomation").select2("data");
            if(selectObj==''){
                $('#toPrivateCnapsCode').val('');
            }
            $('#toPrivateBankName').val(selectObj[0].bankName);//设置个体的银行名称隐藏域
            $('#toPrivateCnapsCode').val(selectObj[0].linkBankNo);//设置联行行号
        });

        /**  操作错误提示信息  */
        var state = $('#saveState').val();
        var option = $('#option').val();
        if (option == "add" && state == "error") {
            OKDialog("系统写入错误，请联系管理员");
        } else if (option == "edit" && state == "error") {
            OKDialog("系统写入错误，请联系管理员");
        }

        /** 发起ajax自动保存草稿信息:
         * <签购单名称、注册名称、主营业务、法人姓名、联系人手机号>
         * */
        $('#receiptsName,#registName,#mainManageBusiness,#legalPersonName,#linkmanMobileNo').blur(function () {
            var findVal = $(this).val();
            var mecNormalLevel = judgeLevelForValidate($('#mecNormalLevel').val());
            console.log("--------------商户等级："+mecNormalLevel)
            /**注册名称 blur 事件绑定*/
            if ("registName" == $(this).attr("id")) {
                if (findVal.length == 0) {
                    ctrlAccountLegalName();// ****>显示隐藏'账户法人姓名'属性
                    return false;
                }

                //判断重复次数校验的商户类型(0=[普通商户、1+N总店、1+N分店]  1=[连锁总店、连锁分店])
                var repeatType = '0';
                var v = $('#merchantType').val();
                if (v == '2' || v == '3') {
                    //连锁总店/连锁分店
                    repeatType = '1';
                }
                $.ajax({
                    url: '/merchantIncome/registNameRepeat',
                    data: {merchantType: repeatType, registName: $(this).val(),mecNormalLevel:mecNormalLevel},
                    type: "POST",
                    dataType: "json",
                    success: function (json) {
                        console.log(json)
                        if (json.code == "1") {
                            console.log("注册名称Yes")
                            ctrlAccountLegalName();// ****>显示隐藏'账户法人姓名'属性
                        } else {
                            OKDialogCallBack("注册名称的重复次数超出系统限制，请联系相关人员！", 'registName');
                        }
                    },
                    error: function (xhr, status) {
                        console.log("--------------注册名称重复次数校验,异常.--------------------")
                    }
                });
            }

            //**********开启自动保存草稿功能********** TODO临时去掉自动保存功能
            if (findVal.length == 0) {
                return false;
            }

        });
        if($("#pageType").val()!="auditIncome"){
            autoExecute();
        }
        /** 重复次数校验:
         个体结算信息 个体结算信息必须整组填写（对公结算信息同理），点击“开户行信息输入框查询结算银行”可以补全联行行号及开户行信息.
         * <注册名称（上面函数中定义）、注册登记号、结算人身份证号、结算卡(对公)账户名、结算卡号(个体)、结算卡号（对公）>
         * */
        $('#registCode,#settleManidNumber,#toPublicAccountName,#toPrivateSettleAccountNo,#toPublicSettleAccountNo').blur(function () {

            //判断重复次数校验的商户类型(0=[普通商户、1+N总店、1+N分店]  1=[连锁总店、连锁分店])
            var repeatType = '0';
            var v = $('#merchantType').val();
            if (v == '2' || v == '3') {
                //连锁总店/连锁分店
                repeatType = '1';
            }
            //获取商户等级类型
            var mecNormalLevel = judgeLevelForValidate($('#mecNormalLevel').val());
            console.log("--------------商户等级："+mecNormalLevel)

            /**<注册登记号> blur 事件绑定*/
            if ("registCode" == $(this).attr("id")) {
                var findVal = $(this).val();
                if (findVal.length == 0) {
                    return false;
                }

                //发起服务器校验
                $.ajax({
                    url: '/merchantIncome/registCodeRepeat',
                    data: {merchantType: repeatType, registCode: findVal,mecNormalLevel:mecNormalLevel},
                    type: "POST",
                    dataType: "json",
                    success: function (json) {
                        if (json.code == "1") {
                            console.log("注册登记号Yes")
                        } else {
                            OKDialogCallBack("注册登记号的重复次数超出系统限制，请联系相关人员！", 'registCode');
                        }
                    },
                    error: function (xhr, status) {
                        console.log("--------------注册登记号重复次数校验,异常.--------------------")
                    }
                });
            }//end

            /**<结算人身份证号> blur 事件绑定*/
            if ("settleManidNumber" == $(this).attr("id")) {
                var findVal = $(this).val();
                if (findVal.length == 0) {
                    return false;
                }
                console.log("--------------商户等级："+mecNormalLevel)

                $.ajax({
                    url: '/merchantIncome/settleCardNoRepeat',
                    data: {merchantType: repeatType, cardNo: findVal,mecNormalLevel:mecNormalLevel},
                    type: "POST",
                    dataType: "json",
                    success: function (json) {
                        if (json.code == "1") {
                            console.log("结算人身份证号Yes")
                        } else {
                            OKDialogCallBack("结算人身份证号的重复次数超出系统限制，请联系相关人员！", 'settleManidNumber');
                        }
                    },
                    error: function (xhr, status) {
                        console.log("--------------结算人身份证号-重复次数校验,异常.--------------------")
                    }
                });
            }//end

            /**<对公结算账户名> blur 事件绑定*/
            if ("toPublicAccountName" == $(this).attr("id")) {
                var findVal = $(this).val();
                if (findVal.length == 0) {
                    // ****>显示隐藏'账户法人姓名'属性
                    ctrlAccountLegalName();
                    return false;
                }
                console.log("--------------商户等级："+mecNormalLevel)

                $.ajax({
                    url: '/merchantIncome/settleAccountNameRepeat',
                    data: {merchantType: repeatType, accoutName: findVal,mecNormalLevel:mecNormalLevel},
                    type: "POST",
                    dataType: "json",
                    success: function (json) {
                        if (json.code == "1") {
                            console.log("结算卡(对公)账户名Yes")

                            // ****>显示隐藏'账户法人姓名'属性
                            ctrlAccountLegalName();
                        } else {
                            OKDialogCallBack("对公结算账户名的重复次数超出系统限制，请联系相关人员！", 'toPublicAccountName');
                        }
                    },
                    error: function (xhr, status) {
                        console.log("--------------结算卡(对公)账户名-重复次数校验,异常.--------------------")
                    }
                });
            }//end

            /**<结算账号(个体/对公)> blur 事件绑定*/
            if (("toPrivateSettleAccountNo" == $(this).attr("id") || "toPublicSettleAccountNo" == $(this).attr("id"))) {
                var findVal = $(this).val();
                if (findVal.length == 0) {
                    return false;
                }
                var showlbl = ("toPrivateSettleAccountNo" == $(this).attr("id")) ? "个体" : "对公";
                var showId = ("toPrivateSettleAccountNo" == $(this).attr("id")) ? "toPrivateSettleAccountNo" : "toPublicSettleAccountNo";
                console.log("--------------商户等级："+mecNormalLevel)

                $.ajax({
                    url: '/merchantIncome/settleAccountNoRepeat',
                    data: {merchantType: repeatType, accoutNo: findVal,mecNormalLevel:mecNormalLevel},
                    type: "POST",
                    dataType: "json",
                    success: function (json) {
                        if (json.code == "1") {
                            console.log("结算账号Yes")
                        } else {
                            OKDialogCallBack(showlbl + "结算账号的重复次数超出系统限制，请联系相关人员！", showId);
                        }
                    },
                    error: function (xhr, status) {
                        console.log("--------------结算账号-重复次数校验,异常.--------------------")
                    }
                });
            }//end
        });

        /** <个体结算账户名> blur事件绑定 */
        $('#toPrivateAccountName').blur(function () {
            // ****>显示隐藏'账户法人姓名'属性
            ctrlAccountLegalName();
        });

        /** <结算人身份证号> 黑名单校验 */
        $('#settleManidNumber').blur(function () {
            var cardNo = $('#settleManidNumber').val();
            var reg = /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/g;
            if (cardNo.length == 0) {
                console.log("没有数据不发起请求.")
            } else if (!reg.test(cardNo)) {
                console.log("请输入15或18位身份证号.")
            } else {
                $.ajax({
                    url: "/merchantIncome/blacklist",
                    data: {'cardNo': cardNo},
                    type: "POST",
                    dataType: "json",
                    success: function (json) {
                        console.log(json);
                        //Object {result: 1, returnMsg: "{"retCode":"0000","opMsg":"结算人身份证号码正常","bFlag":false,"gFlag":false}"}
                        if (json.result == "1") {
                            var returnObj = eval("(" + json.returnMsg + ")")
                            if (returnObj.bFlag == true) {
                                OKDialogCallBack("结算身份证号存在风险，禁止进件！", 'settleManidNumber');
                            }
                        } else {
                            console.log("结算人身份证号:" + cardNo + " 正常.")
                        }
                    },
                    error: function (xhr, status) {
                        alert("黑名单校验异常。");
                    }
                })
            }
        });
        /** <即日付手续费> 范围校验 */
        $('#intradayPayCounterFee').blur(function () {
            var findFee = $('#intradayPayCounterFee').val();
            if (findFee == '')
                return false;

            $.ajax({
                url: "/merchantIncome/limitNumberJiRiFuAjax",
                type: "POST",
                dataType: "json",
                success: function (json) {
                    if (json.result == "1") {
                        if (findFee < json.min || findFee > json.max) {
                            OKDialogCallBack("即日付手续费,请填写[" + json.min + "]到[" + json.max + "]之间的值.", 'intradayPayCounterFee');
                        }
                    } else {
                        alert("无法获取,即日付手续费限额；.");
                        console.log("无法获取,即日付手续费限额；")
                    }
                },
                error: function (xhr, status) {
                    alert("即日付手续费校验失败.");
                }
            })
        });


        /** ----------解析费率Json信息----------------- */

        /** ----------解析费率End----------------- */


        /** ----------标签管理部分----------------- */

        //自定义分类标签
        $('#btnLabelClassify').click(function () {
            $.ajax({
                url: "/merchantLabel/queryLabelListWithJson",
                data: {typeCode: 3},
                type: "POST",
                dataType: "json",
                success: function (json) {
                    if (json.code == 1) {
                        var oldDataV = $('#customClassify').val();
                        var oldDataT = $('#customClassifyText').val();
                        var arrayV = oldDataV.split(',');
                        var appendDom = "";
                        $.each(json.result, function (index, item) {
                            //选中已有的值
                            var res = $.inArray(item.id, arrayV);
                            if (res != -1) {
                                appendDom += '<li> <a href="javascript:;"><input checked onclick="labelCheckFun(this);" data-my-val="' + item.id + '" data-my-text="' + item.name + '" type="checkbox" style="width: 16px;height: 16px;"/><span>' + item.name + '</span></a> </li>'
                            } else {
                                appendDom += '<li> <a href="javascript:;"><input onclick="labelCheckFun(this);" data-my-val="' + item.id + '" data-my-text="' + item.name + '" type="checkbox" style="width: 16px;height: 16px;"/><span>' + item.name + '</span></a> </li>'
                            }
                        });
                        $('.divider-label-customClassify').prevAll().remove();//移除当前元素之前所有的兄弟节点
                        $('.data-label-customClassify').prepend(appendDom);
                    } else {
                        console.log("自定义分类标签->添加失败!")
                    }
                },
                error: function (xhr, status) {
                    console.log("自定义分类标签->添加异常!")
                }
            });
        });

        //银行合作标识标签
        $('#btnLabelTeamworkBank').click(function () {
            $.ajax({
                url: "/merchantLabel/queryLabelListWithJson",
                data: {typeCode: 2},
                type: "POST",
                dataType: "json",
                success: function (json) {
                    if (json.code == 1) {
                        var appendDom = "";
                        $.each(json.result, function (index, item) {
                            appendDom += '<li> <a onclick="labelBankFun(this);" data-my-val="' + item.id + '" data-my-text="' + item.name + '" href="javascript:;"><span>' + item.name + '</span></a> </li>'
                        });
                        $('.divider-label-teamworkBank').prevAll().remove();//移除当前元素之前所有的兄弟节点
                        $('.data-label-teamworkBank').prepend(appendDom);
                    } else {
                        alert("添加失败!");
                    }
                },
                error: function (xhr, status) {

                    alert("添加异常!");
                }
            });
        });

        //业务员标签
        $('#btnLabelSalesman').click(function () {
            $.ajax({
                url: "/merchantLabel/queryLabelListWithJson",
                data: {typeCode: 1},
                type: "POST",
                dataType: "json",
                success: function (json) {
                    if (json.code == 1) {
                        var appendDom = "";
                        $.each(json.result, function (index, item) {
                            appendDom += '<li> <a onclick="labelSalesmanFun(this)" data-my-val="' + item.id + '" data-my-text="' + item.name + '" href="javascript:;"><span>' + item.name + '</span></a> </li>'
                        });
                        $('.divider-label-salesman').prevAll().remove();//移除当前元素之前所有的兄弟节点
                        $('.data-label-salesman').prepend(appendDom);
                    } else {
                        alert("添加失败!");
                    }
                },
                error: function (xhr, status) {

                    alert("添加异常!");
                }
            });
        });

        //业务员change 事件
        $('#salesmanCode').change(function () {
            var showName = $('#salesmanCode').find('option:selected').text();
            console.log(showName)
            $('#salesmanName').val(showName);//吧显示的中文名称存入属性salesmanName中(用反了，以后待修改)
        });
        /** ----------标签End----------------- */

        //禁止输入框输入空格
        $("input[type='text']").keyup(function () {
            this.value = this.value.replace(/\s/gi, '');//去除空格
            this.value = this.value.replace(/\'/g, "");//去除单引号[']

            //输入的最大字节数判断
            //var maxLen=$(this).attr("data-maxLen");
            //console.log(maxLen)
            //WidthCheck(this, maxLen)
        });


        //每10秒执行，无限次(值为0)，计时器名称为"autoDraftSave"
        //若时间间隔抵到，但函式程序仍未完成则需等待执行函式完成后再继续计时

        //timerHeartFun();//心跳显示
        //autoExecute();//定时执行的任务

        ////停止$('body')上名称为A的计时器
        //$('body').stopTime ('A');

        //调用费率信息接口
        renderx();

        if($('#ifPosMd').val() == '00' || $('#ifPosMd').val() == 'on'){
            ifPosMdCheckBoxClick();
        }
        //pos秒到选择显示 借贷分离 或者秒到费率
        $('#ifPosMd').click(function(){
            ifPosMdCheckBoxClick()
        });

        function ifPosMdCheckBoxClick(){
            var chkWHT = $('#ifPosMd').is(':checked');
            console.log("*************chkWHT*****************"+chkWHT)
            if (chkWHT) {
                console.log("*************true 调用秒到接口*****************"+chkWHT)
                $('#newMccInfoDiv').html("");
                goodsCondition();
                //销毁原来计费接口显示

            } else {
                console.log("*************false 调用原来接口*****************"+chkWHT)
                //销毁新计费接口显示
                $('#newPosMdInfoDiv').html("");
                renderx();

            }
        }

        //add by hss 秒到-计费接口调用  闪电 等级 打包
        function goodsCondition() {

            var rateInfo = $("#rateInfomationID").val();
            if (null == rateInfo || "" == rateInfo || rateInfo == undefined) {
                rateInfo = "";
            }
            $.ajax({
                url: '/merchantIncome/goodsCondition',
                data: {
                    rateInfo: rateInfo
                },
                async: true,
                cache: true,
                type: "POST",
                dataType: "json",
                success: function (json) {
                    console.log("*************计费调用成功*****************")
                    //console.log(json)
                    var resultJson = json.msg
                    resultJson = eval('(' + resultJson + ')');
                    if (resultJson.resCode == 'CFS0000') {
                        if (resultJson.data != undefined) {
                            resultJson.data.justView = false;
                            resultJson.data.preset = false;
                            resultJson.data.effDt = '';
                            var template = $('#template').val();
                            var innerHtml = new EJS({
                                //text : template,
                                url: '/assets/merchant/ejs/posMD.txt'
                            }).render(resultJson.data);
                            $('#newPosMdInfoDiv').html(innerHtml);
                            //调用借贷分离接口
                            posMDRateInfo();
                        }
                    } else {
                        OKDialog(resultJson.resMsg);
                    }

                },
                error: function (xhr, status) {
                    console.log("--------------调用出错!!!--------------------")
                    console.log(xhr)
                    console.log(status)
                }
            });
        }
        //add by hss 借贷分离 调用老接口  秒到-计费接口调用
        function posMDRateInfo() {

            var rateInfo = $("#rateInfomationID").val();
            if (null == rateInfo || "" == rateInfo || rateInfo == undefined) {
                rateInfo = "";
            }
            // var orgUuid = $("[name='starterAttrOrgNo']").val();
            // var orderNo = $("[name='orderNo']").val();
            $.ajax({
                url: '/merchantIncome/getMecAgreement',   //jingxl--->调用计费接口获取页面及js
                data: {
                    rateInfo: rateInfo
                },
                async: true,
                cache: true,
                type: "POST",
                dataType: "json",
                success: function (json) {
                    console.log("*************计费调用成功*****************")
                    //console.log(json)
                    var resultJson = json.msg
                    resultJson = eval('(' + resultJson + ')');
                    if (resultJson.resCode == 'CFS0000') {
                        if (resultJson.data != undefined) {
                            resultJson.data.justView = false;
                            resultJson.data.preset = false;
                            resultJson.data.effDt = '';
                            var template = $('#template').val();
                            var innerHtml = new EJS({
                                //text : template,
                                url: '/assets/merchant/ejs/posBD.txt'
                            }).render(resultJson.data);

                            $('#newMccInfoDiv').html(innerHtml);
                        }
                    } else {
                        OKDialog(resultJson.resMsg);
                    }

                },
                error: function (xhr, status) {
                    console.log("--------------调用出错!!!--------------------")
                    console.log(xhr)
                    console.log(status)
                }
            });
        }

        $('#commitBtn').on('click', function () {
            var currentTime = new Date().getTime();
            if ( currentTime - loadTime < 6000 ) {
                return false;
            }
            loadTime = currentTime;

            //拼接posMdStr字符串
            porcPosMdStr();

           var cls= $(this).children("i").attr("class");

            //验证必填图片
            var flag=checkImage();
            if(flag){
                //修改时先保存操作的图片历史记录
                if(cls=="fa fa-update"){
                    saveHistoryImg();
                }

                return checkForm();
            }else{
                return false;
            }
        });

    })//end JQuery Function

    //自定义分类-标签check处理
    function labelCheckFun(obj) {
        var ifcheck = $(obj).is(':checked');
        var oldDataV = $('#customClassify').val();
        var oldDataT = $('#customClassifyText').val();
        var v = $(obj).attr('data-my-val');
        var t = $(obj).attr('data-my-text');
        if (ifcheck) {
            var array = oldDataV.split(',');
            if (array.length >= 15) {
                OKDialog('最多只能选择15个标签');
                return false;
            }
            var rv = oldDataV == '' ? v : oldDataV + ',' + v;
            var rt = oldDataT == '' ? t : oldDataT + ',' + t;
            $('#customClassify').val(rv);
            $('#customClassifyText').val(rt);
        } else {
            var arrayV = oldDataV.split(',');
            var arrayT = oldDataT.split(',');
            arrayV.splice($.inArray(v, arrayV), 1);
            arrayT.splice($.inArray(t, arrayT), 1);

            $('#customClassify').val(arrayV.join(','));
            $('#customClassifyText').val(arrayT.join(','));
        }
    }

    //银行合作标识-标签处理
    function labelBankFun(obj) {
        var v = $(obj).attr('data-my-val');
        var t = $(obj).attr('data-my-text');
        $('#bankTeamworkSign').val(v);
        $('#bankTeamworkSignText').val(t);
    }

    //业务员-自定义标签处理
    function labelSalesmanFun(obj) {
        var v = $(obj).attr('data-my-val');
        var t = $(obj).attr('data-my-text');
        $('#salesmanLabel').val(v);

        var selectItem = $('#select2-salesmanName-container').text();
        selectItem = selectItem.indexOf("×") < 0 ? selectItem : selectItem.substr(1, selectItem.length);
        if (selectItem.indexOf('##') > 0) {
            selectItem = selectItem.substr(0, selectItem.indexOf('##'));
        }
        //$('#select2-salesmanName-container').html("<span class=\"select2-selection__clear\">×</span>"+selectItem+"##"+t);
        $('.selection').children().first().html("<span class=\"select2-selection__rendered\" id=\"select2-salesmanName-container\" title=\"李昊\"><span class=\"select2-selection__clear\">×</span>李昊</span>");
        // $('#select2-salesmanName-container').html("<span class=\"select2-selection__rendered\" id=\"select2-salesmanName-container\" title=\"北京开心1组组员业务员\"><span class=\"select2-selection__clear\">×</span>马铁利</span>");
    }

    //计费接口调用
    function renderx() {
        var rateInfo = $("#rateInfomationID").val();
        if(null == rateInfo || "" == rateInfo || rateInfo==undefined){
            rateInfo = "";
        }
        // var orgUuid = $("[name='starterAttrOrgNo']").val();
        // var orderNo = $("[name='orderNo']").val();
        $.ajax({
            url: '/merchantIncome/getMecAgreement',   //jingxl--->调用计费接口获取页面及js
            data:{
                rateInfo:rateInfo
            },
            async: true,
            cache: true,
            type: "POST",
            dataType: "json",
            success: function (json) {
                console.log("*************调用成功*****************")
                //console.log(json)
                var resultJson = json.msg
                resultJson = eval('(' + resultJson + ')');
                if(resultJson.resCode == 'CFS0000'){
                    if(resultJson.data != undefined){
                        resultJson.data.justView = false;
                        resultJson.data.preset = false;
                        resultJson.data.effDt = '';
                        var template = $('#template').val();
                        var innerHtml = new EJS({
                            //text : template,
                            url: '/assets/merchant/ejs/goods.txt'
                        }).render(resultJson.data);
                        $('#goodsData').val(JSON.stringify(resultJson));
                        $('#newMccInfoDiv').html(innerHtml);
                    }
                }else{
                    OKDialog(resultJson.resMsg);
                }

            },
            error: function (xhr, status) {
                console.log("--------------调用出错!!!--------------------")
                console.log(xhr)
                console.log(status)
            }
        });
    }

    var num = 1;
    var t = 1;
    //心跳函数
    function timerHeartFun() {
        $('body').everyTime('1s', 'showTime', function () {
            console.log("==计时开始：" + t);
            t++;
        }, 0, true);
    }

    //定时自动执行函数
    function autoExecute() {
        /**
         * 规则：输入签购单名称、注册名称、主营业务、法人姓名、联系人手机号其中某一项时生成草稿，光标离开控件自动保存草稿。
         */
        $('body').everyTime('20s', 'draftSave', function () {
            console.log("==>(每隔20秒)自动执行：" + num);
            var flag = $("#receiptsName").val()!=''||$("#registName").val()!=''||$("#mainManageBusiness").val()!=''||$("#legalPersonName").val()!=''||$("#linkmanMobileNo").val()!='';
            if(flag){
                saveDraftAuto();
                num++;
                t = 1;
            }
        }, 0, true);
    }

    /**     自动保存草稿函数    */
    function saveDraftAuto() {
        var mainForm = $('#scaffold-save-merchantIncome');
        var optionVal = $('#optionVal').val();
        var taskCode = $('#taskCode').val();
        console.log("=================自动保存草稿====>" + optionVal);
        setFunctionCheckBoxValue();
        var newMccInfo = checkAndMake();
        console.log("=======费率信息======>:");
        console.log(JSON.stringify(newMccInfo));
        if (newMccInfo != null) {
            if (newMccInfo == undefined || newMccInfo == false) {
                console.log("-->费率填写有错误，不进行草稿保存.")
                $('#rateInfomationID').val("");
                // if(!confirm("费率信息填写不完整或填写错误，继续保存将清空费率信息，是否继续保存？")){
                //     return;
                // }
            } else {
                //$("#newMccInfo").val(JSON.stringify(newMccInfo));
                $('#rateInfomationID').val(JSON.stringify(newMccInfo))//设置隐藏域保存[选中的计费信息]为json信息
            }
        }
        var validateFileSize = uploadFileSize();
        if(validateFileSize == false){
            return false;
        }
        //拼接posMdStr字符串
        porcPosMdStr();

        //草稿保存商户等级信息
        var mecNormalLevel = $("#mecNormalLevel").val();
        if(mecNormalLevel == '10'){//一类
            var levelOne = judgeLevelOne(mecNormalLevel);
            if(levelOne == '10'){//法人结算
                $("#mecNormalLevelFinal").val("10");
            }
            if(levelOne == '11'){//非法人结算
                $("#mecNormalLevelFinal").val("11");
            }
        }else{
            $("#mecNormalLevelFinal").val("20");
        }
        console.log("商户等级草稿最后保存的值是："+$("#mecNormalLevelFinal").val());
        $.ajax({
            url: "/merchantIncome/saveAjax",
            data: mainForm.serialize(),
            type: "POST",
            dataType: "json",
            success: function (json) {
                //console.log(json.result);
                if (json.result == "1") {
                    $('#optionVal').val("1");//改为更新状态
                    var $tip = $('#tip');
                    $tip.stop(true).prop('class', 'alert alert-danger').text("草稿已保存!").css({
                        'margin-left': -$tip.outerWidth() / 2,
                        "margin-top": -$tip.outerHeight() / 2
                    }).fadeIn(500).delay(2000).fadeOut(500);
                    $.ajax({
                        url: "/merchantIncome/findIdByTaskCodeAjax",
                        data: {taskCode: taskCode},
                        type: "POST",
                        dataType: "json",
                        success: function (json) {
                            console.log(json.result);
                            if (json.result == "-1") {
                                console.log("查询草稿UID失败！")
                            } else {
                                console.log("已更新uid隐藏域的值.")
                                //把该草稿id查询出来，保存到隐藏域
                                $('#uid').val(json.result);

                                //发起自动保存图片请求
                                uploadPic($('#licensePic'));
                            }
                        },
                        error: function (xhr, status) {
                            console.log("-----------添加草稿异常(1)-----------------")
                            console.log(xhr)
                            console.log(status)
                            console.log("-----------end console-----------------")
                        }
                    });//end ajax
                   if($('#loadImgFlag').val()==0){
                        // autoSaveImg();//上传图片
                       //doUpload();
                    }

                } else {
                    console.log("草稿添加失败")
                }
            },
            error: function (xhr, status) {
                console.log("-----------添加草稿异常(2)-----------------")
                console.log(json)
                console.log("-----------end console-----------------")
            }
        })
    };
    ////草稿保存后提示信息
    function showResult() {
        alert("草稿已保存!");
    }

    /** 控制'账户法人姓名'属性的显示隐藏 */
    function ctrlAccountLegalName() {
        var opDiv = $('#accountLegalNmDiv');//账户法人姓名DIV
        var legalName = $('#accountLegalPersonName');//账户法人姓名控件
        var ifHasHidden = opDiv.hasClass('hidden');//现在是否hidden
        var pubNm = $('#toPublicAccountName').val();//对公账户名值
        var priNm = $('#toPrivateAccountName').val();//获取对私账户名值
        var regNm = $('#registName').val();//注册名称的值

        //若，对公账户名不为空可以显示，反之不能显示
        if (pubNm == "") {
            if (!ifHasHidden) {
                opDiv.addClass("hidden");
                legalName.addClass("hidden");//避免js验证
                $('#accountLegalPersonName').val("");//被隐藏时,清空原有数据
            }
            return;
        }
        //若对私账户名 不是 空，则不能显示，反之可以显示
        if (priNm != "") {
            if (!ifHasHidden) {
                opDiv.addClass("hidden");
                legalName.addClass("hidden");
                $('#accountLegalPersonName').val("");//被隐藏时,清空原有数据
            }
            return;
        }
        //若注册名称不是空且与对公账户名相等，则不能显示，反之可以显示
        if (regNm != "" && regNm == pubNm) {
            if (!ifHasHidden) {
                opDiv.addClass("hidden");
                legalName.addClass("hidden");
                $('#accountLegalPersonName').val("");//被隐藏时,清空原有数据
            }
            return;
        }
        opDiv.removeClass("hidden");
        legalName.removeClass("hidden");
    }


    /**    费率信息-下拉框改变    */
    // $('#billingWay').change(function(){
    //     var itemId=$('#billingWay').find('option:selected').val();
    //     $('#Bill_'+itemId).removeClass('hidden');
    //     $("#billingWay option").each(function () {
    //         var val = $(this).val();
    //         if(val != itemId){
    //             $('#Bill_'+val).addClass('hidden');
    //         }
    //     });
    // });

    //[提交]form前的验证
    function checkForm() {
        console.log("checkForm 校验开始");
        var validateFileSize = uploadFileSize();
        if(validateFileSize == false){
            return false;
        }
        //checkbox赋值
        setFunctionCheckBoxValue();
        //-----------pos秒到费率信息验证-----------
        if(!validatePosMd()){
            OKDialog("秒到费率信息填写不完整!");
            return false
        }
        //---------费率信息获取并校验 验证---------
        var newMccInfo = checkAndMake();//获取填写的费率信息
        if (newMccInfo != null) {
            if (newMccInfo == undefined || newMccInfo == false) {
                $('#rateInfomationID').val("");
                OKDialog("费率信息填写不完整!");
                return false;
            } else {
                $('#rateInfomationID').val(JSON.stringify(newMccInfo))//设置隐藏域保存[选中的计费信息]为json信息
            }
        }else{
            OKDialog("费率信息不可为空!");
            return false;
        }
        $('#newMccInfoDiv').hide();
        $('#newPosMdInfoDiv').hide();
        console.log("form校验结果"+$('#scaffold-save-merchantIncome').valid())
        //JQueryValidation校验
        if (!$('#scaffold-save-merchantIncome').valid()) {
            $('#newMccInfoDiv').show();
            $('#newPosMdInfoDiv').show();
            return false;
        }
        $('#newMccInfoDiv').show();
        $('#newPosMdInfoDiv').show();

        if($("#toPrivateAccountName").val()==""&&$("#toPublicAccountName").val()!=""&&$("#ifIntradaySettle").prop("checked")){
            OKDialog("默认账户非对私类型不允许开通即日付!");
            return false;
        }
        //隶书商户编码、名称显示控件的验证
        var ifSubjection = $('#subjectionDiv').hasClass('hidden');
        if (!ifSubjection) {//如果界面上显示控件
            var scode = $('#subjectionMerchantCode').val();
            var sname = $('#subjectionMerchantName').val();
            console.log(scode + "-" + sname);
            if (scode.length == 0 || sname.length == 0) {
                OKDialog("隶属商户编号/隶属商户名称,都不能为空！");
                return false;
            }
        } else {
            //do nothing
        }

        //'随意通结算' 显示控件的验证
        if (!requiredCheck('sytDiv1', 'suiYiTongCountrFee')) {
            OKDialog("随意通手续费,不能为空！");
            return false;
        }

        //'即日付' 显示控件的验证
        if (!requiredCheck('jrfDiv1', 'intradayPayCounterFee')) {
            OKDialog("即日付手续费,不能为空！");
            return false;
        }

        //'POS维护费' 显示控件的验证
        if (!requiredCheck('posDiv', 'maintainFeeOfPos')) {
            OKDialog("POS维护费的收取金额,不能为空！");
            return false;
        }

        //'维护通' 显示控件的验证
        if (!requiredCheck('whtDiv', 'collectAmount')) {
            OKDialog("维护通的收取金额,不能为空！");
            return false;
        }

        //交行外卡费率信息,若被勾选则都必须填写
        // var ifbcmDiv1 = $('#bcmDiv1').hasClass('hidden');
        // var ifbcmDiv2 = $('#bcmDiv2').hasClass('hidden');
        // var ifbcmDiv3 = $('#bcmDiv3').hasClass('hidden');
        // if (!ifbcmDiv1 && !ifbcmDiv2 && !ifbcmDiv3) {//如果界面上显示控件
        //     var fee1 = $('#rateVisa').val();
        //     var fee2 = $('#rateMaster').val();
        //     var fee3 = $('#rateAmericanExpress').val();
        //     var fee4 = $('#rateDiners').val();
        //     var fee5 = $('#rateJCB').val();
        //     var fee6 = $('#rateVISADCC').val();
        //     var fee7 = $('#rateMCDCC').val();
        //     if (fee1.length == 0 || fee2.length == 0 || fee3.length == 0 || fee4.length == 0 || fee5.length == 0 || fee6.length == 0 || fee7.length == 0) {
        //         OKDialog("交行外卡费率信息全部填写,不能为空！");
        //         return false;
        //     }
        // }

        //个体或对公至少填写一种结算信息
        var sett = verifySettleInfo();
        if (!sett) {
            OKDialog("个体结算 与 对公结算，至少填写一组并且必须整组填写！");
            return false;
        }

        //add by wangyu
        //验证商户等级是否选择
        // var mecNormalLevel = $("#mecNormalLevel").val();
        // if(mecNormalLevel == '' || mecNormalLevel == null || mecNormalLevel == undefined){
        //     OKDialog("请选择商户等级！");
        //     return false;
        // }
        //获取结算账户类型
        // var publicAccount = $("#publicAccount").val();
        // if(publicAccount == "publicAccount") {//对公结算
        //     var registName = $("#registName").val();
        //     var toPublicAccountName = $("#toPublicAccountName").val();
        //     if($.trim(registName) != $.trim(toPublicAccountName)){
        //         OKDialog("注册名称与对公结算账户名不一致，请修改");
        //         return false;
        //     }
        // }

        //获取商户等级
        var mecNormalLevel = $("#mecNormalLevel").val();
        if(mecNormalLevel == '10'){//一类
            var privateAccount = $("#privateAccount").val();
            var publicAccount = $("#publicAccount").val();
            var levelOne = judgeLevelOne(mecNormalLevel);
            if(privateAccount == "privateAccount") {//对私结算
                console.log("法人非法人结果："+levelOne);
                if(levelOne == '10'){//法人结算
                    //获取对私结算户名
                    var toPrivateAccountName = $("#toPrivateAccountName").val();
                    //获取法人姓名
                    var legalPersonName = $("#legalPersonName").val();

                    if($.trim(toPrivateAccountName) != $.trim(legalPersonName)){//对私结算户名为法人
                        OKDialog("对私结算户名与法人姓名不一致，请修改");
                        return false;
                    }
                    $("#mecNormalLevelFinal").val("10");
                }
                if(levelOne == '11'){//非法人结算
                    //获取对私结算户名
                    var toPrivateAccountName = $("#toPrivateAccountName").val();
                    //获取法人姓名
                    var legalPersonName = $("#legalPersonName").val();

                    if($.trim(toPrivateAccountName) == $.trim(legalPersonName)){//对私结算户名为法人
                        OKDialog("对私结算户名与法人姓名一致，请修改");
                        return false;
                    }
                    $("#mecNormalLevelFinal").val("11");
                }
            }
            //一类对公
            if(publicAccount == "publicAccount"){
                if(levelOne == '10'){//法人结算
                    $("#mecNormalLevelFinal").val("10");
                }
                if(levelOne == '11'){//非法人结算
                    $("#mecNormalLevelFinal").val("11");
                }
            }
        }else{
            $("#mecNormalLevelFinal").val("20");
        }
        //如果注册名称 = 对公结算账户的户名，结算人身份证号跟法人身份证号必须一致
        // var rname = $('#registName').val();
        // var pcname = $('#toPublicAccountName').val();
        // var smn = $('#settleManidNumber').val();
        // var lpc = $('#legalPersonCode').val();
        // if ((rname == pcname) && (smn != lpc)) {
        //     OKDialog("注册名称 与 对公结算账户名相同,则结算人身份证 与 法人证件号必须一致！");
        //     return false;
        // }
        var repeatMsg = "";

        /**  重复次数校验2,提交的时候校验重复次数
         *
         * @type {string}
         */
        var flag = true;
            //判断重复次数校验的商户类型(0=[普通商户、1+N总店、1+N分店]  1=[连锁总店、连锁分店])
        var repeatType = '0';
        var v = $('#merchantType').val();
        if (v == '2' || v == '3') {
            //连锁总店/连锁分店
            repeatType = '1';
        }
        var mecNormalLevel = judgeLevelForValidate($('#mecNormalLevel').val());
        var repeatMsg = "";
        //>1.注册名称重复次数校验
        var findVal = $('#registName').val();
        if (findVal.length > 0) {
            $.ajax({
                url: '/merchantIncome/registNameRepeat',
                data: {merchantType: repeatType, registName: findVal,mecNormalLevel:mecNormalLevel},
                type: "POST",
                dataType: "json",
                async: false,
                success: function (json) {
                    console.log(json)
                    if (json.code == "1") {
                        console.log("注册名称Yes")
                    } else {
                        OKDialogCallBack("注册名称的重复次数超出系统限制，请联系相关人员！", 'registName');
                        flag = false;
                   }
                },
                error: function (xhr, status) {
                    console.log("--------------注册名称重复次数校验,异常.--------------------")
                    flag = false;
                }
            });
        }
        if(!flag){
            return false;
        }
        //>>2.进行注册登记号重复次数校验
        findVal = $('#registCode').val();
        if (findVal.length > 0 ) {
            $.ajax({
                url: '/merchantIncome/registCodeRepeat',
                data: {merchantType: repeatType, registCode: findVal,mecNormalLevel:mecNormalLevel},
                type: "POST",
                dataType: "json",
                async: false,
                success: function (json) {
                    if (json.code == "1") {
                        console.log("注册登记号Yes")
                    } else {
                        OKDialogCallBack("注册登记号的重复次数超出系统限制，请联系相关人员！", 'registCode');
                        flag = false;
                    }
                },
                error: function (xhr, status) {
                    console.log("--------------注册登记号重复次数校验,异常.--------------------")
                    flag = false;
                }
            });
        }
        if(!flag){
            return false;
        }
        //>>>3.结算人身份证号,重复次数校验
        var findVal = $('#settleManidNumber').val();
        if (findVal.length > 0) {
            $.ajax({
                url: '/merchantIncome/settleCardNoRepeat',
                data: {merchantType: repeatType, cardNo: findVal,mecNormalLevel:mecNormalLevel},
                type: "POST",
                dataType: "json",
                async: false,
                success: function (json) {
                    if (json.code == "1") {
                        console.log("结算人身份证号Yes")
                    } else {
                        OKDialogCallBack("结算人身份证号的重复次数超出系统限制，请联系相关人员！", 'settleManidNumber');
                        flag = false;
                    }
                },
                error: function (xhr, status) {
                    console.log("--------------结算人身份证号-重复次数校验,异常.--------------------")
                    flag = false;
                }
            });
        }
        if(!flag){
            return false;
        }
        //>>>>4.对公结算账户名,重复次数校验
        var findVal = $('#toPublicAccountName').val();
        if (findVal.length > 0 ) {
            $.ajax({
                url: '/merchantIncome/settleAccountNameRepeat',
                data: {merchantType: repeatType, accoutName: findVal,mecNormalLevel:mecNormalLevel},
                type: "POST",
                dataType: "json",
                async: false,
                success: function (json) {
                    if (json.code == "1") {
                        console.log("结算卡(对公)账户名Yes")
                    } else {
                        OKDialogCallBack("对公结算账户名的重复次数超出系统限制，请联系相关人员！", 'toPublicAccountName');
                        flag = false;
                    }
                },
                error: function (xhr, status) {
                    console.log("--------------结算卡(对公)账户名-重复次数校验,异常.--------------------")
                    flag = false;
                }
            });
        }
        if(!flag){
            return false;
        }
        //>>>>>5.对公结算账号重复次数校验
        findVal = $('#toPublicSettleAccountNo').val();
        if (findVal.length > 0) {
            $.ajax({
                url: '/merchantIncome/settleAccountNoRepeat',
                data: {merchantType: repeatType, accoutNo: findVal,mecNormalLevel:mecNormalLevel},
                type: "POST",
                dataType: "json",
                async: false,
                success: function (json) {
                    if (json.code == "1") {
                        console.log("对公结算账号Yes")
                    } else {
                        OKDialogCallBack("对公结算账号的重复次数超出系统限制，请联系相关人员！", 'toPublicSettleAccountNo');
                        flag = false;
                    }
                },
                error: function (xhr, status) {
                    console.log("--------------结算账号-重复次数校验,异常.--------------------")
                    flag = false;
                }
            });
        }
        if(!flag){
            return false;
        }
        //>>>>>6.个体结算账号重复次数校验
        findVal = $('#toPrivateSettleAccountNo').val();
        if (findVal.length > 0 ) {
            $.ajax({
                url: '/merchantIncome/settleAccountNoRepeat',
                data: {merchantType: repeatType, accoutNo: findVal,mecNormalLevel:mecNormalLevel},
                type: "POST",
                dataType: "json",
                async: false,
                success: function (json) {
                    if (json.code == "1") {
                        console.log("对公结算账号Yes")
                    } else {
                        OKDialogCallBack("个体结算账号的重复次数超出系统限制，请联系相关人员！", 'toPrivateSettleAccountNo');
                        flag = false;
                    }
                },
                error: function (xhr, status) {
                    console.log("--------------结算账号-重复次数校验,异常.--------------------")
                    flag =false;
                }
            });
        }
        if(!flag){
            return false;
        }
        //验证必填图片
        flag=checkImage();
        if(!flag){
            return false;
        }
        //结算人年龄校验

        return true;
    }// end commit

    //验证必填图片
    function checkImage(){
        var licensePic= $("#licensePicBase64").children("img").attr("src");
        if(!licensePic){
            OKDialog("请上传营业执照!");
            return false;
        }
        //获取商户等级
        var mecNormalLevel = $("#mecNormalLevel").val();
        console.log("wwwwwwwwwww商户等级是wwwww:"+mecNormalLevel);
        if(mecNormalLevel == '10'){//商户等级一类
            var legalPersonidPositivePic= $("#legalPersonidPositivePicBase64").children("img").attr("src");
            if(!legalPersonidPositivePic){
                OKDialog("请上传法人身份证正面!");
                return false;
            }
            var legalPersonidOppositePic= $("#legalPersonidOppositePicBase64").children("img").attr("src");
            if(!legalPersonidOppositePic){
                OKDialog("请上传法人身份证反面!");
                return false;
            }
        }
        var settlePersonIdcardPositiveBase= $("#settlePersonIdcardPositiveBase64").children("img").attr("src");

        if(!settlePersonIdcardPositiveBase){
            OKDialog("请上传结算人身份证正面!");
            return false;
        }
        var settlePersonIdcardPositiveBase= $("#settlePersonIdcardOppositeBase64").children("img").attr("src");

        if(!settlePersonIdcardPositiveBase){
            OKDialog("请上传结算人身份证反面!");
            return false;
        }
        //add by wangyu
        var ifPosMd = $('#ifPosMd').is(':checked');
        if(ifPosMd){
            var handIdcardPicBase= $("#handIdcardPicBase64").children("img").attr("src");
            if(!handIdcardPicBase){
                OKDialog("请上传手持身份证照片!");
                return false;
            }
        }
        //end by wangyu
        var merchantAgreementPicBase= $("#merchantAgreementPicBase64").children("img").attr("src");

        if(!merchantAgreementPicBase){
            OKDialog("请上传商户协议照片!");
            return false;
        }
        var storePicBase= $("#storePicBase64").children("img").attr("src");

        if(!storePicBase){
            OKDialog("请上传门头照片!");
            return false;
        }
        return true;
    }

    /**
     * 检查控件的是否为必填
     * @param checkID为判断条件的ID
     * @param element为要检查的控件ID
     * @param 返回true则不为空
     */
    function requiredCheck(checkID, element) {
        var ifHidden = $('#' + checkID + '').hasClass('hidden');
        if (!ifHidden) {//如果界面上显示控件
            var fee = $('#' + element + '').val();
            if (fee.length == 0) {
                return false;
            }
        }
        return true;
    }

    /**
     * 根据checkbox显示与隐藏指定的元素
     * @param elementID为checkbox的ID
     * @param 可变参数arguments:要显示与隐藏的Element的ID
     */
    function ifChecked(elementID) {

        //如果没有checkbox的ID，直接退出
        if (elementID.length == 0)
            return false;

        //当前checkbox的选择状态
        var hasChk = $('#' + elementID + '').is(':checked');

        //遍历可变参数arguments控制显示与隐藏子元素
        for (var i = 1; i <= arguments.length; i++) {
            var element = arguments[i];
            var cdiv = $('#' + element + '');
            if (hasChk) {
                cdiv.removeClass("hidden");
            } else {
                cdiv.addClass("hidden");
            }
        }
    }


    /**分店设置至少选择一项**/
    $('#branchShopSet1,#branchShopSet2,#branchShopSet3').click(function () {
        var c1 = $('#branchShopSet1').is(':checked');
        var c2 = $('#branchShopSet2').is(':checked');
        var c3 = $('#branchShopSet3').is(':checked');

        if (!c1 && !c2) {
            OKDialog("独立结算/会员共享,至少选择一项！");
            return false;
        }
        if ("branchShopSet1" == this.id) {
            if (c1) {
                $('#ifb3').removeClass('hidden');

                //如果查询过总店结算信息，需要隐藏结算信息
                //清空结算信息并设置可编辑状态
                clearSettleInfo("toPrivate");
                clearSettleInfo("toPublic");
            } else {
                $('#ifb3').addClass('hidden');

                //如果查询过总店结算信息，需要显示结算信息
                var merchantType = $('#merchantType').find('option:selected').val();
                if((merchantType=='3' || merchantType=='5')) {
                    var btn1=$('#toPrivateIfSetValue').val();
                    var btn2=$('#toPublicIfSetValue').val();
                    if(btn1=='Y'){
                        backSettleCardInfo2("toPrivate");
                    }
                    if(btn2=='Y'){
                        backSettleCardInfo2("toPublic");
                    }
                }
            }
            //取消<允许查账>选中状态
            if ($('#branchShopSet3').is(':checked')) {
                $('#branchShopSet3').trigger('click');
            }
        }
    });

    //1.<结算卡功能信息-功能受理>，至少选择一个(默认'一般刷卡'被选中)
    $('#functionAcceptanceSettle1,#functionAcceptanceSettle2,#functionAcceptanceSettle3').click(function () {
        var c1 = $('#functionAcceptanceSettle1').is(':checked');
        var c2 = $('#functionAcceptanceSettle2').is(':checked');
        var c3 = $('#functionAcceptanceSettle3').is(':checked');
        if (!c1 && !c2 && !c3) {
            OKDialog("功能受理至少选择一项！");
            return false;
        }
    });
    //2.<预付卡信息-功能受理>
    $('#functionAcceptancePrepaidCard1,#functionAcceptancePrepaidCard2,#functionAcceptancePrepaidCard3').click(function () {
        var c1 = $('#functionAcceptancePrepaidCard1').is(':checked');
        var c2 = $('#functionAcceptancePrepaidCard2').is(':checked');
        var c3 = $('#functionAcceptancePrepaidCard3').is(':checked');
        if (!c1 && !c2 && !c3) {
            OKDialog("功能受理至少选择一项！");
            return false;
        }
    });


    /** 加载银行列表*/
    function loadTeamworkBankData() {
        $.ajax({
            url: "/merchantIncome/loadTeamworkBankList",
            type: "POST",
            dataType: "json",
            //timeout:5000,
            success: function (json) {
                console.log("--------------AAAAAA---------------")
                console.log(json)
                console.log("--------------BBBBBB---------------")

                if (json.code == 1) {
                    var options = "";
                    var d = "<option value=\"\">请选择</option>";
                    $("#customerManagerBank").html(d);
                    var scVal = $('#customerManagerBank').val();
                    //编辑页面回填
                    if(scVal == '')
                    {
                        scVal  = $('#hideCustomerManagerBank').val();
                    }
                    $.each(json.result, function (i, item) {
                        if (scVal == item.id) {
                            options += "<option selected value=\"" + item.id + "\" >" + item.name + "</option>";

                            selectBankManager(scVal);
                        } else {
                            options += "<option value=\"" + item.id + "\" >" + item.name + "</option>";
                        }
                    });
                    $("#customerManagerBank").append(options);
                } else {
                    console.log("======加载银行列表,出现异常======")
                }

            },
            error: function (xhr, status) {
                console.log("==>无法获取合作银行数据.")
                alert("无法获取合作银行数据.");
            }
        })
    }

    /** 加载银行的客户经理列表*/
    function selectBankManager(bankId) {
        $("#customerManager").html("");
        $.ajax({
            url: "/merchantIncome/loadBankManagerList",
            data: {bankId: bankId},
            type: "POST",
            dataType: "json",
            timeout: 5000,
            success: function (json) {
                if (json.code == 1) {
                    var options = "";
                    var d = "<option value=\"\">请选择</option>";
                    $("#customerManager").html(d);
                    var scVal = $('#customerManager').val();
                    if(scVal == ''){
                        scVal=$('#hideCustomerManager').val() ;
                    }
                    $.each(json.result, function (i, item) {
                        if (scVal == item.managerId) {
                            options += "<option selected value=\"" + item.managerId + "\" >" + item.managerName + "</option>";
                        } else {
                            options += "<option value=\"" + item.managerId + "\" >" + item.managerName + "</option>";
                        }
                    });
                    $("#customerManager").append(options);
                } else {
                    console.log("==========加载客户经理列表，出现错误==============")
                }

            },
            error: function (xhr, status) {
                console.log("==>无法获取银行客户经理数据.")
                alert("无法获取银行客户经理数据.");
            }
        })
    }

    //银行列表选择，级联客户经理下拉数据
    $('#customerManagerBank').change(function () {
        var bankId = $('#customerManagerBank').val();
        selectBankManager(bankId);
    });

    //商户类型-选择
    $('#merchantType').change(function () {
        mtchange();
    });
    function mtchange() {
        var merchantType = $('#merchantType').find('option:selected').val();
        var mt1 = $('#branchDiv');//分店设置DIV
        var mt2 = $('#subjectionDiv');//隶属信息DIV
        var mt3 = $('#showZD');//总店信息按钮
        switch (merchantType) {
            case "3":
            case "5":
                //显示分店与隶属信息
                mt1.removeClass("hidden");
                mt2.removeClass("hidden");
                mt3.removeClass("hidden");
                break;
            default:
                mt1.addClass("hidden");
                mt2.addClass("hidden");
                mt3.addClass("hidden");

                //清空隶属商户、编码信息
                $('#subjectionMerchantCode').val("");
                $('#subjectionMerchantName').val("");
                //恢复默认状态-分店设置选择项
                $('#branchShopSet1').is(':checked') ? "" : $('#branchShopSet1').trigger('click');
                $('#branchShopSet2').is(':checked') ? "" : $('#branchShopSet2').trigger('click');
                $('#branchShopSet3').is(':checked') ? $('#branchShopSet3').trigger('click') : "";

        }

        if((merchantType=='3' || merchantType=='5')) {
        }else{
            //清空结算信息并设置可编辑状态
            // clearSettleInfo("toPrivate");
            // clearSettleInfo("toPublic");
        }

        //====================重新加载数据(去除4省等信息)=========================
        //装机地址数据
        startPCA("provincespan", "cityspan", "areaspan", "bindAddressProvince", "bindAddressCity", "bindAddressArea", "bindAddrProvinceHidden", "bindAddrCityHidden", "bindAddrAreaHidden");
        //注册地址数据
        startPCA("r_provincespan", "r_cityspan", "r_areaspan", "registAddressProvince", "registAddressCity", "registAddressArea", "registAddrProvinceHidden", "registAddrCityHidden", "registAddrAreaHidden");
    }

    //清空结算信息
    function clearSettleInfo(startWord){
        var settleInfoInputIds = [startWord+'AccountName',startWord+'SettleAccountNo',startWord+'CnapsCode',startWord+'OpenbankInfomation','accountLegalPersonName'];
        for(var i=0;i<settleInfoInputIds.length;i++){
            $('#'+settleInfoInputIds[i]).val("");
            if(settleInfoInputIds[i].indexOf("OpenbankInfomation")>0){
                setSelect2Value(startWord+'OpenbankInfomation',"","");//清空公开户行信息
            }
            $('#'+settleInfoInputIds[i]).prop('disabled',false);
        }
    }

    /**
     * 隐藏结算信息显示
     */
    function backSettleCardInfo2(startWord){
        var cnapsCodePub=$('#toPublicCnapsCode').val();
        var cnapsCodePri=$('#toPrivateCnapsCode').val();
        var legalName=$("#accountLegalPersonNameHidden").val();
        $('#'+startWord+'AccountName').val($('#'+startWord+'HiddenAccountName').val());// 结算账户名
        $('#'+startWord+'SettleAccountNo').val($('#'+startWord+'HiddenSettleAccountNo').val()); // 结算账号
        $('#'+startWord+'CnapsCode').val($('#'+startWord+'HiddenCnapsCode').val());// 联行行号
        var bankDetail=$('#'+startWord+'HiddenOpenbankInfomation').val();// 结算银行详细
        setSelect2Value(startWord+'OpenbankInfomation',bankDetail,bankDetail);//对公开户行信息设置
        $('#settleManidNumber').val($('#settleManidNumberHidden').val());//结算人身份证号(只有个体存在账户法人姓名所以ID固定)

        ctrlAccountLegalName();// ****>显示隐藏'账户法人姓名'属性
        if(!$('#accountLegalPersonName').hasClass('hidden')){
            $("#accountLegalPersonName").val($("#accountLegalPersonNameHidden").val());// 账户法人姓名
        }

        if(startWord=="toPublic" && cnapsCodePri == ''){//只有一个结算卡（默认）对公
            var settleInfoInputIds = ['toPrivateAccountName','toPrivateSettleAccountNo','toPrivateCnapsCode','toPrivateOpenbankInfomation'];
            $("#accountLegalNmDiv").show();
            $('#accountLegalPersonName').val(legalName);// 账户法人姓名
            for(var i=0;i<settleInfoInputIds.length;i++){
                $('#'+settleInfoInputIds[i]).val(null);
            }
        }else if(startWord=="toPrivate" && cnapsCodePub == ''){//只有一个结算卡（默认）对私
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
    }



    //银行合作-选择
    $('#bankTeamwork').change(function () {
        var bankType = $('#bankTeamwork').find('option:selected').val();
        var bt1 = $('#bt1');
        var bt2 = $('#bt2');
        switch (bankType) {
            case "1":
                //随行付合作
                bt1.removeClass("hidden");
                bt2.addClass("hidden");

                //加载银行下拉列表
                loadTeamworkBankData();
                break;
            case "2":
                //自主拓展
                bt1.addClass("hidden");
                bt2.removeClass("hidden");
                break;
            default:
                bt1.addClass("hidden");
                bt2.addClass("hidden");
        }
    });

    //行业大类-选择
    $('#businessClassify').change(function () {
        var ysq = $('#functionAcceptancePrepaidCard2').is(':checked');
        if (!ysq) return;

        var classify = $('#businessClassify').find('option:selected').val();
        switch (classify) {
            case "1":
            case "2":
                //do nothing
                break;
            default:
                OKDialog("预授权商户行业大类必须是 一般类或餐娱类，将关闭预授权！");
                $('.class-ysq').attr('checked', false);
        }
    });

    //开通'预授权'不可开通[随意通结算/非工作日结算/即日付]
    $('.class-ysq').click(function () {
        //两个预授权的ID：functionAcceptanceSettle2、functionAcceptancePrepaidCard2
        var syt = $('#ifSuiYiTongSettle').is(':checked');
        var fgzr = $('#ifNonworkdaySettle').is(':checked');
        var jrf = $('#ifIntradaySettle').is(':checked');

        if (syt || fgzr || jrf) {
            $(this).attr('checked', false);
            OKDialog('预授权不能与随意通结算/非工作日结算/即日付 同时开通!');
        } else {
            //预授权商户行业大类必须是一般类或者餐娱类
            var classify = $('#businessClassify').find('option:selected').val();
            switch (classify) {
                case "1":
                case "2":
                    //do nothing
                    break;
                default:
                    $(this).attr('checked', false);
                    OKDialog("预授权商户行业大类必须是 一般类或餐娱类!");
            }
        }
    });

    //随意通
    $('#ifSuiYiTongSettle').click(function () {
        var ischk = $(this).is(':checked');
        var flag = isHaveSuiYiTong();
        if (ischk) {
            //与<pos秒到>不能共同选中
            var chk = $('#ifPosMd').is(':checked');
            if (chk) {
                $('#ifSuiYiTongSettle').attr('checked', false);
                OKDialog('随意通结算 与 闪电到账-自动秒到不可同时开通!');
            }
            var ysq = $('.class-ysq').is(':checked');//两个'预授权'只要有一被勾选就返回true
            if (ysq) {
                $('#ifSuiYiTongSettle').attr('checked', false);
                OKDialog('随意通结算/即日付/非工作日结算不能与预授权同时开通!');
            }else if(flag == '-1'){
                OKDialog('该代理商尚未开通随意通！');
                $("#ifSuiYiTongSettle").attr('checked',false);
            }else if(flag == '-2'){
                OKDialog('非一级代理商商户不允许随意通，请联系一级代理商管理员');
                $("#ifSuiYiTongSettle").attr('checked',false);
            } else {
                //与<即日付>不能共同选中
                var chk = $('#ifIntradaySettle').is(':checked');
                if (chk) {
                    $('#ifSuiYiTongSettle').attr('checked', false);
                    OKDialog('随意通结算 与 即日付不可同时开通!');
                } else {
                    //若果被选中，则需要判断当前登录代理商是否有权限开通[随意通]
                    $.ajax({
                        url: "/merchantIncome/hasSuiYiTongAuthorityAjax",
                        type: "POST",
                        dataType: "json",
                        success: function (json) {
                            if (json.result == "1") {
                                ifChecked('ifSuiYiTongSettle', 'sytDiv1', 'sytDiv2');
                            } else {
                                OKDialog('您没有[随意通]开通权限!');
                                $('#ifSuiYiTongSettle').attr('checked', false);
                                console.log(json);
                                console.log("查询失败，或没有开通权限.")
                            }
                        },
                        error: function (xhr, status) {
                            OKDialog("查询不到当前代理商。");
                            $('#ifSuiYiTongSettle').attr('checked', false);
                        }
                    })//end ajax
                }

            }
        } else {
            ifChecked('ifSuiYiTongSettle', 'sytDiv1', 'sytDiv2');
            //-------如果checkbox被uncheck则清空div内控件填写的数据------
            $("#suiYiTongQuota").val("10000");//1.随意通限额,回复默认值
            $('#suiYiTongCountrFee').val("");//2.清空随意通的手续费内容
            //3.清空-所有自动结算时间的选择
            $('#automaticSettleTime9').is(':checked') ? $('#automaticSettleTime9').trigger('click') : "";
            $('#automaticSettleTime10').is(':checked') ? $('#automaticSettleTime10').trigger('click') : "";
            $('#automaticSettleTime11').is(':checked') ? $('#automaticSettleTime11').trigger('click') : "";
            $('#automaticSettleTime12').is(':checked') ? $('#automaticSettleTime12').trigger('click') : "";
            $('#automaticSettleTime13').is(':checked') ? $('#automaticSettleTime13').trigger('click') : "";
            $('#automaticSettleTime14').is(':checked') ? $('#automaticSettleTime14').trigger('click') : "";
            $('#automaticSettleTime15').is(':checked') ? $('#automaticSettleTime15').trigger('click') : "";
            $('#automaticSettleTime16').is(':checked') ? $('#automaticSettleTime16').trigger('click') : "";
            $('#automaticSettleTime17').is(':checked') ? $('#automaticSettleTime17').trigger('click') : "";
            $('#automaticSettleTime20').is(':checked') ? $('#automaticSettleTime20').trigger('click') : "";
        }
    });

    //非工作日结算
    $('#ifNonworkdaySettle').click(function () {
        var ysq = $('.class-ysq').is(':checked');
        if (ysq) {
            $('#ifNonworkdaySettle').attr('checked', false);
            OKDialog('非工作日结算/随意通结算/即日付不能与预授权同时开通!');
        } else {
            //do nothing
        }
    });

    //即日付
    $('#ifIntradaySettle').click(function () {
        //与<pos秒到>不能共同选中
        var chk = $('#ifPosMd').is(':checked');
        if (chk) {
            $('#ifIntradaySettle').attr('checked', false);
            OKDialog('即日付 与 闪电到账-自动秒到不可同时开通!');
        }
        var ysq = $('.class-ysq').is(':checked');
        if (ysq) {
            $('#ifIntradaySettle').attr('checked', false);
            OKDialog('即日付/随意通结算/非工作日结算不能与预授权同时开通!');
        } else {
            //与<随意通>不能共同选中
            var chk = $('#ifSuiYiTongSettle').is(':checked');
            if (chk) {
                $('#ifIntradaySettle').attr('checked', false);
                OKDialog('即日付 与 随意通不可同时开通!');
            } else {
                ifChecked('ifIntradaySettle', 'jrfDiv1');
                //1.清空即日付的手续费内容
                //查询即日付默认费率
                var defaultRate = queryDefaultRate();
                console.log("默认即日付费率"+defaultRate);
                $('#intradayPayCounterFee').val(defaultRate);
            }

        }

    });
    //开通'pos秒到'不可开通[随意通结算/即日付]
    $('.class-pmd').click(function () {
        //勾选赋值
        var ifPosMd = $('#ifPosMd').is(':checked');
        if(ifPosMd){
            $('#ifPosMd').val("on");
        }else{
            $('#ifPosMd').val("01");
        }
        var syt = $('#ifSuiYiTongSettle').is(':checked');
        var jrf = $('#ifIntradaySettle').is(':checked');
        if (syt || jrf){
            $(this).attr('checked', false);
            OKDialog('闪电到账-自动秒到不能与随意通结算/即日付 同时开通!');
        } else {
            //do nothing
        }

    });



    //费用信息->POS维护费
    $('#ifMaintainFeeOfPos').click(function () {
        //与维护通不能共同选中
        var chkWHT = $('#ifWeiHuTong').is(':checked');
        if (chkWHT) {
            $('#ifMaintainFeeOfPos').attr('checked', false);
            OKDialog("POS维护费与维护通只能收取一种！");
        } else {
            ifChecked('ifMaintainFeeOfPos', 'posDiv');

            var chkPOS = $('#ifMaintainFeeOfPos').is(':checked');
            if (!chkPOS) {
                //清空-收取金额；<日累计扣费、日非累计扣费>不需要清空
                $('#maintainFeeOfPos').val("");
            }//end if
        }
    });

    //日累计扣费/日非累计扣费 不能一起选择,但是至少选择一项
    $('#ifMaintainFeeOfPos2').click(function () {
        $('#ifMaintainFeeOfPos3').trigger('click');
    });
    $('#ifMaintainFeeOfPos3').click(function () {
        $('#ifMaintainFeeOfPos2').trigger('click');
    });


    //费用信息->维护通
    $('#ifWeiHuTong').click(function () {
        //与POS维护费不能共同选中
        var chkPOS = $('#ifMaintainFeeOfPos').is(':checked');
        if (chkPOS) {
            $('#ifWeiHuTong').attr('checked', false);
            OKDialog('POS维护费与维护通只能收取一种!');
        } else {
            ifChecked('ifWeiHuTong', 'whtDiv');
            var chkWHT = $('#ifWeiHuTong').is(':checked');
            if(!chkWHT){
                $("#collectAmount").val("");
            }
        }
    });

    // 预付卡
    $('#ifPrepaidCard').click(function () {
        ifChecked('ifPrepaidCard', 'preH', 'preDiv1', 'preDiv2');
        if ($(this).prop('checked')) {
        } else {
            //设置隐藏域的值为默认状态
            $('#functionAcceptancePrepaidCard1').prop('checked', true);
            $('#functionAcceptancePrepaidCard2').prop('checked', false);
            $('#functionAcceptancePrepaidCard3').prop('checked', false);
            $('#gaoHuiTongMerchantCode').val("");

            //隐藏验证的错误提示信息
            var errorObj = $("#gaoHuiTongMerchantCode").next();
            if ($(errorObj).attr('for') == 'gaoHuiTongMerchantCode') {
                $("#gaoHuiTongMerchantCode").next().remove();
            }
        }
    });

    //交行外卡
    $('#ifOutBCMCard').click(function () {
        ifChecked('ifOutBCMCard', 'bcmH', 'bcmDiv1', 'bcmDiv2', 'bcmDiv3');
        //如果去除勾选，清空交行外卡费率信息
        if(!$('#ifOutBCMCard').prop("checked")){
            $("#rateVisa").val("");
            $("#rateMaster").val("");
            $("#rateAmericanExpress").val("");
            $("#rateDiners").val("");
            $("#rateJCB").val("");
            $("#rateVISADCC").val("");
            $("#rateMCDCC").val("");
        }
    });


    /**
     * alert提示信息封装
     * @param msg 要提示的信息内容
     */
    function OKDialog(msg) {
        bootbox.dialog({
            message: msg,
            closeButton: true,
            title: "提示",
            buttons: {
                success: {
                    label: "确定",
                    className: "blue"
                }
            }
        });
    }

    //带有回到函数清空的提示
    function OKDialogCallBack(msg, optionId) {
        bootbox.dialog({
            message: msg,
            closeButton: true,
            title: "提示",
            buttons: {
                success: {
                    label: "确定",
                    className: "blue",
                    callback: function () {
                        $('#' + optionId + '').val("");
                    }
                }
            }
        });
    }

    /**
     * 根据checkbox显示与隐藏指定的元素
     * @param elementID为checkbox的ID
     * @param 可变参数arguments:要显示与隐藏的Element的ID
     */
    function ifChecked(elementID) {

        //如果没有checkbox的ID，直接退出
        if (elementID.length == 0)
            return false;

        //当前checkbox的选择状态
        var hasChk = $('#' + elementID + '').is(':checked');

        //遍历可变参数arguments控制显示与隐藏子元素
        for (var i = 1; i <= arguments.length; i++) {
            var element = arguments[i];
            var cdiv = $('#' + element + '');

            if (hasChk) {
                cdiv.removeClass("hidden");
                $("#" + element + " input[type='text']").each(function () {
                    $(this).removeClass("hidden");
                });
            } else {
                cdiv.addClass("hidden");
                $("#" + element + " input[type='text']").each(function () {
                    $(this).addClass("hidden");
                });
            }
        }
    }

    //新增时，checkbox默认选中项设置
    function initSetAddDeaultCheckbox() {
        $('#branchShopSet1').attr('checked', true);
        $('#branchShopSet2').attr('checked', true);
        $('#functionAcceptanceSettle1').attr('checked', true);
        $('#ifNonworkdaySettle').attr('checked', true);
        $('#ifOtherConsumption').attr('checked', true);
        $('#ifMaintainFeeOfPos2').attr('checked', true);
        $('#functionAcceptancePrepaidCard1').attr('checked', true);
    }

    /**
     * select2(下拉搜索框) 设置值
     * @param elementID为元素的ID
     * @param textVal为option的显示文本
     * @param idVal为option的key值
     */
    function setSelect2Value(elementID, textVal, idVal) {
        $("#" + elementID + "").append(new Option(textVal, idVal, false, true));
    }

    /**  判断个体和对公结算信息是否至少填写一组，且必须整租填写
     *  return false: 不满足条件，无法提交
     * */
    function verifySettleInfo() {
        $("#privateAccount").val("");
        $("#publicAccount").val("");
        var priName = $('#toPrivateAccountName').val();
        var priNo = $('#toPrivateSettleAccountNo').val();
        var priCode = $('#toPrivateCnapsCode').val();
        var priInfo = $('#toPrivateOpenbankInfomation').val();
        var pubName = $('#toPublicAccountName').val();
        var pubNo = $('#toPublicSettleAccountNo').val();
        var pubCode = $('#toPublicCnapsCode').val();
        var pubInfo = $('#toPublicOpenbankInfomation').val();

        //对公\个体，至少填写一组判断  TODO :为方便开发调试，临时仅通过判断'结算账号'来确定个体 或 对公至少填写一种的逻辑
        if (priNo == '' && pubNo == '') {
            return false;
        } else {
            // 1. 判断【个体】结算是否整组填写
            if (priName != '' || priNo != '' || priCode != '' ||( priInfo != ''&&  priInfo != null)) {
                if (priName == '' || priNo == '' || priCode == '' || priInfo == '' || priInfo == null) {
                    return false;
                }
                $("#privateAccount").val("privateAccount");
            }
            // 2. 判断【对公】结算是否整组填写
            if (pubName != '' || pubNo != '' || pubCode != '' || (pubInfo != '' &&  pubInfo != null)) {
                if (pubName == '' || pubNo == '' || pubCode == '' || pubInfo == '' || pubInfo == null) {
                    return false;
                }
                $("#publicAccount").val("publicAccount");
            }
        }
        return true;
    }//end


    //****************ajax上传图片*******************************************
    function uploadPic(obj) {

        var file = $('#licensePic').files;
        console.log("------------AAA---------------")
        console.log(file)
        console.log("------------BBB---------------")

        // return false;
        //
        // var xhr = null;
        // //创建ajax
        // try {
        //     xhr = new ActiveXObject("Msxml2.XMLHTTP");
        // } catch (e) {
        //     try {
        //         xhr = new ActiveXObject("Microsoft.XMLHTTP");
        //     } catch (e) {
        //         try {
        //             xhr = new XMLHttpRequest();
        //         } catch (e) {
        //             alert("您的浏览器不支持ajax.");
        //             return;
        //         }
        //     }
        // }
        // var file = $('#licensePic').files;
        // console.log("------------AAA---------------")
        // console.log(file)
        // console.log("------------BBB---------------")
        // //判断文件的大小
        // if(file[0]==null){return;}
        // var fileSize=file[0].size;
        // var size = fileSize / 1024;
        // if(size>5120){
        //     alert("上传文件超过最大限制5M");
        //     this.value="";
        //     return
        // }
        //
        // var fromData = new FormData();
        // var xhr = new XMLHttpRequest();
        // fromData.append('file', file[0]);//提交单个文件
        // fromData.append('type', $(obj).attr('name'));//后台用于区别是什么图片(身份证、营业执照等)
        // xhr.open("post", "/merchantIncome/uploadPicture", true);
        // xhr.send(fromData);
        // xhr.onreadystatechange = function() {
        //     if (xhr.readyState==4 && xhr.status == 200) {  //回调
        //         var jsonobj=eval("(" + xhr.responseText + ")");
        //         if(jsonobj.code==200){
        //             console.log("***********1111*****************")
        //             console.log(jsonobj)
        //             console.log("***********2222*****************")
        //             // var data=jsonobj.result.pictureSizes;
        //             // if(data==null){alert('result 是 Null,请注意！'); return;}
        //             // $.each(data,function(i,item){
        //             // if(item.isDefault == '1'){//缩略图
        //             //     currUrl=item.uri;
        //             //     currUrl=item.uri+"?id="+jsonobj.result.id+"&filename="+jsonobj.result.storeName;
        //             // }else{
        //             //     var bigName=jsonobj.result.storeName;
        //             //     var xy=bigName.lastIndexOf(".");
        //             //     var prifix=bigName.substring(xy);
        //             //     bigName=bigName.substring(0,xy)+"_"+item.sizePathName+prifix;
        //             //     currUrl+="&big="+bigName;
        //             // }
        //             // });
        //         }else{
        //             alert('图片上传失败！');
        //         }
        //     }
        // }
    };

    //****************省、市、区*******************************************
    //移除4省份
    function removeProvince(elementID) {
        //[730-黑龙江省]、[647-吉林省]、[512-辽宁省]、[1050-浙江省]
        $("#" + elementID + " option").each(function (index, item) {
            if ($("#" + elementID + " option[value='730']").length == 1) {
                $("#" + elementID + " option[value='730']").remove();
            }
            if ($("#" + elementID + " option[value='647']").length == 1) {
                $("#" + elementID + " option[value='647']").remove();
            }
            if ($("#" + elementID + " option[value='512']").length == 1) {
                $("#" + elementID + " option[value='512']").remove();
            }
            if ($("#" + elementID + " option[value='1050']").length == 1) {
                $("#" + elementID + " option[value='1050']").remove();
            }
        });
    }

    //移除福建省的，除厦门外的其他市
    function removeCity(elementID) {
        $("#" + elementID + " option").each(function (index, item) {
            var fval = $(item).val();
            if ('1321' == fval || '' == fval) {
                //不移除"厦门市"
            } else {
                $("#" + elementID + " option[value='" + fval + "']").remove();
            }
        });
    }

    //装机地址数据
    startPCA("provincespan", "cityspan", "areaspan", "bindAddressProvince", "bindAddressCity", "bindAddressArea", "bindAddrProvinceHidden", "bindAddrCityHidden", "bindAddrAreaHidden");

    //注册地址数据
    startPCA("r_provincespan", "r_cityspan", "r_areaspan", "registAddressProvince", "registAddressCity", "registAddressArea", "registAddrProvinceHidden", "registAddrCityHidden", "registAddrAreaHidden");

    /**
     * 加载省、市、区 数据并支持回显数据
     * @param provincespan 省份显示位置的div的ID
     * @param cityspan 市显示位置的div的ID
     * @param areaspan 区显示位置的div的ID
     *
     * @param name_province_val 省份的name属性
     * @param name_city_val 市的name属性
     * @param name_area_val 区的name属性
     *
     * @param provinceHidden 省的隐藏域ID
     * @param cityHidden 市的隐藏域ID
     * @param areaHidden 区的隐藏域ID
     */
    function startPCA(provincespan, cityspan, areaspan, name_province_val, name_city_val, name_area_val, provinceHidden, cityHidden, areaHidden) {
        $.ajax({
            url: '/common/findProvince',
            data: {nameParam: "" + name_province_val + "", q_province: $('[name=' + provinceHidden + ']').val()},
        }).done(function (data) {
            $("#" + provincespan + "").html(data);
            $("#" + name_province_val + "").select2();

            //商户类型不是"连锁分店"则需要删除4省
            if ($('#merchantType').val() != '3') {
                removeProvince(name_province_val);
            }

        }).fail(function (e, data) {
            console.log("error:findProvince");
        }).always(function () {
            //console.log("complete:findProvince");
        });

        var cityHidden = $('[name=' + cityHidden + ']').val();
        var areaHidden = $('[name=' + areaHidden + ']').val();
        if (cityHidden) {
            getCity($('[name=' + provinceHidden + ']').val(), cityHidden, cityspan, name_city_val);
            if (areaHidden) {
                getArea(cityHidden, areaHidden, areaspan, name_area_val);
            }
        }

        $("#" + provincespan + "").on('change', function () {
            var province = $("#" + name_province_val + "").val();
            $('#' + provinceHidden + '').val(province);
            if (!province) {
                return false;
            }
            //初始化市、区下拉框
            initCityArea(cityspan, areaspan);
            getCity(province, '', cityspan, name_city_val);

            $("#scaffold-save-merchantIncome").validate().element("#" + name_province_val + "");
        });

        $("#" + cityspan + "").on('change', function () {
            var city = $("#" + name_city_val + "").val();
            $('#' + cityHidden + '').val(city);
            if (!city) {
                return false;
            }
            //初始化市、区下拉框
            initCityArea('', areaspan);
            getArea(city, '', areaspan, name_area_val);

            $("#scaffold-save-merchantIncome").validate().element("#" + name_city_val + "");
        });

        $("#" + areaspan + "").on('change', function () {
            var area = $("#" + name_area_val + "").val();
            $('#' + areaHidden + '').val(area);
            $("#scaffold-save-merchantIncome").validate().element("#" + name_area_val + "");
        });

        //窗口加载时，就初始化市、区下拉框
        initCityArea(cityspan, areaspan);
    }

    ////窗口加载时，就初始化市、区下拉框
    function initCityArea(cityspan, areaspan) {
        if (cityspan != '') {
            $("#" + cityspan + "").html("<select class='form-control select2'><option>请选择</option></select>");
        }
        if (areaspan != '') {
            $("#" + areaspan + "").html("<select class='form-control select2'><option>请选择</option></select>");
        }
    }

    function getCity(province, q_city, showDivID, name_val) {
        $.ajax({
            url: '/common/findCity',
            data: {nameParam: "" + name_val + "", province: province, q_city: q_city},
        }).done(function (data) {
            $("#" + showDivID + "").html(data);
            $("#" + name_val + "").select2();

            if ('1305' == province) {
                //除“厦门市”其余全部删除
                if ($('#merchantType').val() != '3') {
                    removeCity(name_val);
                }
            }

        }).fail(function (e, data) {
            console.log("error");
        }).always(function () {
            //console.log("complete");
        });
    }

    function getArea(city, q_area, showDivID, name_val) {
        $.ajax({
            url: '/common/findArea',
            data: {nameParam: "" + name_val + "", city: city, q_area: q_area},
        }).done(function (data) {
            $("#" + showDivID + "").html(data);
            $("#" + name_val + "").select2();
        }).fail(function (e, data) {
            console.log("error");
        }).always(function () {
            //console.log("complete");
        });
    }

    /**
     * 新增商户的时候校验一代是否开通过随意通业务
     */
    function isHaveSuiYiTong(){
        var flag = 2;
        $.ajax({
            url: '/suiYiTongAgent/judgeRootSuiYiTongStatus',
            async:false,
            success:function(data){
                console.log("随意通一级代理商开通结果："+data);
                flag = data;
            }
        });
        return flag;
    }

    /**
     * 查询即日付默认费率
     */
    function queryDefaultRate(){
        var defaultRate = '';
        $.ajax({
            url: '/intradayPay/queryDefaultRate',
            async:false,
            success:function(data){
                console.log("即日付默认费率："+data);
                defaultRate = data;
            }
        });
        return defaultRate;
    }
    //*********End*********************************************************

    $("#toPrivateSettleAccountNo").on('blur',function () {
        regBankCardIsCorrect(this);
    });
    function regBankCardIsCorrect(bankCardField){
        var bankno = $(bankCardField).val();
        var lastNum=bankno.substr(bankno.length-1,1);//取出最后一位（与luhm进行比较）

        var first15Num=bankno.substr(0,bankno.length-1);//前15或18位
        var newArr=new Array();
        for(var i=first15Num.length-1;i>-1;i--){    //前15或18位倒序存进数组
            newArr.push(first15Num.substr(i,1));
        }
        var arrJiShu=new Array();  //奇数位*2的积 <9
        var arrJiShu2=new Array(); //奇数位*2的积 >9

        var arrOuShu=new Array();  //偶数位数组
        for(var j=0;j<newArr.length;j++){
            if((j+1)%2==1){//奇数位
                if(parseInt(newArr[j])*2<9)
                    arrJiShu.push(parseInt(newArr[j])*2);
                else
                    arrJiShu2.push(parseInt(newArr[j])*2);
            }
            else //偶数位
                arrOuShu.push(newArr[j]);
        }

        var jishu_child1=new Array();//奇数位*2 >9 的分割之后的数组个位数
        var jishu_child2=new Array();//奇数位*2 >9 的分割之后的数组十位数
        for(var h=0;h<arrJiShu2.length;h++){
            jishu_child1.push(parseInt(arrJiShu2[h])%10);
            jishu_child2.push(parseInt(arrJiShu2[h])/10);
        }

        var sumJiShu=0; //奇数位*2 < 9 的数组之和
        var sumOuShu=0; //偶数位数组之和
        var sumJiShuChild1=0; //奇数位*2 >9 的分割之后的数组个位数之和
        var sumJiShuChild2=0; //奇数位*2 >9 的分割之后的数组十位数之和
        var sumTotal=0;
        for(var m=0;m<arrJiShu.length;m++){
            sumJiShu=sumJiShu+parseInt(arrJiShu[m]);
        }

        for(var n=0;n<arrOuShu.length;n++){
            sumOuShu=sumOuShu+parseInt(arrOuShu[n]);
        }

        for(var p=0;p<jishu_child1.length;p++){
            sumJiShuChild1=sumJiShuChild1+parseInt(jishu_child1[p]);
            sumJiShuChild2=sumJiShuChild2+parseInt(jishu_child2[p]);
        }
        //计算总和
        sumTotal=parseInt(sumJiShu)+parseInt(sumOuShu)+parseInt(sumJiShuChild1)+parseInt(sumJiShuChild2);

        //计算Luhm值
        var k= parseInt(sumTotal)%10==0?10:parseInt(sumTotal)%10;
        var luhm= 10-k;
        if(lastNum!=luhm){
            OKDialog('您输入的卡号有误，请再次确认是否正确！');
        }
    };
} else {
    alert("新增商户页面错误：JQuery文件还没有被加载...");
}
