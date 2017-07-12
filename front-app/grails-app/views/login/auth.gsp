<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>随行付销售管理系统</title>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <asset:stylesheet src="google-fonts/google-fonts.css"/>
    <asset:stylesheet src="global/plugins/font-awesome/css/font-awesome.min.css"/>
    <asset:stylesheet src="global/plugins/simple-line-icons/simple-line-icons.min.css"/>
    <asset:stylesheet src="pages/css/loginBootBox.css"/>
    %{--<asset:stylesheet src="global/plugins/bootstrap/css/bootstrap.min.css"/>--}%
    <asset:stylesheet src="global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <asset:stylesheet src="global/plugins/select2/css/select2.min.css"/>
    <asset:stylesheet src="global/plugins/select2/css/select2-bootstrap.min.css"/>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <asset:stylesheet src="global/css/components-md.min.css" id="style_components"/>
    <asset:stylesheet src="global/css/plugins-md.min.css"/>
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    %{--<asset:stylesheet src="../assets/pages/css/Login1.css"/>--}%
    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
    <link href="../assets/pages/css/Login1.css" rel="stylesheet" type="text/css">
    %{--<asset:stylesheet src="pages/css/login-new.css"/>--}%
    <asset:javascript src="pages/scripts/auth/jquery1.42.min.js"/>
    <asset:javascript src="pages/scripts/auth/jquery.SuperSlide.2.1.1.js"/>
    <asset:javascript src="pages/scripts/auth/login-phone.js"/>
    <asset:javascript src="global/plugins/jquery.min.js"/>
    <asset:javascript src="global/plugins/bootstrap/js/bootstrap.min.js"/>
    <asset:javascript src="global/plugins/bootbox/bootbox.min.js"/>
    <asset:javascript src="pages/scripts/ui-bootbox.min.js"/>











    <script type="text/javascript" language="javascript">
        function pupopen() {
            document.getElementById("bg_pop").style.display = "block";
            document.getElementById("popbox_xieyi").style.display = "block";
        }
        function pupclose() {
            document.getElementById("bg_pop").style.display = "none";
            document.getElementById("popbox_xieyi").style.display = "none";
        }

        function xian() {
            var pt = document.getElementById("f")
            pt.style.display = "block";
        }
        function mei() {
            var pt = document.getElementById("f")
            pt.style.display = "none"
        }
    </script>

</head>

<body onLoad="loadJs();">
<input type="hidden" id="checkOverdue" value="false"/>
%{--<div class="logo"><img src="../assets/pages/img/auth/logo_vb.png"></div>--}%
<div id="body-bg"><img src="../assets/pages/img/auth/lg_bg2.jpg" width="100%" height="100%"/></div>

