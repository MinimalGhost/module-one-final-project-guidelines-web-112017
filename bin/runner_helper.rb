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
  puts "4. Search reviews by book"
  puts "5. Edit review"
  puts "6. List top books by genre"
  puts "7. Top 10 highest rated books"
  puts "8. Recommend a book"
  puts "9. Quit application"
  input = gets.chomp.to_i
  case input
  when 1
    user.add_book
    home_screen(user)
  when 2
    user.add_review
    home_screen(user)
  when 3
    user.list_books_in_progress
    home_screen(user)
  when 4
    user.get_reviews_by_book
    home_screen(user)
  when 5
    user.edit_review
    home_screen(user)
  when 6
    Book.top_10_by_genre
    home_screen(user)
  when 7
    Review.top_10_highest_rated
    home_screen(user)
  when 8
    Book.recommend_book
    home_screen(user)
  when 9
    puts "Goodbye from GooderBooks!"
  end
end
