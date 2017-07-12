package com.koeiol.grails.takin.framework.taglib.form.domain

class TakinDomainShowTagLib {

    static namespace = "domainShow"
    static defaultEncodeAs = [taglib:'none']

    def takinThemeService

    /**
     * @attr domainInstance REQUIRED
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr colCssClass
     * @atrr labelCssClass
     * @attr valueCssClass
     */
    def displayString = { attrs ->
        def domainInstance = attrs.remove('domainInstance')
        def property = attrs.remove('property')
        attrs['label'] = message.property(domain: attrs.remove('domain'), property: property)
        attrs['value'] = domainInstance ? domainInstance[property] : ''
        out << g.render(template: getThemeTemplate('stringProperty'), model: attrs)
    }

    /**
     * @attr domainInstance REQUIRED
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr colCssClass
     * @atrr labelCssClass
     * @attr valueCssClass
     */
    def displayNumber = { attrs ->
        def domainInstance = attrs.remove('domainInstance')
        def property = attrs.remove('property')
        attrs['label'] = message.property(domain: attrs.remove('domain'), property: property)
        attrs['value'] = domainInstance ? domainInstance[property] : ''
        out << g.render(template: getThemeTemplate('numberProperty'), model: attrs)
    }

    /**
     * @attr domainInstance REQUIRED
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr colCssClass
     * @atrr labelCssClass
     * @attr valueCssClass
     */
    def displayDate = { attrs ->
        def domainInstance = attrs.remove('domainInstance')
        def property = attrs.remove('property')
        attrs['label'] = message.property(domain: attrs.remove('domain'), property: property)
        attrs['value'] = domainInstance ? domainInstance[property] : ''
        out << g.render(template: getThemeTemplate('dateProperty'), model: attrs)
    }

    /**
     * @attr domainInstance REQUIRED
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr colCssClass
     * @atrr labelCssClass
     * @attr valueCssClass
     */
    def displayBoolean = { attrs ->
        def domainInstance = attrs.remove('domainInstance')
        def property = attrs.remove('property')
        attrs['label'] = message.property(domain: attrs.remove('domain'), property: property)
        attrs['value'] = domainInstance ? domainInstance[property] : ''
        out << g.render(template: getThemeTemplate('booleanProperty'), model: attrs)
    }

    /**
     * @attr domainInstance REQUIRED
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr colCssClass
     * @atrr labelCssClass
     * @attr valueCssClass
     */
    def displayInList = { attrs ->
        out << g.render(template: getThemeTemplate('inListProperty'), model: attrs)
    }

    private String getThemeTemplate(String templateName) {
        takinThemeService.getThemeTemplate(templateName, 'form/domain/show')
    }
}
