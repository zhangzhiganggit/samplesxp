﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
	 <style type="text/css" >
    	a:hover{
    		background-color:transparent;
  			text-decoration:underline;
    	}
    </style>
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
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger">
                                        <i class="ace-icon fa fa-table"></i>
                                       IC卡密码查看
                                    </h5>
                                </div>
                                <div class="widget-body">
                                   <table  width="100%" height="100%">
                                      <tr>
                                         <td class="smaller lighter green inline" style="text-align:center;font-size: 20px;">&nbsp;密码：${password}</td>
                                      </tr>
                                     
                                      <tr>
                                         <c:if test="${isHaveButton != 'false'}">
                                		 <td style="font-size: 18px;color: green;text-align:right;"><button onclick="closeConfirm()" id="returnLink">返回${returnPageName}</button>&nbsp;</td>
                                	     </c:if>
                                	     
                                      </tr>
                                   </table>
                                </div>
                                <br /><br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- /.main-content -->
    </div><!-- /.main-container -->
</body>
<script type="text/javascript">
function closeConfirm(){
	parent.$.fancybox.close();
}
</script>
</html>











