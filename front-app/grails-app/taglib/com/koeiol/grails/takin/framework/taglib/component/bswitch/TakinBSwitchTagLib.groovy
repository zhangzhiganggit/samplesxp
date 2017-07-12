package com.koeiol.grails.takin.framework.taglib.component.bswitch

/**
 * Bootstrap Switch
 */
class TakinBSwitchTagLib {

    static namespace = "component"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr dataOnColor
     * @attr dataOffColor
     */
    def bswitch = { attrs, body ->
        //
        if (!attrs['dataOnColor']) attrs['dataOnColor'] = 'primary'
        if (!attrs['dataOffColor']) attrs['dataOffColor'] = 'info'
        out << g.render(template: takinThemeService.getThemeTemplate('bswitch', 'component/bswitch'), model: attrs)
    }
}
