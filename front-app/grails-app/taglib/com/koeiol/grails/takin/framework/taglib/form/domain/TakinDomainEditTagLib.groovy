package com.koeiol.grails.takin.framework.taglib.form.domain

class TakinDomainEditTagLib {

    static namespace = "domainEdit"
    static defaultEncodeAs = [taglib:'none']

    def takinThemeService

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr keyValues REQUIRED
     * @attr values REQUIRED
     */
    def checkboxGroup = { attrs ->
        out << g.render(template: getThemeTemplate('checkboxGroup'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr value REQUIRED
     * @attr required REQUIRED
     */
    def booleanType = { attrs ->
        out << g.render(template: getThemeTemplate('booleanType'), model: attrs)
    }

    /**
     * @attr domainInstance REQUIRED
     * @attr property REQUIRED
     * @attr required
     */
    def enumRadioGroup = { attrs ->
        out << g.render(template: getThemeTemplate('radioGroup'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr domainInstance REQUIRED
     * @attr required REQUIRED
     * @attr enumClass
     */
    def enumRadio = { attrs ->
        def enumClass = attrs['enumClass'] ?: attrs['domainInstance'].getClass().getDeclaredField(attrs['property']).getType()
        attrs['values'] = enumClass.values()
        if ( attrs['required'].toString().toBoolean() ) {
            attrs['checkedIndex'] = 0
        }
        for ( int i = 0; i< attrs['values'].size(); i++ ) {
            if (attrs['values'][i] == attrs['domainInstance'][attrs['property']] ) {
                attrs['checkedIndex'] = i
            }
        }
        out << g.render(template: getThemeTemplate('enumRadio'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr domainInstance REQUIRED
     * @attr required REQUIRED
     * @attr enumClass
     */
    def enumSelect = { attrs ->
        def enumClass = attrs['enumClass'] ?: attrs['domainInstance'].getClass().getDeclaredField(attrs['property']).getType()
        attrs['values'] = enumClass.values()
        attrs['from'] = domainClass.getDeclaredField(attrs['property']).getType().values()
        attrs['keys'] = attrs['from']*.name()
        attrs['required'] = attrs['required'].toString().toBoolean()
        out << g.render(template: getThemeTemplate('enumSelect'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr domainInstance REQUIRED
     * @attr required REQUIRED
     * @attr readonly
     */
    def textField = { attrs ->
        if (!attrs['readonly']) attrs['readonly'] = 'false'
        out << g.render(template: getThemeTemplate('textField'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr domainInstance REQUIRED
     * @attr required REQUIRED
     */
    def comboBox = { attrs ->
        out << g.render(template: getThemeTemplate('comboBox'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr domainInstance REQUIRED
     * @attr from REQUIRED
     * @attr required REQUIRED
     * @attr readonly
     */
    def domainSelect = { attrs ->
        out << g.render(template: getThemeTemplate('domainSelect'), model: attrs)
    }

    private String getThemeTemplate(String templateName) {
        takinThemeService.getThemeTemplate(templateName, 'form/domain/edit')
    }

}
