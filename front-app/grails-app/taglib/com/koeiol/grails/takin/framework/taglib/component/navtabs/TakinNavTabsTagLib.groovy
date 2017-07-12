package com.koeiol.grails.takin.framework.taglib.component.navtabs

class TakinNavTabsTagLib {

    static namespace = "navtabs"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    def tabs = { attrs, body ->
        attrs['body'] = body()
        out << g.render(template: getThemeTemplate('navTabs'), model: attrs)
    }

    /**
     * @attr title REQUIRED
     * @attr tabUrl REQUIRED
     * @attr dataToggle REQUIRED
     */
    def tab = { attrs, body ->

        out << g.render(template: getThemeTemplate('navTab'), model: attrs)
    }

    def content = { attrs, body ->
        attrs['body'] = body()
        out << g.render(template: getThemeTemplate('navTabContent'), model: attrs)
    }

    def pane = { attrs, body ->
        attrs['body'] = body()
        out << g.render(template: getThemeTemplate('navTabPane'), model: attrs)
    }

    def navdropdown = { attrs, body ->

        out << g.render(template: getThemeTemplate('navDropdown'), model: attrs)
    }

    private String getThemeTemplate(String templateName) {
        takinThemeService.getThemeTemplate(templateName, 'component/navtabs')
    }

}
