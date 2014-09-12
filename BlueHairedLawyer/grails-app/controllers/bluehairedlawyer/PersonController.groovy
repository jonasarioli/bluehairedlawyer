package bluehairedlawyer

/**
 * PersonController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PersonController {

	static scaffold = Person
//	def index = { }
	
	def create() {

		def personInstance = new Person()
		personInstance.properties = params
		
		[personInstance: personInstance]
	}
	
	def edit() {
		println "edit person " + params
		
		def personInstance = Person.get(params.id)
		
		[personInstance: personInstance, 
			addressInstance: personInstance.getAddresses().toList().get(0),
			phoneInstance: personInstance.getPhones().toList().get(0) ]
	}
	
	def update() {
		
		println "update person " + params
		
		def personInstance = Person.get(params.id)
		
		if (!personInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'item.label', default: 'Item'), params.id])
			redirect(action: "list")
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (personInstance.version > version) {
				personInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						  [message(code: 'item.label', default: 'Item')] as Object[],
						  "Another user has updated this Item while you were editing")
				render(view: "edit", model: [personInstance: personInstance])
				return
			}
		}

		personInstance.properties = params
		personInstance.addresses.asList().getAt(0).properties = params
		personInstance.phones.asList().getAt(0).properties = params
		
		if (!personInstance.save(flush: true)) {
			render(view: "edit", model: [personInstance: personInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'item.label', default: 'Item'), personInstance.id])
		redirect(action: "show", id: personInstance.id)
	}
	
	def save() {
		
		def addressInstance = new Address(params)
		def personInstance = new Person(params)
		def phoneInstance = new Phone(params)
		
		addressInstance.person = personInstance
		phoneInstance.person = personInstance
		personInstance.save()
		
		addressInstance.save()
		phoneInstance.save()
		
		// TODO allow inspection screen to set the time
		if (!personInstance.save(flush: true)) {
			render(view: "create", model: [personInstance: personInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'person'), personInstance.id])
		redirect(action: "show", id: personInstance.id)

	}
}
