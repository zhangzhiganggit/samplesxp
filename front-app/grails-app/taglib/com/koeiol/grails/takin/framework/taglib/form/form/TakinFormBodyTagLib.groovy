package com.koeiol.grails.takin.framework.taglib.form.form

class TakinFormBodyTagLib {

    static namespace = "formBody"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr text REQUIRED
     */
    def header = { attrs ->
        out << g.render(template: getThemeTemplate('header'), model: attrs)
    }

    private String getThemeTemplate(String templateName) {
        takinThemeService.getThemeTemplate(templateName, 'form/form/body')
    }

}
