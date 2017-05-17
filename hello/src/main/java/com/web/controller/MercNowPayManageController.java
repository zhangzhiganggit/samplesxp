package com.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.base2.domain.MecIfJrf;
import com.base2.mapper.MecIfJrfMapper;


@Controller
@RequestMapping("/nowPayManage")
public class MercNowPayManageController{
    @Autowired
    MecIfJrfMapper mecIfJrfMapper;
    @RequestMapping("/mercNowPayManage")
    public ModelAndView toMercNowPayManage(HttpServletRequest request,
            Integer entry,MecIfJrf mecIfJrf,Integer pageNum,Integer pageSize){
        ModelAndView mv=new ModelAndView("/nowPayManage/mercNowPayManage");
        if(entry==null){
            List <MecIfJrf> plist = mecIfJrfMapper.findMecIfJrfList(mecIfJrf);
            mv.addObject("mecIfJrfList", plist);
        }
        System.out.println("即日付查询");
        return mv;
    }
    
}