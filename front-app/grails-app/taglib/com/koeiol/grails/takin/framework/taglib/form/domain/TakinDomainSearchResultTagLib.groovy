package com.koeiol.grails.takin.framework.taglib.form.domain

class TakinDomainSearchResultTagLib {
    
    static namespace = "domainSearchResult"
    static defaultEncodeAs = [taglib:'none']

    def takinThemeService

    /**
     * @attr domain
     * @attr property
     * @attr width
     */
    def header = { attrs ->
        out << g.render(template: getThemeTemplate('header'), model: attrs)
    }

    /**
     * @attr domain
     * @attr property
     * @attr domainInstance
     * @attr width
     * @attr type REQUIRED ['boolean', 'currency', 'date', 'number', 'text','inList']
     * @attr textAlign ['center','left','right'] default is left
     */
    def rowData = { attrs ->
        out << g.render(template: getThemeTemplate(attrs['type']), model: attrs)
    }

    private String getThemeTemplate(String templateName) {
        takinThemeService.getThemeTemplate(templateName, 'form/domain/searchResult')
    }
}
