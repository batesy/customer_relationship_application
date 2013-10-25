class Rolodex
  @contacts = []
  @id = 1000

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def self.delete_contact(contact_to_delete)
    contacts.delete_if {|i| i.id == contact_to_delete }
  end

  def self.contacts
    @contacts
  end

  def self.display_all_contacts
    contacts.each {|i| puts "ID: #{i.id}  #{i.first_name} #{i.last_name}  Email: #{i.email}  Notes: #{i.note}" }
  end

  def self.display_contact
    contacts.each {}
  end
end