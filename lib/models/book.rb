class Book < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def self.top_10_by_genre
    puts "What genre would you like to search?"
    genre = gets.chomp
    #Book.all.order(:rating).where("genre = ?", genre).limit(10).each { |b| puts b.title  }
    Book.all.where("genre = ?", genre).limit(10).each { |b| puts b.title  }
  end

  def self.recommend_book
    random_number = rand(Book.last.id)
    puts Book.find(random_number).title
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