<!-- 本例主要代码 Start ================================ -->
<div class="login">
    <!--logo start-->
    <div class="lg-logo"><img src="../assets/pages/img/auth/lg_logo.png"></div>

    <!-- login main start -->
    <div class="lg-outside">

        <div class="lg-text"><img src="../assets/pages/img/auth/lg_text.png"></div>

        <form name="formOne" id="formOne" class="login-form" action="/login/authenticate" method="post">
            <div class="login-model" id="login1">
                <h1>账密登录</h1>


                <div class="form-tip1">手机号码验证通过可作为用户名使用，原用户名失效</div>
                <div class="lg-form-item">
                    <div class="form-info">
                        <label><img src="../assets/pages/img/auth/lg_user.png"></label>
                        <input type="text" class="form-input" placeholder="请输入用户名" type="text" autocomplete="off"
                               name="username">
                    </div>

                    <div class="form-info">
                        <label><img src="../assets/pages/img/auth/lg_passward.png"></label>
                        <input type="password" class="form-input" autocomplete="off" name="password" placeholder="请输入密码">
                    </div>

                    <div class="form-info">
                        <label><img src="../assets/pages/img/auth/lg_weima.png"></label>
                        %{--      <input name="" inpt class="form-input"  placeholder="请输入验证码">
                              <div class="foorm-check"><img src="../assets/pages/img/auth/yan.png"></div>--}%

                        <input type="text" autocomplete="off" inpt class="form-input" placeholder="请输入验证码"
                               name="captcha" id="captcha"/>

                        <div class="foorm-check"><img id="imgObj" title="点击更换" onclick="changeImg()"
                                                      src="../assets/pages/img/auth/yan.png"></div>
                    </div>

                    <div class="login-xieyi"><input type="checkbox" name="suixingpayRule" checked="checked"
                                                    id="suixingpayRule">
                        <a href="#" onClick="pupopen()" id="agreeButton">同意《代理商销售系统使用协议》</a></div>

                    <div class="form-actions">
                        <div class="submit-box"><button id="loginSubmit" class="button-ok" type="submit">登录</button>
                            %{--<button type="submit" id="loginSubmit" class="btn green uppercase">登录</button>--}%
                        </div>

                    </div>
                    <div class="login-pub align-right"><a href="#" onClick="change(1)" id="forget-password"
                                                          class="forget-password a_1">忘记登录密码？</a></div>
                </div>


                %{--<div class="alert-dange display-hide info_note">--}%
                %{--<span ><g:message code="springSecurity.login.blank"/></span>--}%
                %{--</div>--}%
                %{--<g:if test="${flash.message}">--}%
                %{--<g:set var="flashType"--}%
                %{--value="${flash.type ? (flash.type in ['success', 'info', 'warning', 'danger'] ? flash.type : 'info') : (defaultType != null ? defaultType : 'info')}"/>--}%
                %{--<div class=" alert-${flashType} alert-dismissable info_note">--}%
                %{--<strong><g:message code="default.flash.type.${flashType}"/></strong>--}%
                %{--${flash.message}--}%
                %{--</div>--}%
                %{--</g:if>--}%

                <div class="alert-danger display-hide info_note">

                    %{--<button class="close" data-close="alert"></button>--}%
                    <div style="color: red;text-align:center"><span><g:message code="springSecurity.login.blank"/></span></div>
                </div>
            %{--<layout:flashMessage/>--}%
                <g:if test="${flash.message}">
                    <g:set var="flashType"
                           value="${flash.type ? (flash.type in ['success', 'info', 'warning', 'danger'] ? flash.type : 'info') : (defaultType != null ? defaultType : 'info')}"/>
                    <div class="alert-${flashType} alert-dismissable info_note">
                        %{--<button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>--}%
                        <div style="color: red;text-align:center"><strong ><g:message code="default.flash.type.${flashType}"/></strong>
                            <span>${flash.message}</span></div>
                    </div>
                </g:if>

            %{--提示出错信息结束--}%
            </div>
        </form>
        %{--</div>--}%
        %{--</div><!-- login main over -->--}%

        <!-- passward main start -->





        <!--login2 start-->

        <!--login2 over-->

        %{--</div>--}%


        <div class="login-model" id="login2" style="display: none">
            <h1>重置密码</h1>
            <div class="form-tip">
                仅支持验证手机号为登录名的用户找回密码。
                <br>
                &nbsp;如未验证的用户找回密码请联系管理员。
            </div>

            <div class="lg-form-item">

                <div class="form-info-passward">
                    <input name="" type="text" id="phone" class="form-input" placeholder="登录手机号">
                </div>


                <div class="form-info-passward">
                    <input name="" type="passward" id="smsCode" class="form-input" placeholder="手机验证码" style="width:130px;">
                    <button class="send-passward" id="userPhoneButton"><a style="color:#fff">发送验证码</a></button>
                </div>


                <div class="form-info-passward">
                    <input name="" id="newPassword" type="password" class="form-input " placeholder="新密码">
                </div>

                <div class="form-info-passward">
                    <input name="" id="confirmPassword" type="password" class="form-input " placeholder="确认新密码">
                </div>


                <div class="passward-btn">
                    <button type="submit" class="btn-ok" value="返回登录" id="back-btn" style="width:118px;"
                            onClick="change(2)">去登录</button>
                    <button type="reset" class="btn-reset" style="width:118px;" id="passwordSubmit">提交</button>
                </div>

            </div>

        </div>
        <!-- passward main over -->
    </div>
</div>
</div>

<!-- 本例主要代码 End ================================ -->



<!-- BEGIN CORE PLUGINS -->
<asset:javascript src="global/plugins/jquery.min.js"/>
<asset:javascript src="global/plugins/bootstrap/js/bootstrap.min.js"/>
<asset:javascript src="global/plugins/js.cookie.min.js"/>
<asset:javascript src="global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"/>
<asset:javascript src="global/plugins/jquery.blockui.min.js" type="text/javascript"/>
<asset:javascript src="global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"/>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<asset:javascript src="global/plugins/jquery-validation/js/jquery.validate.min.js"/>
<asset:javascript src="global/plugins/jquery-validation/js/additional-methods.min.js"/>
<asset:javascript src="global/plugins/select2/js/select2.full.min.js"/>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<asset:javascript src="global/scripts/app.min.js"/>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<asset:javascript src="pages/scripts/login.js"/>


