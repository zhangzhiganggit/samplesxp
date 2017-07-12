package com.koeiol.grails.takin.framework.taglib.form

/**
 *
 */
class TakinFormTagLib {

    static namespace = "form"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * Creates a form that submits to a controller, action, and/or id. Beyond what is described below, all the usual HTML attributes apply.
     *
     * @attr controller The name of the controller to use in the link; if not specified the current controller will be linked
     * @attr action The name of the action to use in the link; if not specified the default action will be linked
     * @attr url A map containing the action,controller,id etc.
     * @attr id The id to use in the link
     * @attr params A Map of request parameters
     * @attr name A value to use for both the name and id attribute of the form tag
     * @attr useToken Set whether to send a token in the request to handle duplicate form submissions.
     * @attr method The form method to use, either POST or GET; defaults to POST
     * @attr cssClass
     */
    def form = { attrs, body ->
        if ( !attrs['method'] ) attrs['method'] = 'POST'
        if ( !attrs['cssClass'] ) attrs['cssClass'] = 'form-horizontal'
        else attrs['cssClass'] += ' form-horizontal'
        if ( !attrs['url'] ) {
            attrs['url'] = [:]
            def controller = attrs.remove('controller')
            if ( controller ) attrs['url']['controller'] = controller
            attrs['url']['action'] = attrs.remove('action')
            attrs['action'] = g.createLink(attrs['url'])
        }
        attrs['body'] = body()
        out << g.render(template: takinThemeService.getThemeTemplate('form', 'form'), model: attrs)
    }

    /**
     *
     */
    def body = { attrs, body ->
        attrs['body'] = body()
        out << g.render(template: takinThemeService.getThemeTemplate('body', 'form/form'), model: attrs)
    }

    /**
     * @EmptyTag
     */
    def scaffoldSearchProperties = { attrs ->
        out << g.render(template: takinThemeService.getThemeTemplate('scaffoldSearchProperties', 'form/form'), model: attrs)
    }

    /**
     *
     */
    def actions = { attrs, body ->
        attrs['body'] = body()
        out << g.render(template: takinThemeService.getThemeTemplate('actions', 'form/form'), model: attrs)
    }

}
