/**

 * Description:

 * Copyright:   ©2015 Vbill Payment Co. Ltd. All rights reserved.

 * Created on:  2015年12月16日 上午11:00:47

 *

 * @author han_xf@suixingpay.com

 */
package com.base.po;

import java.math.BigDecimal;


/**
 * Description:
 * Copyright: ©2015 Vbill Payment Co. Ltd. All rights reserved.
 * Created on: 2015年12月16日 上午11:00:47
 * @author han_xf@suixingpay.com
 */
public class MecIfJrfPo {
	private static final long serialVersionUID = 1L;
    
	protected String uuid; //主键
	protected String in_mno; //内部商编
	protected String org_no; //归属合作商编号
	protected String stl_sts; //T+0状态(00：关闭，01：开通，02：暂停)
	protected BigDecimal limit_amt; //申请额度(占用所属合作商的业务额度)
	protected BigDecimal remain_amt; //可用额度(初始值与申请额度相同)
	protected String cte_stff_no; //首次创建人编号,操作员编号
	protected String ute_stff_no; //修改人编号,操作员编号
	protected String dt_cte; //创建日期
	protected String tm_cte; //创建时间
	protected String dt_ute; //修改日期
	protected String tm_ute; //修改时间
	protected BigDecimal rcs_amt; //风控限额(初始值与申请额度相同，风控恢复限额时不能大于申请额度)
	protected String rmk; //备注
	protected String stl_typ; //T+0类型(01：随意通，02：即日付) 
	protected String open_src; //开通渠道(01：OA/代理商系统，02：POS，03：短信，04：BAP,05：微信)
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getIn_mno() {
		return in_mno;
	}
	public void setIn_mno(String in_mno) {
		this.in_mno = in_mno;
	}
	public String getOrg_no() {
		return org_no;
	}
	public void setOrg_no(String org_no) {
		this.org_no = org_no;
	}
	public String getStl_sts() {
		return stl_sts;
	}
	public void setStl_sts(String stl_sts) {
		this.stl_sts = stl_sts;
	}
	public BigDecimal getLimit_amt() {
		return limit_amt;
	}
	public void setLimit_amt(BigDecimal limit_amt) {
		this.limit_amt = limit_amt;
	}
	public BigDecimal getRemain_amt() {
		return remain_amt;
	}
	public void setRemain_amt(BigDecimal remain_amt) {
		this.remain_amt = remain_amt;
	}
	public String getCte_stff_no() {
		return cte_stff_no;
	}
	public void setCte_stff_no(String cte_stff_no) {
		this.cte_stff_no = cte_stff_no;
	}
	public String getUte_stff_no() {
		return ute_stff_no;
	}
	public void setUte_stff_no(String ute_stff_no) {
		this.ute_stff_no = ute_stff_no;
	}
	public String getDt_cte() {
		return dt_cte;
	}
	public void setDt_cte(String dt_cte) {
		this.dt_cte = dt_cte;
	}
	public String getTm_cte() {
		return tm_cte;
	}
	public void setTm_cte(String tm_cte) {
		this.tm_cte = tm_cte;
	}
	public String getDt_ute() {
		return dt_ute;
	}
	public void setDt_ute(String dt_ute) {
		this.dt_ute = dt_ute;
	}
	public String getTm_ute() {
		return tm_ute;
	}
	public void setTm_ute(String tm_ute) {
		this.tm_ute = tm_ute;
	}
	public BigDecimal getRcs_amt() {
		return rcs_amt;
	}
	public void setRcs_amt(BigDecimal rcs_amt) {
		this.rcs_amt = rcs_amt;
	}
	public String getRmk() {
		return rmk;
	}
	public void setRmk(String rmk) {
		this.rmk = rmk;
	}
	public String getStl_typ() {
		return stl_typ;
	}
	public void setStl_typ(String stl_typ) {
		this.stl_typ = stl_typ;
	}
	public String getOpen_src() {
		return open_src;
	}
	public void setOpen_src(String open_src) {
		this.open_src = open_src;
	}
	
	
	
}
