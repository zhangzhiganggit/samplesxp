/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年5月2日 上午11:33:16   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.base2.mapper;

import java.util.List;

import com.base2.domain.MecIfJrf;

/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年5月2日 上午11:33:16
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年5月2日 上午11:33:16
 */
public interface MecIfJrfMapper {
    public List<MecIfJrf> findMecIfJrfList(MecIfJrf mecIfJrf);

}
