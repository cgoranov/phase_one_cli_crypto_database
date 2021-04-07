
class CryptoCurrency

    attr_accessor :symbol, :name, :rank, :price_usd, :percent_change_24h, :percent_change_1h, :percent_change_7d, :market_cap_usd
    
    @@all = []

    def initialize(currency_hash)

        currency_hash.each do |k, v|
            self.send(("#{k}="), v) if self.respond_to?("#{k}=")
        end

        self.save

    end

    def save
        @@all << self
    end


    def self.all
        @@all
    end

end
