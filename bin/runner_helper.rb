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
  puts "1. Add a book"
  puts "2. Add a review"
  puts "3. List books in progress"
  puts "4. Quit book"
  puts "5. Edit review"
  puts "6. List top books by genre"
  puts "7. Recommend a book"
  puts "8. Quit application"
  input = gets.chomp.to_i
  case input
  when 1
    user.add_book
  when 2
    user.add_review
  when 3
    user.list_books_in_progress
  when 5
    user.edit_review
  when 6
    Book.top_10_by_genre
    home_screen(user)
  when 7
    Book.recommend_book
    home_screen(user)
  when 8
    puts "Goodbye from GooderBooks!"
  end
end
