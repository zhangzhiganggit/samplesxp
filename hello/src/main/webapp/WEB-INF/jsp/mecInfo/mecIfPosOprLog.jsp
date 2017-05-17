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
                            <div class="widget-box widget-color-normal3">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
											商户POS功能开关记录
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="">
                                                
                                            </form>
											
											<div class="col-sm-12 no-padding">
                                                                    <table class="table table-striped table-bordered table-hover dataTable   DTTT_selectable">
                                                                        <thead class="thin-border-bottom">
                                                                        <tr>
																			<th align="center">功能名称</th>
																			<th align="center">执行操作</th>
																			<th align="center">操作时间</th>
																			<th align="center">操作帐号</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
													                       <c:forEach items="${logList}" var="log" varStatus="status">
																				<tr style="height=100">
																					<td style="border:1px solid  #969696;">
																					<c:if test="${log.busTyp eq '-'}">-</c:if>
																					<c:if test="${log.busTyp eq 'BnkFlg_XFCX'}">消费撤销(银联卡)</c:if>
																					<c:if test="${log.busTyp eq 'BnkFlg_YECX'}">余额查询(银联卡)</c:if>
																					<c:if test="${log.busTyp eq 'OthFlg_JYMXDY'}">终端明细打印(银联卡)</c:if>
																					<c:if test="${log.busTyp eq 'BmpFlg_XJXFJZ'}">现金消费记账</c:if>
																					</td>
																					
																					<td style="border:1px solid  #969696;text-align: center;">
																						<c:if test="${log.optTyp eq '01' }">开通</c:if>
																						<c:if test="${log.optTyp eq '00' }">关闭</c:if>
																					</td>
																					<td style="border:1px solid  #969696;text-align: center;">${log.dtCte }</td>
																					<td style="border:1px solid  #969696; text-align: center;">${log.cteStffNo }</td>
																					
																				</tr>
																			</c:forEach>
													
													                  </tbody></table>
                                                                </div>



                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">

                                                    <button class="btn btn-default btn-sm" type="button" onclick="javascript:closewin();">
                                                       <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                        关闭
                                                    </button>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>



            </div>
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

<!-- basic scripts -->

     <%@include file="../layout/common.alljs.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    
    function closewin(){
    	parent.$.fancybox.close();
    }
	
	
	jQuery(function($){
	
		$(":checkbox").click(function(){
			this.checked = !this.checked;
		});
		
	})
	
	
	
	
	
	
	
	
	

</script>
</body>
</html>











