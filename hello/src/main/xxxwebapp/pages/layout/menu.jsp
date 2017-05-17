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
  <c:if test="${loginUserPermission.SMSA_BATCH_TEST_001!=null}">
   <li class="hover" style ="display: none;">
      <a href="#"  class="dropdown-toggle">
        <i class="menu-icon fa fa-file-o"></i>

        <span class="menu-text">
            跑批测试

        </span>

      </a>

      <b class="arrow"></b>
      <ul class="submenu can-scroll">
           <c:if  test="${loginUserPermission.SMSA_BATCH_TEST_001 != null }">   
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/batchTest/listView.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	           跑批测试界面
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
      </ul>
    </li>
</c:if>
  <c:if test="${loginUserPermission.SMSA_AGENT_008!=null || loginUserPermission.SMSA_AGENT_009!=null || loginUserPermission.SMSA_AGENT_019!=null || loginUserPermission.SMSA_AGENT_020!=null || 
  loginUserPermission.SMSA_BASE_001!=null ||loginUserPermission.SMSA_FINANCE_001!=null  || loginUserPermission.SMSA_BOND_ADMIN_MANAGE!=null || loginUserPermission.SMSA_BOND_CHANGE_HIS!=null|| loginUserPermission.SMSA_RATEINFO_01!=null}">
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
								代理商管理
							</span>

        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>

      <ul class="submenu can-scroll">
       
        <c:if  test="${loginUserPermission.SMSA_AGENT_008!=null }">   
          <li class="hover ">
            <a href="<%=request.getContextPath() %>/org/toAddOrg.do">
              <i class="menu-icon fa fa-caret-right"></i>
              新增代理商
            </a>
  
            <b class="arrow"></b>
          </li>
        </c:if>
        <c:if  test="${loginUserPermission.SMSA_AGENT_046!=null }">   
          <li class="hover ">
            <a href="<%=request.getContextPath() %>/batchIncome/tobatchAddMerc.do">
              <i class="menu-icon fa fa-caret-right"></i>
              批量新增商户
            </a>
  
            <b class="arrow"></b>
          </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_AGENT_009!=null }">
          <li class="hover ">
            <a href="<%=request.getContextPath() %>/org/toAddOrgQuick.do?type=quick">
              <i class="menu-icon fa fa-caret-right"></i>
              代理商快速创建
            </a>
  
            <b class="arrow"></b>
          </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_AGENT_019!=null }">
	        <li class="hover">
	          <a href="<%=request.getContextPath()%>/org/list.do?orgProp=2&isFirstLoad=true">
	            <i class="menu-icon fa fa-caret-right"></i>
	            代理商管理
	          </a>
	
	          <b class="arrow"></b>
	        </li>
        </c:if>
      
        <c:if test="${loginUserPermission.SMSA_AGENT_044!=null}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/org/changeOwner.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	                                              退出代理商机具转移
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_BOND_ADMIN_MANAGE!=null}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/bond/manage/bondsList.do?flag=true">
	            <i class="menu-icon fa fa-caret-right"></i>
	                                              保证金管理
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_POLLONG_DATA!=null}">
	        <li class="hover newAgentHidden">
	          <a href="<%=request.getContextPath() %>/agent/pollingData/queryList.do?flag=true">
	            <i class="menu-icon fa fa-caret-right"></i>
	                                              巡检数据查询
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
         <c:if test="${loginUserPermission.SMSA_RATEINFO_01!=null}"> 
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/rateInfo/listView.do?flag=true">
	            <i class="menu-icon fa fa-caret-right"></i>
	                        评级信息导入
	          </a>
	          <b class="arrow"></b>
	        </li>
         </c:if>
      </ul>

    </li>
    </c:if>
    <!-- 手刷业务管理部分 -->

    <c:if test="${(loginUserPermission.SMSA_TIMELYACCOUNT_001!=null || loginUserPermission.SMSA_TIMELYACCOUNT_002!=null || loginUserPermission.SMSA_MOBPOS_UNBIND_001!=null || loginUserPermission.SMS_HANDSETTLE_002!=null || loginUserPermission.SMSA_POSHAND_01!=null || loginUserPermission.SMS_POSHANDTRADE_02!=null || loginUserPermission.SMSA_AGENTJOYTYPE_001!=null)&& pbCheck==false}">
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-cc-visa"></i>
        <span class="menu-text">手刷业务管理</span>

        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>
      <ul class="submenu can-scroll">
      	<c:if test="${loginUserPermission.SMSA_POSHAND_01!=null }">
	        <li class="hover">
	          <a href="<%=request.getContextPath()%>/mecIfHandPos/toList.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            手刷商户查询
	          </a>
	          <b class="arrow"></b>
	        </li>
	    </c:if>
       <c:if test="${loginUserPermission.SMSA_TIMELYACCOUNT_001!=null }"> 
	        <li class="hover">
	          <a href="<%=request.getContextPath()%>/MposRatManager/list.do?isFirstLoad=true">
	            <i class="menu-icon fa fa-caret-right"></i>
	          代理商费率套餐管理
	          </a>
	
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_TIMELYACCOUNT_002!=null }">
	        <li class="hover">
	          <a href="<%=request.getContextPath()%>/MobMecTimelyAccount/list.do?orgProp=2&isFirstLoad=true">
	            <i class="menu-icon fa fa-caret-right"></i>
	          商户即刷即到查询
	          </a>
	
	          <b class="arrow"></b>
	        </li>
        </c:if>
        
        <c:if test="${loginUserPermission.SMSA_MOBPOS_UNBIND_001!=null }">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/mecIfHandPos/toQueryHandPosList.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                           手刷解绑
          </a>

          <b class="arrow"></b>
         </li>
       </c:if>
		 <c:if test="${loginUserPermission.SMS_HANDSETTLE_002!=null }">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/posHandSettle/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                           手刷结算汇总查询
          </a>
          <b class="arrow"></b>
         </li>
        </c:if>
        <c:if test="${loginUserPermission.SMS_POSHANDTRADE_02!=null}">
   	     <li class="hover">
          <a href="<%=request.getContextPath()%>/posHandTrade/listView.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                           手刷交易查询
          </a>
          <b class="arrow"></b>
         </li>
         </c:if>
         <c:if test="${loginUserPermission.SMSA_AGENTJOYTYPE_001!=null}">
         <li class="hover newAgentHidden">
          <a href="/agentJoyType/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                           代理商欢乐送类型管理
          </a>
          <b class="arrow"></b>
         </li>
        </c:if>
	   </ul>
    </li>
    </c:if>
    <!-- 手刷END -->
    <!-- 其他消费商户管理start -->
    <c:if test="${(loginUserPermission.SMS_VVMEC_001 != null || loginUserPermission.SMSA_VVMODIFY_01!=null) && pbCheck==false }">
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-list"></i>
        <span class="menu-text">VV商户管理</span>
        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>

      <ul class="submenu can-scroll ace-scroll scroll-disabled" style="">
       <c:if test="${loginUserPermission.SMS_VVMEC_001!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/vvMecIf/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
             VV商户查询
          </a>
          <b class="arrow"></b>
        </li>
       </c:if>  
         <c:if test="${loginUserPermission.SMSA_VVMODIFY_01!=null }">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/vvMecIfModify/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
          VV商户归属修改
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
      </ul>
    </li>
   </c:if>
    <!-- 其他消费商户管理end -->
    <c:if test="${loginUserPermission.SMSA_QUERY_008!=null ||loginUserPermission.SMSA_QUERY_009!=null ||loginUserPermission.SMSA_QUERY_010!=null 
    	||loginUserPermission.SMSA_QUERY_011!=null || loginUserPermission.SMSA_QUERY_022!=null 
    	||loginUserPermission.SMS_POSMEC_DOWN_001!=null ||loginUserPermission.SMS_MOBMEC_DOWN_001!=null  || loginUserPermission.SMS_QUERY_041!=null 
   || 	loginUserPermission.SMSA_POS_029!=null || loginUserPermission.SMSA_INTRO_01!=null ||
   loginUserPermission.SMSA_PRIZE_01!=null }">
    <li class="hover" >
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-list"></i>
        <span class="menu-text"> 商户查询 </span>
        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>

      <ul class="submenu can-scroll ace-scroll scroll-disabled" style="">
      <c:if test="${loginUserPermission.SMSA_QUERY_008!=null }">
	        <li class="hover">
	          <a href="<%=request.getContextPath()%>/mecIf/listView.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            商户查询
	          </a>
	          <b class="arrow"></b>
	        </li>
      </c:if>
      <c:if test="${loginUserPermission.SMSA_QUERY_009!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/mecIfTrade/listView.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户交易查询
          </a>
          <b class="arrow"></b>
        </li>
     </c:if>    
      <c:if test="${loginUserPermission.SMSA_NOSTANDARD_ELEMENT_001!=null }">
      	<li class="hover">
      	 	<a href="<%=request.getContextPath()%>/noStandard/listView.do">
          	 	<i class="menu-icon fa fa-caret-right"></i>
         			非标商户管理
          	</a>
          	<b class="arrow"></b>
     	</li>
     </c:if>
     
    <!-- delete by lcf 20160630 删除商户工单查询功能 SMS-1372 -->
   <!--  <c:if test="${loginUserPermission.SMSA_QUERY_018!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/mecIfWorkOrder/listView.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户工单查询
          </a>
          <b class="arrow"></b>
        </li>
	</c:if>--> 

     
     <c:if test="${loginUserPermission.SMSA_QUERY_010!=null}">
        <li class="hover">
         <a href="<%=request.getContextPath()%>/mecIfSettle/listView.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户结算查询
          </a>
          <b class="arrow"></b>
        </li>
      </c:if>
      
      <c:if test="${loginUserPermission.SMSA_POS_029!=null}">
        <li class="hover">
         <a href="<%=request.getContextPath()%>/mecIf/mecIfPosMgr.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户POS管理
          </a>
          <b class="arrow"></b>
        </li>
      </c:if>
      <c:if test="${loginUserPermission.SMSA_QUERY_011!=null }">
        <li class="hover">

          <a href="<%=request.getContextPath()%>/mecIf/listSearch.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户归属修改
          </a>

          <b class="arrow"></b>
        </li>
      </c:if> 
	  <!--
      <c:if test="${loginUserPermission.SMSA_QUERY_022!=null}">
        <li class="hover">
         <a href="<%=request.getContextPath()%>/mecIf/toExportDown.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户信息导出
          </a>
          <b class="arrow"></b>
        </li>
      </c:if>
	  -->
      <c:if test="${loginUserPermission.SMSA_COMPLIANC_001!=null }">
      <li class="hover">
         <a href="<%=request.getContextPath() %>/MerchantComplianceManage/toQueryMercComplianceList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户追偿核算
          </a>
          <b class="arrow"></b>
        </li>
       </c:if>	  	
     <c:if test="${loginUserPermission.SMS_POSMEC_DOWN_001!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/imageUpload/downloadPosIndex.do">
            <i class="menu-icon fa fa-caret-right"></i>
         进件图片下载
          </a>
          <b class="arrow"></b>
        </li>
     </c:if>
     <c:if test="${loginUserPermission.SMS_MOBMEC_DOWN_001!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/imageUpload/downloadMobIndex.do">
            <i class="menu-icon fa fa-caret-right"></i>
         手刷商户实名认证照片下载
          </a>
          <b class="arrow"></b>
        </li>
     </c:if>
        <c:if test="${loginUserPermission.SMS_QUERY_041!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/mecIf/agreementView.do">
            <i class="menu-icon fa fa-caret-right"></i>
                       商户电子协议查询
          </a>
          <b class="arrow"></b>
        </li>
      </c:if>
      <c:if test="${loginUserPermission.SMSA_INTRO_01!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/mecIf/adminMecIntroductionList.do?isFirstLoad=true">
            <i class="menu-icon fa fa-caret-right"></i>
                       商户转介绍查询
          </a>
          <b class="arrow"></b>
        </li>
      </c:if>
      <c:if test="${loginUserPermission.SMSA_PRIZE_01!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/mecIf/adminMecRewordList.do?isFirstLoad=true">
            <i class="menu-icon fa fa-caret-right"></i>
                       推荐商户奖励查询
          </a>
          <b class="arrow"></b>
        </li>
      </c:if>			
      </ul><div class="scroll-track scroll-detached no-track scroll-thin scroll-margin scroll-visible" style="display: none; top: 1px; left: 288px;"><div class="scroll-bar" style="top: 0px;"></div></div>
    </li>
