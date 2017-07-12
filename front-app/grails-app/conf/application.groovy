

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.zzg.SystemUser'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.zzg.SystemUserSystemIdentity'
grails.plugin.springsecurity.authority.className = 'com.zzg.SystemIdentity'
grails.plugin.springsecurity.password.algorithm = 'MD5'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/**', access: 'permitAll'],
	[pattern: '/error', access: 'permitAll'],
	[pattern: '/index', access: 'permitAll'],
	[pattern: '/index.gsp', access: 'permitAll'],
	[pattern: '/shutdown', access: 'permitAll'],
	[pattern: '/assets/**', access: 'permitAll'],
	[pattern: '/**/js/**', access: 'permitAll'],
	[pattern: '/**/css/**', access: 'permitAll'],
	[pattern: '/**/images/**', access: 'permitAll'],
	[pattern: '/**/favicon.ico', access: 'permitAll'],
	[pattern: '/systemUserPassword/forgetPassword', access: 'permitAll'],
	[pattern: '/image/index', access: 'permitAll']
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]
grails.plugin.springsecurity.useSecurityEventListener = true
grails.plugin.springsecurity.useSessionFixationPrevention = true
grails.plugin.springsecurity.sessionFixationPrevention.migrate = true
grails.plugin.springsecurity.logout.afterLogoutUrl = '/'

//when a visitor goes to "/", spring security will intercept and redirect to the login page, then redirect to "/" after the login.
grails.plugin.springsecurity.interceptUrlMap = [
		'/': ['IS_AUTHENTICATED_FULLY']
]
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.rejectIfNoRule = false
