package com.koeiol.grails.takin.framework.taglib.menu

/**
 *
 */
class TakinMenuTagLib {

    static namespace = "menu"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr controller REQUIRED controller名
     * @attr action action名
     * @attr activeControllers 除了上面指定的controller以外，还有哪些controller时高亮
     */
    Closure rootMenu = { Map attrs ->

        if (!attrs.containsKey('action')) attrs['action'] = 'index'
        if (!attrs.containsKey('activeControllers')) attrs['activeControllers'] = []
        out << g.render(template: takinThemeService.getThemeTemplate('rootMenu', 'menu'), model: attrs)
    }

    /**
     * @attr menus REQUIRED
     */
    def shortcutMenu = { attrs, body ->
        out << g.render(template: takinThemeService.getThemeTemplate('shortcutMenu', 'menu'), model: attrs)
    }
}