</c:if>

  <%--   <c:if test="${loginUserPermission.SMS_FlowGg_001!=null}">
   <li class="hover" style="display: none;">
      <a href="#"  class="dropdown-toggle">
        <i class="menu-icon fa fa-file-o"></i>
        <span class="menu-text">
                                           流动广告管理
        </span>
      </a>
      <b class="arrow"></b>
      <ul class="submenu can-scroll">
           <c:if  test="${loginUserPermission.SMS_FlowGg_001!=null }">   
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/flow/advertisement.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            流动广告查询
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
      </ul>
     
    </li>
</c:if> --%>

<c:if test="${pbCheck==false }">
   <c:if test="${loginUserPermission.SMSA_EMP_TRANSFER_01!=null ||loginUserPermission.SMSA_EMP_INFO_01 !=null }">
 <li class="hover">
      <a href="#" class="dropdown-toggle" >
        <i class="menu-icon fa fa-pencil-square-o"></i>
        <span class="menu-text">业务员管理</span>

        <b class="arrow fa fa-angle-down"></b>
      </a>

      <b class="arrow"></b>

      <ul class="submenu can-scroll ace-scroll scroll-disabled" style="">
   <c:if test="${loginUserPermission.SMSA_EMP_TRANSFER_01 != null}">
     <li class="hover">
     <a href="<%=request.getContextPath()%>/sspEmpRegister/sspEmpRegisterList.do?entry=0"> 
     <i class="menu-icon fa fa-caret-right"></i> 
   业务员划拨管理
   </a> 
   <b class="arrow"></b>
   </li>
   </c:if>   
   
   
   <c:if test="${loginUserPermission.SMSA_EMP_INFO_01 != null}">
   <li class="hover newAgentHidden">
     <a href="<%=request.getContextPath()%>/empInfo/empInfoList.do?entry=0"> 
     <i class="menu-icon fa fa-caret-right"></i> 
   业务员信息查询
	 </a> 
	 <b class="arrow"></b>
	 </li>
 	 </c:if>
       </ul>
       </li>
