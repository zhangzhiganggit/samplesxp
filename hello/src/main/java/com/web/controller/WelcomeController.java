/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年4月24日 下午4:49:45   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.web.controller;


import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.base.Servise.PersionService;
import com.base.domain.Persion;
import com.base.mapper.PersionMapper;


/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年4月24日 下午4:49:45
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年4月24日 下午4:49:45
 */
@Controller
public class WelcomeController {
    //@Resource 
//    PersionService persionService;
    @Autowired
    PersionMapper persionMapper;
    @RequestMapping("/initpage")
    @ResponseBody
    public ModelAndView doView() {
        ModelAndView mv = new ModelAndView("index"); 
        Persion p=new Persion();
        p.setId("1");
        //List <Persion> plist=persionService.findPersionList(p);
        List <Persion> plist = persionMapper.findPersionList(p);
        System.out.println(plist.get(0).toString());
        mv.addObject("PersionList",plist);
        return mv;
    }

}