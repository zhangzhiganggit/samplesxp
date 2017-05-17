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
                                        库存管理
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
                                            <form class="form-inline form-horizontal" action="/stockManage/list.do" id="searchForm">
                                                <input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }">
                                                <input type="hidden" name="pageSize" value="${pageInfo.getPageSize() }">
                                                <input type="hidden" id="isFirstLoad" name="isFirstLoad" value="false" />
                                                <input type="hidden" id="model" value="${stockInfo.model}"/>
                                                <input type="hidden" id="goodsName" value="${stockInfo.goodsName}">
                                                <input type="hidden" id="factShortName" value="${stockInfo.factShortName}"/>
                                                <input type="hidden" id="goodsType" value="${stockInfo.goodsType}"/>
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6"
                                                            class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">盟主编号:</label>

                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="chiefId" value="${stockInfo.chiefId }"
                                                                class="form-control input-small width-200px"
                                                                onkeyup="this.value=this.value.replace(/\s+/g,'')"
                                                                data-placement="bottom" title="" id="form-field-6"
                                                                data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6"
                                                            class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">盟主名称:</label>

                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="chiefName" value="${stockInfo.chiefName }"
                                                                class="form-control input-small width-200px"
                                                                onkeyup="this.value=this.value.replace(/\s+/g,'')"
                                                                data-placement="bottom" title="" id="form-field-6"
                                                                data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
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
                                                                        <c:if test="${item.goodsType == stockInfo.goodsType }"> selected </c:if>
                                                                    >${item.goodsTypeName }</option>
                                                                    </c:forEach>
                                                            </select>
                                                        </div>
                                                    
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label
                                                            class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">物品名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="--请选择--"  id="searchGoodsName" name="goodsName"  class="chosen-select form-control width-200px" data-placement="bottom" title="" 
                                                               data-rel="tooltip" data-original-title="Hello Tooltip!" 
                                                               onchange="fillFactoryNameSelect('searchGoodsName','','searchFactoryName','--请选择--','searchModName')">
                                                            </select>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm  width-300px">
                                                        <label
                                                            class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商简称:</label>
                                                            <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="--请选择--"  id="searchFactoryName" name="factShortName" class="chosen-select form-control width-200px" data-placement="bottom" title=""
                                                                data-rel="tooltip" data-original-title="Hello Tooltip!" 
                                                                onchange="fillModelSelect('searchGoodsName','searchFactoryName','','searchModName','--请选择--')" >
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                             <select data-placeholder="--请选择--" id="searchModName" name="model" style="width: 90px;" class="chosen-select form-control width-200px" data-placement="bottom" title=""   
                                                             data-rel="tooltip" data-original-title="Hello Tooltip!" 
                                                             onchange="fillSubModelSelect('searchModName','','searchSubModName','--请选择--')" >
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >通讯方式:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                                <select data-placeholder="请选择" id="communicationType" name="communicationType" class="chosen-select form-control width-200px">
                                                                     <option value="">全部</option>
                                                                     <option value="0" <c:if test="${stockInfo.communicationType =='0'}">selected="selected"</c:if>>拨号</option>
                                                                     <option value="1" <c:if test="${stockInfo.communicationType =='1'}">selected="selected"</c:if>>GPRS</option>
                                                                     <option value="2" <c:if test="${stockInfo.communicationType =='2'}">selected="selected"</c:if>>TCP</option>
                                                                     <option value="3" <c:if test="${stockInfo.communicationType =='3'}">selected="selected"</c:if>>TD-LTE</option>
                                                                     <option value="4" <c:if test="${stockInfo.communicationType =='4'}">selected="selected"</c:if>>CDMA</option>
                                                                     <option value="5" <c:if test="${stockInfo.communicationType =='5'}">selected="selected"</c:if>>CDMA2000</option>
                                                                     <option value="6" <c:if test="${stockInfo.communicationType =='6'}">selected="selected"</c:if>>WCDMA</option>
                                                                     <option value="7" <c:if test="${stockInfo.communicationType =='7'}">selected="selected"</c:if>>TD_CDMA</option>
                                                                     <option value="8" <c:if test="${stockInfo.communicationType =='8'}">selected="selected"</c:if>>WIFI</option>
                                                                     <option value="9" <c:if test="${stockInfo.communicationType =='9'}">selected="selected"</c:if>>FDD_LTE</option>
                                                                </select>
    
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >电签:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select data-placeholder="请选择" id="signa" name="signa" class="chosen-select form-control width-200px">
                                                                 <option value="">请选择</option>
                                                                 <option value="0" <c:if test="${stockInfo.signa =='0'}">selected="selected"</c:if>>不支持</option>
                                                                 <option value="1" <c:if test="${stockInfo.signa =='1'}">selected="selected"</c:if>>支持</option>
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
                                                   <button class="btn btn-danger btn-sm" type="button" onclick="stockInList()">
                                                   <span class="ace-icon fa fa-list icon-on-right bigger-110"></span>
                                                    出库记录
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header float:right  ">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                      库存查询
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width:8%">盟主编号</th>
                                                <th style="text-align:center;width:10%">盟主名称</th>
                                                <th style="text-align:center;width:7%">物品类型</th>
                                                <th style="text-align:center;width:7%">物品名称</th>
                                                <th style="text-align:center;width:7%">厂商简称</th>
                                                <th style="text-align:center;width:7%">型号</th>
                                                <th style="text-align:center;width:7%">通讯方式</th>
                                                <th style="text-align:center;width:7%">电签</th>
                                                <th style="text-align:center;width:7%">未安装数</th>
                                                <th style="text-align:center;width:7%">安装数</th>
                                                <th style="text-align:center;width:7%">剩余库存数</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${stockList}" var="sto"  varStatus="status">
                                                    <tr>
                                                        <td style="text-align:center;">${sto.chiefId}</td>
                                                        <td style="text-align:center;">${sto.chiefName}</td>
                                                        <td style="text-align:center;">${sto.goodsType}</td>
                                                        <td style="text-align:center;">${sto.goodsName}</td>
                                                        <td style="text-align:center;">${sto.factShortName}</td>
                                                        <td style="text-align:center;">${sto.model}</td>
                                                        <td style="text-align:center;">${sto.communicationType}
                                                            
                                                            
                                                        </td>
                                                        <td style="text-align:center;">${sto.signa}
                                                        </td>
                                                        <td style="text-align:center;"><a href="<%=request.getContextPath() %>/stockManage/unInstallNumberList.do?belongtoOrg=${sto.belongtoOrg}&modelCode=${sto.modelCode}&status=1" class="green">${sto.unInstallNumber}</a></td>
                                                        <td style="text-align:center;"><a href="<%=request.getContextPath() %>/stockManage/installNumber.do?status=3&belongtoOrg=${sto.belongtoOrg}&modelCode=${sto.modelCode}" class="green">${sto.installNumber}</a></td>
                                                        <td style="text-align:center;">${sto.inventoryNumber}</td>  
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
            
        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../../layout/common.js.jsp"%>
    
    <!-- inline scripts related to this page -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/goodsPrice/stockManage.js"></script>
    <script type="text/javascript">
      var flag = 5;
      var timer;
      function stockInList(){
        window.location.href="<%=request.getContextPath() %>/stockManage/stockInList.do?isFirstLoad=1";
      }
        $('.chosen-select').chosen({});
        jQuery(function($) {
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
        jQuery(function($) {
            var goodsId = $("#goodsName").val();
            var modId = $("#model").val();

            var factId =  $("#factShortName").val();
            var goodsType = $("#goodsType").val();
            
            $("#searchGoodsType").val(goodsType);
            $("#searchGoodsType").trigger("chosen:updated");
           fillGoodsNameSelect('searchGoodsType',goodsId,'searchGoodsName','--请选择--');
           fillFactoryNameSelect('searchGoodsName',factId,'searchFactoryName','--请选择--');
           fillModelSelect('searchGoodsName','searchFactoryName',modId,'searchModName','--请选择--');
       });
      
</script>
</body>
</html>