</c:if>
</c:if>
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

<c:if test="${loginUserPermission.SMSA_PROFIT_001!=null ||loginUserPermission.SMSA_PROFIT_004!=null ||loginUserPermission.SMSA_PROFIT_010!=null 
	||loginUserPermission.SMSA_PROFIT_013!=null ||loginUserPermission.SMSA_PROFIT_014!=null ||loginUserPermission.SMSA_PROFIT_015!=null}">
   <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-pencil-square-o"></i>
        <span class="menu-text"> 分润管理 </span>

        <b class="arrow fa fa-angle-down"></b>
      </a>

      <b class="arrow"></b>

      <ul class="submenu can-scroll ace-scroll scroll-disabled" style="">
      <c:if test="${loginUserPermission.SMSA_PROFIT_001!=null}">
	       <li class="hover newAgentHidden">
	          <a href="<%=request.getContextPath()%>/profitLevel/list.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            分润等级设置
	          </a>
	
	          <b class="arrow"></b>
	        </li>
       </c:if>       
        <c:if test="${loginUserPermission.SMSA_PROFIT_045!=null}">
        <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath()%>/profitArea/profitOrglist.do">
            <i class="menu-icon fa fa-caret-right"></i>
            分润机构设置
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_PROFIT_037!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/profitLoss/lossImportList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            每月损失同步
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_PROFIT_026!=null}">
         <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath()%>/orgTradeSumNew/orgProfitNew.do">
            <i class="menu-icon fa fa-caret-right"></i>
            代理商分润查询(新)
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_PROFIT_013!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/mecTradeSum/mecList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户日交易查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
         <c:if test="${loginUserPermission.SMSA_PROFIT_015!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/mecTradeSum/mecMonthList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户月交易查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
         <c:if test="${loginUserPermission.SMSA_PROFIT_017!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/empTradeSum/empList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            业务员日交易查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_PROFIT_019!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/empTradeSum/empMonthList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            业务员月交易查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_PROFIT_021!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/orgTradeSum/orgList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            机构日交易查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
         <c:if test="${loginUserPermission.SMSA_PROFIT_023!=null}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/orgTradeSum/orgMonthList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            机构月交易查询
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
      </ul>
    </li>
</c:if>

