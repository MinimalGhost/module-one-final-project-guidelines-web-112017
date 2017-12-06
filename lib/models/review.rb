class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  def add_review_info
    puts "Rate this book between 0 and 5"
    user_rating = Integer(gets) rescue -1
    if user_rating.to_i > 5 || user_rating.to_i < 0
      add_review_info
    end
    # binding.pry
    self.rating = user_rating.to_i
    puts "Write a short review of the book:"
    user_description = gets.chomp
    self.description = user_description
    self.end_date = Date.new
    self.status = "completed"
    self.save
  end

  def edit_review_info
    puts "Your current review is:"
    puts "Rating: #{self.rating}"
    puts "Review: #{self.description}"
    puts "What would you like to change?"
    puts "1. Change Rating"
    puts "2. Change Review"
    puts "3. Done Editing"
    input = gets.chomp.to_i
    case input
    when 1
      self.change_rating
    when 2
      self.change_description
    when 3
      puts "Edits complete, returning to home screen"
    end
  end

  def change_rating
    puts "Enter your new rating:"
    input = gets.chomp.to_i
    self.rating = input
    self.save
    edit_review_info
  end

  def change_description
    puts "Write your new review:"
    input = gets.chomp
    self.description = input
    self.save
    edit_review_info
  end
end
