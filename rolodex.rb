class Rolodex
  attr_reader :id

  @contacts = []
  @id = 1000

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def self.contacts
    @contacts
  end

  def self.display_all
    clear_screen
    contacts.each { |contact| contact.display }
  end
end