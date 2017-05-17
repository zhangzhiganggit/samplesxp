/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年5月2日 下午1:45:37   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.zzg.dubbo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.domain.MecMDinfo;
import com.base.mapper.MecMDinfoMapper;
import com.zzg.api.MecMDinfoService;
import com.zzg.api.bean.MecMDinfoServiceRpcBean;

/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年5月2日 下午1:45:37
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年5月2日 下午1:45:37
 */
@Service("mecMDinfoService")
public class MecMDinfoServiceImpl implements MecMDinfoService{
    @Autowired
    MecMDinfoMapper mecMDinfoMapper;
    /**      
     * TODO 
     * @param mecMDinfoServiceRpcBean
     * @return
     * @see com.zzg.api.MecMDinfoService#findmecMDinfoList(com.zzg.api.bean.MecMDinfoServiceRpcBean)
     */ 
    @Override
    public List<MecMDinfoServiceRpcBean> findmecMDinfoList(MecMDinfoServiceRpcBean mecMDinfoServiceRpcBean) {
        List<MecMDinfo> MecMDinfolist=mecMDinfoMapper.findmecMDinfoList(this.convertFromtoMecMDinfo(mecMDinfoServiceRpcBean));
        List<MecMDinfoServiceRpcBean> MecMDinfoServiceRpcBeanlist=convertFromtoMecMDinfoServiceRpcBean(MecMDinfolist);
        return MecMDinfoServiceRpcBeanlist;
    }
    /**   
     * TODO
     * @param mecMDinfoServiceRpcBean
     * @return 
     */  
    private MecMDinfo convertFromtoMecMDinfo(MecMDinfoServiceRpcBean mecMDinfoServiceRpcBean) {
        MecMDinfo md =new MecMDinfo();
        md.setBranchNm(mecMDinfoServiceRpcBean.getBranchNm());
        md.setMDSts(mecMDinfoServiceRpcBean.getMDSts());
        md.setOneMDLimit(mecMDinfoServiceRpcBean.getOneMDLimit());
        md.setDayMDLimit(mecMDinfoServiceRpcBean.getDayMDLimit());
        md.setMecNm(mecMDinfoServiceRpcBean.getMecNm());
        md.setMecNo(mecMDinfoServiceRpcBean.getMecNo());
        md.setFirstOrgNm(mecMDinfoServiceRpcBean.getFirstOrgNm());
        md.setOrgNm(mecMDinfoServiceRpcBean.getOrgNm());
        md.setStartTime(mecMDinfoServiceRpcBean.getStartTime());
        md.setDtCte(mecMDinfoServiceRpcBean.getDtCte());
        return md;
    }
    /**   
     * TODO
     * @param mecMDinfoServiceRpcBean
     * @return 
     */  
    private List<MecMDinfoServiceRpcBean> convertFromtoMecMDinfoServiceRpcBean(List<MecMDinfo> MecMDinfolist) {
        List<MecMDinfoServiceRpcBean> MecMDinfoServiceRpcBeanlist =new ArrayList<MecMDinfoServiceRpcBean>();
        for(MecMDinfo md:MecMDinfolist){
            MecMDinfoServiceRpcBean mecMDinfoServiceRpcBean=new MecMDinfoServiceRpcBean();
            mecMDinfoServiceRpcBean.setBranchNm(md.getBranchNm());
            mecMDinfoServiceRpcBean.setMDSts(md.getMDSts());
            mecMDinfoServiceRpcBean.setOneMDLimit(md.getOneMDLimit());
            mecMDinfoServiceRpcBean.setDayMDLimit(md.getDayMDLimit());
            mecMDinfoServiceRpcBean.setMecNm(md.getMecNm());
            mecMDinfoServiceRpcBean.setMecNo(md.getMecNo());
            mecMDinfoServiceRpcBean.setFirstOrgNm(md.getFirstOrgNm());
            mecMDinfoServiceRpcBean.setOrgNm(md.getOrgNm());
            mecMDinfoServiceRpcBean.setStartTime(md.getStartTime());
            mecMDinfoServiceRpcBean.setDtCte(md.getDtCte());
            MecMDinfoServiceRpcBeanlist.add(mecMDinfoServiceRpcBean);
        }
        return MecMDinfoServiceRpcBeanlist;
    }
    

}
