class Book < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  # def self.top_10_by_genre
  #   puts "What genre would you like to search?"
  #   genre = gets.chomp
  #   Book.all.where("genre = ?", genre).limit(10).each { |b| puts b.title  }
  # end

  def self.recommend_book
    random_number = rand(Book.last.id)
    recommended_book = Book.find(random_number)
    puts "*******************************************************"
    puts "#{recommended_book.title} by #{recommended_book.author}"
    puts "*******************************************************"
  end

  def add_book_info
    enter_book_author
    enter_book_genre
    enter_book_year
    enter_book_description
    self.save
  end

  def enter_book_author
    puts "Enter the Author of your book:"
    book_author = gets.chomp
    self.author = book_author
  end

  def enter_book_genre
    puts "Enter the Genre of your book:"
    book_genre = gets.chomp
    self.genre = book_genre
  end

  def enter_book_year
    begin
      puts "Enter the Year your book was published:"
      user_input = Integer(gets)
    rescue
      puts "Invalid year, please enter the year your book was published:"
      enter_book_year
    end

    if user_input.to_i <= Date.today.strftime("%Y").to_i
      self.year = user_input
    else
      puts "Invalid year, please enter a year prior to the current year:"
      enter_book_year
    end
  end

  def enter_book_description
    puts "Enter a brief description of the book"
    book_description = gets.chomp
    self.description = book_description
  end

  def self.find_by_title
    puts "Enter book title:"
    input = gets.chomp.downcase
    book = Book.find_by("lower(title) = ?", input)
    if book
      return book
    else
      puts "No book found, please add book"
    end
  end
end
