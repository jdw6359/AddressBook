require './contact'



class AddressBook

	attr_reader :contacts

	def initialize
		@contacts=[]
	end 


	def print_contact_list
		puts "Contact List"
		contacts.each do |contact|
			puts contact.to_s("last_first")
		end 

	end 

end


address_book=AddressBook.new
	
josh=Contact.new
josh.first_name="Josh"
josh.middle_name="Dodge"
josh.last_name="Woodward"
josh.add_phone_number("Home","123-456-7890")
josh.add_phone_number("Work","000-123-4567")
josh.add_address("Home", "200 Example St.", " ", "Nowhere", "PA", "89456")

address_book.contacts.push(josh)
address_book.print_contact_list