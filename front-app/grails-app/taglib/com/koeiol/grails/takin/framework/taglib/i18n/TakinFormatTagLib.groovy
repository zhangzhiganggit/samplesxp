package com.koeiol.grails.takin.framework.taglib.i18n

/**
 * 
 * @author xuhua@koeiol.com
 *
 */
class TakinFormatTagLib {

	static namespace = "format"
	static defaultEncodeAs = [taglib:'none']

	/**
	 * @attr prefix REQUIRED
	 * @attr value REQUIRED
	 */
	def booleanValue = { attrs ->
		out << g.message(code: "${attrs['prefix']}.${attrs['value']}", default: g.message(code: "default.boolean.${attrs['value']}"))
	}

	/**
	 * @attr prefix REQUIRED
	 * @attr value REQUIRED
	 */
	def dateValue = { attrs ->
		def format = g.message(code: "${attrs['prefix']}.format", default: g.message(code: "default.date.format"))
		out << g.formatDate(date: attrs['value'], format: format)
	}

	/**
	 * @attr prefix REQUIRED
	 * @attr value REQUIRED
	 */
	def numberValue = { attrs ->
		def format = g.message(code: "${attrs['prefix']}.format", default: g.message(code: "default.number.format"))
		out << g.formatNumber(number: attrs['value'], format: format)
	}

	/**
	 * @attr prefix REQUIRED
	 * @attr value REQUIRED
	 */
	def currencyValue = { attrs ->
		def format = g.message(code: "${attrs['prefix']}.format", default: g.message(code: "default.currency.format"))
		out << g.formatNumber(number: attrs['value'], format: format)
	}
}
