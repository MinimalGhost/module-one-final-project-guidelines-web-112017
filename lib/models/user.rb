class User < ActiveRecord::Base
  has_many :reviews
  has_many :books, through: :reviews

  def add_book
    puts "Type the title of the book you would like to add:"
    book_title = gets.chomp
    book = Book.find_or_create_by(title: book_title)
    if book.genre == nil
      book.add_book_info
    end
    start_book(book)
  end

  def start_book(book)
    Review.create(book_id: book.id, user_id: self.id, start_date: Date.new, status: "in progress")
  end

  def get_reviews_by_book
    book = Book.find_by_title
    if book != nil
      book.reviews.each do |r|
        puts "Title: #{r.book.title}"
        puts "Rating: #{r.rating}"
        puts "Description: #{r.description}"
        puts "______________________________"
      end
    else
      puts "Sorry, that book has not been reviewed yet."
    end
  end

  def add_review
    puts "Type the title of the book you would like to review:"
    book_to_review = gets.chomp
    #look up book by title and compare id with Review.book_id and self.id with Review.user_id
    book = Book.find_by(title: book_to_review)
    #if there is a match, allow them to update review instance
    if book.title = book_to_review
      myReview = Review.find_or_create_by(user_id: self.id, book_id: book.id)
      myReview.add_review_info
    else
      #else tell them that book doesnt exist and return user to home screen
      puts "That book does not exist!"
      home_screen(self)
    end
  end

  def edit_review
    puts "Enter the book title for the review you want to edit:"
    book_title = gets.chomp
    book = Book.find_by(title: book_title)
    myReview = Review.find_by(user_id: self.id, book_id: book.id)
    myReview.edit_review_info
    home_screen(self)
  end

  def list_books_in_progress
    arr = self.reviews.all.select do |r|
      r.status == "in progress"
    end.map { |r| r.book_id }

    Book.all.select do |b|
      arr.any? { |r| r == b.id }
    end.each_with_index { |book, idx| puts "#{idx+1}. #{book.title}" }
  end


end
