package com.koeiol.grails.takin.framework.taglib.form

class TakinFormCommonTagLib {

    static namespace = "formCommon"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr name REQUIRED
     * @attr value
     */
    def hiddenField = { attrs ->
        out << g.render(template: takinThemeService.getThemeTemplate('hiddenField', 'form/common'), model: attrs)
    }
}
