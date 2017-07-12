package com.koeiol.grails.takin.framework.taglib.component

/**
 * bootbox Tag
 */
class TakinBootboxTagLib {

    static namespace = "component"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr color
     * @attr id
     * @attr title REQUIRED
     */
    def bootbox = { attrs, body ->
        //
        if ( !attrs['color'] ) attrs['color'] = 'red'
        out << g.render(template: takinThemeService.getThemeTemplate('bootbox', 'component'), model: attrs)
    }
}
