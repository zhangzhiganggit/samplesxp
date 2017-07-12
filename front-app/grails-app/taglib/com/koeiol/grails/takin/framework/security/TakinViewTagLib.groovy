package com.koeiol.grails.takin.framework.security

/**
 *
 * @author xuhua@koeiol.com
 *
 */
class TakinViewTagLib {

    static namespace = "tk"
    static defaultEncodeAs = [taglib:'none']

    def takinSecurityService

    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def view = { attrs, body ->
        out << body()
    }

}
