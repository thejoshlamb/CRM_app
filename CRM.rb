require_relative "contact"
require_relative "rolodex"

class CRM

  def initialize
    run
  end

  def run
    while true
      main_menu
    end
  end

  def clear_screen
    puts "\e[H\e[2J"
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
    puts "Is this correct? (Y/N)"
    confirm_choice = gets.chomp
    case confirm_choice[0]
    when "y" || "Y"
      contact = Contact.new(first_name, last_name, email, note)
      Rolodex.add_contact(contact)
    else
      add_new_contact
    end
  end

  def modify_existing_contact
    puts "Enter the ID of the contact you would like to edit:"
    id_to_modify = gets.chomp.to_i
    Rolodex.modify_contact
  end

  def delete_contact
  end

  def display_contact
    clear_screen
    puts "Enter the id of the Contact you would like to display:"
    user_choice = gets.to_i
    Rolodex.display_particular_contact(user_choice)
  end

  def display_all_contacts
    Rolodex.display_all_contacts
  end

  def display_attribute
    Rolodex.display_all_attributes
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
end

greatest_crm_ever = CRM.new