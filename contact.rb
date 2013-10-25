class Contact
  attr_accessor :id, :first_name, :last_name, :email, :notes

  def initialize(first_name, last_name, email, notes)
    @id = "not added to rolodex"
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
  end

  def display
  	puts "------------------------------"
  	puts "ID: #{@id}"
  	puts "First Name: #{@first_name}"
  	puts "Last Name: #{@last_name}"
  	puts "Email: #{@email}"
  	puts "Notes: #{@notes}"
  	puts "------------------------------"
  end
end
