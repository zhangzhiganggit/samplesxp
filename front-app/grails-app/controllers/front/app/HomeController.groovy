package front.app
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class HomeController {
    def springSecurityService
    /*
    *
    * 登录后内容初始化
    * */
    def index() {
        session.setMaxInactiveInterval(3600)
        session.setAttribute('home', 'home')
        def systemUserInstance = springSecurityService.currentUser
        //未登录过 强制修改密码
        if (!systemUserInstance.passwordChanged) {
            respond systemUserInstance,
                    view: '/home/updatePassword'
        }
    }
}
