require './contact'

class AddressBook

	attr_reader :contacts

	def initialize
		@contacts=[]
	end 


	def print_results(search,results)
		puts "#{search}"
		results.each do |contact|
			puts contact.to_s('full_name')
			contact.print_phone_numbers
			contact.print_addresses
			puts "\n"
		end 
	end


	#iterates over every contact in @contacts and returns matches
	def find_by_name(name)
		results=[]
		search=name.downcase

		contacts.each do |contact|
			if contact.full_name.downcase.include?(search) 
				results.push(contact) unless results.include?(contact)
			end 
		end 	
		print_results("Name search results (#{search})",results)	 
	end


	def find_by_phone_number(number)
		results=[]
		search=number.gsub("-","")

		contacts.each do |contact|
			contact.phone_numbers.each do |phone_number|
				if phone_number.number.gsub("-","").include?(search)
					results.push(contact) unless results.include?(contact)
				end 
			end 
		end 
		print_results("Phone search results (#{search})", results)
	end


	def find_by_address(query)
		results=[]
		search=query.downcase
		
		contacts.each do |contact|
			contact.addresses.each do |address|
				if address.to_s('long').downcase.include?(search)
					results.push(contact) unless results.include?(contact)
				end 
			end 
		end 

		print_results("Address search results (#{search})",results)
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

scott=Contact.new
scott.first_name="Scott"
scott.middle_name="Rumor"
scott.last_name="Jacoby"
scott.add_phone_number("Home","555-555-5555")
scott.add_phone_number("Cell","1-800-867-5309")
scott.add_address("Work", "365 Business Avenue", "Suite #678 ", "NY", "NY", "12345")




address_book.contacts.push(josh)
address_book.contacts.push(scott)
#address_book.print_contact_list

address_book.find_by_name("jos")
address_book.find_by_name("scot")
address_book.find_by_phone_number("456")
address_book.find_by_phone_number("00")
address_book.find_by_address("busi")
