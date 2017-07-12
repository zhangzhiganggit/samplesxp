package com.koeiol.grails.takin.framework.taglib.component

import grails.gsp.TagLib
import grails.util.TypeConvertingMap
import grails.web.mapping.UrlMapping
import groovy.transform.CompileStatic
import org.grails.encoder.CodecLookup
import org.grails.encoder.Encoder
import org.springframework.web.servlet.support.RequestContextUtils

@CompileStatic
@TagLib
class TakinUrlMappingTagLib {

    CodecLookup codecLookup

    static namespace = "component"

    static defaultEncodeAs = [taglib: 'none']

    /**
     * Creates next/previous links to support pagination for the current controller.<br/>
     *
     * &lt;g:paginate total="${Account.count()}" /&gt;<br/>
     *
     * @emptyTag
     *
     * @attr total REQUIRED The total number of results to paginate
     * @attr action the name of the action to use in the link, if not specified the default action will be linked
     * @attr controller the name of the controller to use in the link, if not specified the current controller will be linked
     * @attr id The id to use in the link
     * @attr params A map containing request parameters
     * @attr prev The text to display for the previous link (defaults to "Previous" as defined by default.paginate.prev property in I18n messages.properties)
     * @attr next The text to display for the next link (defaults to "Next" as defined by default.paginate.next property in I18n messages.properties)
     * @attr omitPrev Whether to not show the previous link (if set to true, the previous link will not be shown)
     * @attr omitNext Whether to not show the next link (if set to true, the next link will not be shown)
     * @attr omitFirst Whether to not show the first link (if set to true, the first link will not be shown)
     * @attr omitLast Whether to not show the last link (if set to true, the last link will not be shown)
     * @attr max The number of records displayed per page (defaults to 10). Used ONLY if params.max is empty
     * @attr maxsteps The number of steps displayed for pagination (defaults to 10). Used ONLY if params.maxsteps is empty
     * @attr offset Used only if params.offset is empty
     * @attr mapping The named URL mapping to use to rewrite the link
     * @attr fragment The link fragment (often called anchor tag) to use
     * @attr pageSizeChoose
     */
    def paginate = { Map attrsMap ->
        TypeConvertingMap attrs = (TypeConvertingMap) attrsMap
        def writer = out
        if (attrs.total == null) {
            throwTagError("Tag [paginate] is missing required attribute [total]")
        }

        def messageSource = grailsAttributes.messageSource
        def locale = RequestContextUtils.getLocale(request)

        def total = attrs.int('total') ?: 0
        def offset = params.int('offset') ?: 0
        def max = params.int('max')
        def maxsteps = (attrs.int('maxsteps') ?: 5)

        if (!offset) offset = (attrs.int('offset') ?: 0)
        if (!max) max = (attrs.int('max') ?: 10)

        Map linkParams = [:]
        if (attrs.params instanceof Map) linkParams.putAll((Map) attrs.params)
        linkParams.offset = offset - max
        linkParams.max = max
        if (params.sort) linkParams.sort = params.sort
        if (params.order) linkParams.order = params.order

        Map linkTagAttrs = [:]
        def action
        if (attrs.containsKey('mapping')) {
            linkTagAttrs.mapping = attrs.mapping
            action = attrs.action
        } else {
            action = attrs.action ?: params.action
        }
        if (action) {
            linkTagAttrs.action = action
        }
        if (attrs.controller) {
            linkTagAttrs.controller = attrs.controller
        }
        if (attrs.containsKey(UrlMapping.PLUGIN)) {
            linkTagAttrs.put(UrlMapping.PLUGIN, attrs.get(UrlMapping.PLUGIN))
        }
        if (attrs.containsKey(UrlMapping.NAMESPACE)) {
            linkTagAttrs.put(UrlMapping.NAMESPACE, attrs.get(UrlMapping.NAMESPACE))
        }
        if (attrs.id != null) {
            linkTagAttrs.id = attrs.id
        }
        if (attrs.fragment != null) {
            linkTagAttrs.fragment = attrs.fragment
        }
        linkTagAttrs.params = linkParams

        // determine paging variables
        def steps = maxsteps > 0
        int currentstep = ((offset / max) as int) + 1
        int firststep = 1
        int laststep = Math.round(Math.ceil(total / max)) as int

        Object[] statusArgs = [
                offset + 1,
                offset + max < total ? offset + max : total,
                total
        ]
        writer << '<div class="row"><div class="col-md-6 col-sm-6" style="margin-bottom:10px;">'
        if (total > 0) {
            if (attrs.pageSizeChoose){
                writer <<
                        '<div class="col-md-5 col-sm-6" style="display:block;overflow:hidden;line-height:35px;"><div class="" style="padding-top:5px;width:40px;float:left;">每页</div><div class="" style="padding-top:5px;width:80px;float:left;">' +
                        '<select class="form-control takin-pageSizeChoose" style="vertical-align: 5px;line-height: 30px;"><option>100</option><option>200</option></select></div><div class="" style="padding-top:5px;float:left;">条</div>' +
                        '</div>'

            } else {
                writer <<
                        '<div class="col-md-5 col-sm-6" style="display:block;overflow:hidden;line-height:35px;"><div class="" style="padding-top:5px;width:40px;float:left;">每页</div><div class="" style="padding-top:5px;width:80px;float:left;">' +
                        '<select class="form-control takin-pageSizeChoose" style="vertical-align: 5px;line-height: 30px;"><option>10</option><option>30</option><option>50</option><option>100</option></select></div><div class="" style="padding-top:5px;float:left;">条</div>' +
                        '</div>'
            }
        }
        writer << '<div class="dataTables_info col-md-7 col-sm-6" id="sample_1_info" role="status" aria-live="polite" style="line-height:35px;">'
        if (total > 0) {
            writer << messageSource.getMessage('paginate.status', statusArgs, messageSource.getMessage('default.paginate.status', statusArgs, 'Showing {0} to {1} of {2} entries', locale), locale)
        } else {
            writer << messageSource.getMessage('default.paginate.not.found', null, 'default.paginate.not.found', locale)
        }
        writer << '</div></div><div class="col-md-6 col-sm-6"><div class="dataTables_paginate paging_simple_numbers text-right">'
        writer << '<ul class="pagination">'

        // display previous link when not on firststep unless omitPrev is true
        if (currentstep > firststep && !attrs.boolean('omitPrev')) {
            linkTagAttrs.put('class', 'prevLink')
            linkParams.offset = offset - max
            writer << '<li class="prev">' << callLink((Map) linkTagAttrs.clone()) {
                (attrs.prev ?: messageSource.getMessage('paginate.prev', null, messageSource.getMessage('default.paginate.prev', null, 'Previous', locale), locale))
            } << '</li>'
        }

        // display steps when steps are enabled and laststep is not firststep
        if (steps && laststep > firststep) {
            linkTagAttrs.put('class', 'step')

            // determine begin and endstep paging variables
            int beginstep = currentstep - (Math.round(maxsteps / 2.0d) as int) + (maxsteps % 2)
            int endstep = currentstep + (Math.round(maxsteps / 2.0d) as int) - 1

            if (beginstep < firststep) {
                beginstep = firststep
                endstep = maxsteps
            }
            if (endstep > laststep) {
                beginstep = laststep - maxsteps + 1
                if (beginstep < firststep) {
                    beginstep = firststep
                }
                endstep = laststep
            }

            // display firststep link when beginstep is not firststep
            if (beginstep > firststep && !attrs.boolean('omitFirst')) {
                linkParams.offset = 0
                writer << '<li class="prev">' << callLink((Map) linkTagAttrs.clone()) { firststep + '' } << '</li>'
            }
            //show a gap if beginstep isn't immediately after firststep, and if were not omitting first or rev
            if (beginstep > firststep + 1 && (!attrs.boolean('omitFirst') || !attrs.boolean('omitPrev'))) {
                writer << '<li><a href="javascript:void(0);">...</a></li>'
            }

            // display paginate steps
            (beginstep..endstep).each { int i ->
                if (currentstep == i) {
                    //writer << '<li class=\"active\"><a href=\"javascript:void(0);\">' << i << '</a></li>'
                    //bug SMS-1938 add by  matieli
                    writer << '<li class=\"active\"><span>' << i << '</span></li>'
                } else {
                    linkParams.offset = (i - 1) * max
                    writer << '<li>' << callLink((Map) linkTagAttrs.clone()) { i + '' } << '</li>'
                }
            }

            //show a gap if beginstep isn't immediately before firststep, and if were not omitting first or rev
            if (endstep + 1 < laststep && (!attrs.boolean('omitLast') || !attrs.boolean('omitNext'))) {
                writer << '<li><a href="javascript:void(0);">...</a></li>'
            }
            // display laststep link when endstep is not laststep
            if (endstep < laststep && !attrs.boolean('omitLast')) {
                linkParams.offset = (laststep - 1) * max
                writer << '<li>' << callLink((Map) linkTagAttrs.clone()) { laststep + '' } << '</li>'
            }
        }

        // display next link when not on laststep unless omitNext is true
        if (currentstep < laststep && !attrs.boolean('omitNext')) {
            linkTagAttrs.put('class', 'nextLink')
            linkParams.offset = offset + max
            writer << '<li>' << callLink((Map) linkTagAttrs.clone()) {
                (attrs.next ? attrs.next : messageSource.getMessage('paginate.next', null, messageSource.getMessage('default.paginate.next', null, 'Next', locale), locale))
            } << '</li>'
        }

        writer << '</ul></div></div></div>'
    }

