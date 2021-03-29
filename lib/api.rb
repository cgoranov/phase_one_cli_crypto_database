

class GetCryptoCurrency

    URL = "https://api.coinlore.net/api/tickers/"

    def self.get_currency
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
        currency_array = JSON.parse(response.body)
        currency_array.each do |currency|
            CryptoCurrency.new(currency)
        end
    end

end




