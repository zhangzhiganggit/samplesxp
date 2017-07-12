package com.koeiol.grails.takin.framework.taglib.form

import grails.gsp.TagLib
import groovy.transform.CompileStatic
import org.grails.buffer.GrailsPrintWriter
import org.grails.encoder.CodecLookup
import org.grails.encoder.Encoder
import org.grails.gsp.GroovyPage
import org.grails.taglib.TagLibraryLookup

@CompileStatic
@TagLib
class TakinAutoCompleteTagLib {

    TagLibraryLookup gspTagLibraryLookup
    CodecLookup codecLookup
    GroovyPage groovyPage

    static namespace = "tk"
    static defaultEncodeAs = [taglib: 'none']

    /**
     * @attr name REQUIRED
     * @attr value
     * @attr linkParams REQUIRED
     * @attr enabled boolean, default is true
     * @attr placeholder
     */
    Closure autoComplete = { Map attrs ->
        String name = attrs.remove('name')
        String value = attrs.remove('value') ?: ''
        Map linkParams = (Map) attrs.remove("linkParams")
        String url = callLink(linkParams) {};
        String placeholder = attrs.remove("placeholder") ?: ''
        out << '<select name="' << name << '" value="' << value
        out << '" data-url="' << url
        out << '" data-placeholder="' << placeholder << '"'
        outputAttributes(attrs, out)
        out << '></select>'  //TODO so
    }

    void outputAttributes(Map attrs, GrailsPrintWriter writer, boolean useNameAsIdIfIdDoesNotExist = false) {
        attrs.remove('tagName') // Just in case one is left
        Encoder htmlEncoder = codecLookup?.lookupEncoder('HTML')
        attrs.each { k, v ->
            if (v != null) {
                writer << k
                writer << '="'
                writer << (htmlEncoder != null ? htmlEncoder.encode(v) : v)
                writer << '" '
            }
        }
        if (useNameAsIdIfIdDoesNotExist) {
            outputNameAsIdIfIdDoesNotExist(attrs, writer)
        }
    }

    private void outputNameAsIdIfIdDoesNotExist(Map attrs, GrailsPrintWriter out) {
        if (!attrs.containsKey('id') && attrs.containsKey('name')) {
            Encoder htmlEncoder = codecLookup?.lookupEncoder('HTML')
            out << 'id="'
            out << (htmlEncoder != null ? htmlEncoder.encode(attrs.name) : attrs.name)
            out << '" '
        }
    }

    private callLink(Map attrs, Closure body) {
        '/' << attrs['controller'] << '/' << attrs['action']
    }
}
