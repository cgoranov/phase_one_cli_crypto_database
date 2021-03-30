
class CLI

    def initialize
        GetCryptoCurrency.get_currency
        search
    end

    def search
        greeting
        user_input
        if
    end

    def greeting
        puts "Welcome to Crypto Search!"
        puts "Would you like to see the top 5 largest cryptocurrencies in the world?"
        puts "Enter 'Yes' to see our list or 'Exit' to leave search"
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
