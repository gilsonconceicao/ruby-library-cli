books_list = []

# title, author, yearPublish

loop do
    puts "\n=== MENU ==="
    puts "1 - Add new book"
    puts "2 - Read all books"
    puts "3 - Search by book"
    puts "4 - Delete book"
    puts "E - Exit"

    print "Choose an option: "

    choose_user = gets.chomp; 

    case choose_user
        when "1"
            puts "Enter with info abount book"

            print "Title: "
            title = gets.chomp
            print "Author: "
            author = gets.chomp
            print "Year Pulish: "
            year = gets.chomp

            if title != "" && author != "" && year != ""
                newBook = {title: title, author: author, year: year}
                books_list.push(newBook)
                puts("Book #{title} added with success!")
            end
            
        when "2"
            if books_list.length == 0
                puts  "Books list is empty. Add a new book to see here."
            end

            books_list.each_with_index do | book, index |
              puts "#{index + 1} - #{book[:title]} from #{book[:author]} at #{book[:year]}"
            end

        when "3"
            puts "Option selected 3"
        when "4"
            puts "Option selected 3"
        when "E"
            puts "Saindo..."
            break
    end
end