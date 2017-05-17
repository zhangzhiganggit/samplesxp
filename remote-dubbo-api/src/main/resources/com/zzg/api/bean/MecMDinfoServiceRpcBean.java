/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年5月2日 下午1:53:59   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.zzg.api.bean;

import java.io.Serializable;

/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年5月2日 下午1:53:59
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年5月2日 下午1:53:59
 */
public class MecMDinfoServiceRpcBean implements Serializable{

    /** 
     * @author li_jing 2016年8月17日
     *
     * @fields serialVersionUID : TODO
     */
    private static final long serialVersionUID = 1L;
    private String uuid;
    private String mecNo;
    private String mecNm;
    private String MDSts;
    private String branchNm;
    private String branchNo;
    private String firstOrgNm;
    private String firstOrgNo;
    private String dateOpen;
    private String timeOpen;
    private String dayMDLimit;
    private String oneMDLimit;
    private double rat;
    private String orgNm;
    private String orgNo;
    private String logNo;
    private String startTimeStart;
    private String startTimeEnd;
    private String startTime;//开通日期
    private String BUSINESSEMPNO;
    private String dtCte;//进件日期
    private String mecInNo;
    private String rateType;//计费产品
    private String effectiveDate;//生效日期
    private String invalidDate;//失效日期
    private String rules;//规则
    private String rateDetail;//仅限于大pos秒到费率
    private String fixedFee;
    private String topAmount;
    private String lowCharge;
    
    public String getLowCharge() {
        return lowCharge;
    }
    public void setLowCharge(String lowCharge) {
        this.lowCharge = lowCharge;
    }
    public String getFixedFee() {
        return fixedFee;
    }
    public void setFixedFee(String fixedFee) {
        this.fixedFee = fixedFee;
    }
    public String getTopAmount() {
        return topAmount;
    }
    public void setTopAmount(String topAmount) {
        this.topAmount = topAmount;
    }
    public String getRateDetail() {
        return rateDetail;
    }
    public void setRateDetail(String rateDetail) {
        this.rateDetail = rateDetail;
    }
    public String getRules() {
        return rules;
    }
    public void setRules(String rules) {
        this.rules = rules;
    }
    public String getRateType() {
        return rateType;
    }
    public void setRateType(String rateType) {
        this.rateType = rateType;
    }
    public String getEffectiveDate() {
        return effectiveDate;
    }
    public void setEffectiveDate(String effectiveDate) {
        this.effectiveDate = effectiveDate;
    }
    public String getInvalidDate() {
        return invalidDate;
    }
    public void setInvalidDate(String invalidDate) {
        this.invalidDate = invalidDate;
    }
    public String getMecInNo() {
        return mecInNo;
    }
    public void setMecInNo(String mecInNo) {
        this.mecInNo = mecInNo;
    }
    public String getBUSINESSEMPNO() {
        return BUSINESSEMPNO;
    }
    public void setBUSINESSEMPNO(String bUSINESSEMPNO) {
        BUSINESSEMPNO = bUSINESSEMPNO;
    }
    public String getLogNo() {
        return logNo;
    }
    public void setLogNo(String logNo) {
        this.logNo = logNo;
    }
    public String getBranchNo() {
        return branchNo;
    }
    public void setBranchNo(String branchNo) {
        this.branchNo = branchNo;
    }
    public String getFirstOrgNo() {
        return firstOrgNo;
    }
    public void setFirstOrgNo(String firstOrgNo) {
        this.firstOrgNo = firstOrgNo;
    }
    public String getOrgNo() {
        return orgNo;
    }
    public void setOrgNo(String orgNo) {
        this.orgNo = orgNo;
    }
    public String getUuid() {
        return uuid;
    }
    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
    public String getMecNo() {
        return mecNo;
    }
    public void setMecNo(String mecNo) {
        this.mecNo = mecNo;
    }
    public String getMecNm() {
        return mecNm;
    }
    public void setMecNm(String mecNm) {
        this.mecNm = mecNm;
    }
    public String getMDSts() {
        return MDSts;
    }
    public void setMDSts(String mDSts) {
        MDSts = mDSts;
    }
    public String getBranchNm() {
        return branchNm;
    }
    public void setBranchNm(String branchNm) {
        this.branchNm = branchNm;
    }
    public String getFirstOrgNm() {
        return firstOrgNm;
    }
    public void setFirstOrgNm(String firstOrgNm) {
        this.firstOrgNm = firstOrgNm;
    }
    public String getOrgNm() {
        return orgNm;
    }
    public void setOrgNm(String orgNm) {
        this.orgNm = orgNm;
    }
    public String getDateOpen() {
        return dateOpen;
    }
    public void setDateOpen(String dateOpen) {
        this.dateOpen = dateOpen;
    }
    public String getTimeOpen() {
        return timeOpen;
    }
    public void setTimeOpen(String timeOpen) {
        this.timeOpen = timeOpen;
    }
    public String getDayMDLimit() {
        return dayMDLimit;
    }
    public void setDayMDLimit(String dayMDLimit) {
        this.dayMDLimit = dayMDLimit;
    }
    public String getOneMDLimit() {
        return oneMDLimit;
    }
    public void setOneMDLimit(String oneMDLimit) {
        this.oneMDLimit = oneMDLimit;
    }
    public double getRat() {
        return rat;
    }
    public void setRat(double rat) {
        this.rat = rat;
    }
    public String getStartTimeStart() {
        return startTimeStart;
    }
    public void setStartTimeStart(String startTimeStart) {
        this.startTimeStart = startTimeStart;
    }
    public String getStartTimeEnd() {
        return startTimeEnd;
    }
    public void setStartTimeEnd(String startTimeEnd) {
        this.startTimeEnd = startTimeEnd;
    }
    public String getStartTime() {
        return startTime;
    }
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }
    public String getDtCte() {
        return dtCte;
    }
    public void setDtCte(String dtCte) {
        this.dtCte = dtCte;
    }
}
