package com.base2.domain;

import com.base.po.MecIfJrfPo;

/**
 * Description: 商户即日付表信息 Domain
 * Copyright:   ©2015 suixingpay. All rights reserved.
 * Created on:  2015-11-17 16:04:21
 *
 * @author  Jacky Yu
 */
public class MecIfJrf extends MecIfJrfPo{
	private static final long serialVersionUID = 1L;
	
	public String mno;
	public String cpr_reg_nm_cn;
	
	//
	private String branchOrgUuid;
	private String agentBranchOrgUuid;
	//
	private boolean canChangeState; 
	
	public String org_nm;
	public String top_agent_org_no;
	public String branch_org_no;
	public String dt_cte_start;
	public String dt_cte_end;
	public String stl_sts_str;
	public String inMno;
	public String zft_flg;
	public String actTyp;
	public String opt_typ;
	public String orign_stl_sts;
	public String bus_typ;
	public String stff_no;
	public String mec_source;
	
	protected Float rat1;  // 费率 
	
	public String satisEffDtFlg;//合规规则1
	public String satisEffDt;//规则1天数
	public String jinjianDt;//进件日期
	
	public String getMec_source() {
		return mec_source;
	}
	public void setMec_source(String mec_source) {
		this.mec_source = mec_source;
	}
	public String getOrign_stl_sts() {
		return orign_stl_sts;
	}
	public void setOrign_stl_sts(String orign_stl_sts) {
		this.orign_stl_sts = orign_stl_sts;
	}
	public String getBus_typ() {
		return bus_typ;
	}
	public void setBus_typ(String bus_typ) {
		this.bus_typ = bus_typ;
	}
	public String getStff_no() {
		return stff_no;
	}
	public void setStff_no(String stff_no) {
		this.stff_no = stff_no;
	}
	public String getOpt_typ() {
		return opt_typ;
	}
	public void setOpt_typ(String opt_typ) {
		this.opt_typ = opt_typ;
	}
	public String getOrg_nm() {
		return org_nm;
	}
	public void setOrg_nm(String org_nm) {
		this.org_nm = org_nm;
	}
	public String getActTyp() {
		return actTyp;
	}
	public void setActTyp(String actTyp) {
		this.actTyp = actTyp;
	}
	public String getZft_flg() {
		return zft_flg;
	}
	public void setZft_flg(String zft_flg) {
		this.zft_flg = zft_flg;
	}
	public String getInMno() {
		return inMno;
	}
	public void setInMno(String inMno) {
		this.inMno = inMno;
	}
	public String getStl_sts_str() {
		return stl_sts_str;
	}
	public void setStl_sts_str(String stl_sts_str) {
		this.stl_sts_str = stl_sts_str;
	}
	public String getDt_cte_start() {
		return dt_cte_start;
	}
	public void setDt_cte_start(String dt_cte_start) {
		this.dt_cte_start = dt_cte_start;
	}
	public String getDt_cte_end() {
		return dt_cte_end;
	}
	public void setDt_cte_end(String dt_cte_end) {
		this.dt_cte_end = dt_cte_end;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getCpr_reg_nm_cn() {
		return cpr_reg_nm_cn;
	}
	public void setCpr_reg_nm_cn(String cpr_reg_nm_cn) {
		this.cpr_reg_nm_cn = cpr_reg_nm_cn;
	}
	public String getBranchOrgUuid() {
		return branchOrgUuid;
	}
	
	public void setBranchOrgUuid(String branchOrgUuid) {
		this.branchOrgUuid = branchOrgUuid;
	}
	
	public String getAgentBranchOrgUuid() {
		return agentBranchOrgUuid;
	}
	
	public void setAgentBranchOrgUuid(String agentBranchOrgUuid) {
		this.agentBranchOrgUuid = agentBranchOrgUuid;
	} 
	
	public boolean isCanChangeState() {
		return canChangeState;
	}
	
	public void setCanChangeState(boolean canChangeState) {
		this.canChangeState = canChangeState;
	}
	
	public String getTop_agent_org_no() {
		return top_agent_org_no;
	}
	public void setTop_agent_org_no(String top_agent_org_no) {
		this.top_agent_org_no = top_agent_org_no;
	}
	public String getBranch_org_no() {
		return branch_org_no;
	}
	public void setBranch_org_no(String branch_org_no) {
		this.branch_org_no = branch_org_no;
	}
	public Float getRat1() {
		return rat1;
	}
	public void setRat1(Float rat1) {
		this.rat1 = rat1;
	}
	public String getSatisEffDtFlg() {
	    return satisEffDtFlg;
	}
	public void setSatisEffDtFlg(String satisEffDtFlg) {
	    this.satisEffDtFlg = satisEffDtFlg;
	}
	public String getSatisEffDt() {
	    return satisEffDt;
	}
	public void setSatisEffDt(String satisEffDt) {
	    this.satisEffDt = satisEffDt;
	}
	public String getJinjianDt() {
	    return jinjianDt;
	}
	public void setJinjianDt(String jinjianDt) {
	    this.jinjianDt = jinjianDt;
	}
	
	

}