%{--<script type="text/javascript">--}%
%{--//if (top.location !== self.location) {--}%
%{--//top.location = self.location;--}%
%{--//}--}%
%{--//--}%
%{--//$(function(){--}%
%{--//$("#agreeButton").on("click",function(e){--}%
%{--//e.preventDefault();--}%
%{--//$("#showRule").modal().show();--}%
%{--//})--}%
%{--//})--}%

%{--</script>--}%
<div id="bg_pop"></div>

<div id="popbox_xieyi"><h1><strong>随行付销售系统使用协议</strong></h1>
    　　随行付销售系统使用协议（下称“本协议”）是由随行付外包服务商（下称“用户”或“您”）与随行付公司就随行付销售系统使用的相关权利义务的规范文件。
    　　随行付公司在此特别提醒用户：在用户使用随行付销售系统前请确实仔细阅读本协议，当用户点选同意键或定制、使用、接受销售系统时即视为您已仔细阅读本条款，同意接受本服务条款的所有规范包括接受随行付对服务条款随时所做的任何修改，并愿受其拘束。
    <P>一、用户保证自己在使用本系统时您的身份真实和正确及完整，如果资料发生变化，用户应及时更改。因您丢失了账户信息和密码而引起的任何损失或损害承担责任。</P>

    <P>二、在用户收到一个密码及帐号后，用户应维持密码及帐号的机密安全。您应对任何人利用您的密码及帐号所进行的活动负完全的责任，随行付无法对非法或未经您授权使用您帐号及密码的行为作出甄别，因此随行付不承担任何责任。</P>

    <P>三、用户充分了解并同意，您必须为自己帐号下的一切行为负责，包括用户通过该系统所进行的一切操作以及由此产生的任何后果。您应对本系统中的内容自行加以判断，并承担因操作内容而引起的所有风险，包括因对操作内容的正确性、完整性或实用性而产生的风险。随行付无法且不会对因前述风险而导致的任何损失或损害承担责任。由于您的操作给随行付造成的任何损失，您均应当予以赔偿。</P>

    <P>四、用户必须保证，您拥有您上传之照片、文字等内容已获得合法授权，您在本系统之上传行为未侵犯任何第三方之合法权益。否则，将由您承担由此带来的一切法律责任。</P>

    <P>五、违约处理： 您理解并同意，随行付有权依合理判断对违反有关法律法规或本协议规定的行为进行处罚，对违法违规的任何用户采取适当的法律行动，并依据法律法规保存有关信息向有关部门报告等，用户应独自承担由此而产生的一切法律责任。因您违反本协议或相关服务条款的规定，导致或产生第三方主张的任何索赔、要求或损失，您应当独立承担责任；随行付因此遭受损失的，您也应当一并赔偿。</P>

    <P>六、您使用本系统功能即视为您已阅读并同意受本协议的约束。随行付有权在必要时修改本协议条款。您可以在本软件的最新版本中查阅相关协议条款。本协议条款变更后，如果您继续使用本系统，即视为您已接受修改后的协议。如果您不接受修改后的协议，应当停止使用本软件。</P>

    <P>七、本协议签订地为中华人民共和国北京市石景山区。</P>

    <P>八、本协议的成立、生效、履行、解释及纠纷解决，适用中华人民共和国大陆地区法律（不包括冲突法）。</P>

    <P>九、若您和随行付之间发生任何纠纷或争议，首先应友好协商解决；协商不成的，您同意将纠纷或争议提交本协议签订地有管辖权的人民法院管辖。</P>

    <P>十、本协议所有条款的标题仅为阅读方便，本身并无实际涵义，不能作为本协议涵义解释的依据。</P>

    <P>十一、 本协议条款无论因何种原因部分无效或不可执行，其余条款仍有效，对双方具有约束力。（正文完）

    <P style="text-align:right;">随行付</P>

    <P style="text-align:center;"><button onClick="pupclose()" class="btn btn-cancle">关闭</button></P>
</div>
<asset:javascript src="global/plugins/jquery.min.js"/>
<asset:javascript src="global/plugins/bootstrap/js/bootstrap.min.js"/>
<asset:javascript src="global/plugins/js.cookie.min.js"/>
<asset:javascript src="global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"/>
<asset:javascript src="global/plugins/jquery.blockui.min.js" type="text/javascript"/>
<asset:javascript src="global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"/>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<asset:javascript src="global/plugins/jquery-validation/js/jquery.validate.min.js"/>
<asset:javascript src="global/plugins/jquery-validation/js/additional-methods.min.js"/>
<asset:javascript src="global/plugins/select2/js/select2.full.min.js"/>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<asset:javascript src="global/scripts/app.min.js"/>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<asset:javascript src="pages/scripts/login.js"/>
<asset:javascript src="login.js"/>
<script type="text/javascript">

    if (top.location !== self.location) {
        top.location = self.location;
    }

    $(function(){
        $("#agreeButton").on("click",function(e){
            e.preventDefault();
            $("#showRule").modal().show();
        })
    })

</script>
<script>

    function loadJs() {
        document.getElementById('login2').style.display = "none"
    }

    function change(flag) {
        if (flag == 1) {
            document.getElementById('login1').style.display = "none"
            document.getElementById('login2').style.display = "block"
        }
        else {
            document.getElementById('login1').style.display = "block"
            document.getElementById('login2').style.display = "none"
        }
    }
</script>

<!--select-openwindow over-->
</body>
</html>