    /**
     * Renders a sortable column to support sorting in list views.<br/>
     *
     * Attribute title or titleKey is required. When both attributes are specified then titleKey takes precedence,
     * resulting in the title caption to be resolved against the message source. In case when the message could
     * not be resolved, the title will be used as title caption.<br/>
     *
     * Examples:<br/>
     *
     * &lt;g:sortableColumn property="title" title="Title" /&gt;<br/>
     * &lt;g:sortableColumn property="title" title="Title" style="width: 200px" /&gt;<br/>
     * &lt;g:sortableColumn property="title" titleKey="book.title" /&gt;<br/>
     * &lt;g:sortableColumn property="releaseDate" defaultOrder="desc" title="Release Date" /&gt;<br/>
     * &lt;g:sortableColumn property="releaseDate" defaultOrder="desc" title="Release Date" titleKey="book.releaseDate" /&gt;<br/>
     *
     * @emptyTag
     *
     * @attr property - name of the property relating to the field
     * @attr defaultOrder default order for the property; choose between asc (default if not provided) and desc
     * @attr title title caption for the column
     * @attr titleKey title key to use for the column, resolved against the message source
     * @attr params a map containing request parameters
     * @attr action the name of the action to use in the link, if not specified the list action will be linked
     * @attr params A map containing URL query parameters
     * @attr class CSS class name
     */
    Closure sortableColumn = { Map attrs ->
        def writer = out
        if (!attrs.property) {
            throwTagError("Tag [sortableColumn] is missing required attribute [property]")
        }

        def property = attrs.remove("property")
        def action = attrs.action ? attrs.remove("action") : (actionName ?: "list")

        def defaultOrder = attrs.remove("defaultOrder")
        if (defaultOrder != "desc") defaultOrder = "asc"

        // current sorting property and order
        def sort = params.sort
        def order = params.order

        // add sorting property and params to link params
        Map linkParams = [:]
        if (params.id) linkParams.put("id", params.id)
        def paramsAttr = attrs.remove("params")
        if (paramsAttr instanceof Map) linkParams.putAll(paramsAttr)
        linkParams.sort = property

        // propagate "max" and "offset" standard params
        if (params.max) linkParams.max = params.max
        if (params.offset) linkParams.offset = params.offset

        // determine and add sorting order for this column to link params
        attrs['class'] = (attrs['class'] ? "${attrs['class']} sortable" : "sortable")
        if (property == sort) {
            attrs['class'] = (attrs['class'] as String) + " sorting_${order}"
            if (order == "asc") {
                linkParams.order = "desc"
            } else {
                linkParams.order = "asc"
            }
        } else {
            linkParams.order = defaultOrder
        }

        // determine column title
        String title = attrs.remove("title") as String
        String titleKey = attrs.remove("titleKey") as String
        Object mapping = attrs.remove('mapping')
        if (titleKey) {
            if (!title) title = titleKey
            def messageSource = grailsAttributes.messageSource
            def locale = RequestContextUtils.getLocale(request)
            title = messageSource.getMessage(titleKey, null, title, locale)
        }

        writer << "<th "
        // process remaining attributes
        Encoder htmlEncoder = codecLookup.lookupEncoder('HTML')
        attrs.each { k, v ->
            writer << k
            writer << "=\""
            writer << htmlEncoder.encode(v)
            writer << "\" "
        }
        writer << '>'
        Map linkAttrs = [:]
        linkAttrs.params = linkParams
        if (mapping) {
            linkAttrs.mapping = mapping
        }

        linkAttrs.action = action

        writer << callLink((Map) linkAttrs) { title }
        writer << '</th>'
    }

    Closure sortColumn = { Map attrs, Closure body ->
        def writer = out
        def property = attrs.remove('property')
        def order = params?.order ?: 'asc'
        writer << '<th class="sortColumn'
        if (params.sort == property) {
            writer << ' sorting_' << order << '" data-order="' << (order == 'asc' ? 'desc' : 'asc') << '"'
        } else {
            writer << ' sorting" data-order="asc"'
        }
        writer << ' data-sort="' << property << '">' << '' + body() << '</th>'
    }

    private callLink(Map attrs, Closure body) {
        //GroovyPage.captureTagOutput(gspTagLibraryLookup, 'g', 'link', attrs, body, webRequest)
        '<a href="javascript:void(0);" data-offset="' << attrs.params['offset'] << '">' << body() << '</a>'
    }
}
