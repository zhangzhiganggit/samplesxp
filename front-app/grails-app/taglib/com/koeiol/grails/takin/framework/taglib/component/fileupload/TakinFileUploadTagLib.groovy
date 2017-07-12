package com.koeiol.grails.takin.framework.taglib.component.fileupload

class TakinFileUploadTagLib {

    static namespace = "component"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * 单个文件上传
     * @attr title REQUIRED
     * @attr name REQUIRED
     */
    def simpleFileupload = { attrs, body ->
        //
        out << g.render(template: takinThemeService.getThemeTemplate('simpleFileupload', 'component/fileupload'), model: attrs)
    }

    /**
     * 多文件上传
     * @attr controller REQUIRED controller name
     * @attr action REQUIRED action name
     * @attr title REQUIRED
     * @attr name REQUIRED
     */
    def multipleFileupload = { attrs, body ->
        //
        attrs['dataUrl'] = '/' << attrs['controller'] << '/' << attrs['action']
        out << g.render(template: takinThemeService.getThemeTemplate('multipleFileupload', 'component/fileupload'), model: attrs)
    }
}
