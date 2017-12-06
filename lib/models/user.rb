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
    home_screen(self)
  end

  def finish_book
    puts "Congratulations! Which book did you finish?"


  end

  def quit_book(book_title)

  end

  def add_review(book_title)
    puts "Type the title of the book you would like to review:"
    book_to_review = gets.chomp
    #look up book by title and compare id with Review.book_id and self.id with Review.user_id
    Books.find(title: book_to_review)

    #if there is a match, allow them to update review instance

    #else create Review and add associations, then allow user to fill out fields
  end

  def edit_review(book_title)

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
