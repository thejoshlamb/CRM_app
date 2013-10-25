class Rolodex
  attr_accessor :id, :contacts

  def initialize
    @contacts = Array.new
    @id = 1000
  end

  def add(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def contact_exists?(id)
    @contacts.each do |contact|
      return true if contact.id == id
      return false
    end
  end

  def display_all_contacts
    @contacts.each {|contact| contact.display}
  end

  #def display_info_by_attribute(desired_attribute)
  #end

  def display_particular_contact(desired_id)
     contacts.each { |contact| contact.display if contact.id == desired_id }
  end

  def modify_contact(desired_id,attribute_to_edit)

  end

  def delete_contact
  end

end