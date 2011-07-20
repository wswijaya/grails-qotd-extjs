import org.xaab.qotd.*

class BootStrap {
	def springSecurityService
	
    def init = { servletContext ->
		new Quote(author: "Unknown", content: "If you think sunshine brings you happiness, then you haven’t danced in the rain.").save()
		new Quote(author: "Lao Tzu", content: "An ant on the move does more than a dozing ox.").save()
		new Quote(author: "Tony Robbins", content: "It not knowing what to do, it’s doing what you know.").save()
		new Quote(author: "Bruce Lee", content: "Simplicity is the key to brilliance.").save()
		
		new Requestmap(url: '/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
		new Requestmap(url: '/quote/**', configAttribute: 'ROLE_ADMIN,IS_AUTHENTICATED_FULLY').save()

		new Requestmap(url: '/js/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new Requestmap(url: '/css/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new Requestmap(url: '/images/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new Requestmap(url: '/ext-4.0.2/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new Requestmap(url: '/quote/random', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new Requestmap(url: '/login/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new Requestmap(url: '/logout/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		
		def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
		
		def adminUser = User.findByUsername('admin') ?: new User(
			username: 'admin',
			password: springSecurityService.encodePassword('admin'),
			enabled: true).save(failOnError: true)
		
		if (!adminUser.authorities.contains(adminRole)) {
			UserRole.create(adminUser, adminRole)
		}
    }
    def destroy = {
    }
}
