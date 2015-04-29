class Contact

	attr_writer :first_name, :middle_name, :last_name

	def first_name
		@first_name
	end 

	def middle_name
		@middle_name
	end

	def last_name
		@last_name
	end 



	def full_name
		full_name = first_name
		if !@middle_name.nil?
			full_name += " "
			full_name += middle_name
		end 
		full_name += ' '
		full_name += last_name
		full_name
	end 


	josh=Contact.new
	josh.first_name="Josh"
	josh.middle_name="Dodge"
	josh.last_name="Woodward"

	puts josh.first_name + " " + josh.last_name
	puts josh.full_name
end 