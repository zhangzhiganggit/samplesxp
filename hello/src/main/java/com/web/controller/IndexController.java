/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年4月27日 上午11:13:26   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.base2.domain.SupPersion;
import com.base2.mapper.SupPersionMapper;
import com.zzg.api.TestRegistryService;

/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年4月27日 上午11:13:26
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年4月27日 上午11:13:26
 */
@Controller
public class IndexController {
    @Autowired
    private TestRegistryService testRegistryService;
    @Autowired
    SupPersionMapper persionMapper;
    @RequestMapping("/hello")
    public ModelAndView index(Model model){
         String name=testRegistryService.hello("zz");
         System.out.println("xx=="+name);
         ModelAndView mv = new ModelAndView("index"); 
         SupPersion p=new SupPersion();
         p.setId("8888");
         List <SupPersion> plist = persionMapper.findPersionList(p);
         System.out.println(plist.get(0).toString());
         mv.addObject("PersionList",plist);
        return mv;
    }

}