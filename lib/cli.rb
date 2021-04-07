
class CLI

    def initialize
        greeting
        GetCryptoCurrency.get_currency
        menu
    end

    def menu
        puts " "
        puts "Enter 'Yes' to see our list or 'Exit' to leave search"
        input = user_input
        if input == "Yes"
            search
        elsif input == "Exit"
            goodbye
        else
            invalid
            menu
        end
    end

    def search
        puts " "
        crypto_currency_list
        puts " "
        puts "Please enter name of the currency you would like to see more detail about. WARNING: case sensitive!"
        puts "You can type 'Exit' to exit application."
        input = user_input
        if input == "Exit"
            goodbye
        elsif CryptoCurrency.all.any? {|x| x.name == input}
            currency_deail(input)
            puts " "
            another_selection?
        else
            invalid
            search
        end
    end

    def another_selection?
        puts " "
        puts "would you like to search other currencies? Select 'Yes' or 'Exit' (input is CASE SENSITIVE)"
        input = user_input
        if input == "Yes"
            search
        elsif input == "Exit"
            goodbye
        else
            invalid
            another_selection?
        end
    end

    def greeting
        font = TTY::Font.new(:starwars)
        pastel = Pastel.new
        puts " "
        puts "Welcome to" 
        puts pastel.magenta(font.write("Crypto Search"))
        puts " "
        puts "Would you like to see the top 5 largest cryptocurrencies in the world?"
        puts " "
    end

    def goodbye
        puts " "
        puts "We are sorry to see you go. Comeback anytime for all your Crypto Data needs!"
        puts " "
    end

    def invalid
        puts " "
        puts "Invalid input! Please try again."
        puts " "
    end

    def user_input
        input = gets.strip
    end

    def crypto_currency_list
        CryptoCurrency.all.collect do |x|
            puts "#{x.rank}. #{x.name}" if x.rank <= 5
        end
    end

    def currency_deail(user_input)
        sorted_list = CryptoCurrency.all.sort {|a, b| a.rank <=> b.rank}
        sorted_list.each do |x|
            if x.name == user_input
                puts " "
                puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                puts " "
                puts "Rank:                 #{x.rank}"
                puts "Name:                 #{x.name.colorize(:light_blue)}"
                puts "Ticker Symbol:        #{x.symbol}"
                puts "Current Price ($):    #{format_number(x.price_usd)}"
                puts "Market Cap ($):       #{format_number(x.market_cap_usd)}"
                puts "24 hour change (%):   #{format_change(x.percent_change_24h)}"
                puts "1 hour change (%):    #{format_change(x.percent_change_1h)}"
                puts "7 day change (%):     #{format_change(x.percent_change_7d)}"
                puts " "
                puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                puts " "
            end
        end
    end

    def format_number(input)
        input_integer = input.to_i
        input_integer.to_s.reverse.scan(/.{1,3}/).join(',').reverse
    end

    def format_change(input)
        input_array = input.to_s.split(//)
        if input_array.include?("-")
            input.colorize(:red)
        else
            input.colorize(:green)
        end
    end
        
end
