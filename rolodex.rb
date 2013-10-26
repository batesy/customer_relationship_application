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

  def self.display_contact(contact_to_display)
    contacts.each { |i| puts "ID: #{i.id}  #{i.first_name} #{i.last_name}  Email: #{i.email}  Notes: #{i.note}" if contact_to_display.downcase == i.first_name.downcase || contact_to_display.downcase == i.last_name.downcase  }
    puts
  end

  def self.display_attribute(user_selected)
    case user_selected
    when 1
      contacts.each { |i| puts i.id }
    when 2
      contacts.each { |i| puts i.first_name }
    when 3
      contacts.each { |i| puts i.last_name }
    when 4
      contacts.each { |i| puts i.email }
    when 5
      contacts.each { |i| puts i.note }
    end
    puts
  end

  def self.display_name(id_to_edit)
    contacts.each { |i| puts "Edit #{i.first_name} #{i.last_name}?" if id_to_edit == i.id }
  end

  # def self.edit_a_contact(id, field)
  #   case field
  #   when 1
  #     contacts.map! { |i| i.first_name = }

  # end

end

