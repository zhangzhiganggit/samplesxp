package com.koeiol.grails.takin.framework.security

/**
 *
 */
class TakinSecMenuTagLib {

    static namespace = "secMenu"
    static defaultEncodeAs = [taglib: 'none']

    def takinSecMenuService

    Closure canViewSuiYiTong = { Map attrs, Closure body ->
        if (takinSecMenuService.canViewSuiYiTong()) {
            out << body()
        }
    }

}