<c:if test="${loginUserPermission.SMSA_IC_CARD_001!=null ||loginUserPermission.SMSA_OMS_001!=null ||loginUserPermission.SMSA_OMS_002!=null ||loginUserPermission.SMSA_OMS_003!=null ||loginUserPermission.SMSA_POS_020!=null ||loginUserPermission.SMSA_OMS_008!=null ||loginUserPermission.SMSA_OMS_009!=null ||loginUserPermission.SMSA_OMS_004!=null ||loginUserPermission.SMSA_OMS_005!=null ||loginUserPermission.SMSA_OMS_006!=null ||loginUserPermission.SMSA_OMS_007!=null ||loginUserPermission.SMS_SIMCARD_001!=null || loginUserPermission.SMSA_DEVICELIMIT_001!=null ||loginUserPermission.SMSA_POSSIMMAPPING_001!=null || loginUserPermission.SMSA_SUBMODEL_001!=null}">

    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-calendar"></i>
        <span class="menu-text">
            终端管理
        </span>
        <b class="arrow fa fa-angle-down"></b>
      </a>

      <b class="arrow"></b>
      <ul class="submenu can-scroll ace-scroll scroll-disabled" style="">
      <c:if test="${loginUserPermission.SMSA_IC_CARD_001!=null}">
			<li class="hover"><a href="/IcCardManage/toQueryCardList.do">
					<i class="menu-icon fa fa-caret-right"></i> IC卡操作
			</a> <b class="arrow"></b></li>
		</c:if>
       <%--密钥预灌装取消迁移  <li class="hover">
        	<a href="<%=request.getContextPath() %>/device/sKeyImport/list">
            <i class="menu-icon fa fa-caret-right"></i>
            	密钥预灌装     </a>

          <b class="arrow"></b>
        </li> --%>
		<c:if test="${loginUserPermission.SMSA_OMS_001!=null}">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/device/sKeyExport/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
            	密钥导出     </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_002!=null}">
 		<li class="hover">
        	<a href="<%=request.getContextPath() %>/device/deviceInStockOrder/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
            	终端附件入库     </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_003!=null}">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/device/posdevice/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
            	终端设备管理     </a>

          <b class="arrow"></b>
        </li>
        </c:if>
       <c:if test="${loginUserPermission.SMSA_POS_020!=null}">
       <li class="hover">
          <a href="<%=request.getContextPath() %>/deviceBatchIntake/toDeviceBatchIntake.do">
            <i class="menu-icon fa fa-caret-right"></i>
            	携机入库
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_008!=null}">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/manufacturer/view.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                   厂商管理
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_009!=null}">
        <li class="hover">
          <a href="<%=request.getContextPath() %>/posModel/posModelManager.do">
            <i class="menu-icon fa fa-caret-right"></i>
           	 型号管理
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
         <c:if test="${loginUserPermission.SMSA_OMS_004!=null}">
        <li class="hover">
       	<a href="<%=request.getContextPath() %>/deviceOperateLog/view.do">
           <i class="menu-icon fa fa-caret-right"></i>
                                  终端历史数据查询
         </a>
         <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_005!=null}">
         <li class="hover">
        	<a href="<%=request.getContextPath() %>/attachmentDevices/view.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                 附件设备管理
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_006!=null}">
       <li class="hover">
          <a href="<%=request.getContextPath() %>/posTransferAdmin/queryTransferListView.do">
            <i class="menu-icon fa fa-caret-right"></i>
           	划拨单查询
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_OMS_007!=null}">
          <li class="hover">
          <a href="<%=request.getContextPath() %>/BatchTransfer/queryBatchTransferOrder">
            <i class="menu-icon fa fa-caret-right"></i>
             	批量划拨管理
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMS_SIMCARD_001!=null}">
          <li class="hover newAgentHidden">
        	<a href="<%=request.getContextPath() %>/SimCard/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
           SIM卡管理
          </a>
          <b class="arrow"></b>
          </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_DEVICELIMIT_001!=null}">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/deviceLimit/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
           终端限制管理
          </a>
          <b class="arrow"></b>
          </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_POSSIMMAPPING_001!=null}">
        <li class="hover newAgentHidden">
        	<a href="<%=request.getContextPath() %>/posSimMapping/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
           机卡绑定信息查询
          </a>
          <b class="arrow"></b>
          </li>
       </c:if>
       <c:if test="${loginUserPermission.SMSA_SUBMODEL_001!=null}">
        <li class="hover newAgentHidden">
        	<a href="<%=request.getContextPath() %>/subModel/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
           小型号管理
          </a>
          <b class="arrow"></b>
          </li>
       </c:if>
       <c:if test="${loginUserPermission.SMSA_TSS_STOCKMANAGE_001!=null}">
        <li class="hover newAgentHidden">
        	<a href="<%=request.getContextPath() %>/stockManage/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
           库存管理
          </a>
          <b class="arrow"></b>
          </li>
       </c:if>
      </ul>
    </li>
 </c:if>
 <c:if test="${loginUserPermission.SMSA_POS_001!=null||loginUserPermission.SMSA_POS_011!=null||loginUserPermission.SMSA_ONLINE_PAY_001!=null||loginUserPermission.SMSA_POS_005!=null ||loginUserPermission.SMSA_ORDERCHANDE_001!=null ||loginUserPermission.SMSA_GOODS_PRICE_01!=null ||loginUserPermission.SMSA_PAYLOG_001!=null ||loginUserPermission.SMSA_CREDIT_01!=null|| loginUserPermission.SMSA_BOND_CONFIRM_PAY!=null || loginUserPermission.ORDER_LIMIT_CONFIG!=null}">

 	<li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-pencil"></i>
        <span class="menu-text">订购管理</span>
        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>
      <ul class="submenu can-scroll">
      <c:if test="${loginUserPermission.SMSA_GOODS_PRICE_01!=null}">
       <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath() %>/goodsPriceManage/goodsPriceList.do?pattern=2&isFirstLoad=true" >
            <i class="menu-icon fa fa-caret-right"></i>
         物品价格—两方 
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_GOODS_PRICE_02!=null}">
       <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath() %>/goodsPriceManage/goodsPriceList.do?pattern=3&isFirstLoad=true" >
            <i class="menu-icon fa fa-caret-right"></i>
         物品价格—三方
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
      <c:if test="${loginUserPermission.SMSA_CREDIT_01!=null}">
       <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath() %>/credit/creditList.do?isFirstLoad=true" >
            <i class="menu-icon fa fa-caret-right"></i>
         赊购管理
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
       <c:if test="${loginUserPermission.SMSA_POS_001!=null}">
        <li class="hover newAgentHidden">
        	<a href="<%=request.getContextPath() %>/posOrderAdmin/orderList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            订单管理
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_POS_011!=null }">
        <li class="hover newAgentHidden">
        	<a href="<%=request.getContextPath() %>/posOrderAdmin/orderListForConfirmPage.do">
            <i class="menu-icon fa fa-caret-right"></i>
            收款确认
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_ONLINE_PAY_001!=null }">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/onlinePayment/onlinePayLogList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            在线支付对账
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_POS_005!=null}">
        <li class="hover newAgentHidden">
        	<a href="<%=request.getContextPath() %>/posTransferAdmin/queryTransferList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            发货管理
          </a>

          <b class="arrow"></b>
        </li>
       </c:if>
        <c:if test="${loginUserPermission.SMSA_BOND_CONFIRM_PAY!=null}">
        <li class="hover">
        	<a href="<%=request.getContextPath() %>/bond/manage/bondsConfirmList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            保证金收款确认
          </a>

          <b class="arrow"></b>
        </li>
       </c:if>
       <c:if test="${loginUserPermission.SMSA_ORDERCHANDE_001!=null}">
        <li class="hover newAgentHidden">
        	<a href="<%=request.getContextPath() %>/orderChange/queryOrderList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            订单改价
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_PAYLOG_001!=null}">
        <li class="hover newAgentHidden">
        	<a href="<%=request.getContextPath() %>/simCardPayLog/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
           缴费流水查询
          </a>
          <b class="arrow"></b>
          </li>
        </c:if>
        <c:if test="${loginUserPermission.ORDER_LIMIT_CONFIG != null}">
        <li class="hover newAgentHidden">
        	<a href="<%=request.getContextPath() %>/orderLimitConfig/orderLimitConfigList.do?flag=true">
            <i class="menu-icon fa fa-caret-right"></i>
           订购限额设置
          </a>
          <b class="arrow"></b>
          </li>
        </c:if>
        </ul>
 </c:if>
 
 
 <c:if test="${loginUserPermission.SMSA_FLOW_001!=null ||loginUserPermission.SMSA_MERCINCOME_FORBID_01!=null
 || loginUserPermission.SMSA_QUERY_015!=null ||loginUserPermission.SMSA_DRESTRICT_TIMES_01!=null ||loginUserPermission.SMSA_DRESTRICT_EXCEPTION_01!=null 
 || loginUserPermission.SMSA_SSP_TASKEND_01!=null ||loginUserPermission.SMSA_TASKCOUNT_001!=null || loginUserPermission.SMSA_AGENT_043!=null ||loginUserPermission.SMSA_ENREGISTER_RULE_01!=null 
 || loginUserPermission.SMSA_FLOW_073!=null || loginUserPermission.SMSA_FORBID_001!=null || loginUserPermission.SMSA_FORBID_RULE_001!=null ||loginUserPermission.SMSA_ASSIGN_01!=null
 || loginUserPermission.SMSA_COMMON_026!=null || loginUserPermission.SMSA_TASK_ENTRUSTINFO_01!=null ||loginUserPermission.SMSA_TASK_ENTRUSTINFO_01!=null  ||loginUserPermission.SMSA_DRESTRICT_EXPORT_01!=null }">

    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-tag"></i>
        <span class="menu-text"> 流程管理 </span>

        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>
      <ul class="submenu can-scroll">
      <c:if test="${loginUserPermission.SMSA_QUERY_015!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/mecIfDatum/listView.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户资料查询
          </a>
          <b class="arrow"></b>
        </li>
    </c:if>
     <c:if test="${loginUserPermission.SMSA_DRESTRICT_TIMES_01!=null && pbCheck==false }">
          <li class="hover newAgentHidden">
            <a href="<%=request.getContextPath() %>/dRestrictTimes/dRestrictTimesList.do"   >
              <i class="menu-icon fa fa-caret-right"></i>
              重复次数限制
            </a>
            <b class="arrow"></b>
          </li>
      </c:if>
      <c:if test="${loginUserPermission.SMSA_DRESTRICT_EXCEPTION_01!=null &&pbCheck==false }">
          <li class="hover newAgentHidden">
            <a href="<%=request.getContextPath() %>/dRestrictException/dRestrictExceptionList.do" >
              <i class="menu-icon fa fa-caret-right"></i>
              重复次数例外限制
            </a>
            <b class="arrow"></b>
          </li>
      </c:if>
      <c:if test="${loginUserPermission.SMSA_SSP_TASKEND_01 != null &&pbCheck==false}">
  
      <li class="hover newAgentHidden">
            <a href="<%=request.getContextPath() %>/mercIncomeEntering/taskEndList.do">
              <i class="menu-icon fa fa-caret-right"></i>
              结束工单管理
            </a>
            <b class="arrow"></b>
          </li>

      </c:if>
      <c:if test="${loginUserPermission.SMSA_TASKCOUNT_001!=null&&pbCheck==false}">
	        <li class="hover newAgentHidden">
	          <a href="<%=request.getContextPath() %>/taskCount/taskCountList.do?entry=mercIncome" >
	            <i class="menu-icon fa fa-caret-right"></i>
	            审单工作量统计
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if> 
         <c:if test="${loginUserPermission.SMSA_AGENT_043!=null&&pbCheck==false}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/mercIncome/tipsInfoExport.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	                                              修改提示信息导出
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        
        <c:if test="${loginUserPermission.SMSA_ENREGISTER_RULE_01!=null&&pbCheck==false}">
        <li class="hover">
          <a href="<%=request.getContextPath() %>/enregisterInfo/enregisterInfoRuleList.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                           通用规则管理
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
   <%--     <c:if test="${loginUserPermission.SMSA_FLOW_073!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/centerCManage/listView.do">
            <i class="menu-icon fa fa-caret-right"></i>
            审单人员管理
          </a>

          <b class="arrow"></b>
        </li>
        </c:if> --%>
        <c:if test="${loginUserPermission.SMSA_FORBID_001!=null&&pbCheck==false}">
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/forbidAudit/forbidAuditView.do"   >
	            <i class="menu-icon fa fa-caret-right"></i>
	            禁审工单管理
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_FORBID_RULE_001!=null&&pbCheck==false}">
          <li class="hover newAgentHidden">
            <a href="<%=request.getContextPath() %>/sspForbidAuditRule/sspForbidAuditRuleList.do"   >
              <i class="menu-icon fa fa-caret-right"></i>
              禁审工单规则管理
            </a>
            <b class="arrow"></b>
          </li>
        </c:if>
     <%--  <c:if test="${loginUserPermission.SMSA_COMMON_026!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/authenticationBank/toEditorBank.do">
            <i class="menu-icon fa fa-caret-right"></i>
              鉴权银行维护
          </a>

          <b class="arrow"></b>
        </li>
        </c:if> --%>
     <c:if test="${loginUserPermission.SMSA_TASK_ENTRUSTINFO_01!=null&&pbCheck==false}">
      <li class="hover newAgentHidden">
            <a href="<%=request.getContextPath() %>/mercIncomeEntering/listView.do">
              <i class="menu-icon fa fa-caret-right"></i>
              工单委托记录查询
            </a>
            <b class="arrow"></b>
          </li> 
        </c:if>
    <c:if test="${loginUserPermission.SMSA_ASSIGN_01!=null&&pbCheck==false}">
	        <li class="hover newAgentHidden">
	          <a href="<%=request.getContextPath() %>/mercIncomeEntering/assignView.do?entry=mercIncomeEntering"   >
	            <i class="menu-icon fa fa-caret-right"></i>
	    账号办理中工单统计
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
        
      <c:if test="${loginUserPermission.SMSA_DRESTRICT_EXPORT_01!=null&&pbCheck==false}">
          <li class="hover newAgentHidden">
            <a href="<%=request.getContextPath() %>/dRestrictTimesExport/exportView.do" >
              <i class="menu-icon fa fa-caret-right"></i>
              重复次数导出
            </a>
            <b class="arrow"></b>
          </li>
      </c:if>
      </ul>
    </li>
