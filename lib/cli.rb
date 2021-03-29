
class CLI

    def initialize
    end

    def search
    end

    def greeting
        puts "Welcome to Crypto Search!"
        puts "Would you like to see the top 5 largest cryptocurrencies in the world?"
        puts "Enter 'Yes' to see list or 'Exit' to leave search"
    end

    def user_input
        input = gets.strip
    end

    def valid_input?
    end

    def crypto_currency_list
        CryptoCurrency.all.each do |x|
            puts "#{x.rank}. #{x.name}" if x.rank <= 5
        end
    end

    def crypto_currency_detail
    end

end
