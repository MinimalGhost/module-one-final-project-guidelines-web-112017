class Book < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def self.top_10_by_genre(genre)
    Book.all.order(:rating).where("genre = ?", genre).limit(10)
  end

  def recommend_book
    Book.find(rand)
  end

  def add_book_info
    puts "Enter the Author of your book:"
    book_author = gets.chomp
    self.author = book_author
    puts "Enter the Genre of your book:"
    book_genre = gets.chomp
    self.genre = book_genre
    puts "Enter the Year your book was published:"
    book_year = gets.chomp
    self.year = book_year
    puts "Enter a brief description of the book"
    book_description = gets.chomp
    self.description = book_description
  end
end
