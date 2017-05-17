<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="pageContent">
	<div class="tabs" currentIndex="0" eventType="click">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>基本信息</span></a></li>
					<li><a href="javascript:;"><span>资质信息</span></a></li>
					<li><a href="javascript:;"><span>结算信息</span></a></li>
					<li><a href="javascript:;"><span>费用信息</span></a></li>
					<li><a href="javascript:;"><span>功能开通</span></a></li>
					<li><a href="javascript:;"><span>pos信息</span></a></li>
				</ul>
			</div>
		</div>
		<div class="tabsContent" style="height:450px;">
			<div class="pageFormContent" >
				 <p>
					<span>协议编号：${mstl.agrNo }</span>
				</p>
				<p>
					<span>商户类型：${minf.mercModStr }</span> <!-- 连锁的话  显示 总店 分店 -->
				</p>
				<p>
					<span>特殊商户：<c:if test="${minf.isXw eq '00'}">普通商户</c:if><c:if test="${minf.isXw eq '01'}">小微商户</c:if><c:if test="${minf.isXw eq '02'}">差错商户</c:if></span>
				</p>
				<p>
					<span>经营名称：${minf.cprOperNmCn }</span>
				</p>
				<p>
					<span>签购单名称：${minf.mecDisNm }</span>
				</p>
				<p>
					<span>经营地址：${minf.busAddr }</span>
				</p>
				<p>
					<span>经度：${locMapLong }</span>
				</p>
				<p>
					<span>纬度：${locMapLat }</span>
				</p>
				<p>
					<span>实际经营范围：${minf.nmgtScp }</span>
				</p>
				<p>
					<span>营业时间：${minf.busStrHourStr }至${minf.busEndHourStr }</span>
				</p>
				<p>
					<span>营业用地面积(平米)：${minf.busArea }</span>
				</p>
				<p>
					<span>联系人名称：${mstl.cttPsnCnm }</span>
				</p>
				<p>
					<span>联系人电话：${mstl.mblTel }</span>
				</p>
				<p>
					<span>商户客服电话：${minf.csTelNo }</span>
				</p>
				<p>
					<span>商户管理员手机号：${minf.mercOprMbl }</span>
				</p>
				<p>
					<span>商户扩展类型：${minf.mercSrcStr }</span> <!-- 代理商，机构代理   -->
				</p>
				<p>
					<span>商户拓展员名称：${minf.cusMgrNm }</span>
				</p>
				<p>
					<span>商户拓展员编号：${minf.cusMgr }</span>
				</p>
				<p>
					<span>行业大类：${minf.mercTrdDescStr }</span>
				</p>
				<p>
					<span>费率：${mfee.rat1 }%</span>
				</p>
				<p>
					<span>是否封顶：${mfee.mercFeecapFlg }</span>
				</p>
				<c:if test="${mfee.mercFeecapFlg eq '封顶' }">
				<p>
					<span>封顶值：${mfee.maxFeeAmt }</span>
				</p>
				</c:if>
				
				<table class="table" width="100%" layoutH="138">
					<thead>
						<tr>
							<th align="center">POS通讯方式</th>
							<th align="center">POS型号</th>
							<th align="center">POS数量(台)</th>
							<th align="center">POS终端租赁费(元/台)</th>
							<th align="center">是否带密码键盘</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${madi }" var="madi">
						<c:if test="${madi.mercPos1 > 0 }">
								<tr >
									<td style="border:1px solid  #969696;">
										<c:if test="${madi.posMesMod1 eq '01' }">GPRS</c:if>
										<c:if test="${madi.posMesMod1 eq '00' }">拨号</c:if>
				                        <c:if test="${madi.posMesMod1 eq '02' }">以太网</c:if>
				                        <c:if test="${madi.posMesMod1 eq '03' }">TD-LTE</c:if>
				                        <c:if test="${madi.posMesMod1 eq '04' }">CDMA</c:if>
				                        <c:if test="${madi.posMesMod1 eq '05' }">CDMA2000</c:if>
				                        <c:if test="${madi.posMesMod1 eq '06' }">WCDMA</c:if>
				                        <c:if test="${madi.posMesMod1 eq '07' }">TD_SCDMA</c:if>
				                        <c:if test="${madi.posMesMod1 eq '08' }">WIFI</c:if>
				                        <c:if test="${madi.posMesMod1 eq '09' }">FDD-LTE</c:if>
									</td>
									<td style="border:1px solid  #969696;">
										${madi.modNm1 }
									</td>
									<td style="border:1px solid  #969696;">${madi.mercPos1 }</td>
									<td style="border:1px solid  #969696;">${madi.posFee1 }</td>
									<td style="border:1px solid  #969696;"><c:if test="${madi.posPswFlg1 eq '00'}">否</c:if><c:if test="${madi.posPswFlg1 eq '01'}">是</c:if></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!--  ~~~~~~~分割线    ~~~~~~~~~~  -->
			<div class="pageFormContent">
				<p>
					<span>注册名称：${minf.cprRegNmCn }</span>
				</p>
				<p>
					<span>商户性质：${minf.mercTypStr }</span>
				</p>
				<p>
					<span>注册地址：${minf.regAddr }</span>
				</p>
				<p>
					<span>注册登记号：${minf.regId }</span>
				</p>
				<p>
					<span>营业执照有效期：<c:if test="${minf.busExpFlg eq '00' }">${minf.busStrDt }至${minf.busExpDt }</c:if><c:if test="${minf.busExpFlg eq '01' }">长期有效</c:if> </span>
				</p>
				<p>
					<span>法定代表姓名：${minf.crpNm }</span>
				</p>
				<p>
					<span>法人代表证件类型：
					<c:if test="${minf.crpIdTyp eq '00' }">身份证</c:if>
					<c:if test="${minf.crpIdTyp eq '03' }">军人证</c:if>
					<c:if test="${minf.crpIdTyp eq '04' }">警察证</c:if>
					<c:if test="${minf.crpIdTyp eq '05' }">港澳居民往来内地通行证</c:if>
					<c:if test="${minf.crpIdTyp eq '06' }">台湾居民来往大陆通行证</c:if>
					<c:if test="${minf.crpIdTyp eq '07' }">护照</c:if>
					<c:if test="${minf.crpIdTyp eq '99' }">其他</c:if>
					</span>
				</p>
				<p>
					<span>法人代表证件号码：${minf.crpIdNo }</span>
				</p>
				<p>
					<span>法人代表证件有效期：<c:if test="${mfee.crpidExpFlg eq '01' }">长期有效</c:if><c:if test="${mfee.crpidExpFlg eq '00' }">${mfee.crpidStrDt}至${mfee.crpidExpDt}</c:if></span>
				</p>
				<p>
					<span>税务登记号：${minf.taxRegNo }</span>
				</p>
				<table class="table" width="100%" layoutH="138">
				<thead>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<!--  ~~~~~~~分割线    ~~~~~~~~~~  -->
			<div class="pageFormContent">
				
				<p>
					<span>是否允许隔日对账：<c:if test="${minf.sattleFlag eq '0'}">不允许</c:if><c:if test="${minf.sattleFlag eq '1'}">允许</c:if></span>
				</p>
				<p>
					<span>结算天数：<c:if test="${mstl.stlTrfDays eq '1'}">T+1</c:if><c:if test="${mstl.stlTrfDays eq '3'}">T+3</c:if></span>
				</p>
				<p>
					<span>起始金额（元）：${mstl.stlBegAmt }</span>
				</p>
				<p>
				</p>
				<%--	<p>
					<span>资金结算方向：<c:if test="${mstl.vrtlFlg eq '1'}">结算至随行付支付账户</c:if><c:if test="${mstl.vrtlFlg eq '0'}">结算至银行卡</c:if></span><!-- 结算至随行付  显示三个可填空卡的信息-->
				</p>
				
				
				 <p>
					<span>结算账户类型：<c:if test="${mact.stlOacCls eq '0'}">对公</c:if><c:if test="${mact.stlOacCls eq '1'}">对私</c:if></span><!-- 有两个卡的信息就显示两个卡的信息 -->
				</p>
				<p>
					<span>结算银行名称：${mact.wcBnk }</span>
				</p>
				<p>
					<span>结算银行详细信息：${mact.opnBnkDesc }</span>
				</p>
				<p>
					<span>联行行号：${mact.wcLbnkNo }</span>
				</p>
				<p>
					<span>结算账号户名：${mact.bnkAcnm }</span>
				</p>
				<p>
					<span>结算帐号：${mact.stlOac }</span>
				</p> --%>
				<%-- 暂时不显示,需要在解开 <c:forEach var="ur" items="${urm}" varStatus="ss" ><!-- 结算至随行付信息 -->
					<p>
						<span>结算卡${ss.count}</span>
					</p>
				<p>
					<span>结算银行名称：${ur.bnkNm }</span>
				</p>
				<p>
					<span>结算银行详细信息：${ur.opnBnkDesc } </span>
				</p>
				<p>
					<span>联行行号：${ur.wcLbnkNo } </span>
				</p>
				<p>
					<span>结算账号户名：${ur.bnkAcnm } </span>
				</p>
				<p>
					<span>结算帐号：${ur.wdcOac }    </span>
				</p>
				</c:forEach>
				
				<c:forEach var="ur" items="${urmMact}" varStatus="ss" ><!-- 结算至银行卡信息 -->
					<p>
						<span>结算卡${ss.count}</span>
					</p>
					<p>
					<span>结算账户类型：<c:if test="${ur.stlOacCls eq '0'}">对公</c:if><c:if test="${mact.stlOacCls eq '1'}">对私</c:if></span><!-- 有两个卡的信息就显示两个卡的信息 -->
				</p>
				<p>
					<span>结算银行名称：${ur.bnkNm}</span>
				</p>
				<p>
					<span>结算银行详细信息：  ${ur.opnBnkDescMact}</span>
				</p>
				<p>
					<span>联行行号： ${ur.wcLbnkNoMact }</span>
				</p>
				<p>
					<span>结算账号户名:  ${ur.bnkAcnmMact }</span>
				</p>
				<p>
					<span>结算帐号：  ${ur.stlOac} </span>
				</p>
				</c:forEach> --%>
				
				<table class="table" width="100%" layoutH="138">
				<thead>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<!--  ~~~~~~~分割线    ~~~~~~~~~~  -->
			<div class="pageFormContent">
				<p>
					<span>是否收取维护费：<c:if test="${mfee.maintChargeFlg eq '01' }">收取</c:if><c:if test="${mfee.maintChargeFlg eq '00' }">不收</c:if></span>
				</p>
				<p>
					<span>押金：${minf.mercDpsAmt }</span>
				</p>
				<table class="table" width="100%" layoutH="138">
				<thead>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<!--  ~~~~~~~分割线    ~~~~~~~~~~  -->
			<div class="pageFormContent">
				
					<span>开通高汇通储值卡：${minf.acqTypGao }</span>
				
				<br/><br/>
				<br/>
					<span>开通北京中行外卡：${minf.mercTxnClsStr }</span>
					<c:if test="${minf.mercTxnClsStr eq '已开通' }"><br/><br/>
						<span>
							<c:if test="${minf.mercTxnClsStr1 eq '1111' }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一般刷卡</c:if>
							<c:if test="${minf.mercTxnClsStr2 eq '1111' }">预授权</c:if>
							<c:if test="${minf.mercTxnClsStr3 eq '1' }">在线退货</c:if>
						</span>
					</c:if>
				
				<br/><br/><br/>
				
					<span>开通北京交行外卡：${minf.acqTypBc }</span>
					<br/><br/><br/>
					<span>开通非工作日结算：${minf.d1 }</span>
					<br/><br/><br/>
					<span>开通随意通：${minf.t0 }</span>
				<table class="table" width="100%" layoutH="138">
				<thead>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<!--  ~~~~~~~分割线    ~~~~~~~~~~  -->
			<div class="pageFormContent" >
				<span>此商户共申请${posCntCountInt }台pos，其中${mercPosCnt2IntG }台无线，${mercPosCnt2IntL }台有线</span>
				<br><br><span>此商户共绑定${posListsBindedSize }台pos，其中${posListsBindedCountG }台无线，${posListsBindedCountL }台有线</span>
				<br><br>
				<c:if test="${!empty posListsBinded }">
				<table class="table" width="100%" layoutH="138">
					<thead>
						<tr>
							<th align="center">机具型号</th>
							<th align="center">终端号</th>
							<th align="center">终端序列号</th>
							<th align="center">密码键盘型号</th>
							<th align="center">密码键盘序列号</th>
							<th align="center">SIM卡号</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${posListsBinded }" var="pos">
							<tr>
							<td style="border:1px solid  #969696;">${pos.modNm }</td>
							<td style="border:1px solid  #969696;">${pos.trmNo }</td>
							<td style="border:1px solid  #969696;">${pos.trmSn }</td>
							<td style="border:1px solid  #969696;">${pos.modKeyNm }</td>
							<td style="border:1px solid  #969696;">${pos.modKeySeriNo }</td>
							<td style="border:1px solid  #969696;">${pos.simNo }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
				<table class="table" width="100%" layoutH="138">
					<thead>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
</div>