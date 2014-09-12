import bluehairedlawyer.Address
import bluehairedlawyer.Bank
import bluehairedlawyer.Lawsuits
import bluehairedlawyer.Person
import bluehairedlawyer.Phone
import bluehairedlawyer.security.SecRole
import bluehairedlawyer.security.SecUser
import bluehairedlawyer.security.SecUserSecRole


class BootStrap {

	def init = { servletContext ->

		def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
		def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)

		def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
				username: 'admin',
				password: 'admin',
				enabled: true).save(failOnError: true)

		def basicUser = SecUser.findByUsername('guest') ?: new SecUser(
				username: 'guest',
				password: 'guest',                          //pw encoded by security plugin
				enabled: true).save(failOnError: true)

		if (!adminUser.authorities.contains(adminRole)) {
			SecUserSecRole.create adminUser, adminRole
		}
		if (!basicUser.authorities.contains(userRole)) {
			SecUserSecRole.create basicUser, userRole
		}

		if (!Person.count()) {
			def client1 = new Person(name: "Ned Flanders", docNumber: "632.476.725-67", email: "flanders@email.com").save(failOnError: true)
			def client2 = new Person(name: "Luann Van Houten", docNumber: "767.811.071-51", email: "luann@email.com").save(failOnError: true)
			def client3 = new Person(name: "Apu Nahasapeemapetilon", docNumber: "364.456.253-98", email: "apu@email.com").save(failOnError: true)
			def client4 = new Person(name: "Bernice Hibbert", docNumber: "257.445.232-19", email: "bernice@email.com").save(failOnError: true)
			def client5 = new Person(name: "Walter Seymour Skinner", docNumber: "175.774.863-61", email: "skinner@email.com").save(failOnError: true)

			client1.addToAddresses(new Address(streetAddress: "Ever Green Terrace", number: "742", city: "Springfield", state: "SP", district: "Centro", zipCode: "15905-000")).save(failOnError: true)
			client2.addToAddresses(new Address(streetAddress: "Rua Plympton", number: "19", city: "Springfield", state: "SP", district: "Centro", zipCode: "15905-000")).save(failOnError: true)
			client3.addToAddresses(new Address(streetAddress: "Rua Walnut", number: "00", city: "Springfield", state: "SP", district: "Centro", zipCode: "15905-000")).save(failOnError: true)
			client4.addToAddresses(new Address(streetAddress: "Avenida Terra Alta", number: "15", city: "Springfield", state: "SP", district: "Centro", zipCode: "15905-000")).save(failOnError: true)
			client5.addToAddresses(new Address(streetAddress: "Rua Elm", number: "25", city: "Springfield", state: "SP", district: "Centro", zipCode: "15905-000")).save(failOnError: true)

			client1.addToPhones(new Phone(phoneNumber: "(19) 3256-9856", extension: "", contactPerson: "Rod")).save(failOnError: true)
			client3.addToPhones(new Phone(phoneNumber: "(19) 3365-9852", extension: "", contactPerson: "Kavi Nahasapeemapetilon")).save(failOnError: true)
			client5.addToPhones(new Phone(phoneNumber: "(19) 99855-2541", extension: "", contactPerson: "Agnes")).save(failOnError: true)
			
			if(!Lawsuits.count()) {
				def law1 = new Lawsuits(number: "025.14.111.222-3", client: client1).save(failOnError: true)
				def law2 = new Lawsuits(number: "023.36.666.999-2", client: client1).save(failOnError: true)
				def law3 = new Lawsuits(number: "123.45.678.910-1", client: client2).save(failOnError: true)
				def law4 = new Lawsuits(number: "987.65.432.100-9", client: client4).save(failOnError: true)
				def law5 = new Lawsuits(number: "111.22.333.444-5", client: client5).save(failOnError: true)
			}

		}
		
		if(!Bank.count()) {
			def bank1 = new Bank(name: "Itau", agency: "8974", currentAccount: "36258-9", initialBalance: 13526.00, currentBalance: 13526.00).save(failOnError: true)
			def bank2 = new Bank(name: "Bradesco", agency: "2589-6", currentAccount: "3256-0", initialBalance: 25.000, currentBalance: 25.000).save(failOnError: true)
			def bank3 = new Bank(name: "Banco do Brasil", agency: "8974-5", currentAccount: "56985-6", initialBalance: 5000.00, currentBalance: 5000.00).save(failOnError: true)
			def bank4 = new Bank(name: "Caixa interno", agency: "", currentAccount: "", initialBalance: 300.00, currentBalance: 300.00).save(failOnError: true)
		}
		
		



	}
	def destroy = {
	}
}
