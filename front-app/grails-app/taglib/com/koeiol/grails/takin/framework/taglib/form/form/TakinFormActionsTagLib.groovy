package com.koeiol.grails.takin.framework.taglib.form.form

/**
 *
 */
class TakinFormActionsTagLib {

    static namespace = "formActions"
    static defaultEncodeAs = [taglib: 'none']

    static final String DEFAULT_BTN_CSS_CLASS = 'btn btn-primary'

    def takinThemeService

    /**
     * @attr id
     * @attr action REQUIRED
     * @attr btnCssClass default is 'btn btn-primary'
     * @attr btnIconClass default is null
     * @attr value REQUIRED
     */
    def action = { attrs ->
        if ( !attrs['btnCssClass'] ) attrs['btnCssClass'] = DEFAULT_BTN_CSS_CLASS
        out << g.render(template: getThemeTemplate('action'), model: attrs)
    }

    /**
     * @attr id
     * @attr btnCssClass default is 'btn btn-primary'
     * @attr btnIconClass default is null
     * @attr value REQUIRED
     */
    def submit = { attrs ->
        if ( !attrs['btnCssClass'] ) attrs['btnCssClass'] = DEFAULT_BTN_CSS_CLASS
        out << g.render(template: getThemeTemplate('submit'), model: attrs)
    }

    /**
     * @attr id
     * @attr btnCssClass default is 'btn btn-primary'
     * @attr btnIconClass default is null
     * @attr value REQUIRED
     */
    def reset = { attrs ->
        if ( !attrs['btnCssClass'] ) attrs['btnCssClass'] = DEFAULT_BTN_CSS_CLASS
        out << g.render(template: getThemeTemplate('reset'), model: attrs)
    }


    /**
     * @attr id
     * @attr btnCssClass default is 'btn btn-primary'
     * @attr btnIconClass default is null
     * @attr value REQUIRED
     */
    def button = { attrs ->
        if ( !attrs['btnCssClass'] ) attrs['btnCssClass'] = DEFAULT_BTN_CSS_CLASS
        out << g.render(template: getThemeTemplate('button'), model: attrs)
    }

    private String getThemeTemplate(String templateName) {
        takinThemeService.getThemeTemplate(templateName, 'form/form/actions')
    }
}
