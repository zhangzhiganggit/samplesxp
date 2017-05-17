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
    
   <%--  <%@include file="../layout/header.jsp"%> --%>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
       <%--   <%@include file="../layout/menu.jsp"%>  --%>

        <div class="main-content ">
            <div class="main-content-inner ">

               
                <div class="page-content ">

                    <div class="row" >


                        <div class=" widget-container-col ui-sortable  "  >
                           
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        	结果列表
                                    </h5>


                                </div>

                                <div class="widget-body">
                                     <font size="3" color="red">本次批量导入备案商户共${totalNum }条,成功${sucNum }条,失败${failNum }条,失败原因如下</font>
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                 <th align="center" style="width: 10%">序号</th> 
                                                <th style="width: 30%"> 导入结果 </th>
                                                <th > 失败原因</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${failList}" var="de"  varStatus="status">
													<tr>
														 <td style="text-align: center;">${status.index+1 }</td> 
														<td style="text-align: center;">${de.msgRow }</td>
														<td style="text-align: left;">${de.msgErr }</td>
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


						</div>

                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%-- <%@include file="../layout/footer.jsp"%> --%>
      <%@include file="../layout/common.alljs.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    function closeThisWin(){
    	parent.$.fancybox.close();
    }
     </script>
    
    <script type="text/javascript">
        jQuery(function($) {
        	$('.chosen-select').chosen({});
    })
    
     
</script>
</body>
</html>











