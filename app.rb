books_list = []

# title, author, yearPublish

loop do
    puts "\n=== MEU PRIMEIRO MENU ==="
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
                
            end
            
        when "2"
            puts "Option selected 2"
        when "3"
            puts "Option selected 3"
        when "4"
            puts "Option selected 3"
        when "E"
            puts "Saindo..."
            break
    end
end