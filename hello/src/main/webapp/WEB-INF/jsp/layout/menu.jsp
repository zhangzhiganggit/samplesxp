<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@include file="../common/taglib.jsp"%>
 <style>
 <%--
.hover{
  display: none;
}

.newAgentHidden{
  display: inline;
}
.liuxia{
  color: red;
}--%>
</style>
<div id="sidebar" class="sidebar                  responsive sidebar-fixed compact sidebar-scroll" data-sidebar="true" data-sidebar-scroll="true" style="" data-sidebar-hover="true">
  <script type="text/javascript">
    try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
  </script>

  <div class="nav-wrap-up pos-rel"><div class="nav-wrap nav-wrap-t" style="max-height: 418px;"><ul class="nav nav-list" style="position: relative; top: 0px; transition: top 0.15s; -webkit-transition: top 0.15s;">
    <li class="hover" >
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-tachometer"></i>
        <span class="menu-text"> 首页 </span>
      </a>

      <b class="arrow"></b>
       
    </li>
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-pencil-square-o"></i>
        <span class="menu-text"> 增值产品</span>

        <b class="arrow fa fa-angle-down"></b>
      </a>

      <b class="arrow"></b>

      <ul class="submenu can-scroll ace-scroll scroll-disabled" style="">
         <li class="hover">
         <a href="<%=request.getContextPath()%>/mecMDinfo/view.do?isFirst=true"> 
         <i class="menu-icon fa fa-caret-right"></i> 
         自动秒到商户查询
         </a> 
         <b class="arrow"></b>
         </li>
     <li class="hover">
     <a href="<%=request.getContextPath()%>/nowPayManage/mercNowPayManage.do?entry=0"> 
     <i class="menu-icon fa fa-caret-right"></i> 
     商户即日付管理
     </a> 
     <b class="arrow"></b>
     </li>
      </ul>
      </li>

<c:if test="${loginUserPermission.SMSA_NOW_PAY_01!=null || loginUserPermission.SMSA_MDMEC_INFO_001!=null  ||loginUserPermission.SMSA_D1_COUNT_001!=null||loginUserPermission.SMSA_D1_STATUS_001!=null || loginUserPermission.SMSA_GOLD_MERC!=null}">
 <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-pencil-square-o"></i>
        <span class="menu-text"> 增值产品</span>

        <b class="arrow fa fa-angle-down"></b>
      </a>

      <b class="arrow"></b>

      <ul class="submenu can-scroll ace-scroll scroll-disabled" style="">
      <c:if test="${loginUserPermission.SMSA_MDMEC_INFO_001!=null }">
	     <li class="hover">
	     <a href="<%=request.getContextPath()%>/mecMDinfo/view.do?isFirst=true"> 
	     <i class="menu-icon fa fa-caret-right"></i> 
	     自动秒到商户查询
		 </a> 
		 <b class="arrow"></b>
		 </li>
	 </c:if>
      <c:if test="${loginUserPermission.SMSA_NOW_PAY_01!=null }">
     <li class="hover">
     <a href="<%=request.getContextPath()%>/nowPayManage/mercNowPayManage.do?entry=0"> 
     <i class="menu-icon fa fa-caret-right"></i> 
     商户即日付管理
	 </a> 
	 <b class="arrow"></b>
	 </li>
	 </c:if>
	 <c:if test="${loginUserPermission.SMSA_D1_STATUS_001!=null}">
	       <li class="hover">
	          <a href="<%=request.getContextPath()%>/mecIfDayOneStatus/list.do?isFirstLoad=true">
	            <i class="menu-icon fa fa-caret-right"></i>
	         商户D+1状态管理
	          </a>
	          <b class="arrow"></b>
	        </li>
     </c:if> 
	 <c:if test="${loginUserPermission.SMSA_D1_COUNT_001!=null}">
	       <li class="hover">
	          <a href="<%=request.getContextPath()%>/mecIfDayOne/list.do?isFirstLoad=true">
	            <i class="menu-icon fa fa-caret-right"></i>
	          代理商D+1商户数查询
	          </a>
	
	          <b class="arrow"></b>
	        </li>
     </c:if> 
      </ul>
      </li>
</c:if>    
    </ul>
    </div>
    <div class="ace-scroll nav-scroll">
      <div class="scroll-track scroll-active" >
    <div class="scroll-bar" ></div>
  </div>
    <div class="scroll-content" ></div>
  </div>
  </div>
  <script type="text/javascript">
    try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
    try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
    function openDataImportPage(){
    	$.fancybox.open({
    		href : '/complianceRectification/toImportOrderPage.do',
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 500,
	        autoSize: false,
	        closeClick: false
        });
    }
  </script>
</div>
