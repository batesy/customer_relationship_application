require_relative "contact"
require_relative "rolodex"

class CRM
  attr_accessor(:name, :contact)
  def initialize(name)
    @name = name
  end

  def print_main_menu
    puts "-----------------------------"
    puts "  Welcome to Gregforce CRM"
    puts "-----------------------------"
    puts "[1] Add a new contact"
    puts "[2] Edit an existing contact"
    puts "[3] Search for a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Delete a contact"
    puts "[7] Exit"
    puts "-----------------------------"
    print "Enter a number: "
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
      display_a_contact
    when 4
      display_all_contacts
      return_to_menu
    when 5
      display_attribute
    when 6
      delete_a_contact
    when 7
      exit
    end
  end

  def add_new_contact
    puts "\e[H\e[2J"
    puts "-----------------"
    puts "Add a New Contact"
    puts "-----------------"
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
    puts "\e[H\e[2J"
    puts "     * Contact Added! *"
    main_menu
  end

  def delete_a_contact
    display_all_contacts
    puts
    puts "Which contact do you want to delete?"
    print "Enter ID: "
    contact_to_delete = gets.to_i
    Rolodex.delete_contact(contact_to_delete)
    puts "\e[H\e[2J"
    puts "    * Contact Deleted! *"
    main_menu
  end

  def display_all_contacts
    puts "\e[H\e[2J"
    puts "-------------"
    puts "Your Contacts"
    puts "-------------"
    Rolodex.display_all_contacts
  end

  def display_a_contact
    puts "\e[H\e[2J"
    puts "-------------------------------"
    puts "Search For a Contact To Display"
    puts "-------------------------------"
    print "Search for a name: "
    contact_to_display = gets.chomp
    puts "\e[H\e[2J"
    puts "--------------"
    puts "Search Results"
    puts "--------------"
    puts
    Rolodex.display_contact(contact_to_display)
    puts
    return_to_menu
  end

  def edit_contact
    puts "\e[H\e[2J"
    display_all_contacts
    puts
    print "Enter ID of Contact to Edit: "
    id_to_edit = gets.to_i
    puts
    Rolodex.display_name(id_to_edit)
    puts
    puts "[1] Yes"
    puts "[2] No"
    puts 
    print "Make a choice: "
    confirm = gets.to_i
    case confirm
    when 1
      puts "\e[H\e[2J"  
      puts "-----------------------------------"
      puts "Which field would you like to edit?"
      puts "-----------------------------------"
      puts "[1] First Name"
      puts "[2] Last Name"
      puts "[3] Email"
      puts "[4] Note"
      puts "-----------------------------------"
      print "Make a choice: "
      field_to_edit = gets.to_i
    when 2
      puts "\e[H\e[2J"
      main_menu
    end
    case field_to_edit
    when 1
      puts
      print "Enter new First Name: "
      new_first_name = gets.chomp
      Rolodex.change_first_name(id_to_edit, new_first_name)
      puts "\e[H\e[2J"
      puts "* First Name Successfully Changed! *"
      main_menu
    when 2
      puts
      print "Enter new Last Name: "
      new_last_name = gets.chomp
      Rolodex.change_last_name(id_to_edit, new_last_name)
      puts "\e[H\e[2J"
      puts "* Last Name Successfully Changed! *"
      main_menu
    when 3
      puts
      print "Enter new Email: "
      new_email = gets.chomp
      Rolodex.change_email(id_to_edit, new_email)
      puts "\e[H\e[2J"
      puts "* Email Successfully Changed! *"
      main_menu
    when 4
      puts
      print "Enter new Note: "
      new_note = gets.chomp
      Rolodex.change_note(id_to_edit, new_note)
      puts "\e[H\e[2J"
      puts "* Note Successfully Changed! *"
      main_menu
    end
  end

  def display_attribute
    puts "\e[H\e[2J"
    puts "What do you want to see?"
    puts "---------------"
    puts "[1] ID"
    puts "[2] First Name"
    puts "[3] Last Name"
    puts "[4] Email"
    puts "[5] Notes"
    puts "---------------"
    print "Make a Choice: "
    user_selected = gets.to_i
    puts
    Rolodex.display_attribute(user_selected)
    return_to_menu
  end

  def return_to_menu
    puts
    puts "Hit Enter To Return To Main Menu"
    gets.chomp
    puts "\e[H\e[2J"
  end

end


gregforce = CRM.new("Gregforce")
puts "\e[H\e[2J"
gregforce.main_menu

