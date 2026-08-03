require "securerandom"
require "date"

books_list = []

class Book
  attr_reader :list

  def initialize(list)
    @list = list
  end

  def add(title, author, year)
    new_book = { tilte: title, author: author, year: year }

    if new_book[:title] != "" && new_book[:author] != "" && new_book[:year] != ""
      new_book[:id] = SecureRandom.uuid
      new_book[:created_at] = DateTime.now
      @list.push(new_book)
      puts("\nBook #{new_book[:title]} added with success!")
    else
      puts("Error adding the book due to missing information.")
    end
  end

  def read_all()
    if @list.empty?
      puts "\nBooks list is empty. Add a new book to see here."
    end

    @list.each_with_index do |book| show_formated(book) end
  end

  def get_by_id(book_id)
    find_book = @list.find { |book| book[:id] == book_id }
    if find_book
      puts "\nBook finded: "
      show_formated(find_book)
    else
      puts "Book not found"
    end
  end

  def delete_by_id(book_id)
    find_book = @list.find { |book| book[:id] == book_id }
    unless find_book
      puts "Book not found"
      return
    end

    @list.reject! { |book| book[:id] == book_id }
    puts("\nBook deleted with success!")
  end

  def show_formated(book)
    puts "\n"
    created_at_formated = book[:created_at].strftime("%d/%m/%Y às %H:%M")
    puts "\##{book[:id]} - Título: #{book[:title]} | Autor: #{book[:author]} | Adicionado em: #{created_at_formated}"
  end
end

class StartProgram
  attr_reader :book_list

  def initialize(book_list)
    @book_list = book_list
  end

  def Start
    book_started = Book.new(@book_list)
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
        book_started.read_all
      when "2"
        puts "\nSearch by book ID"
        find_id = gets.chomp
        book_started.get_by_id(find_id)
      when "3"
        puts "\nEnter with info abount book"

        print "\nTitle: "
        title = gets.chomp
        print "Author: "
        author = gets.chomp
        print "Year Pulish: "
        year = gets.chomp

        book_started.add(title, author, year)
      when "4"
        puts "Enter book ID to delete"
        find_id = gets.chomp
        book_started.delete_by_id(find_id)
      when "E"
        puts "Saiu..."
        break
      end
    end
  end
end

StartProgram.new(books_list)
            .Start()
