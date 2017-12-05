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
  end
end
