
class GetCryptoCurrency

    URL = "https://api.coinlore.net/api/tickers/"

    def self.get_currency
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        currency_array = JSON.parse(response.body)["data"]
        currency_array.each do |currency|
            CryptoCurrency.new(currency)
        end
        
    end

end




