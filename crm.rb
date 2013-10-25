require_relative "contact"
require_relative "rolodex"

class CRM
  attr_accessor(:name, :contact)
  def initialize(name)
    @name = name
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Display a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Delete a contact"
    puts "[7] Exit"
    puts "Enter a number: "
  end

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end

  def call_option(user_selected)
    case user_selected
    when 1
      add_new_contact
    when 2
      modify_existing_contact
    when 3
      display_contact
    when 4
      display_all_contacts
    when 5
      display_attribute
    when 6
      delete_a_contact
    when 7
      exit
    end
  end

  def add_new_contact
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp
    print "Enter a Note: "
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
    Rolodex.add_contact(contact)
    main_menu
  end

  def display_all_contacts
    Rolodex.display_all_contacts
  end
end


gregforce = CRM.new("Gregforce")
gregforce.main_menu

