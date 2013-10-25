require_relative "contact"
require_relative "rolodex"

class CRM

  def initialize
    @rolodex = Rolodex.new
  end

  def run
    while true
      main_menu
    end
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def warn_if_empty
    puts "No contacts yet!" unless @rolodex.contacts.any?
  end

  def pause_for_user
    puts "Press Enter to continue"
    wait_for_enter = gets
  end

  def confirm_choice
    puts "Is this correct? (Y/N)"
    confirm_choice = gets.chomp
    case confirm_choice[0]
    when "y" || "Y"
      return true
    else
      return false
    end
  end

  def main_menu
    clear_screen
    print_main_menu
    user_selected = gets.to_i
    #begin
      call_option(user_selected)
    #rescue
    #  main_menu_error
    #end
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display a contact"
    puts "[5] Display all the contacts"
    puts "[6] Display an attribute" 
    puts "[7] Quit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    case user_selected
    when 1
      add_new_contact
    when 2
      modify_existing_contact
    when 3
      delete_contact
    when 4
      display_contact
    when 5
      display_all_contacts
    when 6
      display_attribute
    when 7
      quit
    else
      #raise
      main_menu_error
    end
  end

  def add_new_contact
    clear_screen
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp
    print "Enter a Note: "
    note = gets.chomp
    clear_screen
    puts "Adding #{first_name} #{last_name}"
    puts "Email address: #{email}"
    puts "Notes: #{note}"
    case confirm_choice
    when true
      contact = Contact.new(first_name, last_name, email, note)
      @rolodex.add(contact)
    else
      add_new_contact
    end
  end

  def modify_existing_contact
    clear_screen
    contact_exists = false
    while contact_exists = false do
      puts "Enter the ID of the contact you would like to edit:"
      id_to_modify = gets.chomp.to_i
      contact_exists = true if contact_exists?(id_to_modify)
      puts "That ID does not exist"
    end
    clear_screen
    puts "Which Attribute would you like to modify?"
    puts "[1] ID"
    puts "[2] Name"
    puts "[3] Email"
    puts "[4] Notes"
    attribute_choice = gets.to_i
    @rolodex.modify_contact(id_to_modify,)
  end

  def delete_contact
    puts "Enter the ID of the contact you would like to delete:"
    
  end

  def display_contact
    clear_screen
    puts "Enter the id of the Contact you would like to display:"
    user_choice = gets.to_i
    @rolodex.display_particular_contact(user_choice)
    pause_for_user
  end

  def display_all_contacts
    clear_screen
    warn_if_empty
    @rolodex.display_all_contacts
    pause_for_user
  end

  def display_attribute
    clear_screen
    warn_if_empty
    puts "Which attribute?"
    puts "[1] ID"
    puts "[2] Name (Last, First)"
    puts "[3] Name (First, Last)"
    puts "[4] Email"
    puts "[5] Notes"
    user_choice = gets.to_i
    clear_screen
    case user_choice
    when 1
      @rolodex.contacts.each {|contact| puts contact.id}
    when 2
      @rolodex.contacts.each {|contact| puts "#{contact.last_name}, #{contact.first_name}" }
    when 3
      @rolodex.contacts.each {|contact| puts "#{contact.first_name}, #{contact.last_name}" }
    when 4
      @rolodex.contacts.each {|contact| puts contact.email }
    when 5
      @rolodex.contacts.each {|contact| puts contact.notes }
    else
      raise
    end
    pause_for_user
  end

  def main_menu_error
    clear_screen
    print_main_menu
    puts "Not a valid selection, try again."
    user_selected = gets.to_i
    call_option(user_selected)
  end

  def quit
    exit
  end

  def loadpresets
    contact = Contact.new("Bruce", "Wayne", "bwanye@batmanor.com", "He's Batman")
    @rolodex.add(contact)
    contact = Contact.new("Some", "Guy", "whatever@whoever.com", "just some guy")
    @rolodex.add(contact)
    contact = Contact.new("Alfred", "Hitchcock", "Hitch@film.com", "A fat guy")
    @rolodex.add(contact)
  end
end

newcrm = CRM.new
newcrm.loadpresets
newcrm.run