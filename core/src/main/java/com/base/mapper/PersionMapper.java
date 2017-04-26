/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年4月24日 下午3:55:22   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.base.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.base.domain.Persion;


/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年4月24日 下午3:55:22
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年4月24日 下午3:55:22
 */

public interface PersionMapper {
    public List<Persion> findPersionList(Persion persion);
}
