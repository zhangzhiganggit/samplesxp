package com.koeiol.grails.takin.framework.taglib.component.portlet

/**
 *
 */
class TakinPortletTagLib {

    static namespace = "portlet"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr iconCssClass such as 'icon-equalizer'
     * @attr title REQUIRED
     * @attr titleHelper
     * @attr actions inList ['collapse', 'config', 'reload', 'remove', 'fullscreen'], default is ['collapse', 'fullscreen']
     */
    def title = { attrs ->
        if ( !attrs['actions'] ) attrs['actions'] = ['collapse', 'fullscreen']
        out << g.render(template: getThemeTemplate('portletTitle'), model: attrs)
    }

    /**
     * @attr withForm default is false
     */
    def body = { attrs, body ->
        if ( !attrs.containsKey('withForm') ) attrs['withForm'] = 'false'
        attrs['body'] = body()
        out << g.render(template: getThemeTemplate('portletBody'), model: attrs)
    }

    private String getThemeTemplate(String templateName) {
        takinThemeService.getThemeTemplate(templateName, 'component/portlet')
    }
}

