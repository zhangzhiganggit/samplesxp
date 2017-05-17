<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.css.jsp"%>


</head>

<body class="no-skin " onload="load()">
<input type="hidden" id="orderNo" value="${orderNo}"/>
<input type="hidden" id="mecAdminTel" value="${mstl.mecAdminTel}"/>
<input type="hidden" id="isHave2ndAct" value="${mstl.isHave2ndAct}"/>
    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

                <div class="page-content ">

                    <div class="row" >

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       POS秒到商户费率详情
                                    </h5>

                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="">
                                                <div class=" col-xs-12 no-padding">
													<div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mecNo" id="mecNo" value="${mecMDinfo.mecNo }" class="form-control input-small width-200px"  disabled="disabled" >
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mecNm" id="mecNm" value="${mecMDinfo.mecNm }" class="form-control input-small width-200px" disabled="disabled" >
                                                        </div>
                                                    </div>  
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >计费产品:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="rateType" id="rateType" disabled="disabled"  value="${mecMDinfo.rateType }" class="form-control input-small width-200px"  >
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >内部商编	:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mecInNo" id="mecInNo" value="${mecMDinfo.mecInNo }" class="form-control input-small width-200px" disabled="disabled" >
                                                        </div>
                                                    </div>  
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >生效时间:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="effectiveDate" id="effectiveDate" value="${mecMDinfo.effectiveDate }" class="form-control input-small width-200px" disabled="disabled"  >
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >失效时间:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="invalidDate" id="invalidDate" value="${mecMDinfo.invalidDate }" class="form-control input-small width-200px" disabled="disabled" >
                                                        </div>
                                                    </div>                                                       
                                                </div>
												 <div class="table-scrollable">
							                    <table class="table table-striped table-bordered table-hover dataTable no-footer">
							                        <thead>
							                        <tr>
							                        	 <th style="text-align:center;width: 8%">规则</th>
		                                                <th style="text-align:center;width: 6%"  >费率</th>
		                                                <th style="text-align:center;width: 6%"  >固定费用</th>
		                                                <th style="text-align:center;width: 6%"  >封顶金额</th>
		                                                <th style="text-align:center;width: 6%"  >最低收费</th>
							                        </tr>
							                        </thead>
							                        <tbody>
                                            		<c:forEach items="${rateList}" var="rate">
                                            		<tr>
                                            			<td style="text-align:center">${rate.rules}</td>
														<td style="text-align:center">${rate.rateDetail}</td>
														<td style="text-align:center">${rate.fixedFee}</td>
														<td style="text-align:center">${rate.topAmount}</td>
														<td style="text-align:center">${rate.lowCharge}</td>
                                            		</tr>
                                            		</c:forEach>
                                            		</tbody>
							                        </table>
							                        </div>
                                               <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">

                                                    <button class="btn btn-default btn-sm"  type="button" onclick="closeWin()">
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
</div></div></div></div></div>


        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>

<!-- basic scripts -->

    <%@include file="../layout/common.alljs.jsp"%>
       <script type="text/javascript" src="<%=request.getContextPath() %>/js/ejs/ejs_production.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/ejs/ejs_fulljslint.js"></script>
<!-- inline scripts related to this page -->
	<script type="text/javascript">
	<%-- /* 回显费率信息 */
	 function getCurrentRateAgreement(inMno,agreementNo,mecBusiType) {
    		$.ajax({
            url: '/mercInfoUpdate/getMecAgreementByMerc',
            data:{
            	inMno:inMno,
            	agreementNo:agreementNo,
            	mecBusiType:mecBusiType
            },
            async : true,
            cache: true,
            success : function(resultJson) {
            	 $('#newMccInfo').val(resultJson);
            	resultJson = eval('('+resultJson+')');
            	resultJson.data.justView = true;
               	resultJson.data.preset = false;
            	resultJson.data.effDt = '';
        		var template = $('#template').val();
        		// {url : '/js/ejs/goods.ejs'}
        		var innerHtml = new EJS({
        			// text : template,
        			url : '<%= request.getContextPath()%>/js/ejs/goods.txt'
        		}).render(resultJson.data);
    		    $('#goodsData').val(JSON.stringify(resultJson));
    		 	$('#newMccInfoDiv').html(innerHtml);
            }
    	});
    } --%>
    function getCurrentRateAgreement(inMno,agreementNo,mecBusiType) {
		$.ajax({
        url: '<%=request.getContextPath() %>/mecMDinfo/getMecAgreementByMerc',
        data:{
        	inMno:inMno,
        	agreementNo:agreementNo,
        	mecBusiType:mecBusiType
        },
        async : true,
        cache: true,
        success : function(resultJson) {
        	if( resultJson =='费率信息获取失败'){
        		alert(resultJson)
        	}
        
        	 $('#newMccInfo').val(resultJson);
        	resultJson = eval('('+resultJson+')');
        	resultJson.data.justView = true;
           	resultJson.data.preset = false;
    		var template = $('#template').val();
    		// {url : '/js/ejs/goods.ejs'}
    		var innerHtml = new EJS({
    			// text : template,
    			url : '<%= request.getContextPath()%>/js/ejs/goods.txt'
    		}).render(resultJson.data);
		    $('#goodsData').val(JSON.stringify(resultJson));
		    $('#newMccInfoText').val(JSON.stringify(resultJson));
		 	$('#newMccInfoDiv').html(innerHtml);
		 	if(resultJson.forbidPreset == 1){
		 		alert(resultJson.data.viewMsg);
		 	}
        }
	});
}
	function closeWin(){
    	parent.$.fancybox.close();
    }
	</script>
	
</body>
</html>

