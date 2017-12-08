def user_login
  # Welcome the user and prompt for name
  puts "Welcome to GooderBooks! Please enter your full name:"

  # Get user input for name lookup
  user_name = gets.chomp.split(' ')

  # Return or create user instance if none found
  # binding.pry
  user = User.find_by("lower(first_name) = lower(?) AND lower(last_name) = lower(?)", user_name[0], user_name[1])
  if user == nil
    user = User.create(first_name: user_name[0], last_name: user_name[1])
  end
  user
end

def home_screen(user)
  puts "*********************************************"
  puts "Welcome #{user.first_name} #{user.last_name}"
  puts "Type a number to perform an action. Your options are:"
  puts "1. Start a new book"
  puts "2. Write a review"
  puts "3. Edit a review"
  puts "4. Delete a review"
  puts "5. Search reviews by book"
  puts "6. View my books in progress"
  puts "7. View another User's books in progress"
  puts "8. Top 10 highest rated books"
  puts "9. Top 10 highest rated books by genre"
  puts "10. Get a book recommendation"
  puts "11. Quit application"
  puts "*********************************************"

  input = gets.chomp.to_i
  case input
  when 1
    user.add_book
    home_screen(user)
  when 2
    user.add_review
    home_screen(user)
  when 3
    user.edit_review
    home_screen(user)
  when 4
    user.delete_review
    home_screen(user)
  when 5
    user.get_reviews_by_book
    home_screen(user)
  when 6
    user.list_books_in_progress
    home_screen(user)
  when 7
    new_user = get_user
    Review.search_user_books_in_progress(new_user)
    home_screen(user)
  when 8
    Review.top_10_highest_rated
    home_screen(user)
  when 9
    Review.top_10_by_genre
    home_screen(user)
  when 10
    Book.recommend_book
    home_screen(user)
  when 11
    puts "Goodbye from GooderBooks!"
  else
    puts "That is not a valid command, please enter a number between 1-11!"
    home_screen(user)
  end
end

def get_user
  puts "Enter user name"
  user_name = gets.chomp.downcase.split(' ')
  user = User.find_by("lower(first_name) = ? AND lower(last_name) = ?", user_name[0], user_name[1])
  if user == nil
    puts "That is not a user, try again"
    get_user
  end
  user
end
