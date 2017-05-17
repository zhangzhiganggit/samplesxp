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

                        <div class=" widget-container-col ui-sortable  "  >

                            <div class="widget-box widget-color-normal3"  >
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        小型号详情
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/subModel/subModelAddSave.do" id="searchForm">
                                                <input type="hidden" id="modId" value="${subModel.modId}"/>
                                            	<input type="hidden" id="goodsId" value="${subModel.goodsId}">
                                            	<input type="hidden" id="factId" value="${subModel.factId}"/>
                                            	<input type="hidden" id="goodsType" value="${subModel.goodsType}"/>
                                            	
                                            <div class="widget-main no-padding">
                                               
                                                <div class="col-sm-12">
                                                    <h6 class="header smaller lighter green">型号基本信息 </h6>
                                                    <div class="col-sm-12">
                                                    <div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span
																	style="color: red">*</span>物品类型:</label>
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
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span
																	style="color: red">*</span>物品名称:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="--请选择--"  id="searchGoodsName" name="goodsId"  class="chosen-select form-control width-200px" data-placement="bottom" title="" 
                                                               data-rel="tooltip" data-original-title="Hello Tooltip!" 
                                                               onchange="fillFactoryNameSelect('searchGoodsName','','searchFactoryName','--请选择--')">
                                                            </select>
														</div>
													</div>
                                                     <div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span
																	style="color: red">*</span>厂商简称:</label>
															<div class="col-sm-8  no-padding">
															<select data-placeholder="--请选择--"  id="searchFactoryName" name="factId" class="chosen-select form-control width-200px" data-placement="bottom" title=""
                                                                data-rel="tooltip" data-original-title="Hello Tooltip!" 
                                                                onchange="fillModelSelect('searchGoodsName','searchFactoryName','','searchModName','--请选择--')" >
                                                            </select>
														</div>
													</div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><span
																	style="color: red">*</span>型号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                             <select data-placeholder="--请选择--" id="searchModName" name="modId" style="width: 90px;" class="chosen-select form-control width-200px" data-placement="bottom" title=""   
                                                             data-rel="tooltip" data-original-title="Hello Tooltip!" 
                                                             onchange="fillModelDetailSelect('searchModName','','packUnit','--请选择--')" >
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >包装单位:</label>
                                                       <div class="col-sm-8  no-padding"  >
                                                       <input type="text" name="packUnit" id="packUnit" value="" class="form-control input-small width-200px" readonly="readonly" >
                                                       </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >包装数量:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                       <input type="text" name="qty" id="qty" value="" class="form-control input-small width-200px" readonly="readonly" >
                                                       </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >计量单位:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                       <input type="text" name="unit" id="unit" value="" class="form-control input-small width-200px" readonly="readonly" >
                                                       </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="col-sm-12" >                                                   
                                                   <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >规格说明:</label>
                                                        <div class="col-sm-8  no-padding">
                                                           <textarea  style="height:80px" name="modSpec" id="modSpec"  class="form-control limited input-small width-100"  readonly="readonly">${subModelDetail.modSpec}</textarea>
                                                        </div>
                                                   </div>
                                                </div>
                                                </div>
												&nbsp;
                                                <div class="col-sm-12">
                                                	<h6 class="header smaller lighter green">小型号信息 </h6>
                                                	<div class="col-sm-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><span
																	style="color: red">*</span>小型号:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                       <input type="text" name="subModNm" id="subModNm" value="${subModel.subModNm }" class="form-control input-small width-200px" onblur="validateIsHave(this.value)">
                                                          
                                                       </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >模式:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                        <select data-placeholder="" id="pattern" name="pattern"   class="chosen-select form-control width-200px">
                                                                <option value=2 <c:if test="${subModel.pattern== 2}">selected="selected"</c:if>>两方</option>
                                                                <option value=3 <c:if test="${subModel.pattern== 3}">selected="selected"</c:if>>三方</option>
                                                        </select>
                                                       </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >非接:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                        <select data-placeholder="" id="nonNm" name="nonNm"   class="chosen-select form-control width-200px">
                                                                <option value=0 <c:if test="${subModel.nonNm == 0}">selected="selected"</c:if>>不支持</option>
                                                                <option value=1 <c:if test="${subModel.nonNm == 1}">selected="selected"</c:if>>支持</option>
                                                        </select>
                                                       </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >扫描:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                       <select data-placeholder="" id="scanNm" name="scanNm"   class="chosen-select form-control width-200px">
                                                                <option value=0 <c:if test="${subModel.scanNm == 0}">selected="selected"</c:if>>不支持</option>
                                                                <option value=1 <c:if test="${subModel.scanNm == 1}">selected="selected"</c:if>>支持</option>
                                                        </select>
                                                       </div>
                                                    </div>
                                                 </div>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="button" name="savebtn" onclick="return save()" id="savebtn">
														<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														保存
													</button>
                                                    <button class="btn  btn-sm" type="button"  onclick="closeWin()">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                        关闭
                                                    </button>
                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../../layout/common.js.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/goodsPrice/subModelAdd.js"></script>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    function closeWin(){
    	parent.$.fancybox.close();
    }
    $('.chosen-select').chosen({});
    jQuery(function($) {
        var modId = $("#modId").val();
        var goodsId = $("#goodsId").val();
        var factId =  $("#factId").val();
        var goodsType = $("#goodsType").val();
		 	$("#searchGoodsType").val(goodsType);
        $("#searchGoodsType").trigger("chosen:updated");
       fillGoodsNameSelect('searchGoodsType',goodsId,'searchGoodsName','--请选择--');
       fillFactoryNameSelect('searchGoodsName',factId,'searchFactoryName','--请选择--');
       fillModelSelect('searchGoodsName','searchFactoryName',modId,'searchModName','--请选择--');
       
       
       $('#searchForm').bootstrapValidator({
           message: 'This value is not valid',
           container:'popover',
           feedbackIcons: {
               valid: 'glyphicon glyphicon-ok',
               invalid: 'glyphicon glyphicon-remove',
               validating: 'glyphicon glyphicon-refresh'
           },
           fields: {
        	   subModNm: {
                   validators: {
                       notEmpty: {},
                       stringLength: {
                       	max : 100,
                       	message:'小型号不可超过100个字符'
                       }
                   }
               }
           }
       });

   });
    
        
</script>
</body>
</html>











