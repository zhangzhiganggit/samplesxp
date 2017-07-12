package com.zzg

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class SystemIdentity implements Serializable {

	private static final long serialVersionUID = 1

	String authority

	static constraints = {
		authority blank: false, unique: true
	}

	static mapping = {
		table(name: 'M_SYSTEM_IDENTITY')
		id(column: 'id', generator: 'uuid')
		cache true
	}
}
