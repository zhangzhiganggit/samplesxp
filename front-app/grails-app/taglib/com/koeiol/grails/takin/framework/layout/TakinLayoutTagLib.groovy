package com.koeiol.grails.takin.framework.layout

class TakinLayoutTagLib {

    static namespace = "layout"
    static defaultEncodeAs = [taglib:'none']

    def takinThemeService

    def sidebar = { attrs ->
        out << g.render(template: getThemeTemplate('sidebar'), model: [])
    }

    def mainNav = { attrs ->
        out << g.render(template: getThemeTemplate('mainNav'), model: [])
    }

    def pageHeader = { attrs ->
        out << g.render(template: getThemeTemplate('pageHeader'), model: [])
    }

    def flashMessage = { attrs ->
        out << g.render(template: getThemeTemplate('flashMessage'), model: [])
    }

    def flowMessage = { attrs ->
        out << g.render(template: getThemeTemplate('flowMessage'), model: [])
    }

    def footer = { attrs ->
        out << g.render(template: getThemeTemplate('footer'), model: [])
    }

    private String getThemeTemplate(String templateName) {
        takinThemeService.getThemeTemplate(templateName, 'layout')
    }
}
