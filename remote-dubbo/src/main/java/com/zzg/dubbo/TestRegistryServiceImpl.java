/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年4月27日 上午9:48:43   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.zzg.dubbo;

import org.springframework.stereotype.Service;

import com.zzg.api.TestRegistryService;


/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年4月27日 上午9:48:43
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年4月27日 上午9:48:43
 */
@Service("testRegistryService")
public class TestRegistryServiceImpl implements TestRegistryService {

    /**      
     * TODO 
     * @param name
     * @return
     * @see com.zzg.api.TestRegistryService#hello(java.lang.String)
     */ 
    @Override
    public String hello(String name) {  
        return "hello"+name;
    }

}
