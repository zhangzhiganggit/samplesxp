package com.koeiol.grails.takin.framework.taglib.component

class TakinButtonTagLib {

    static namespace = "component"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr title REQUIRED
     */
    def button = { attrs, body ->
        //
        //if ( !attrs['size'] ) attrs['size'] = 'light'
        out << g.render(template: takinThemeService.getThemeTemplate('button', 'component'), model: attrs)
    }
}
