require_relative 'config/environment'

def runner
  # Welcome the user and prompt for name
  puts "Welcome to GooderBooks! Please enter your first name:"

  # Get user input for name lookup
  user_name = gets.chomp
  
  # Return or create user instance if none found
  User.find_or_create_by(first_name: user_name)
end
