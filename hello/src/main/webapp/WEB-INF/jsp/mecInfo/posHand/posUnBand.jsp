<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title>

    <%@include file="../../layout/common.jsp"%>
</head>

<body class="no-skin ">

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

                <div class="page-content ">

                    <div class="row" >

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        机具解绑 &nbsp;<font size="1">(点击对应终端后的解绑按钮即可)</font>
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="printUnbindInfo" class="form-inline form-horizontal" action="<%=request.getContextPath() %>/posPrint/getPdfReport.pdf" method="post" target="_blank">
                                                <div class="col-sm-12">
													<input type="hidden" id="ctxPath" name="ctxPath" value="${ctx }"/>
													<input type="hidden" id="mercOldSn" name="mercOldSn" value="${mercOldSn}"/>
													<input type="text" name="mercSn" value="${posPoForUnBind.mercSn }" style="display: none;"/>
													<input type="text" name="postyp" value="3" style="display: none;"/> 
													
													<input type="text" id="sign299" name="sign"  style="display: none;"/> 
													<input type="text" id="attSnSim299" name="attSnSim" style="display: none;"/> 
													<input type="text" id="attSnKey299" name="attSnKey" style="display: none;"/> 
													<input type="text" id="trmSn299" name="trmSn" style="display: none;"/> 
													<input type="text" id="trmNo299" name="trmNo" style="display: none;"/> 
													<input type="text" id="modNm299" name="modNm" style="display: none;"/>
													<input type="text" id="mercTyp" name="mercTyp" value="${mercTyp}" style="display: none;"/>
													
                                                    <h3 class="header smaller lighter green">商户信息</h3>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mercSn" id="mercSn" class="form-control input-small width-200px " disabled="disabled"    title=""  value="${posPoForUnBind.mercSn }" >
                                                        </div>
                                                    </div>
<%--                                                     <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >经营名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="mercAbbr" id="mercAbbr" class="form-control input-small width-200px  " disabled="disabled" title="" value="${posPoForUnBind.mercAbbr }"  >
                                                        </div>
                                                    </div> --%>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="mercCnm" id="mercCnm" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="${posPoForUnBind.mercCnm }"  >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >直属机构:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="orgNm" id="orgNm" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="${posPoForUnBind.orgNm }"  >
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >手机号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="mecAdminTel" id="mecAdminTel" class="form-control input-small width-200px  " disabled="disabled" title="" value="${posPoForUnBind.mecAdminTel}"  >
                                                        </div>
                                                    </div>
<%--                                                      <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >对公结算户名:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="mercActg" id="mercActg" class="form-control input-small width-200px  " disabled="disabled" title="" value="${cardtyp1}"  >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >对私结算户名:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="mercActs" id="mercActs" class="form-control input-small width-200px  " disabled="disabled" title="" value="${cardtyp2}"  >
                                                        </div>
                                                    </div> --%>
