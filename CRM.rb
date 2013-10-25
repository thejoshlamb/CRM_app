require_relative "contact"
require_relative "rolodex"

class CRM

  def clear_screen
    puts "\e[H\e[2J"
  end

  def main_menu
    clear_screen
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute" 
    puts "[6] Quit"
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
      display_all_contacts
    when 5
    display_attribute
    when 6
      quit
    else
      error_message_menu
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
    main_menu
  end

  def modify_existing_contact
    display_all_contacts
    puts "Enter the ID of the contact you would like to edit:"
    modify_id = gets.chomp.to_i
  end

  def delete_contact
  end

  def display_all_contacts
    Rolodex.display_all
    puts "Press Enter to continue"
    wait_for_enter = gets
    main_menu
  end

  def display_attribute
  end

  def error_message_menu
    clear_screen
    print_main_menu
    puts "Not a valid, selection, try again."
    user_selected = gets.to_i
    call_option(user_selected)
  end

  def run
    main_menu
  end

  def quit
    exit
  end
end

greatest_crm_ever = CRM.new
greatest_crm_ever.run