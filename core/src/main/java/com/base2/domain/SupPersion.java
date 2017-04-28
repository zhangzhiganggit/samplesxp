/**  
 * All rights Reserved, Designed By Suixingpay.
 * @author: matieli[zhang_zhg@hisuntech.com] 
 * @date: 2017年4月24日 下午3:38:30   
 * @Copyright ©2017 Suixingpay. All rights reserved. 
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
package com.base2.domain;

import com.base.po.PersionPo;
import com.base.util.Domain;

/**  
 * TODO
 * @author: matieli[zhang_zhg@hisuntech.com]
 * @date: 2017年4月24日 下午3:38:30
 * @version: V1.0
 * @review: matieli[zhang_zhg@hisuntech.com]/2017年4月24日 下午3:38:30
 */
public class SupPersion extends PersionPo implements Domain{

    /**   
     * @Fields serialVersionUID: TODO
     */ 
    private static final long serialVersionUID = 1L;
    private String fav;
    public String getFav() {
        return fav;
    }
    public void setFav(String fav) {
        this.fav = fav;
    }
    @Override
    public String toString() {
        return "Persion [fav=" + fav + "]";
    }
   
    
}