<%--                                                     <div class="form-group form-group-sm width-60">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >装机地址:</label>

                                                        <div class="col-sm-8  no-padding width-80"  >
                                                            <input type="text" name="busAddr" id="busAddr" class="form-control input-small width-100  " disabled="disabled" title="" value="${posPoForUnBind.busAddr }"  >
                                                        </div>
                                                    </div> --%>
                                                </div>
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">安装信息</h3>
                                                <div class="row"></div>
                                                <c:forEach items="${posListsBinded}" var="de"  varStatus="status">
                                                <div class="info">
                                                <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >所属一代:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="orgNm" id="orgNm" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="${de.topOrgName }"  >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >直属机构:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="orgNm" id="orgNm" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="${de.orgNm }"  >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >厂商:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="orgNm" id="orgNm" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="${de.factName }"  >
                                                        </div>
                                                    </div>
	                                                <div class="form-group form-group-sm width-300px">
	                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机具型号:</label>
	                                                    <div class="col-sm-8  no-padding"  >
	                                                        <input id="modNm2" name="modNm2" type="text" value="${de.modNm}" class="form-control input-small width-200px formElement modNm2" data-placement="bottom" readonly="readonly"/>
	                                                    	<input type="hidden" class="sign2" value="0" id="${de.trmNo}BBC" />
	                                                    </div>
	                                                </div>
	                                                <div class="form-group form-group-sm width-300px">
	                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >终端号:</label>
	                                                    <div class="col-sm-8  no-padding"  >
	                                                        <input id="trmNo2" name="trmNo2" type="text" value="${de.trmNo}" class="form-control input-small width-200px formElement trmNo2" data-placement="bottom" readonly="readonly"/>
	                                                    </div>
	                                                </div>
	                                                <div class="form-group form-group-sm width-300px">
	                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >序列号:</label>
	                                                    <div class="col-sm-8  no-padding"  >
	                                                        <input id="trmSn2" name="trmSn2" type="text" value="${de.trmSn}" class="form-control input-small width-70 formElement attSnSim2" data-placement="bottom" readonly="readonly"/>
	                                                        <button id="${de.trmNo}" class="btn btn-minier btn-purple btn-xs unband formElement" type="button"  onclick="unBingPos(this)" value="解绑" 
                                                                >解绑
                                                            </button>
	                                                    </div>
	                                                </div>
	                                                <%-- <div class="form-group form-group-sm width-300px">
	                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >密码键盘型号:</label>
	                                                    <div class="col-sm-8  no-padding"  >
	                                                        <input id="modKeyNm" name="modKeyNm" type="text" value="${de.modKeyNm}" class="form-control input-small width-200px formElement" data-placement="bottom" readonly="readonly"/>
	                                                    </div>
	                                                </div>
	                                                <div class="form-group form-group-sm width-300px">
	                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >键盘序列号:</label>
	                                                    <div class="col-sm-8  no-padding"  >
	                                                        <input id="attSnKey2" name="attSnKey2" type="text" value="${de.modKeySeriNo}" class="form-control input-small width-200px formElement attSnKey2" data-placement="bottom" readonly="readonly"/>
	                                                    </div>
	                                                </div> --%>
	                                                
	                                                <%-- <div class="form-group form-group-sm width-300px">
	                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >SIM卡号:</label>
	                                                    <div class="col-sm-8  no-padding"  >
	                                                        <input id="attSnSim2" name="attSnSim2" type="text" value="${de.simNo}" class="form-control input-small width-70 formElement attSnSim2" data-placement="bottom" readonly="readonly"/>
                                                           <button id="${de.trmNo}" class="btn btn-minier btn-purple btn-xs unband formElement" type="button" <c:if test="${ mercTyp =='02' and loginUserPermission.SMSA_MOB_001==null }">disabled="disabled"</c:if> onclick="unBingPos(this)" value="解绑" 
                                                        	    >解绑
                                                            </button>
                                                            
	                                                    </div>
	                                                </div> --%>
	                                                
                                                    <div class="btn-group no-padding">
                                                     </div>
                                                </div>
                                                </c:forEach>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <!-- <button class="btn btn-success btn-sm" type="button" onclick = "unBindPrint()" >
                                                        <span class="ace-icon fa fa-print icon-on-right bigger-110"></span>
                                                        打印工单
                                                    </button> -->
                                                    <button class="btn  btn-sm" type="button"  onclick="closeWin()">
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                        关闭
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->
	</div>
