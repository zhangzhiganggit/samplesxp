package com.koeiol.grails.takin.framework.taglib.form.domain

/**
 *
 */
class TakinDomainSearchTagLib {

    static namespace = "domainSearch"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     */
    def datePicker = { attrs ->
        out << g.render(template: getThemeTemplate('datePicker'), model: attrs)
    }

    def datePicker2 = { attrs ->
        out << g.render(template: getThemeTemplate('datePicker2'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     */
    def datePicker3 = { attrs ->
        out << g.render(template: getThemeTemplate('datePicker3'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     */
    def dateTimePicker = { attrs ->
        out << g.render(template: getThemeTemplate('dateTimePicker'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr from REQUIRED
     */
    def select = { attrs ->
        out << g.render(template: getThemeTemplate('select'), model: attrs)
    }
    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr from REQUIRED
     */
    def select2 = { attrs ->
        out << g.render(template: getThemeTemplate('select2'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     */
    def radio = { attrs ->
        out << g.render(template: getThemeTemplate('radio'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     */
    def booleanType = { attrs ->
        out << g.render(template: getThemeTemplate('booleanType'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr type REQUIRED
     */
    def enumType = { attrs ->
        String domainClassName = attrs['domain']
        def type = attrs['type']
        attrs['keyValues'] = type.values().collectEntries {
            [it.name(), g.message(code: type.name + "." + it.name(), default: it.name)]
        }
        attrs['keyValues'] << ['': '任意']
        if (!params['q_' + attrs['property']]) params['q_' + attrs['property']] = ''
        out << g.render(template: getThemeTemplate('enumType'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     */
    def textField = { attrs ->
        out << g.render(template: getThemeTemplate('textField'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr directly REQUIRED
     */
    def orgTree = { attrs ->
        out << g.render(template: getThemeTemplate('orgTree'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr directly REQUIRED
     */
    def transferOrgTree = { attrs ->
        out << g.render(template: getThemeTemplate('transferOrgTree'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr type REQUIRED
     */
    def oneToMany = { attrs ->
        out << g.render(template: getThemeTemplate('oneToMany'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr type REQUIRED
     * @attr controller
     * @attr action
     */
    def manyToOne = { attrs ->
        attrs['url'] = g.createLink(controller: attrs['controller'] ?: attrs['domain'], action: attrs['action'] ?: 'autoComplete')
        out << g.render(template: getThemeTemplate('manyToOne'), model: attrs)
    }

    /**
     * @attr domain REQUIRED
     * @attr property REQUIRED
     * @attr type REQUIRED
     */
    def manyToMany = { attrs ->
        out << g.render(template: getThemeTemplate('manyToMany'), model: attrs)
    }

    /**
     *
     * @param templateName
     * @return
     */
    private String getThemeTemplate(String templateName) {
        takinThemeService.getThemeTemplate(templateName, 'form/domain/search')
    }

}
