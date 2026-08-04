require "securerandom"
require "date"
require "json"

FILE_PATH = "data.json"

def get_file_persist_json
  if !File.exist?(FILE_PATH) || File.zero?(FILE_PATH)
    File.write(FILE_PATH, "[]")
    return []
  end

  JSON.parse(File.read(FILE_PATH), symbolize_names: true)
rescue JSON::ParserError => e
  puts "Erro ao ler o JSON: #{e.message}"
  []
end

def save_book_in_file(data)
  File.write(FILE_PATH, JSON.pretty_generate(data))
end

class Book
  def initialize(list)
    @list = list
  end

  def add(title, author, year)
    if title.empty? || author.empty? || year.empty?
      puts "\nError adding the book due to missing information."
      return
    end

    new_book = {
      id: SecureRandom.uuid,
      title: title,
      author: author,
      year: year,
      created_at: DateTime.now.iso8601,
    }

    @list << new_book
    save_book_in_file(@list)

    puts "\nBook '#{title}' added successfully!"
  end

  def read_all
    if @list.empty?
      puts "\nBooks list is empty."
      return
    end

    puts "\n===== BOOKS ====="

    @list.each do |book|
      show_formatted(book)
    end
  end

  def get_by_id(book_id)
    find_book = @list.find { |book| book[:id] == book_id }

    if find_book
      puts "\nBook found:"
      show_formatted(find_book)
    else
      puts "\nBook not found."
    end
  end

  def delete_by_id(book_id)
    deleted = @list.reject! { |book| book[:id] == book_id }

    if deleted
      save_book_in_file(@list)
      puts "\nBook deleted successfully!"
    else
      puts "\nBook not found."
    end
  end

  private def show_formatted(book)
    created_at = DateTime.parse(book[:created_at])

    puts "-" * 50
    puts "ID:      #{book[:id]}"
    puts "Title:   #{book[:title]}"
    puts "Author:  #{book[:author]}"
    puts "Year:    #{book[:year]}"
    puts "Created: #{created_at.strftime("%d/%m/%Y %H:%M")}"
  end
end

class StartProgram
  def initialize(book_list)
    @book = Book.new(book_list)
  end

  def start
    loop do
      puts "\n========== MENU =========="
      puts "1 - List all books"
      puts "2 - Search by ID"
      puts "3 - Add new book"
      puts "4 - Delete book"
      puts "E - Exit"
      print "\nChoose an option: "

      option = gets.chomp.upcase

      case option
      when "1"
        @book.read_all
      when "2"
        print "\nEnter book ID: "
        id = gets.chomp
        @book.get_by_id(id)
      when "3"
        puts "\nAdd a new book"

        print "Title: "
        title = gets.chomp

        print "Author: "
        author = gets.chomp

        print "Year: "
        year = gets.chomp

        @book.add(title, author, year)
      when "4"
        print "\nEnter book ID to delete: "
        id = gets.chomp
        @book.delete_by_id(id)
      when "E"
        puts "\nGoodbye!"
        break
      else
        puts "\nInvalid option."
      end
    end
  end
end

books = get_file_persist_json
StartProgram.new(books).start()
