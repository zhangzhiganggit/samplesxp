package System

import com.koeiol.grails.takin.framework.core.annotation.TakinComment
import groovy.transform.EqualsAndHashCode

@TakinComment('首页展示')
@EqualsAndHashCode
class HomeUserPanels implements Serializable {

    String id
    @TakinComment('用户编号') String userCode
    @TakinComment('面板') String panels
    @TakinComment('样式') String style
    @TakinComment('可用') boolean enabled = true
    @TakinComment('备注') String remark

    String dateCreated
    String lastUpdated
    boolean deleted = false

    static constraints = {
        userCode(blank: false, unique: true)
    }

    static mapping = {
        table(name: 'M_Home_User_Panels')
        id(column: 'id', generator: 'uuid')
    }

    @Override
    public String toString() {
        return "HomeUserPanels{" +
                "version=" + version +
                ", id='" + id + '\'' +
                ", userCode='" + userCode + '\'' +
                ", panels='" + panels + '\'' +
                ", style='" + style + '\'' +
                ", enabled=" + enabled +
                ", remark='" + remark + '\'' +
                ", dateCreated=" + dateCreated +
                ", lastUpdated=" + lastUpdated +
                ", deleted=" + deleted +
                '}';
    }
}
