/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年4月24日 下午4:16:13   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.base2.Servise;

import java.util.List;

import org.springframework.stereotype.Service;

import com.base.domain.Persion;
import com.base2.domain.SupPersion;

/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年4月24日 下午4:16:13
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年4月24日 下午4:16:13
 */
public interface SupPersionService {
    public List<SupPersion> findPersionList(SupPersion persion);
}
