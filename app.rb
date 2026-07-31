require "securerandom"
require "date"

# properties: title, author, yearPublish
books_list = []

def add_book(books_list, new_book)
  if new_book[:title] != "" && new_book[:author] != "" && new_book[:year] != ""
    new_book[:id] = SecureRandom.uuid
    new_book[:created_at] = DateTime.now
    books_list.push(new_book)
    puts("\nBook #{new_book[:title]} added with success!")
  else
    puts("Error adding the book due to missing information.")
  end
end

def read_all_books(books_list)
  if books_list.empty?
    puts "\nBooks list is empty. Add a new book to see here."
  end

  books_list.each_with_index do |book| show_book_formated(book) end
end

def get_book_by_id(books_list, book_id)
  find_book = books_list.find { |book| book[:id] == book_id }
  if find_book
    puts "\nBook finded: "
    show_book_formated(find_book)
  else
    puts "Book not found"
  end
end

def delete_book_by_id(books_list, book_id)
  find_book = books_list.find { |book| book[:id] == book_id }
  unless find_book
    puts "Book not found"
    return
  end

  books_list.reject! { |book| book[:id] == book_id }
  puts("\nBook deleted with success!")
end

def show_book_formated(book)
  puts "\n"
  created_at_formated = book[:created_at].strftime("%d/%m/%Y às %H:%M")
  puts "\##{book[:id]} - Título: #{book[:title]} | Autor: #{book[:author]} | Adicionado em: #{created_at_formated}"
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
    puts "\nSearch by book ID"
    find_id = gets.chomp
    get_book_by_id(books_list, find_id)
  when "3"
    puts "\nEnter with info abount book"

    print "\nTitle: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    print "Year Pulish: "
    year = gets.chomp

    new_book = { title: title, author: author, year: year }

    add_book(books_list, new_book)
  when "4"
    puts "Enter book ID to delete"
    find_id = gets.chomp
    delete_book_by_id(books_list, find_id)
  when "E"
    puts "Exiting..."
    break
  end
end
