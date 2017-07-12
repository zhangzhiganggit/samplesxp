package com.koeiol.grails.takin.framework.taglib.component.checkbox

/**
 *
 */
class TakinCheckboxTaglibTagLib {

    static namespace = "component"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr cssClass
     * @attr property REQUIRED
     * @attr dataSet
     * @attr title REQUIRED
     */
    def checkbox = { attrs, body ->
        //
        out << g.render(template: takinThemeService.getThemeTemplate('checkbox', 'component/checkbox'), model: attrs)
    }
}
