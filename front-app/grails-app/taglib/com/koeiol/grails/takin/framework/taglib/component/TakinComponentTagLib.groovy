package com.koeiol.grails.takin.framework.taglib.component

class TakinComponentTagLib {

    static namespace = "component"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr style 'light' or 'box', default is 'light'
     * @attr color ignore where istyle == 'light', otherwise change title bg-color.
     * @attr cssClass
     */
    def portlet = { attrs, body ->
        if ( !attrs['style'] ) attrs['style'] = 'light'
        if ( attrs['style'] != 'light' && !attrs.containsKey('color') ) attrs['color'] = 'green'
        attrs['body'] = body()
        out << g.render(template: takinThemeService.getThemeTemplate('portlet', 'component/portlet'), model: attrs)
    }

    /**
     * @attr controller see also g.createLink
     * @attr action see also g.createLink
     * @attr url see also g.createLink
     * @attr style in ['alert', 'mail', 'calendar'], default is 'alert'
     * @attr domId
     * @attr count the number of badge.
     */
    def notice = { attrs ->
        if ( !['alert', 'mail', 'calendar'].contains(attrs['style']) ) attrs['style'] = 'alert'
        if ( !attrs['url'] ) {
            attrs['url'] = [:]
            def controller = attrs.remove('controller')
            if ( controller ) attrs['url']['controller'] = controller
            attrs['url']['action'] = attrs.remove('action')
            attrs['url'] = g.createLink(attrs['url'])
        }
        out << g.render(template: takinThemeService.getThemeTemplate('notice', 'component/notice'), model: attrs)
    }

}