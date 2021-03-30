
class CLI

    def initialize
        GetCryptoCurrency.get_currency
        greeting
        menu
    end

    def menu
        puts "Enter 'Yes' to see our list or 'Exit' to leave search"
        user_input
        if valid_input?(user_input)
            if user_input == "Yes"
                crypto_currency_list
                search
            else
                puts "We are sorry to see you go. Comeback anytime for all your Crypto Data needs!"
            end

        else
            "Invalid input"
            menu
        end
    end

    def search
        crypto_currency_list
        puts " "
        puts "Please enter name (yes case sensitive!) of the currency you would like to see more detail about."
        puts "You can type 'Exit' to exit application"
        user_input
        if valid_input?(user_input)
            if user_input == "Yes"
                crypto_currency_list
                search
            else
                goodbye
            end

        else
            "Invalid input"
            menu
        end
    
    end

    def greeting
        puts "Welcome to Crypto Search!"
        puts "Would you like to see the top 5 largest cryptocurrencies in the world?"
    end

    def goodbye
        puts "We are sorry to see you go. Comeback anytime for all your Crypto Data needs!"
    end


    def user_input
        input = gets.strip
    end

    def valid_input?(user_input)
        user_input == "Yes" || user_input === "Exit" || CryptoCurrency.all.any? {|x| x.name == user_input}
    end

    def crypto_currency_list
        CryptoCurrency.all.collect do |x|
            puts "#{x.rank}. #{x.name}" if x.rank <= 5
        end
    end

    def show_currency_detail(user_input)
        CryptoCurrency.all.each do |x|
           if x.name == user_input 
              self.currency_deail(x)
        end
    end

    def currency_deail(currency)
        CryptoCurrency.all.each do |x|
            if x.name == user_input
                puts "Rank:           #{x.rank}"
                puts "Name:           #{x.name}"
                puts "Ticker Symbol:  #{x.symbol}"
                puts "Current Price:  #{x.price_usd}"
                puts "Market Cap:     #{x.market_cap_usd}"
                puts "24 hour change: #{x.percent_change_24h}"
                puts "1 hour change:  #{x.percent_change_1h}"
                puts "7 day change:   #{x.percent_change_7d}"
            end
        end
    end

end
