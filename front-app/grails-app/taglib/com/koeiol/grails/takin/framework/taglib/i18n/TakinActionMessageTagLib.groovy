package com.koeiol.grails.takin.framework.taglib.i18n

class TakinActionMessageTagLib {

    static namespace = "actionMessage"
    static defaultEncodeAs = [taglib:'none']

    /**
     * @attr controller REQUIRED
     */
    def index = {

    }

    /**
     * @attr controller REQUIRED controller name. ( controller.${controller}.${action}.label )
     * @attr action REQUIRED action name.
     * @attr args
     */
    Closure controllerAction = { Map attrs ->
        out << g.message(code: "controller.${attrs['controller']}.${attrs['action']}.label", args: attrs['args'], default: message(code: "default.${attrs['action']}.label", args: attrs['args']))
    }

}
