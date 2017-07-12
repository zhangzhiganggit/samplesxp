package com.koeiol.grails.takin.framework.theme

import grails.transaction.Transactional

@Transactional
class TakinThemeService {

    String DEFAULT_THEME_NAME = 'default'

    def getThemeTemplate(String templateName) {
        "/_themes/default/${templateName}"
    }

    def getThemeTemplate(String templateName, String categoryName) {
        "/_themes/default/${categoryName}/${templateName}"
    }

    def getThemeTemplateWithOutButton(String templateName, String categoryName) {
        "/_themes/default/${categoryName}/${templateName}"
    }
}