<!-- basic scripts -->

    <%@include file="../../layout/common.js.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    function closeWin(){
    	parent.$.fancybox.close();
    }
    
    $('.chosen-select').chosen({});
    jQuery(function($) {

        $('.easy-pie-chart.percentage').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size/10),
                animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
                size: size
            });
        })

        $('.sparkline').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
            $(this).sparkline('html',
                {
                    tagValuesAttribute:'data-values',
                    type: 'bar',
                    barColor: barColor ,
                    chartRangeMin:$(this).data('min') || 0
                });
        });
        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });

        $(".fancybox-manual-b").click(function() {
            $.fancybox.open({
                href : 'detail.html',
                type : 'iframe',
                scrolling:'no',
                scrollOutside:false,
                model :true,
                minWidth:400,
                width:900,
                height:400,
                autoHeight:true,
                autoWidth:true,
                closeBtn:true,
                padding : 5
            });
        });
        //$('#sidebar').addClass('compact');
    })
    
    //解绑调用此函数
    function unBingPos(node) {
        var parent = $(node).parents(".info");
        var mercOldSn = $('#mercOldSn').val();
        var trmNo = parent.find("#trmNo2").val();
        var trmSn = parent.find("#trmSn2").val();
        var mercTyp = $('#mercTyp').val();
        var url = "";
        var ifBalanceSet = "00"; //是否进行余额结算默认不结算
        if (mercTyp == '02') {
            url = "/mecIfHandPos/unBindMoDevice?randomNum=" + new Date().getTime()
        } else {
            url = "/mecIfHandPos/setDivideNew?randomNum=" + new Date().getTime()
        }
        console.info(trmNo);
        /*var result = balancePay(node);
        if (result) {
            if (confirm("是否进行撤机余额结算？")) {
                //确认余额结算
                ifBalanceSet = "01";
            }
        }*/
        $.ajax({
            url: url,
            data: {
                trmNo: trmNo,
                trmSn: trmSn,
                mercSn: mercOldSn,
                mercTyp: mercTyp,
                ifBalanceSet: ifBalanceSet
            },
            async: false,
            error: function(e) {
                    alert(e);
                    },
            success: function(data) {
                var result = data;
                if (result.resCode == '-1') {
                    if (result.ifBalanceSet == '01' || result.ifBalanceSet == '00') {
                        alert(result.resMsg + result.balanceMassage);
                    } else {
                        alert(result.resMsg);
                    }
                } else {
                    //绑定成功的操作
                    if (result.ifBalanceSet == '01' || result.ifBalanceSet == '00') {
                        alert(result.resMsg + result.balanceMassage);
                    } else {
                    	alert("操作成功");
                        //alert(result.resMsg);
                    }
                    parent.find(".formElement").attr({
                        "disabled": "disabled"
                    });
                    parent.find(".unband").attr({
                        "value": "解绑成功"
                    }).text("解绑成功");
                    //将对应机具的falg置为非0 为打印工单使用
                    parent.find(".sign2").val("1");
                    $(node).attr('disabled', true);
                    flagPrint = true;
                }
            }
        });
    }
	
	//是否进行余额结算
	function balancePay(node){
	   	var parent = $(node).parents(".info");
		var mercOldSn=$('#mercOldSn').val();
		var trmNo = parent.find("#trmNo2").val();
		var trmSn = parent.find("#trmSn2").val();
		var mercTyp = $('#mercTyp').val();
		var url  = "/mecIfHandPos/balancePay?randomNum="+new Date().getTime()
		console.info(trmNo);
		var rs = false;
		$.ajax({ url: url , 
				data:{trmNo:trmNo,trmSn:trmSn,mercSn:mercOldSn,mercTyp:mercTyp},
				async:false,
				success: function(data){
                    console.log(data);
					/*var result = eval("("+data+")");
			    	     if(result.resCode=='1'){
			    	    	rs =  true;
			    	    }*/
                    if(data.resCode == '-1'){
                        rs = true;
                    }    
				}});
		return rs;
	}
	function unBindPrint(){
		var suchFlag = false;
		var sign="";
		var attSnSim="";
		var attSnKey="";
		var trmSn="";
		var trmNo="";
		var modNm="";
		$(".sign2").each(function(index,item) {
			if($(this).val()==1){
				suchFlag = true;
			}
		    sign+=(","+($(this).val()==""?" ":$(this).val()));
		});
		if(!suchFlag){
			alert("请先至少解绑一台pos");
			return ;
		}
		$(".attSnSim2").each(function(index,item) {
			attSnSim+=(","+($(this).val()==""?" ":$(this).val()));
		});
		$(".attSnKey2").each(function(index,item) {
			attSnKey+=(","+($(this).val()==""?" ":$(this).val()));
		});
		$(".trmSn2").each(function(index,item) {
			trmSn+=(","+($(this).val()==""?" ":$(this).val()));
		});
		$(".trmNo2").each(function(index,item) {
			trmNo+=(","+($(this).val()==""?" ":$(this).val()));
		});
		$(".modNm2").each(function(index,item) {
			modNm+=(","+($(this).val()==""?" ":$(this).val()));
		});
		$("#sign299").val(sign.substring(1));
		$("#attSnSim299").val(attSnSim.substring(1));
		$("#attSnKey299").val(attSnKey.substring(1));
		$("#trmSn299").val(trmSn.substring(1));
		$("#trmNo299").val(trmNo.substring(1));
		$("#modNm299").val(modNm.substring(1));
		$("#printUnbindInfo").submit();
	}
	
</script>
</body>
</html>











