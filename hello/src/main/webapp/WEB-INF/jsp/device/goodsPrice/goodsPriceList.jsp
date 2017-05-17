<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

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
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        物品价格管理
                                    </h5>
                                    
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/goodsPriceManage/goodsPriceList.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" id="subModelId" value="${searchModel.subModelId}"/>
                                            	<input type="hidden" id="goodsId" value="${searchModel.goodsId}">
                                            	<input type="hidden" id="factId" value="${searchModel.factId}"/>
                                            	<input type="hidden" id="goodsType" value="${searchModel.goodsType}"/>
                                            	<input type="hidden" id="commType1" value="${searchModel.commType}"/>
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">物品类型:</label>
														<div class="col-sm-8  no-padding">
															 <select data-placeholder="--请选择--"  id="searchGoodsType" name="goodsType"  class="chosen-select form-control width-200px" data-placement="bottom" title=""  
                                                            data-rel="tooltip" data-original-title="Hello Tooltip!"  
                                                            onchange="fillGoodsNameSelect('searchGoodsType','','searchGoodsName','--请选择--','searchFactoryName','searchModName')">
                                                                  <option value="" >--请选择--</option>
                                                                	<c:forEach items="${goodsTypeList}" var="item">
																		<option value="${item.goodsType }"
                                                                		<c:if test="${item.goodsType == searchModel.goodsType }"> selected </c:if>
                                                                	>${item.goodsTypeName }</option>
								                                    </c:forEach>
                                                            </select>
														</div>
													
													</div>
                                                    <div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">物品名称:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="--请选择--"  id="searchGoodsName" name="goodsId"  class="chosen-select form-control width-200px" data-placement="bottom" title="" 
                                                               data-rel="tooltip" data-original-title="Hello Tooltip!" 
                                                               onchange="fillFactoryNameSelect('searchGoodsName','','searchFactoryName','--请选择--','searchModName')">
                                                            </select>
														</div>
													</div>
                                                     <div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商简称:</label>
															<div class="col-sm-8  no-padding">
															<select data-placeholder="--请选择--"  id="searchFactoryName" name="factId" class="chosen-select form-control width-200px" data-placement="bottom" title=""
                                                                data-rel="tooltip" data-original-title="Hello Tooltip!" 
                                                                onchange="fillModelSelect('searchGoodsName','searchFactoryName','','searchModName','--请选择--')" >
                                                            </select>
														</div>
													</div>
                                                 
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                             <select data-placeholder="--请选择--" id="searchModName" name="subModelId" style="width: 90px;" class="chosen-select form-control width-200px" data-placement="bottom" title=""   
                                                             data-rel="tooltip" data-original-title="Hello Tooltip!" 
                                                             onchange="fillCommTypeSelect('searchModName','','commType','--请选择--')">
                                                            </select>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >电签:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="--请选择--" name="ifElectronicSignIn" id="ifElectronicSignIn" class="chosen-select form-control width-200px">
                                                                <option value="">--请选择--</option>
											    				<option value="1" <c:if test="${searchModel.ifElectronicSignIn=='1'}">selected</c:if>>支持</option>
											    				<option value="0" <c:if test="${searchModel.ifElectronicSignIn=='0'}">selected</c:if>>不支持</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >通讯方式:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                             <select data-placeholder="--请选择--" id="commType" name="commType" style="width: 90px;" class="chosen-select form-control width-200px" data-placement="bottom" title=""   
                                                             data-rel="tooltip" data-original-title="Hello Tooltip!" >
                                                            </select>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select data-placeholder="--请选择--" name="sellStatus" id="sellStatus" class="chosen-select form-control width-200px">
                                                                <option value="">--请选择--</option>
											    				<option value="01" <c:if test="${searchModel.sellStatus=='01'}">selected="selected"</c:if>>销售</option>
											    				<option value="02" <c:if test="${searchModel.sellStatus == '02'}">selected="selected"</c:if>>停售</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" id="pattern" name="pattern" value="${searchModel.pattern }"/>

                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="resetSearchForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        任务查询结果
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="8%">物品类型</th>
                                                <th width="10%">物品名称</th>
                                                <th width="13%">厂商简称</th>
                                                <th width="8%">通讯方式</th>
                                                <th width="6%">型号</th>
                                                <th width="5%">电签</th>
                                                <!--  <th width="5%">非接</th>-->
                                                <th width="5%">状态</th>
                                                <th width="6%">价格类型</th>
                                                <th width="10%">价格</th>
                                                <th width="5%">起定量</th>
                                                 <th width="5%">单位数量</th>
                                                  <th width="10%">操作</th>
                                                
                                            </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach var="model" items="${modelList}">
                                            		<tr>
		                                                <td>
		                                                	<c:if test="${model.goodsType==0}">终端设备</c:if>
															<c:if test="${model.goodsType==1}">附件设备</c:if>
															<c:if test="${model.goodsType==2}">配件设备</c:if>
															<c:if test="${model.goodsType==3}">耗材</c:if>
		                                                </td>
		                                                <td >${model.goodsName}</td>
		                                                <td >${model.factoryName}</td>
		                                                <!-- 通讯方式 0拨号 1GPRS 2TCP 3TD-LTE 4CDMA 5CDMA2000 6WCDMA 7TD_CDMA 8WIFI 9FDD-LTE -->
		                                                <td align="center">
			                                                <c:if test="${model.commType==0}">拨号</c:if>
			                                                <c:if test="${model.commType==1}">GPRS</c:if>
			                                                <c:if test="${model.commType==2}">TCP</c:if>
			                                                <c:if test="${model.commType==3}">TD-LTE</c:if>
			                                                <c:if test="${model.commType==4}">CDMA</c:if>
			                                                <c:if test="${model.commType==5}">CDMA2000</c:if>
			                                                <c:if test="${model.commType==6}">WCDMA</c:if>
			                                                <c:if test="${model.commType==7}">TD_CDMA</c:if>
			                                                <c:if test="${model.commType==8}">WIFI</c:if>
			                                                <c:if test="${model.commType==9}">FDD-LTE</c:if>
		                                                </td>
		                                                <td>${model.subModelName}</td>
		                                                <td align="center">
			                                                <c:if test="${model.ifElectronicSignIn=='1'}">支持</c:if>
			                                                <c:if test="${model.ifElectronicSignIn=='0'}">不支持</c:if>
		                                                </td>
		                                                <!-- <td>
		                                                	<c:if test="${model.ifNonContact=='1'}">支持</c:if>
			                                                <c:if test="${model.ifNonContact ne'1'}">不支持</c:if>
		                                               </td> -->
		                                                <td align="center" ><c:if test="${model.sellStatus=='01'}">销售</c:if><c:if test="${model.sellStatus ne '01'}">停售</c:if></td>
		                                                <td><c:if test="${model.priceType=='01'}">统一</c:if><c:if test="${model.priceType=='02'}">阶梯</c:if></td>
		                                                <td align="right" class="numberPointFormatForText">${model.price}</td>
		                                                <td  align="right">${model.minOrderQuantity}</td>
		                                                 <td  align="right">${model.unitQuantity}</td>
		                                                <td >
	                                                        <div class="action-buttons">
	                                                        	<c:if test="${model.priceId != null && model.priceId ne ''}">
	                                                        	<a href="<%=request.getContextPath() %>/goodsPriceManage/goodsPriceDetail?modId=${model.subModelId}&goodsPriceId=${model.priceId}" class="green">查看</a>|</c:if>
	                                                        	<a href="<%=request.getContextPath() %>/goodsPriceManage/toEditGoodsPrice?modId=${model.subModelId}&goodsPriceId=${model.priceId}" class="green">价格设置</a>
	                                                        	<c:if test="${model.sellStatus=='01'}">|<a href="###" class="green" onclick="editPriceStatus('${model.priceId}','stop','${model.subModelId}')">停售</a></c:if><c:if test="${model.sellStatus ne'01'}">|<a href="###" class="green" onclick="editPriceStatus('${model.priceId}','start','${model.subModelId}')">销售</a></c:if>
	                                                        </div>
	                                                    </td>
	                                                </tr>
                                            	</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                         
                        <div class="row col-sm-12    ">
							<div class="col-sm-4 hidden-480 left">
								<label class="dataTables_info " id="dynamic-table_info"
									role="status" aria-live="polite"></label>
							</div>
							<div class="col-sm-8 right">
								<%@include file="../../layout/pagination.jsp" %>
							</div>
						</div>
                    </div>
                </div>
            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->
    <%@include file="../../layout/common.js.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/goodsPrice/goodsPriceManage.js"></script>
    <script type="text/javascript">
        $('.chosen-select').chosen({});
        jQuery(function($) {
	        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
	            var offset = $(this).offset();
	            var $w = $(window)
	            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
	                $(this).addClass('dropup');
	            else $(this).removeClass('dropup');
	        });
	        $('.date-picker').datepicker({
	            autoclose: true,
	            language: 'zh-CN',
	            todayHighlight: true
	        })
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
    	});
	    
	    function editPriceStatus(priceId,operateType,subModelId){
	    	if(priceId==null || priceId==''){
	    		alert("未设置价格的物品不允许进行销售");
	    		return false;
	    	}
	    	var msg = '';
	    	if(operateType=='start'){
	    		msg = '该物品为停售状态，销售可订购，确定销售吗？'
	    	}else{
	    		msg = '该物品为销售状态，停售后无法订购，确定停售吗？'
	    	}
	    	if(!confirm(msg)){
	    		return;
	    	}
    		$.ajax({
                url: '/goodsPriceManage/changePriceStatus',
                data : {
                	priceId : priceId,
                	operateType:operateType,
                	subModelId:subModelId
    	        },
                async:false,
                cache: true,
                success : function(result) {
                	if(1 == result){
                		alert("操作成功");
                		window.location.reload();
                	}else if(0 == result){
                		alert("小型号不存在，请刷新！");
                		window.location.reload();
                	}else{
                		alert("操作失败");
                	}
                }
	    	});
	    }
	    
	    jQuery(function($) {
             var subModelId = $("#subModelId").val();
             var goodsId = $("#goodsId").val();
             var factId =  $("#factId").val();
             var goodsType = $("#goodsType").val();
             var commType = $("#commType1").val();
  		 	$("#searchGoodsType").val(goodsType);
            $("#searchGoodsType").trigger("chosen:updated");
            fillGoodsNameSelect('searchGoodsType',goodsId,'searchGoodsName','--请选择--','searchFactoryName','searchModName');
            fillFactoryNameSelect('searchGoodsName',factId,'searchFactoryName','--请选择--','searchModName');
            fillModelSelect('searchGoodsName','searchFactoryName',subModelId,'searchModName','--请选择--');
            fillCommTypeSelect('searchModName',commType,'commType','--请选择--')
        });
	    
	    function resetSearchForm(){
	    	$("#searchGoodsType").val("");
	    	$("#ifElectronicSignIn").val("");
	    	$("#commType").val("");
	    	$("#sellStatus").val("");	    	
            $("#searchGoodsType").trigger("chosen:updated");
            $("#ifElectronicSignIn").trigger("chosen:updated");
            $("#commType").trigger("chosen:updated");
            $("#sellStatus").trigger("chosen:updated");
            
            $("#searchGoodsName").chosen("destroy"); 
            $("#searchGoodsName").trigger("chosen:updated");
            $("#searchGoodsName").html('<option value="">--请选择--</option>');
    	    $("#searchGoodsName").chosen({});
 	        $("#searchGoodsName").trigger("chosen:updated");
            
	    	$("#searchFactoryName").chosen("destroy");
	    	$("#searchFactoryName").trigger("chosen:updated");
	    	$("#searchFactoryName").html('<option value="">--请选择--</option>');
   	        $("#searchFactoryName").chosen({});
	        $("#searchFactoryName").trigger("chosen:updated");
	    	
	    	$("#searchModName").chosen("destroy");
            $("#searchModName").trigger("chosen:updated");
            $("#searchModName").html('<option value="">--请选择--</option>');
   	        $("#searchModName").chosen({});
	        $("#searchModName").trigger("chosen:updated");
	        
	        $("#commType").chosen("destroy");
            $("#commType").trigger("chosen:updated");
            $("#commType").html('<option value="">--请选择--</option>');
   	        $("#commType").chosen({});
	        $("#commType").trigger("chosen:updated");
            


	    }
       
</script>
</body>
</html>