</c:if>
    
   
  <c:if test="${loginUserPermission.SMSA_INSPECTION_RISK_01!=null ||loginUserPermission.SMSA_VVMECIFCHECK_001!=null && pbCheck==false || loginUserPermission.SMSA_SMALLMERCUPDATE_01!=null
 ||loginUserPermission.SMSA_MOB_002!=null || loginUserPermission.SMS_AUDIT_01!=null || loginUserPermission.SMSA_POSOPEN_01!=null || loginUserPermission.SMSA_AUDIT_04!=null ||loginUserPermission.SMSA_FLOW_067!=null
 ||loginUserPermission.SMSA_FOUR_ELEMENT_001!=null || loginUserPermission.SMSA_MPOS_MERCINCOME_001!=null}">

    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-tag"></i>
        <span class="menu-text"> 审核流程</span>

        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>
      <ul class="submenu can-scroll">
      
    <c:if test="${loginUserPermission.SMSA_INSPECTION_RISK_01 != null}">
        <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath()%>/mercIncomeEntering/mercIncomeEnteringList.do">
            <i class="menu-icon fa fa-caret-right"></i>
            商户流程管理
          </a>
          <b class="arrow"></b>
        </li>
	</c:if>
        <c:if test="${loginUserPermission.SMSA_VVMECIFCHECK_001!=null && pbCheck==false}">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/vvMecIfCheck/vvMecIfCheckList.do">
            <i class="menu-icon fa fa-caret-right"></i>
          信息审核
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>
		<c:if test="${loginUserPermission.SMSA_MOB_002!=null  && pbCheck==false}">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/mobMercAuthAdmin/realNamCheckList.do?isFirstLoad=true">
            <i class="menu-icon fa fa-caret-right"></i>
            二代手刷实名认证审核
          </a>
          <b class="arrow"></b>
        </li>
     </c:if>
	 <c:if test="${loginUserPermission.SMS_AUDIT_01!=null  && pbCheck==false}">
     <li class="hover">
          <a href="<%=request.getContextPath()%>/businessLicence/businessLicenceList.do?isFirstLoad=true">
            <i class="menu-icon fa fa-caret-right"></i>
         商户认证信息审核
          </a>
          <b class="arrow"></b>
        </li>	
        </c:if>
		<c:if test="${loginUserPermission.SMSA_POSOPEN_01!=null  && pbCheck==false}">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/posOpenAuth/posOpenAuthList.do?isFirstLoad=true">
            <i class="menu-icon fa fa-caret-right"></i>
                       大POS自动秒到审核
          </a>
          <b class="arrow"></b>
        </li>
      </c:if>
	  <c:if test="${loginUserPermission.SMSA_AUDIT_04!=null}" >
     <li class="hover" >
     <a href="<%=request.getContextPath()%>/salesmanCheck/salesCheckList.do?isFirstLoad=true"> 
     <i class="menu-icon fa fa-caret-right"></i> 
     业务员认证信息审核
	 </a> 
	 <b class="arrow"></b>
	 </li>
 	 </c:if>
	<%--  <c:if test="${loginUserPermission.SMSA_FLOW_067!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/identityDetail/toNameAndCardid.do">
            <i class="menu-icon fa fa-caret-right"></i>
            身份证验证
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
		 <!-- add by hss 2016-03-22 -->
       <c:if test="${loginUserPermission.SMSA_FOUR_ELEMENT_001!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/identityDetailFour/toNameAndCardidFour.do">
            <i class="menu-icon fa fa-caret-right"></i>
        四要素校验
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
            --%>
        <c:if test="${loginUserPermission.SMSA_SMALLMERCUPDATE_01!=null && pbCheck ==false }">
        <li class="hover">
          <a href="<%=request.getContextPath() %>/smallMercUpdate/ordersList.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                          小微商户快速修改信息审核
		</a>
          <b class="arrow"></b>
        </li>
        </c:if>
        
   <c:if test="${loginUserPermission.SMSA_CHECKAGESET_0C1!=null}">
        <li class="hover">
          <a href="/checkAgeSet/init.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                           审单年龄设置
          </a>
          <b class="arrow"></b>
        </li>
    </c:if>
        
    <c:if test="${loginUserPermission.SMSA_CHECKAGESET_0C2!=null}">
        <li class="hover">
          <a href="/checkAgeSet/exceptInit.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                           审单年龄例外设置

          </a>
          <b class="arrow"></b>
        </li>
    </c:if>
    <c:if test="${loginUserPermission.SMSA_MPOS_MERCINCOME_001!=null  && pbCheck==false	}">
         <li class="hover">
          <a href="<%=request.getContextPath()%>/mposMercIncomeList/realNamCheckList.do">
            <i class="menu-icon fa fa-caret-right"></i>
           MPOS商户认证审核
          </a>
          <b class="arrow"></b>
        </li>
        </c:if>

      </ul>
    </li>
