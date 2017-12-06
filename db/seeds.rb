book_list = [
  [ "The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, "Book about people cheating on each other and then the girl gets hit by a car and the dude dies." ],
  [ "Frankenstien", "Mary Shelly", "Horror", 1903, "EEERHHHHRRGGG" ],
  [ "To Kill a Mockingbird", "Harper Lee", 1945, "I think its about racism or something" ],
  [ "1984", "George Orwell", "Classic", 1984, "This is not a book about big goverment. The goverment is great. I love goverment" ],
  ["IT", "Stephen King", "Horror", 1988, "I'm too scared to even find out what the book is about."],
  ["Lord of the Rings", "J.R.R. Tolkien", "Fantasy", 1940, "Epic journey set upen by Elijah Wood and Rudy and another guy. The pretty much have to get rid of some jewelry or the world will die. BUT you have to throw the ring into Mount Dooms fiery lava pit."],
  ["And then there were none", "Agatha Christie", "Mystery", 1910, "People get invited to a house party, then die."],
  ["Dracula", "Bram Stoker", "Horror", 1901, "He comes to suck your blood."],
  ["Cat in the Hat", "Dr. Suess", "Childrens", 1988, "A cat shows up and babysits kids. The cat is goofy."],
  ["Green eggs and Ham", "Dr. Suess", "Childrens", 1990, "A guy really tries to sell kids on eating green eggs and ham."],
  ["James and the Giant Peach", "Rohl Dahl", "Childrens", 1985, "A kid gets trapped inside of a peach which goes to New York City or something. Also the clouds turn into monsters."]
]



book_list.each do |title, author, genre, year, description|
  Book.create(
  title: title,
  author: author, 
  genre: genre,
  year: year,
  description: description
  )
end
