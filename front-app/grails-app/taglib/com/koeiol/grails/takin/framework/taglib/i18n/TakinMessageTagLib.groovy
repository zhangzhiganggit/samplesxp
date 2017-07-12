package com.koeiol.grails.takin.framework.taglib.i18n

/**
 * 
 * @author xuhua@koeiol.com
 *
 */
class TakinMessageTagLib {

	static namespace = "message"
	static defaultEncodeAs = [taglib:'none']

	/**
	 * @attr controller REQUIRED controller name. ( controller.${controller}.label )
	 */
	Closure controller = { Map attrs ->
		out << g.message(code: "controller.${attrs['controller']}.label")
	}
	
	/**
	 * @attr controller REQUIRED controller name. ( controller.${controller}.icon )
	 */
	Closure controllerIcon = { Map attrs ->
		out << g.message(code: "controller.${attrs['controller']}.icon", default: message(code: 'default.icon.controller'))
	}

	/**
	 * @attr controller REQUIRED controller name. ( controller.${controller}.color )
	 */
	Closure controllerColor = { Map attrs ->
		out << g.message(code: "controller.${attrs['controller']}.color", default: message(code: "default.color.controller"))
	}
	
	/**
	 * @attr controller REQUIRED controller name. ( controller.${controller}.tooltip )
	 */
	Closure controllerTooltip = { Map attrs ->
		out << g.message(code: "controller.${attrs['controller']}.tooltip", default: message(code: "controller.default.tooltip"))
	}
	
	/**
	 * @attr controller REQUIRED controller name. ( controller.${controller}.${action}.label )
	 * @attr action REQUIRED action name.
	 * @attr args
	 */
	Closure controllerAction = { Map attrs ->
		out << g.message(code: "controller.${attrs['controller']}.${attrs['action']}.label", args: attrs['args'], default: message(code: "default.${attrs['action']}.label", args: attrs['args']))
	}
	
	/**
	 * @attr controller REQUIRED controller name. ( controller.${controller}.${action}.icon )
	 * @attr action REQUIRED action name.
	 */
	Closure controllerActionIcon = { Map attrs ->
		out << g.message(code: "controller.${attrs['controller']}.${attrs['action']}.icon", default: message(code: "default.icon.action.${attrs['action']}", default: message(code: 'default.icon.action')))
	}

	/**
	 * @attr domain REQUIRED
	 */
	Closure domain = { Map attrs ->
		def code = "${attrs['domain']}.label"
		out << g.message(code: code, default: g.message(code: "default.domain.${attrs['property']}.label", default: code))
	}

	/**
	 * @attr domain REQUIRED
	 * @attr property REQUIRED
	 */
	Closure property = { Map attrs ->
		def code = "${attrs['domain']}.${attrs['property']}.label"
		out << g.message(code: code, default: g.message(code: "default.property.${attrs['property']}.label", default: code))
	}

}
