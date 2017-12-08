class User < ActiveRecord::Base
  has_many :reviews
  has_many :books, through: :reviews

  def add_book
    puts "Type the title of the book you would like to start:"

    title = gets.chomp
    book = Book.find_by("lower(title) = lower(?)", title)
    if book == nil
      puts "That book does not exist in our database, please add book info."
      book = Book.create(title: title)
      book.add_book_info
    end
    start_book(book)
  end

  def start_book(book)
    Review.create(book_id: book.id, user_id: self.id, start_date: Date.new, status: "in progress")
    puts "You have started reading #{book.title}"
  end

  def get_reviews_by_book
    book = Book.find_by_title
    if book != nil
      bookList = book.reviews.select do |r|
        r.rating != nil
      end
      if bookList.length > 0
        bookList.each { |r|
          puts "Title: #{r.book.title}"
          puts "Rating: #{r.rating}"
          puts "Description: #{r.description}"
          puts "______________________________"
         }
      else
        puts "Sorry, that book has not been reviewed yet."
      end
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
    end
  end

  def edit_review
    puts "Enter the book title for the review you want to edit:"
    book_title = gets.chomp
    book = Book.find_by(title: book_title)
    if book != nil
      myReview = Review.find_by(user_id: self.id, book_id: book.id)
      if myReview != nil
        myReview.edit_review_info
      else
        puts "You do not have a review to edit for this book"
      end
    else
      puts "thats not a book we have, please add it to database using the 1. command."
    end
  end

  def delete_review
    puts "Enter the book title for the review you want to delete:"
    book_title = gets.chomp.downcase
    book = Book.find_by('lower(title) = ?', book_title)
    if book != nil
      puts "Your review for #{book.title} has been deleted!"
      my_rev = Review.find_by(user_id: self.id, book_id: book.id)
      if my_rev != nil
        my_rev.destroy
      else
        puts "You do not have a review for that book"
      end
    else
      puts "That book does not exist!"
    end
  end

  def list_books_in_progress
    arr = self.reviews.all.select do |r|
      r.status == "in progress"
    end.map { |r| r.book_id }

    if arr.length > 0
      Book.all.select do |b|
        arr.any? { |r| r == b.id }
      end.each_with_index { |book, idx| puts "#{idx+1}. #{book.title}" }
    else
      puts "#{self.first_name} #{self.last_name} is not actively reading any books right now."
    end
  end
end
