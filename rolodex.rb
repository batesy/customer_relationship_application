class Rolodex
  @contacts = []
  @id = 1000

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def self.contacts
    @contacts
  end

  def self.display_all_contacts
    self.contacts.each {|i| puts "ID: #{i.id}  #{i.first_name} #{i.last_name}  Email: #{i.email}  Notes: #{i.note}" }
  end

end