package com.koeiol.grails.takin.framework.taglib.component.modals

class TakinModalsTagLib {

    static namespace = "component"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr title REQUIRED
     * @attr id REQUIRED
     * @attr width ['dialog', 'content', 'sm', 'lg', 'full'] default is dialog and full is 99%
     */
    def modals = { attrs, body ->
        //
        attrs['body'] = body()
        out << g.render(template: takinThemeService.getThemeTemplate('modals', 'component/modals'), model: attrs)
    }

    def modalsL = { attrs, body ->
        //
        attrs['body'] = body()
        out << g.render(template: takinThemeService.getThemeTemplateWithOutButton('modalsWithOutButton', 'component/modals'), model: attrs)
    }
}