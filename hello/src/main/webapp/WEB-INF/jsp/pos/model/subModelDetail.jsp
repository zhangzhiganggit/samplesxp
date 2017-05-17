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
                                        <form class="form-inline form-horizontal" action="/subModel/subModelDetail.do" id="searchForm">
                                            <div class="widget-main no-padding">
                                               
                                                <div class="col-sm-12">
                                                    <h6 class="header smaller lighter green">型号基本信息 </h6>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物品类型:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                          <label class="form-control input-small width-200px   view-control  "
                                                              data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                              >${subModelDetail.goodsTypeNm}</label>
                                                       </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物品名称:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                          <label class="form-control input-small width-200px   view-control  "
                                                              data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                              >${subModelDetail.goodsName}</label>
                                                       </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >厂商简称:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                          <label class="form-control input-small width-200px   view-control  "
                                                              data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                              >${subModelDetail.factShortname}</label>
                                                       </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                          <label class="form-control input-small width-200px   view-control  "
                                                              data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                              >${subModelDetail.modNm}</label>
                                                       </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >包装单位:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                          <label class="form-control input-small width-200px   view-control  "
                                                              data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                              >${subModelDetail.packUnit}</label>
                                                       </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >包装数量:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                          <label class="form-control input-small width-200px   view-control  "
                                                              data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                              >${subModelDetail.qty}</label>
                                                       </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >计量单位:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                          <label class="form-control input-small width-200px   view-control  "
                                                              data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                              >${subModelDetail.unit}</label>
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
												&nbsp;
                                                <div class="col-sm-12">
                                                	<h6 class="header smaller lighter green">小型号信息 </h6>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >小型号:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                          <label class="form-control input-small width-200px   view-control  "
                                                              data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                              >${subModelDetail.subModNm}</label>
                                                       </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >模式:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                          <label class="form-control input-small width-200px   view-control  "
                                                              data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover">
                                                              <c:if test="${subModelDetail.pattern == 2}"> 两方</c:if>
                                                              <c:if test="${subModelDetail.pattern == 3}"> 三方</c:if>
                                                             </label>
                                                       </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >非接:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                          <label class="form-control input-small width-200px   view-control  "
                                                              data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                              >${subModelDetail.nonNm}</label>
                                                       </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >扫描:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                          <label class="form-control input-small width-200px   view-control  "
                                                              data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                              >${subModelDetail.scanNm}</label>
                                                       </div>
                                                    </div>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    
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
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    function closeWin(){
    	parent.$.fancybox.close();
    }
        
</script>
</body>
</html>