</c:if> 
   
   
<c:if test="${loginUserPermission.RISKCLUEPROVIDE_ELEMENT_001!=null || loginUserPermission.UNIONPAYRECOVERYQUERY_001!=null}">
<!-- add by liyang  -->
	<li class="hover"><a href="#" class="dropdown-toggle"> <i
			class="menu-icon fa fa-tag"></i> <span class="menu-text">风险管理</span>
			<b class="arrow fa fa-angle-down"></b>
	</a> <b class="arrow"></b>
		<ul class="submenu can-scroll">
			<c:if
				test="${loginUserPermission.RISKCLUEPROVIDE_ELEMENT_001!=null}">
				<li class="hover newAgentHidden"><a
					href="<%=request.getContextPath()%>/riskClueProvide/queryList.do">
						<i class="menu-icon fa fa-caret-right"></i>风控线索管理</a><b class="arrow"></b></li>
			</c:if>

			<c:if
				test="${loginUserPermission.UNIONPAYRECOVERYQUERY_001!=null}">
				<li class="hover newAgentHidden"><a
					href="<%=request.getContextPath()%>/recoveryQuery/queryList.do">
						<i class="menu-icon fa fa-caret-right"></i>银联追偿管理</a><b class="arrow"></b></li>
			</c:if>
			    <c:if test="${loginUserPermission.SMSA_RECTIFICATION_01!=null}">
        <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath()%>/autonomouslyRectification/autonomouslyRectificationList?entry=0">
            <i class="menu-icon fa fa-caret-right"></i>
           自主合规整改审核
          </a>
          <b class="arrow"></b>
        </li>
      </c:if>
		</ul>
	</li>
