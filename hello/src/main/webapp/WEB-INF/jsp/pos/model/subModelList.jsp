<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title>

	<%@include file="../../common/taglib.jsp"%>
    <%@include file="../../layout/common.jsp"%>
</head>

<body class="no-skin ">
    <!-- 隐藏一个遮罩层用于提示操作结果 -->
	  <div id="test" style="display:none;" align="center">
	  <div  style="background-color:  rgb(192,255,62 ); opacity: 0.5;filter:alpha(opacity=50); top: 0px; left: 0px; width: 100%; height: 60px;  ">
	  <span><font color="red" size="5" style="font-weight:bold;font-style:italic;">${result}</font></span> 
	  <div class="alert_div"><span style="color:red;" id="alert_span"></span>秒后自动关闭
	  </div>
	  </div>
	  </div>
	<!-- END -->

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
                                        小型号管理查询条件
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
                                            <form class="form-inline form-horizontal" action="/subModel/list.do" id="searchForm">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" id="result" name="result" value="${result}">
												<input type="hidden" id="isFirstLoad" name="isFirstLoad" value="false" />
												<input type="hidden" id="subModId" value="${subModel.subModId}"/>
												<input type="hidden" id="modId" value="${subModel.modId}"/>
                                            	<input type="hidden" id="goodsId" value="${subModel.goodsId}">
                                            	<input type="hidden" id="factId" value="${subModel.factId}"/>
                                            	<input type="hidden" id="goodsType" value="${subModel.goodsType}"/>
                                                <div class=" col-xs-12">
                                                    
													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">物品类型:</label>
														<div class="col-sm-8  no-padding">
															 <select data-placeholder="--请选择--"  id="searchGoodsType" name="goodsType"  class="chosen-select form-control width-200px" data-placement="bottom" title=""  
                                                            data-rel="tooltip" data-original-title="Hello Tooltip!"  
                                                            onchange="fillGoodsNameSelect('searchGoodsType','','searchGoodsName','--请选择--')">
                                                                  <option value="" >--请选择--</option>
                                                                	<c:forEach items="${goodsTypeList}" var="item">
																		<option value="${item.goodsType }"
                                                                		<c:if test="${item.goodsType == subModel.goodsType }"> selected </c:if>
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
												</div>
												<!-- 二排条件 -->
												<div class=" col-xs-12">
                                                   <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                             <select data-placeholder="--请选择--" id="searchModName" name="modId" style="width: 90px;" class="chosen-select form-control width-200px" data-placement="bottom" title=""   
                                                             data-rel="tooltip" data-original-title="Hello Tooltip!" 
                                                             onchange="fillSubModelSelect('searchModName','','searchSubModName','--请选择--')" >
                                                            </select>
                                                        </div>
                                                    </div>
													<div class="form-group form-group-sm width-300px">
	                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号状态:</label>
	                                                    <div class="col-sm-8  no-padding"  >
	                                                            <select data-placeholder="请选择" id="modSts" name="modSts" class="chosen-select form-control width-200px">
	                                                                 <option value="">全部</option>
	                                                                 <option value="0" <c:if test="${subModel.modSts =='0'}">selected="selected"</c:if>>正常</option>
	                                                                 <option value="1" <c:if test="${subModel.modSts =='1'}">selected="selected"</c:if>>冻结</option>
	                                                                 <option value="2" <c:if test="${subModel.modSts =='2'}">selected="selected"</c:if>>待审批</option>
	                                                                 <option value="9" <c:if test="${subModel.modSts =='9'}">selected="selected"</c:if>>注销</option>
	                                                            </select>
	
	                                                    </div>
													</div>
													<div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >小型号:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="--请选择--" id="searchSubModName" name="subModId" style="width: 90px;" class="chosen-select form-control width-200px" data-placement="bottom" title=""   
                                                             data-rel="tooltip" data-original-title="Hello Tooltip!" >
                                                            </select>

                                                        </div>
													</div>
													
												</div>
												<!-- 三排参数 -->
											<div class=" col-xs-12">
	                                            <div class="form-group form-group-sm width-300px">
	                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >非接:</label>
	                                                    <div class="col-sm-8  no-padding"  >
	                                                            <select data-placeholder="请选择" id="noncontact" name="noncontact" class="chosen-select form-control width-200px">
	                                                                 <option value="">请选择</option>
	                                                                 <option value="0" <c:if test="${subModel.noncontact =='0'}">selected="selected"</c:if>>不支持</option>
	                                                                 <option value="1" <c:if test="${subModel.noncontact =='1'}">selected="selected"</c:if>>支持</option>
	                                                                 
	                                                            </select>
	
	                                                    </div>
													</div>
													<div class="form-group form-group-sm width-300px">
	                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >扫描:</label>
	                                                    <div class="col-sm-8  no-padding"  >
	                                                            <select data-placeholder="请选择" id="scan" name="scan" class="chosen-select form-control width-200px">
	                                                                 <option value="">请选择</option>
	                                                                 <option value="0" <c:if test="${subModel.scan =='0'}">selected="selected"</c:if>>不支持</option>
	                                                                 <option value="1" <c:if test="${subModel.scan =='1'}">selected="selected"</c:if>>支持</option>
	                                                                 
	                                                            </select>
	
	                                                    </div>
													</div>
													<div class="form-group form-group-sm width-300px">
	                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >模式:</label>
	                                                    <div class="col-sm-8  no-padding"  >
	                                                            <select data-placeholder="请选择" id="pattern" name="pattern" class="chosen-select form-control width-200px">
	                                                                 <option value="">请选择</option>
	                                                                 <option value="2" <c:if test="${subModel.pattern =='2'}">selected="selected"</c:if>>两方</option>
	                                                                 <option value="3" <c:if test="${subModel.pattern =='3'}">selected="selected"</c:if>>三方</option>
	                                                                 
	                                                            </select>
	                                                    </div>
													</div>
												</div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="resetSearchForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button>
                                                   <button class="btn btn-info btn-sm" type="button" onclick="javaScript:alertIframe(this,2,3)">
                                                    添加
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
                                       小型号查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width:8%">物品类型</th>
                                                <th style="text-align:center;width:10%">物品名称</th>
                                                <th style="text-align:center;width:15%">厂商简称</th>
                                                <th style="text-align:center;width:7%">型号</th>
                                                <th style="text-align:center;width:7%">型号状态</th>
                                                <th style="text-align:center;width:7%">小型号</th>
                                                <th style="text-align:center;width:7%">模式</th>
                                                <th style="text-align:center;width:7%">非接</th>
                                                <th style="text-align:center;width:7%">扫描</th>
                                                <th style="text-align:center;width:10%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach items="${subModelList}" var="sub"  varStatus="status">
													<tr>
														<td style="text-align:center;">${sub.goodsTypeNm}</td>
														<td style="text-align:center;">${sub.goodsName}</td>
														<td style="text-align:center;">${sub.factShortname}</td>
														<td style="text-align:center;">${sub.modNm}</td>
														<td style="text-align:center;">${sub.modStatusNm}</td>
														<td style="text-align:center;">${sub.subModNm}</td>
														<td style="text-align:center;">
														<c:if test="${sub.pattern==2}">两方</c:if>
														<c:if test="${sub.pattern==3}">三方</c:if>
														</td>
														<td style="text-align:center;">
														   <c:if test="${sub.noncontact==1}">支持</c:if>
														   <c:if test="${sub.noncontact==0}">不支持</c:if>
														</td>
														<td style="text-align:center;">
														   <c:if test="${sub.scan==1}">支持</c:if>
														   <c:if test="${sub.scan==0}">不支持</c:if>
														</td>
														<td style="text-align:center;">
										                     <div class="action-buttons">
										                         <a href="javaScript:alertIframe(this,'${sub.subModId}',1)" class="blue" title="明细">
										                             查看
										                         </a>
										                            <a  href="javaScript:deleteModel('${sub.subModId}','${sub.priceStatus}')" class="blue" title="删除">
										                              删除                                  
										                         </a>
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
    
    <!-- inline scripts related to this page -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/goodsPrice/subModelManage.js"></script>
    <script type="text/javascript">
	  var flag = 5;
	  var timer;
	  function auto_close(){
	   if(flag == 0){
	     flag = 5;
	     fun_close();
	   }else{
		 document.getElementById("alert_span").innerHTML = flag;
		 flag--;
		 timer = setTimeout(auto_close,1000);
	   }
	  }
	  function fun_close(){
	    document.getElementById("test").style.display = 'none';
	    clearTimeout(timer);
	  }
	  function fun_open(){
	    flag = 5;
	    document.getElementById("test").style.display = '';
	    auto_close();
	  }

        $('.chosen-select').chosen({});
        jQuery(function($) {
            if($("#result").val() != ""){
            	fun_open();
            }
        $('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                firstName: {
                    validators: {
                        notEmpty: {},
                        stringCase: {
                            'case': 'upper'
                        }
                    }
                }
            }
        });

        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});

    })
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        
    function alertIframe(obj,subModId,flag){
    	
    	var href = '';
    	if(1 == flag){//明细
    		href = '<%=request.getContextPath() %>/subModel/subModelDetail.do?subModId='+subModId;
    	}else if(3 == flag){//添加
    		href = '<%=request.getContextPath() %>/subModel/subModelAdd.do';
    	}
    	$.fancybox.open({
			href : href,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width(),
            height: $(window).width(),
            centerOnScroll:true,
            autoSize: true,
            helpers:{
            	overlay:{
            		closeClick:false
            	}
            },
			afterClose:function(){
				if(4 != flag){
					reloadParent();
				}
			}
		});
    }
    //删除
    function deleteModel(subModId,priceStatus){
    	if(priceStatus=='01'){
    		alert("该物品正在销售，不能删除！");
				return false;
    	}
    	var href = '${ctx}/subModel/subModelDel.do?subModId='+subModId;
			$.ajax({
				type : "GET",
				url : href,
				dataType : "json",
				cache : false,
				success : function(data) {
					if(data == '1'){
						alert("删除成功!");
					}else{
						alert("删除失败!");
					}
					reloadParent();
				}
			});
    }
		jQuery(function($) {
            var modId = $("#modId").val();
            var goodsId = $("#goodsId").val();
            var factId =  $("#factId").val();
            var goodsType = $("#goodsType").val();
            var subModId = $("#subModId").val();
            
 		 	$("#searchGoodsType").val(goodsType);
            $("#searchGoodsType").trigger("chosen:updated");
           fillGoodsNameSelect('searchGoodsType',goodsId,'searchGoodsName','--请选择--');
           fillFactoryNameSelect('searchGoodsName',factId,'searchFactoryName','--请选择--');
           fillModelSelect('searchGoodsName','searchFactoryName',modId,'searchModName','--请选择--');
           fillSubModelSelect('searchModName',subModId,'searchSubModName','--请选择--');
       });
	    
</script>
</body>
</html>











