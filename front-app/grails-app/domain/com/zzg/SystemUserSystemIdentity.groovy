package com.zzg

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class SystemUserSystemIdentity implements Serializable {

	private static final long serialVersionUID = 1

	SystemUser systemUser
	SystemIdentity systemIdentity

	@Override
	boolean equals(other) {
		if (other instanceof SystemUserSystemIdentity) {
			other.systemUserId == systemUser?.id && other.systemIdentityId == systemIdentity?.id
		}
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (systemUser) builder.append(systemUser.id)
		if (systemIdentity) builder.append(systemIdentity.id)
		builder.toHashCode()
	}

	static SystemUserSystemIdentity get(long systemUserId, long systemIdentityId) {
		criteriaFor(systemUserId, systemIdentityId).get()
	}

	static boolean exists(long systemUserId, long systemIdentityId) {
		criteriaFor(systemUserId, systemIdentityId).count()
	}

	private static DetachedCriteria criteriaFor(long systemUserId, long systemIdentityId) {
		SystemUserSystemIdentity.where {
			systemUser == SystemUser.load(systemUserId) &&
			systemIdentity == SystemIdentity.load(systemIdentityId)
		}
	}

	static SystemUserSystemIdentity create(SystemUser systemUser, SystemIdentity systemIdentity) {
		def instance = new SystemUserSystemIdentity(systemUser: systemUser, systemIdentity: systemIdentity)
		instance.save()
		instance
	}

	static boolean remove(SystemUser u, SystemIdentity r) {
		if (u != null && r != null) {
			SystemUserSystemIdentity.where { systemUser == u && systemIdentity == r }.deleteAll()
		}
	}

	static int removeAll(SystemUser u) {
		u == null ? 0 : SystemUserSystemIdentity.where { systemUser == u }.deleteAll()
	}

	static int removeAll(SystemIdentity r) {
		r == null ? 0 : SystemUserSystemIdentity.where { systemIdentity == r }.deleteAll()
	}

	static constraints = {
		systemIdentity validator: { SystemIdentity r, SystemUserSystemIdentity ur ->
			if (ur.systemUser?.id) {
				SystemUserSystemIdentity.withNewSession {
					if (SystemUserSystemIdentity.exists(ur.systemUser.id, r.id)) {
						return ['userRole.exists']
					}
				}
			}
		}
	}

	static mapping = {
		id composite: ['systemUser', 'systemIdentity']
		version false
		table(name: 'M_SYSTEM_USER_IDENTITY')
		id(column: 'id', generator: 'uuid')
	}
}
