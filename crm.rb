require_relative "contact"
require_relative "rolodex"

class CRM
  attr_accessor(:name, :contact)
  def initialize(name)
    @name = name
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Edit an existing contact"
    puts "[3] Display a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Delete a contact"
    puts "[7] Exit"
    puts "Enter a number: "
  end

  def main_menu
    begin
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
    end while user_selected != 7 
  end

  def call_option(user_selected)
    case user_selected
    when 1
      add_new_contact
    when 2
      edit_contact
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

  def delete_a_contact
    display_all_contacts
    puts "Which contact do you want to delete? Enter ID: "
    contact_to_delete = gets.to_i
    Rolodex.delete_contact(contact_to_delete)
  end

  def display_all_contacts
    Rolodex.display_all_contacts
    puts
  end

  def display_a_contact
    puts "Enter an ID to display: "
    contact_to_display = gets.to_i
#    Rolodex.display_contact(contact_to_display)
  end

  def edit_contact
    puts "Which contact do you want to edit?"
    display_all_contacts
    puts "Enter ID: "
    contact_to_edit = gets.to_i
    puts "You want to edit contact: #{contact_to_edit}?"
#   Finish Later
  end



end


gregforce = CRM.new("Gregforce")
gregforce.main_menu

