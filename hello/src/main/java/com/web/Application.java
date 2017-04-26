package com.web;
/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年4月24日 下午4:49:45   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */



import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.context.annotation.ImportResource;
@ImportResource("classpath:application-context.xml")
@SpringBootApplication
public class Application   {
    public static void main(String[] args) throws Exception {
        SpringApplication.run(Application.class, args);
    }
}
