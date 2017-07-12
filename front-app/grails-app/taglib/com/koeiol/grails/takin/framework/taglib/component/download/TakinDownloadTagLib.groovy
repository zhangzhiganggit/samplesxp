package com.koeiol.grails.takin.framework.taglib.component.download

/**
 * 文件下载标签
 */
class TakinDownloadTagLib {

    static namespace = "component"
    static defaultEncodeAs = [taglib: 'none']

    def takinThemeService

    /**
     * @attr title
     * @attr filePath REQUIRED
     * @attr fileName
     */
    def download = { attrs, body ->
        //
        if (!attrs['title']) attrs['title'] = message(code: 'default.download.action.label')
//        if (!attrs['isAbsolutePath']) attrs['isAbsolutePath'] = false;
        out << g.render(template: takinThemeService.getThemeTemplate('download', 'component/download'), model: attrs)
    }
}
