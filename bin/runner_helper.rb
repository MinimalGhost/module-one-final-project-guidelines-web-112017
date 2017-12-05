def user_login
  # Welcome the user and prompt for name
  puts "Welcome to GooderBooks! Please enter your full name:"

  # Get user input for name lookup
  user_name = gets.chomp.split(' ')

  # Return or create user instance if none found
  # binding.pry
  User.find_or_create_by(first_name: user_name[0], last_name: user_name[1])
end

def home_screen(user)
  puts "Welcome #{user.first_name} #{user.last_name}"
  puts "Your commands options are"
  puts "1. add_book"
  puts "2. add_review"
  input = gets.chomp.to_i
  case input
  when 1
    user.add_book
  end
  when 2
    user.add_review
  end
end
