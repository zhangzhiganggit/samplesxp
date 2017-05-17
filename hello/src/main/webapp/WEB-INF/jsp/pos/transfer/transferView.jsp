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
                                        划拨单查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/posTransferAdmin/queryTransferListView" id="searchForm">
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
                                                <input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >划拨单号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="goodsTransferId" id="goodsTransferId" onkeyup="this.value=this.value.replace(/[^+\d]/g,'')" value="${goodsTransfer.goodsTransferId }" class="form-control input-small width-200px" data-placement="bottom" title=""  data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收货机构:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="toOrgName" id="toOrgName" value="${goodsTransfer.toOrgName }" class="form-control input-small width-200px" data-placement="bottom" title=""  data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
     <%--                                                <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >单据状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="transferStatus" name="transferStatus"  class="chosen-select form-control width-200px">
                                                                <option value="0">请选择</option>
                                                                <option value="10" <c:if test="${goodsTransfer.transferStatus == 10}">selected="selected"</c:if>>未发货</option>
                                                                <option value="20" <c:if test="${goodsTransfer.transferStatus == 20}">selected="selected"</c:if>>已发货</option>
                                                                <option value="21" <c:if test="${goodsTransfer.transferStatus == 21}">selected="selected"</c:if>>部分发货</option>
                                                                <option value="80" <c:if test="${goodsTransfer.transferStatus == 80}">selected="selected"</c:if>>确认收货</option>
                                                            </select>

                                                        </div>
                                                    </div> --%>
                                                    
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >单据类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="transferType" name="transferType"  class="chosen-select form-control width-200px">
                                                                <option value="0">请选择</option>
                                                                <option value="2" <c:if test="${goodsTransfer.transferType == 2}">selected="selected"</c:if>>划拨单</option>
                                                            </select>

                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >发货时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="sendDateStart" value="${goodsTransfer.sendDateStart}" class="input-small form-control">
                                                                     <span class="input-group-addon">
                                                                         <i class="fa fa-exchange"></i>
                                                                     </span>
                                                                <input type="text" name="sendDateEnd" value="${goodsTransfer.sendDateEnd}" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
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
                                        划拨单查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width: 10%">划拨单号</th>
                                                <!-- <th style="text-align:center;width: 10%">订单号</th> -->
                                                <th style="text-align:center;width: 15%">发货机构</th>
                                                <th style="text-align:center;width: 15%">收货机构</th>
                                                <th style="text-align:center;width: 10%">发出人</th>
                                                <th style="text-align:center;width: 10%">单据类型</th>
                                                <th style="text-align:center;width: 10%">单据状态</th>
                                                <th style="text-align:center;width: 10%">发货时间</th>
                                                <th style="text-align:center;width: 10%">收货时间</th>
                                                <th style="text-align:center;width: 10%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                             <c:forEach items="${transferList}" var="transfer" varStatus="status">
                                                    <tr>
                                                        <td style="text-align:center" >${transfer.goodsTransferId}</td>
                                                        <%-- <td style="text-align:right" >${transfer.goodsOrderId}</td> --%>
                                                        <td>${transfer.fromOrgName}</td>
                                                        <td>${transfer.toOrgName}</td>
                                                        <td style="display:none">${transfer.goodsOrderId}</td>
                                                        <td style="display:none">${transfer.totalQuantity}</td>
                                                        <td style="text-align:center">
                                                            <c:if test="${transfer.transferType==1}">总部</c:if>
                                                            <c:if test="${transfer.transferType==2}">${transfer.sender}</c:if>
                                                        </td>
                                                        <td style="text-align:center">
                                                            <c:if test="${transfer.transferType==1}">发货单</c:if>
                                                            <c:if test="${transfer.transferType==2}">划拨单</c:if>
                                                        </td>
                                                        <td style="text-align:center" >
                                                            <c:if test="${transfer.transferStatus==10}" >未发货</c:if>
                                                            <c:if test="${transfer.transferStatus==20}" >已发货</c:if>
                                                            <%-- <c:if test="${transfer.transferStatus==21}" >部分发货</c:if> --%>
                                                            <c:if test="${transfer.transferStatus==80}" >确认收货</c:if>
                                                        </td>
                                                        <td style="text-align:center">${transfer.sendDate}</td>
                                                        <td style="text-align:center">${transfer.receiveDate}</td>
                                                        <td style="text-align:center">
                                                            <a href="javaScript:openIframe('${transfer.goodsOrderId}','${transfer.goodsTransferId}',1,${transfer.transferType})" class="blue">详情</a>
                                                            <c:if test="${loginUserPermission.SMS_POS_010!= null }">
                                                    <%--        <c:if test="${transfer.transferStatus==20}" >
                                                                <a href="javascript:openIframe('${transfer.goodsOrderId}','${transfer.goodsTransferId}',3,${transfer.transferType})" class="blue">确认收货</a>
                                                            </c:if> --%>
                                                            </c:if>
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
    <script type="text/javascript">


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



        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        })
//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});

    })
    
     function resetMecForm(){
       	 $(':input','#searchForm')  
       	 .not(':button, :submit, :reset, :hidden')  
       	 .val('') ; 
       	 $("#transferType").val('');
 		 $("#transferType").trigger("chosen:updated");
     }
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
    function openIframe(goodsOrderId,goodsTransferId,flag,transferType){
        var href = '<%=request.getContextPath() %>/posTransferAdmin/queryTransferDetailView?goodsTransferId='+goodsTransferId+'&goodsOrderId='+goodsOrderId+'&flag='+flag+'&transferType='+transferType;
        $.fancybox.open({
            href : href,
            type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width() * 0.9,
            centerOnScroll:true,
            autoSize: true,
            helpers:{
                overlay:{
                    closeClick:false
                }
            },
            afterClose:function(){
                if(1 != flag){
                    reloadParent();
                }
            }
        });
    }
    
<%--     function confirm(goodsOrderId,goodsTransferId,transferType){
        var url = '';
        if('1' == transferType){
            url = "<%=request.getContextPath()%>/posTransferAdmin/confirm.do?randomNum="+new Date().getTime();
        }else{
            url = "<%=request.getContextPath()%>/posTransferAdmin/agentConfirm.do?randomNum="+new Date().getTime();
        }
        
        $.ajax({ url: url, 
               data:{goodsOrderId:goodsOrderId,goodsTransferId:goodsTransferId},
               type: 'POST',
               async:false,
               success: function(data){
                    if("1" == data){
                        alert("收货成功！");
                        reloadParent();
                    }else{
                        alert("收货失败！");
                    }
            }});
    } --%>
    
    function reloadParent(){
        document.getElementById("searchForm").submit();
     }
</script>
</body>
</html>











