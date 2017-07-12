
/**
 * create by qiudong
 * 修改小微进件界面脚本
 */
if (typeof jQuery !== 'undefined') {
    $(function () {
//反写
        var ifPosMdVal=$('#ifPosMd').val();//闪电到账-自动秒到
        // console.log('ifPosMdVal:'+ifPosMdVal)
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
        /*    if ("yes" != serverError) {
         initSetAddDeaultCheckbox();//设置默认选中的checkbox值
         }*/
        //  mtchange();//商户类型

        /**  个体  联行号信息-下拉框改变    */
        $('#toPrivateOpenbankInfomation').change(function () {
            var selectObj = $("#toPrivateOpenbankInfomation").select2("data");
            $('#toPrivateBankName').val(selectObj[0].bankName);//设置个体的银行名称隐藏域
            $('#toPrivateCnapsCode').val(selectObj[0].linkBankNo);//设置联行行号
        });

        /*      /!**  操作错误提示信息  *!/
         var state = $('#saveState').val();
         var option = $('#option').val();
         if (option == "add" && state == "error") {
         OKDialog("新增失败，请检查填写内容是否符合要求！");
         } else if (option == "edit" && state == "error") {
         OKDialog("修改失败，请检查填写内容是否符合要求！");
         }
         */
        /** 重复次数校验:
         个体结算信息 个体结算信息必须整组填写（对公结算信息同理），点击“开户行信息输入框查询结算银行”可以补全联行行号及开户行信息.
         * <注册名称（上面函数中定义）、注册登记号、结算人身份证号、结算卡(对公)账户名、结算卡号(个体)、结算卡号（对公）>
         * */
        $('#subjectionMerchantName,#registCode,#settleManidNumber,#toPublicAccountName,#toPrivateSettleAccountNo,#toPublicSettleAccountNo').blur(function () {
            //判断重复次数校验的商户类型(0=[普通商户、1+N总店、1+N分店]  1=[连锁总店、连锁分店])
            var repeatType = '0';
            var v = $('#merchantType').val();
            if (v == '2' || v == '3') {
                //连锁总店/连锁分店
                repeatType = '1';
            }


            /**<注册登记号> blur 事件绑定*/

            if ("subjectionMerchantName" == $(this).attr("id")) {
                var findVal = $(this).val();
                if (findVal.length == 0) {
                    return false;
                }


                //发起服务器校验
                $.ajax({
                    url: '/merchantIncome/registNameRepeat',
                    data: {merchantType: repeatType, registName: findVal,mecNormalLevel:'30'},
                    type: "POST",
                    dataType: "json",
                    success: function (json) {
                        if (json.code == "1") {
                            console.log("商户名称Yes")
                        } else {
                            OKDialogCallBack("商户名称的重复次数超出系统限制，请联系相关人员！", 'registCode');
                        }
                    },
                    error: function (xhr, status) {
                        console.log("--------------商户名称重复次数校验,异常.--------------------")
                    }
                });
            }//end

            /**<结算人身份证号> blur 事件绑定*/
            if ("settleManidNumber" == $(this).attr("id")) {
                var findVal = $(this).val();
                if (findVal.length == 0) {
                    return false;
                }

                $.ajax({
                    url: '/merchantIncome/settleCardNoRepeat',
                    data: {merchantType: repeatType, cardNo: findVal,mecNormalLevel:'30'},
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

            /* /!**<对公结算账户名> blur 事件绑定*!/
             if ("toPublicAccountName" == $(this).attr("id")) {
             var findVal = $(this).val();
             if (findVal.length == 0) {
             // ****>显示隐藏'账户法人姓名'属性
             ctrlAccountLegalName();
             return false;
             }

             $.ajax({
             url: '/merchantIncome/settleAccountNameRepeat',
             data: {merchantType: repeatType, accoutName: findVal},
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
             }//end*/

            /**<结算账号(个体)> blur 事件绑定*/
            if ("toPrivateSettleAccountNo" == $(this).attr("id")) {
                var findVal = $("#toPrivateSettleAccountNo").val();
                if (findVal.length == 0) {
                    return false;
                }
                var showlbl = ("toPrivateSettleAccountNo" == $(this).attr("id")) ? "个体" : "对公";
                var showId = ("toPrivateSettleAccountNo" == $(this).attr("id")) ? "toPrivateSettleAccountNo" : "toPublicSettleAccountNo";
                $.ajax({
                    url: '/merchantIncome/settleAccountNoRepeat',
                    data: {merchantType: repeatType, accoutNo: findVal,mecNormalLevel:'30'},
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
        /* $('#legalPersonName').blur(function () {
         // ****>显示隐藏'账户法人姓名'属性
         var findVal = $("#legalPersonName").val();
         if (findVal.length == 0) {
         // ****>显示隐藏'账户法人姓名'属性
         ctrlAccountLegalName();
         return false;
         }

         $.ajax({
         url: '/merchantIncome/settleAccountNameRepeat',
         data: {merchantType: 0, accoutName: findVal},
         type: "POST",
         dataType: "json",
         success: function (json) {
         if (json.code == "1") {
         console.log("结算卡(对私)账户名Yes")

         // ****>显示隐藏'账户法人姓名'属性
         ctrlAccountLegalName();
         } else {
         OKDialogCallBack("个体结算账户名的重复次数超出系统限制，请联系相关人员！", 'legalPersonName');
         $("#toPrivateAccountName").val("")
         }
         },
         error: function (xhr, status) {
         console.log("--------------结算卡(对私)账户名-重复次数校验,异常.--------------------")
         }
         });
         ctrlAccountLegalName();
         });*/
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

        /**<商户名称>blur事件绑定*/
        /* $("#subjectionMerchantName").blur(function () {
         var findVal = $('#subjectionMerchantName').val();
         if (findVal.length == 0) {
         return false;
         }
         $.ajax({
         url: '/merchantIncome/registNameRepeat',
         data: {merchantType: 0, registName: findVal},
         type: "POST",
         dataType: "json",
         async: false,
         success: function (json) {
         console.log(json)
         if (json.code == "1") {
         console.log("注册名称Yes")
         } else {
         OKDialogCallBack("商户名称的重复次数超出系统限制，请联系相关人员！", 'subjectionMerchantName');
         flag = false;
         }
         },
         error: function (xhr, status) {
         console.log("--------------注册名称重复次数校验,异常.--------------------")
         flag = false;
         }
         });
         })
         */

        /** ----------解析费率Json信息----------------- */

        /** ----------解析费率End----------------- */


        /** ----------标签管理部分----------------- */

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
        //默认执行基本费率
        renderx();
        if($('#ifPosMd').val() == '00' || $('#ifPosMd').val() == 'on'){
            ifPosMdCheckBoxClick();
        }

        //pos秒到选择显示 借贷分离 或者秒到费率
        $('#ifPosMd').click(function(){
            var ifPosMd = $('#ifPosMd').is(':checked');
            if(ifPosMd){
                $('#ifPosMd').val("on");
            }else{
                $('#ifPosMd').val("01");
            }
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

        $('#commitBtn').on('click', function () {


            if ($("#cardEndTime").val() == null || $("#cardEndTime").val() == '') {
                bootbox.alert('结束时间不能为空')
            }
            if ($("#cardStartTime").val() == null || $("#cardStartTime").val() == '') {
                bootbox.alert('开始时间不能为空')
            }

            /*
             $("#commitBtn").prop("disabled",true);
             setTimeout(function () {
             $("#commitBtn").prop("disabled",false);
             },5000)*/

            // 拼接posMdStr字符串
            porcPosMdStr();

            var cls = $(this).children("i").attr("class");
            //验证必填图片
            var flag = false

            try {
                flag = checkForm();

            } catch (err) {
                console.error("保存失败:" + err);
                flag = false;
            }
            if (flag) {
                flag = checkImage();
                if (flag) {
                    //修改时先保存操作的图片历史记录
                    if (cls == "fa fa-update") {
                        try {
                            saveHistoryImg();
                        } catch (err) {
                            //flag=false;
                            console.error("上传图片失败");
                        }

                    }
                }

                return flag;

            } else {
                return false;
            }

        });

    })//end JQuery Function
    //计费接口调用
    function renderx() {

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
                            url: '/assets/merchant/ejs/goods.txt'
                        }).render(resultJson.data);
                        $('#goodsData').val(JSON.stringify(resultJson));
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
    //add by hss 秒到-计费接口调用  闪电 等级 打包
    function goodsCondition() {

        var rateInfo = $("#rateInfomationID").val();
        if (null == rateInfo || "" == rateInfo || rateInfo == undefined) {
            rateInfo = "";
        }
        var handle = $("#handle").val()
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
                        if (handle == 'show'){
                            resultJson.data.justView = true;
                        }else{
                            resultJson.data.justView = false;
                        }
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
        var handle = $("#handle").val()
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
                        if (handle == 'show'){
                            resultJson.data.justView = true;
                        }else{
                            resultJson.data.justView = false;
                        }
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

    var num = 1;
    var t = 1;
    //心跳函数
    function timerHeartFun() {
        $('body').everyTime('1s', 'showTime', function () {
            console.log("==计时开始：" + t);
            t++;
        }, 0, true);
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


    //[提交]form前的验证
    function checkForm() {

        var validateFileSize = uploadFileSize();
        if (validateFileSize == false) {
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
        } else {
            OKDialog("费率信息不可为空!");
            return false;
        }
        $('#newMccInfoDiv').hide();
        $('#newPosMdInfoDiv').hide();
        // console.info(!$('#scaffold-save-merchantIncome').valid())
        //JQueryValidation校验
        try {
            if (!$('#scaffold-save-merchantSmallAndMicro').valid()) {
                $('#newMccInfoDiv').show();
                $('#newPosMdInfoDiv').show();

                return false;
            }
        } catch (e) {
            if (!$('#scaffold-update-merchantSmallAndMicro').valid()) {
                $('#newMccInfoDiv').show();
                $('#newPosMdInfoDiv').show();
                return false;
            }
        }

        $('#newMccInfoDiv').show();
        $('#newPosMdInfoDiv').show();

        if ($("#toPrivateAccountName").val() == "" && $("#toPublicAccountName").val() != "" && $("#ifIntradaySettle").prop("checked")) {
            OKDialog("默认账户非对私类型不允许开通即日付!");
            return false;
        }
        //隶书商户编码、名称显示控件的验证
        var ifSubjection = $('#subjectionDiv').hasClass('hidden');
        if (ifSubjection) {//如果界面上显示控件
            //var scode = $('#subjectionMerchantCode').val();
            var sname = $('#subjectionMerchantName').val();
            // console.log(scode + "-" + sname);
            // if (scode.length == 0 || sname.length == 0) {
            if (sname.length == 0) {
                OKDialog("隶属商户名称不能为空！");
                return false;
            }
        } else {
            //do nothing
        }

        var repeatMsg = "";

        /**  重复次数校验2,提交的时候校验重复次数
         *
         * @type {string}
         */


            //判断重复次数校验的商户类型(0=[普通商户、1+N总店、1+N分店]  1=[连锁总店、连锁分店])
        var repeatType = '0';
        var v = $('#merchantType').val();
        if (v == '2' || v == '3') {
            //连锁总店/连锁分店
            repeatType = '1';
        }

        var flag = true;
        // var repeatType = '0';
        var findVal = $('#subjectionMerchantName').val();
        if (findVal.length > 0) {
            $.ajax({
                url: '/merchantIncome/registNameRepeat',
                data: {merchantType: repeatType, registName: findVal,mecNormalLevel:'30'},
                type: "POST",
                dataType: "json",
                async: false,
                success: function (json) {
                    console.log(json)
                    if (json.code == "1") {
                        console.log("商户名称Yes")
                    } else {
                        OKDialogCallBack("商户名称的重复次数超出系统限制，请联系相关人员！", 'registName');
                        flag = false;
                    }
                },
                error: function (xhr, status) {
                    console.log("--------------商户名称重复次数校验,异常.--------------------")
                    flag = false;
                }
            });
        }
        if (!flag) {
            return false;
        }
        var repeatMsg = "";
        /* //>1.注册名称重复次数校验
         var findVal = $('#registName').val();
         if (findVal.length > 0) {
         $.ajax({
         url: '/merchantIncome/registNameRepeat',
         data: {merchantType: repeatType, registName: findVal},
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
         if (findVal.length > 0) {
         $.ajax({
         url: '/merchantIncome/registCodeRepeat',
         data: {merchantType: repeatType, registCode: findVal},
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
         }*/
        //>>>3.结算人身份证号,重复次数校验
        var findVal = $('#settleManidNumber').val();
        if (findVal.length > 0) {
            $.ajax({
                url: '/merchantIncome/settleCardNoRepeat',
                data: {merchantType: repeatType, cardNo: findVal,mecNormalLevel:'30'},
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
        if (!flag) {
            return false;
        }

        //>>>>>6.个体结算账号重复次数校验
        findVal = $('#toPrivateSettleAccountNo').val();
        if (findVal.length > 0) {
            $.ajax({
                url: '/merchantIncome/settleAccountNoRepeat',
                data: {merchantType: repeatType, accoutNo: findVal,mecNormalLevel:'30'},
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
                    flag = false;
                }
            });
        }

        if (!flag) {
            return false;
        }
        //验证必填图片
        flag = checkImage();
        if (!flag) {
            return false;
        }
        //结算人年龄校验

        return true;
    }// end commit

    //验证必填图片
    function checkImage() {

        var handIdcardPic = $("#handIdcardPicBase64").children("img").attr("src");
        if (!handIdcardPic) {
            OKDialog("请上传手持身份证照片!");
            return false;
        }
        var settlePersonIdcardPositiveBase = $("#settlePersonIdcardPositiveBase64").children("img").attr("src");

        if (!settlePersonIdcardPositiveBase) {
            OKDialog("请上传结算人身份证正面!");
            return false;
        }
        var settlePersonIdcardPositiveBase = $("#settlePersonIdcardOppositeBase64").children("img").attr("src");

        if (!settlePersonIdcardPositiveBase) {
            OKDialog("请上传结算人身份证反面!");
            return false;
        }
        var merchantAgreementPicBase = $("#merchantAgreementPicBase64").children("img").attr("src");

        if (!merchantAgreementPicBase) {
            OKDialog("请上传商户协议照片!");
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
                    if (scVal == '') {
                        scVal = $('#hideCustomerManagerBank').val();
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
            if (!chkWHT) {
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
        if (!$('#ifOutBCMCard').prop("checked")) {
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
            try {
                $("#scaffold-save-merchantSmallAndMicro").validate().element("#" + name_province_val + "");

            } catch (e) {
                $("#scaffold-update-merchantSmallAndMicro").validate().element("#" + name_province_val + "");

            }
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
            try {
                $("#scaffold-save-merchantSmallAndMicro").validate().element("#" + name_city_val + "");

            } catch (e) {
                $("#scaffold-update-merchantSmallAndMicro").validate().element("#" + name_city_val + "");

            }
        });

        $("#" + areaspan + "").on('change', function () {
            var area = $("#" + name_area_val + "").val();
            $('#' + areaHidden + '').val(area);
            try {
                $("#scaffold-save-merchantSmallAndMicro").validate().element("#" + name_area_val + "");
            } catch (e) {
                $("#scaffold-update-merchantSmallAndMicro").validate().element("#" + name_area_val + "");
            }

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
     * 查询即日付默认费率
     */
    function queryDefaultRate() {
        var defaultRate = '';
        $.ajax({
            url: '/intradayPay/queryDefaultRate',
            async: false,
            success: function (data) {
                console.log("即日付默认费率：" + data);
                defaultRate = data;
            }
        });
        return defaultRate;
    }

    //*********End*********************************************************

    $("#toPrivateSettleAccountNo").on('blur', function () {
        regBankCardIsCorrect(this);
    });
    function regBankCardIsCorrect(bankCardField) {
        var bankno = $(bankCardField).val();
        var lastNum = bankno.substr(bankno.length - 1, 1);//取出最后一位（与luhm进行比较）

        var first15Num = bankno.substr(0, bankno.length - 1);//前15或18位
        var newArr = new Array();
        for (var i = first15Num.length - 1; i > -1; i--) {    //前15或18位倒序存进数组
            newArr.push(first15Num.substr(i, 1));
        }
        var arrJiShu = new Array();  //奇数位*2的积 <9
        var arrJiShu2 = new Array(); //奇数位*2的积 >9

        var arrOuShu = new Array();  //偶数位数组
        for (var j = 0; j < newArr.length; j++) {
            if ((j + 1) % 2 == 1) {//奇数位
                if (parseInt(newArr[j]) * 2 < 9)
                    arrJiShu.push(parseInt(newArr[j]) * 2);
                else
                    arrJiShu2.push(parseInt(newArr[j]) * 2);
            }
            else //偶数位
                arrOuShu.push(newArr[j]);
        }

        var jishu_child1 = new Array();//奇数位*2 >9 的分割之后的数组个位数
        var jishu_child2 = new Array();//奇数位*2 >9 的分割之后的数组十位数
        for (var h = 0; h < arrJiShu2.length; h++) {
            jishu_child1.push(parseInt(arrJiShu2[h]) % 10);
            jishu_child2.push(parseInt(arrJiShu2[h]) / 10);
        }

        var sumJiShu = 0; //奇数位*2 < 9 的数组之和
        var sumOuShu = 0; //偶数位数组之和
        var sumJiShuChild1 = 0; //奇数位*2 >9 的分割之后的数组个位数之和
        var sumJiShuChild2 = 0; //奇数位*2 >9 的分割之后的数组十位数之和
        var sumTotal = 0;
        for (var m = 0; m < arrJiShu.length; m++) {
            sumJiShu = sumJiShu + parseInt(arrJiShu[m]);
        }

        for (var n = 0; n < arrOuShu.length; n++) {
            sumOuShu = sumOuShu + parseInt(arrOuShu[n]);
        }

        for (var p = 0; p < jishu_child1.length; p++) {
            sumJiShuChild1 = sumJiShuChild1 + parseInt(jishu_child1[p]);
            sumJiShuChild2 = sumJiShuChild2 + parseInt(jishu_child2[p]);
        }
        //计算总和
        sumTotal = parseInt(sumJiShu) + parseInt(sumOuShu) + parseInt(sumJiShuChild1) + parseInt(sumJiShuChild2);

        //计算Luhm值
        var k = parseInt(sumTotal) % 10 == 0 ? 10 : parseInt(sumTotal) % 10;
        var luhm = 10 - k;
        if (lastNum != luhm) {
            OKDialog('您输入的卡号有误，请再次确认是否正确！');
        }
    }

} else {
    alert("新增商户页面错误：JQuery文件还没有被加载...");
}

/**
 * 保存图片操作的历史记录
 */
function saveHistoryImg() {
    //要保存记录
    saveImg("/MerchantIncome/savePictureHistoryImg");
    //判断是否要保存记录
    // if(MerchantIncomeUtils.isSavePictureHistory){
    //     saveImg("/MerchantIncome/savePictureHistoryImg");
    // }
}


function saveImg(url) {
    var dataInfo = "";  //传递的data数据
    var postfix = "Base64Img";
    if ($('.fileinput.fileinput-exists').length == 0) {
        return false;
    }
    var ids = new Array();
    $('.fileinput.fileinput-exists').each(function (i, n) {
        var fileObj = $(this).find(':file'); //file对象
        var file = fileObj.val(); //file的值
        var id = fileObj.attr('id');//file的id
        ids.push(id);
        // if(file != undefined && file.length!=0)//校验是否上传了文件。
        var base64Str = $(this).find('#' + id + "Base64Img").val();
        if (i == 0) {
            dataInfo += id + postfix + ":" + "\'" + base64Str + "\'";
        } else {
            dataInfo += "," + id + postfix + ":" + "\'" + base64Str + "\'";
        }
    })
    dataInfo += "," + "taskCode" + ":" + "\'" + $('#taskCode').val() + "\'"; //追加taskCode字段
    dataInfo = "{" + dataInfo + "}";
    $('#loadImgFlag').val(-1);
    $.ajaxFileUpload({
        type: 'POST',
        secureuri: false,
        fileElementId: ids,
        dataType: 'json',
        data: eval("(" + dataInfo + ")"),
        url: url,
        success: function (data) {
            // $('#imgload').stop(true).prop('class', 'bootbox.alert bootbox.alert-danger').text(data.message).css({
            //     'margin-left': -$tip.outerWidth() / 2,
            //     "margin-top": -$tip.outerHeight() / 2
            // }).fadeIn(500).delay(500).fadeOut(500);
            $('#loadImgFlag').val(0);

            console.log("图片上传成功!");
        },
        failure: function (data) {
            // $('#imgload').stop(true).prop('class', 'bootbox.alert bootbox.alert-danger').text('图片保存失败').css({
            //     'margin-left': -$tip.outerWidth() / 2,
            //     "margin-top": -$tip.outerHeight() / 2
            // }).fadeIn(500).delay(500).fadeOut(500);
            $('#loadImgFlag').val(0);
            console.log("图片上传失败!");
        },
        complete: function (XHR, TS) {
            XHR = null;
            $('#loadImgFlag').val(0);
        }
    });
}