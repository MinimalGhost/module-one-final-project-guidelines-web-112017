class User < ActiveRecord::Base
  has_many :reviews
  has_many :books, through: :reviews

  def add_book
    # User creates new review, which associates to book if exists
    # and creates it if it does not
    puts "Type the title of the book you would like to add:"
    book_title = gets.chomp
    book = Book.find_or_create_by(title: book_title)
    if book.genre == nil
      add_book_info(book)
    end
    start_book(book)
  end

  def add_book_info(book)
    puts "Enter the Author of your book:"
    book_author = gets.chomp
    book.author = book_author
    puts "Enter the Genre of your book:"
    book_genre = gets.chomp
    book.genre = book_genre
    puts "Enter the Year your book was published:"
    book_year = gets.chomp
    book.year = book_year
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
    end.map { |book| puts "#{book.title}" }


  end
end
