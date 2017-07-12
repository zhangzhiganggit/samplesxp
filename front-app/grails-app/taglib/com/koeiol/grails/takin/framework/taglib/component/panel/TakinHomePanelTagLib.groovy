package com.koeiol.grails.takin.framework.taglib.component.panel

class TakinHomePanelTagLib {

    static namespace = "component"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr panels REQUIRED
     */
    def homepanel = { attrs, body ->
        out << g.render(template: takinThemeService.getThemeTemplate('homepanel', 'component/panel'), model: attrs)
    }
}
