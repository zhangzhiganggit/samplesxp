/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年4月24日 下午4:21:39   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.base2.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.base2.domain.SupPersion;
import com.base2.mapper.SupPersionMapper;
import com.base2.Servise.SupPersionService;

/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年4月24日 下午4:21:39
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年4月24日 下午4:21:39
 */
public class SupPersionServiceImpl implements SupPersionService {
    @Autowired
    private SupPersionMapper persionMapper;
    /**      
     * TODO 
     * @param persion
     * @return
     * @see com.base.Servise.PersionService#findPersionList(com.base.domain.Persion)
     */ 
    @Override
    public List<SupPersion> findPersionList(SupPersion persion) {
        // TODO Auto-generated method stub
        return persionMapper.findPersionList(persion);
    }

}
