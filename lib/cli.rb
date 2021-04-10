
class CLI

    def initialize
        greeting
        GetCryptoCurrency.get_currency
        menu
    end

    def menu
        puts " "
        puts "Enter 'Yes' to see our list or 'Exit' to leave search"
        input = user_input.downcase
        if input == "yes"
            search
        elsif input == "exit"
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
        puts "Please enter name of the currency you would like to see more detail about."
        puts "You can type 'Exit' to exit application."
        input = user_input.downcase
        if input == "exit"
            goodbye
        elsif CryptoCurrency.all.any? {|x| x.name.downcase == input}
            currency_detail(input)
            puts " "
            another_selection?
        else
            invalid
            search
        end
    end

    def another_selection?
        puts " "
        puts "would you like to search other currencies? Select 'Yes' or 'Exit'"
        input = user_input.downcase
        if input == "yes"
            search
        elsif input == "exit"
            goodbye
        else
            invalid
            another_selection?
        end
    end

    def greeting
        puts " "
        puts "Welcome to" 
        puts PASTEL.magenta(FONT.write("Crypto Search"))
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
        sorted_list = CryptoCurrency.all.sort {|a, b| a.rank <=> b.rank}
        sorted_list[0..4].each do |x|
            puts "#{x.rank}. #{x.name}" 
        end
    end

    def currency_detail(user_input)
        CryptoCurrency.all.each do |x|
            if x.name.downcase == user_input
                puts " "
                puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                puts " "
                puts "Rank:                 #{x.rank}"
                puts "Name:                 #{x.name.colorize(:light_blue)}"
                puts "Ticker Symbol:        #{x.symbol}"
                puts "Current Price ($):    #{format_number(x.price_usd)}"
                puts "Market Cap ($):       #{format_number(x.market_cap_usd)}"
                puts "7 day change (%):     #{format_change(x.percent_change_7d)}"
                puts "24 hour change (%):   #{format_change(x.percent_change_24h)}"
                puts "1 hour change (%):    #{format_change(x.percent_change_1h)}"
                puts " "
                puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
            end
        end
    end

    def format_number(input)
        fractional = input.split(".")[1]
        integral = input.split(".")[0]
        integral_with_commas = integral.to_s.reverse.scan(/.{1,3}/).join(',').reverse
        integral_with_commas + "." + fractional
    end

    def format_change(input)
        if input.include?("-")
            input.colorize(:red)
        else
            "+".colorize(:green) + input.colorize(:green)
        end
    end
        
end
