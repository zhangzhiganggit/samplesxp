/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年4月24日 下午4:21:39   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.base.Servise.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.base.Servise.PersionService;
import com.base.domain.Persion;
import com.base.mapper.PersionMapper;

/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年4月24日 下午4:21:39
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年4月24日 下午4:21:39
 */
public class PersionServiceImpl implements PersionService {
    @Autowired
    private PersionMapper persionMapper;
    /**      
     * TODO 
     * @param persion
     * @return
     * @see com.base.Servise.PersionService#findPersionList(com.base.domain.Persion)
     */ 
    @Override
    public List<Persion> findPersionList(Persion persion) {
        // TODO Auto-generated method stub
        return persionMapper.findPersionList(persion);
    }

}
