# properties: title, author, yearPublish
books_list = []

def add_book(books_list, newBook)
  if newBook[:title] != "" && newBook[:author] != "" && newBook[:year] != ""
    books_list.push(newBook)
    puts("Book #{newBook[:title]} added with success!")
  else
    puts("Error adding the book due to missing information.")
  end
end

def read_all_books(books_list)
  if books_list.length == 0
    puts "Books list is empty. Add a new book to see here."
  end

  books_list.each_with_index do |book, index|
    puts "#{index + 1} - #{book[:title]} from #{book[:author]} at #{book[:year]}"
  end
end

loop do
  puts "\n======== MENU ======== "
  puts "1 - Read all books"
  puts "2 - Search by book"
  puts "3 - Add new book"
  puts "4 - Delete book"
  puts "E - Exit"
  puts "\n"

  print "Choose an option: "

  choose_user = gets.chomp

  case choose_user
  when "1"
    read_all_books(books_list)
  when "2"
    puts "Option selected 2"
  when "3"
    puts "Enter with info abount book"

    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    print "Year Pulish: "
    year = gets.chomp

    newBook = { title: title, author: author, year: year }

    add_book(books_list, newBook)
  when "4"
    puts "Option selected 3"
  when "E"
    puts "Saindo..."
    break
  end
end
