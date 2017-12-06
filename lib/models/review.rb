class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  def self.top_10_highest_rated
    best_reviews = Book.joins(:reviews).select("books.*, avg(reviews.rating) as average_rating").group("books.id").order("average_rating DESC")
    # binding.pry
    best_reviews.each do |b|
      puts "Title: #{b.title}"
      puts "Author: #{b.author}"
      puts "Description: #{b.description}"
      puts "______________________________"
    end
  end

  def add_review_info
    enter_review_rating
    enter_review_description
    review_date_status
    self.save
  end

  def enter_review_rating
    puts "Rate this book between 0 and 5"
    user_rating = Integer(gets) rescue -1
    if user_rating.to_i > 5 || user_rating.to_i < 0
      add_review_info
    end
    self.rating = user_rating.to_i
  end

  def enter_review_description
    puts "Write a short review of the book:"
    user_description = gets.chomp
    self.description = user_description
  end

  def review_date_status
    self.end_date = Date.new
    self.status = "completed"
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
