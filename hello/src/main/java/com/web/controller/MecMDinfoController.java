/**  
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年5月2日 上午9:18:39   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.base.domain.MecMDinfo;
import com.zzg.api.MecMDinfoService;
import com.zzg.api.bean.MecMDinfoServiceRpcBean;


/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年5月2日 上午9:18:39
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年5月2日 上午9:18:39
 */
@Controller
@RequestMapping("/mecMDinfo")
public class MecMDinfoController {
    @Autowired
    MecMDinfoService mecMDinfoService;
    @RequestMapping("view")
    public ModelAndView oClockView(Integer pageNum, Integer pageSize, HttpServletRequest req,MecMDinfoServiceRpcBean mecMDinfoServiceRpcBean){
        ModelAndView mv = new ModelAndView("mec/mecMDinfo");
        String isFirst = req.getParameter("isFirst");
        if(!"true".equals(isFirst)){
            if (null == pageNum) {
                pageNum = 1;
                pageSize = 20;
            }
            //TODO分页
            List<MecMDinfoServiceRpcBean> mDinfoList= mecMDinfoService.findmecMDinfoList(mecMDinfoServiceRpcBean);
            mv.addObject("mDinfoList", mDinfoList);
        }
        System.out.println("秒到查询");
        return mv;
    }
}
