
class CryptoCurrency

    attr_accessor :id, :symbol, :name, :nameid, :rank, :price_usd, :percent_change_24h, :percent_change_1h, :percent_change_7d, :price_btc, :market_cap_usd, :volume24, :volume24a, :csupply, :tsupply, :msupply

    @@all = []

    def initialize(currency_hash)

        currency_hash.each do |k, v|
            self.send(("#{k}="), v)
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
