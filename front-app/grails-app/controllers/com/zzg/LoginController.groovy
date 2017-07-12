package com.zzg
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.security.access.annotation.Secured

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.security.access.annotation.Secured
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.AuthenticationTrustResolver
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.InternalAuthenticationServiceException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.WebAttributes
import javax.servlet.http.HttpServletResponse
@Secured('permitAll')
class LoginController {
    def springSecurityService
    def index() {

        if (springSecurityService.isLoggedIn()) {
            redirect uri: conf.successHandler.defaultTargetUrl
        }
        else {
            redirect action: 'auth', params: params
        }
    }

    /** Show the login page. */
    def auth() {
        log.debug 'LoginController  auth'
        def conf = getConf()

        if (springSecurityService.isLoggedIn()) {
            redirect uri: conf.successHandler.defaultTargetUrl
            return
        }

        String postUrl = request.contextPath + conf.apf.filterProcessesUrl
        render view: 'auth', model: [postUrl: postUrl,
                                     rememberMeParameter: conf.rememberMe.parameter,
                                     usernameParameter: conf.apf.usernameParameter,
                                     passwordParameter: conf.apf.passwordParameter,
                                     gspLayout: conf.gsp.layoutAuth]
    }
    protected ConfigObject getConf() {
        SpringSecurityUtils.securityConfig
    }
    /** The redirect action for Ajax requests. */
    def authAjax() {
        response.setHeader 'Location', conf.auth.ajaxLoginFormUrl
        render(status: HttpServletResponse.SC_UNAUTHORIZED, text: 'Unauthorized')
    }

    /** Show denied page. */
    def denied() {
        if (springSecurityService.isLoggedIn() && authenticationTrustResolver.isRememberMe(authentication)) {
            // have cookie but the page is guarded with IS_AUTHENTICATED_FULLY (or the equivalent expression)
            redirect action: 'full', params: params
            return
        }

        [gspLayout: conf.gsp.layoutDenied]
    }

    /** Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page. */
    def full() {
        def conf = getConf()
        render view: 'auth', params: params,
                model: [hasCookie: authenticationTrustResolver.isRememberMe(authentication),
                        postUrl: request.contextPath + conf.apf.filterProcessesUrl,
                        rememberMeParameter: conf.rememberMe.parameter,
                        usernameParameter: conf.apf.usernameParameter,
                        passwordParameter: conf.apf.passwordParameter,
                        gspLayout: conf.gsp.layoutAuth]
    }

    /** Callback after a failed login. Redirects to the auth page with a warning message. */
    def authfail() {


        String msg = ''
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]

        log.debug exception.toString()+"==authfail"
        if (exception) {
            if (exception instanceof AccountExpiredException) {
                msg = message(code: 'springSecurity.errors.login.expired')
            }
            else if (exception instanceof CredentialsExpiredException) {
                msg = message(code: 'springSecurity.errors.login.passwordExpired')
            }
            else if (exception instanceof DisabledException) {
                msg = message(code: 'springSecurity.errors.login.disabled')
            }else if (exception instanceof InternalAuthenticationServiceException) {
                msg = message(code: 'springSecurity.errors.login.disabled')
            }
            else if (exception instanceof LockedException) {
                msg = message(code: 'springSecurity.errors.login.locked')
            }else {
                msg = message(code: 'springSecurity.errors.login.fail')
            }
        }

        log.debug msg+'=msg'
        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        }
        else {
            flash.type = "danger"
            flash.message = msg
            render view: 'auth', params: params
        }
    }

    /** The Ajax success redirect url. */
    def ajaxSuccess() {
        render([success: true, username: authentication.name] as JSON)
    }

    /** The Ajax denied redirect url. */
    def ajaxDenied() {
        render([error: 'access denied'] as JSON)
    }

    protected Authentication getAuthentication() {

        log.debug 'logincon   getAuthentication'
        SecurityContextHolder.context?.authentication
    }


}
