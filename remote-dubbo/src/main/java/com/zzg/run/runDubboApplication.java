/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年4月28日 上午9:46:53   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.zzg.run;

import java.util.concurrent.LinkedBlockingDeque;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;



/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年4月28日 上午9:46:54
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年4月28日 上午9:46:54
 */
@ImportResource("classpath:application-context.xml")
@SpringBootApplication
public class runDubboApplication   {

    private static LinkedBlockingDeque<Boolean> run = new LinkedBlockingDeque<Boolean>();


    /**
     * The entry point of application.
     *
     * @param args the input arguments
     * @throws Exception the exception
     */
    public static void main(String[] args) throws Exception {

        SpringApplication springApplication = new SpringApplication(runDubboApplication.class);

        springApplication.run(args);

        while (run.take()) {
        }
    }

    /**
     * Stop.
     */
    static void stop() {
        run.add(false);
    }
}

