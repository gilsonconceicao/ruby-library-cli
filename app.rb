require "securerandom"
require "date"

# properties: title, author, yearPublish
books_list = []

def add_book(books_list, newBook)
  if newBook[:title] != "" && newBook[:author] != "" && newBook[:year] != ""
    newBook[:id] = SecureRandom.uuid
    newBook[:created_at] = DateTime.now
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
  puts "\n"

  books_list.each_with_index do |book, index|
    data_formatada = book[:created_at].strftime("%d/%m/%Y às %H:%M")

    puts "##{book[:id]} - Título: #{book[:title]} | Autor: #{book[:author]} | Adicionado em: #{data_formatada}"
  end
end

def get_book_by_id(books_list, bookId)
  find_book = books_list.find { |book| book[:id] == bookId }
  if find_book
    data_formatada = find_book[:created_at].strftime("%d/%m/%Y às %H:%M")
    puts "##{find_book[:id]} - Título: #{find_book[:title]} | Autor: #{find_book[:author]} | Adicionado em: #{data_formatada}"
  else
    puts "Book not found"
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
    puts "Search by book ID"
    findId = gets.chomp
    get_book_by_id(books_list, findId)
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
