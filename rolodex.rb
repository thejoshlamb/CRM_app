class Rolodex
  attr_accessor :id, :contacts

  @@contacts = []
  @@id = 1000


  def self.pause_for_user
    puts "Press Enter to continue"
    wait_for_enter = gets
  end

  def self.add_contact(contact)
    contact.id = @@id
    @@contacts << contact
    @@id += 1
  end

  def self.clear_screen # i don't understand why this needs to be a .self
    puts "\e[H\e[2J"
  end

  def self.warn_if_empty
    puts "No contacts yet!" unless contacts.any?
  end

  def self.display_all_contacts
    clear_screen
    warn_if_empty
    contacts.each { |contact| contact.display }
    pause_for_user
  end

  def self.display_all_attributes
    clear_screen
    warn_if_empty
    puts "Which attribute?"
    puts "[1] ID"
    puts "[2] Name (Last, First)"
    puts "[3] Name (First, Last)"
    puts "[4] Email"
    puts "[5] Notes"
    user_choice = gets.to_i
    case user_choice
    when 1
      clear_screen
      contacts.each {|contact| puts contact.id}
      pause_for_user
    when 2
      clear_screen
      contacts.each {|contact| puts "#{contact.last_name}, #{contact.first_name}" }
      pause_for_user
    when 3
      clear_screen
      contacts.each {|contact| puts "#{contact.first_name}, #{contact.last_name}" }
      pause_for_user
    when 4
      clear_screen
      contacts.each {|contact| puts contact.email }
      pause_for_user
    when 5
      clear_screen
      contacts.each {|contact| puts contact.notes }
      pause_for_user
    else
      puts "NOPENOPENOPENOPE"
    end
  end

    def self.display_particular_contact(desired_id)
      contacts.each { |contact| contact.display if contact.id == desired_id }
    end

    def self.modify_contact
    end

    def self.delete_contact
    end
  end
end