</c:if>
<c:if test="${loginUserPermission.SMSA_COMMON_010!=null ||loginUserPermission.SMSA_COMMON_016!=null }">
   <li class="hover">
      <a href="#"  class="dropdown-toggle">
        <i class="menu-icon fa fa-file-o"></i>

        <span class="menu-text">
            文件资料


        </span>

      </a>

      <b class="arrow"></b>
      <ul class="submenu can-scroll">
      <c:if test="${loginUserPermission.SMSA_COMMON_010!=null}">
        <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath() %>/file/fileTypeList.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                           文件分类管理
          </a>

          <b class="arrow"></b>
          
        </li>
        </c:if>
        <c:if test="${loginUserPermission.SMSA_COMMON_016!=null}">
         <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath() %>/file/fileList.do">
            <i class="menu-icon fa fa-caret-right"></i>
                                           文件内容管理
          </a>

          <b class="arrow"></b>
         </li>
         </c:if>
      </ul>

    </li>
</c:if>
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-tag"></i>
        <span class="menu-text"> 系统管理 </span>

        <b class="arrow fa fa-angle-down"></b>
      </a>

      <b class="arrow"></b>

      <ul class="submenu can-scroll">
      <c:if test="${loginUserPermission.SMSA_COMMON_005!=null}">
       <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath()%>/notice/list.do?isFirst=''">
            <i class="menu-icon fa fa-caret-right"></i>
            公告管理
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        
           <c:if test="${loginUserPermission.SMS_EmergencyNotice_001!=null}">
       <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath()%>/emergencyNotice/list.do">
            <i class="menu-icon fa fa-caret-right"></i>
                     紧急通知
          </a>

          <b class="arrow"></b>
        </li>
        </c:if> 
        
        <li class="hover hidden">
          <a href="<%=request.getContextPath() %>/employee/toUpdatePassword.do" id="updatePassword">
            <i class="menu-icon fa fa-caret-right"></i>
            密码修改
          </a>

          <b class="arrow"></b>
        </li>
              <c:if test="${loginUserPermission.SMSA_admin_001!=null}">
        
        <li class="hover">
          <a href="<%=request.getContextPath() %>/employee/adminList.do" id="updatePassword">
            <i class="menu-icon fa fa-caret-right"></i>
            权限设置
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        
        <!-- end by hss 2016-03-22 -->
        <c:if test="${loginUserPermission.SMSA_ADVERTISING_PICTURE_01!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath() %>/advertisingPicture/toUpload.do">
            <i class="menu-icon fa fa-caret-right"></i>
            广告图片配置
          </a>

          <b class="arrow"></b>
        </li>
       </c:if> 
	<c:if test="${loginUserPermission.SMSA_OP_QUESTION_001!=null}">
        <li class="hover">
          <a href="<%=request.getContextPath() %>/opQuestion/opQuestionHome.do?onlyShow=true">
            <i class="menu-icon fa fa-caret-right"></i>
           分公司问题问答
          </a>

          <b class="arrow"></b>
        </li>
       </c:if>
       
       <c:if test="${loginUserPermission.SMSA_GOLD_CONFIG_MRO!=null}">
		     <li class="hover">
			     <a href="<%=request.getContextPath()%>/goldMerchant/goldMecConfig.do"> 
			     <i class="menu-icon fa fa-caret-right"></i> 
			     	金牌产品配置
				 </a> 
				 <b class="arrow"></b>
			 </li>
	      </c:if>
      <c:if test="${loginUserPermission.SMSA_CSWORKORDER_NEW_001!=null}">
       <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath()%>/newWorkOrder/list.do?isFirstLoad=true">
            <i class="menu-icon fa fa-caret-right"></i>
           客服协办管理
          </a>

          <b class="arrow"></b>
          
        </li>
      </c:if>
       <c:if test="${loginUserPermission.SMSA_DI_ORGTEAM_OPERATOR_001!=null}">
        <li class="hover">
          <a href="<%=request.getContextPath() %>/orgTeam/orgTeamHome.do?onlyShow=true">
            <i class="menu-icon fa fa-caret-right"></i>
            拓展组管理      
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
        
       <c:if test="${loginUserPermission.SMSA_DI_TEAMREGION_OPERATOR_001!=null}">
        <li class="hover">
          <a href="<%=request.getContextPath() %>/orgTeam/regionMappingHome.do?onlyShow=true">
            <i class="menu-icon fa fa-caret-right"></i>
            拓展组区域管理         
          </a>

          <b class="arrow"></b>
        </li>
       </c:if>
       <c:if test="${loginUserPermission.SMSA_FLOW_067!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/identityDetail/toNameAndCardid.do">
            <i class="menu-icon fa fa-caret-right"></i>
            身份证验证
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
		 <!-- add by hss 2016-03-22 -->
       <c:if test="${loginUserPermission.SMSA_FOUR_ELEMENT_001!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/identityDetailFour/toNameAndCardidFour.do">
            <i class="menu-icon fa fa-caret-right"></i>
        四要素校验
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>	
         <c:if test="${loginUserPermission.SMSA_FLOW_073!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/centerCManage/listView.do">
            <i class="menu-icon fa fa-caret-right"></i>
            审单人员管理
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
         <c:if test="${loginUserPermission.SMSA_COMMON_026!=null }">
        <li class="hover">
          <a href="<%=request.getContextPath()%>/authenticationBank/toEditorBank.do">
            <i class="menu-icon fa fa-caret-right"></i>
              鉴权银行维护
          </a>

          <b class="arrow"></b>
        </li>
        </c:if>
           <c:if  test="${loginUserPermission.SMS_FlowGg_001!=null }">   
	        <li class="hover">
	          <a href="<%=request.getContextPath() %>/flow/advertisement.do">
	            <i class="menu-icon fa fa-caret-right"></i>
	            流动广告查询
	          </a>
	          <b class="arrow"></b>
	        </li>
        </c:if>
      </ul>
    </li>
    
   <%--  <c:if test="${loginUserPermission.SMSA_RECTIFICATION_01!=null}">
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-tag"></i>
        <span class="menu-text">自主合规整改</span>

        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>
      <ul class="submenu can-scroll">
      <c:if test="${loginUserPermission.SMSA_RECTIFICATION_01!=null}">
        <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath()%>/autonomouslyRectification/autonomouslyRectificationList?entry=0">
            <i class="menu-icon fa fa-caret-right"></i>
           自主合规整改审核
          </a>
          <b class="arrow"></b>
        </li>
      </c:if>
      </ul>
    </li>
    </c:if>
    
     --%>
    <c:if test="${loginUserPermission.SMSA_COMMON_023!=null}">
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-tag"></i>
        <span class="menu-text"> 意见建议 </span>

        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>
      <ul class="submenu can-scroll">
        <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath()%>/suggestion/toList.do?entry=0">
            <i class="menu-icon fa fa-caret-right"></i>
            意见建议
          </a>
          <b class="arrow"></b>
        </li>
      </ul>
    </li>
    </c:if>
    
    
    <c:if test="${loginUserPermission.SMSA_APPRAISAL_01!=null}">
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-tag"></i>
        <span class="menu-text"> 系统评价 </span>

        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>
      <ul class="submenu can-scroll">
        <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath()%>/mAppraisal/mAppraisalList.do?entry=0">
            <i class="menu-icon fa fa-caret-right"></i>
            系统评价
          </a>
          <b class="arrow"></b>
        </li>
      </ul>
    </li>
    </c:if>
    
    <c:if test="${loginUserPermission.SMSA_SUIYITONG_ADMIN_MANAGE !=null}">
    <li class="hover">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-tag"></i>
        <span class="menu-text"> 随意通管理 </span>

        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b>
      <ul class="submenu can-scroll">
        <li class="hover newAgentHidden">
          <a href="<%=request.getContextPath()%>/suiYiTongAdmin/suiYiTongCheckList">
            <i class="menu-icon fa fa-caret-right"></i>
            随意通审核数据管理
          </a>
          <b class="arrow"></b>
        </li>
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
