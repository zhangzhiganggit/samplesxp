package com.koeiol.grails.takin.framework.taglib.component.select

/**
 * Select
 */
class TakinSelectTagLib {

    static namespace = "component"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * Multiple select boxes
     *
     * @attr id REQUIRED
     * @attr name REQUIRED
     * @attr title REQUIRED
     * @attr from REQUIRED
     * @attr cssClass
     */
    def multipleSelectBoxes = { attrs, body ->
        //
        out << g.render(template: takinThemeService.getThemeTemplate('multipleSelectBoxes', 'component/select'), model: attrs)
    }
}
