require 'net/http'
require 'json'
module ElevatorMedia
    class Streamer
        def self.getContent
            url = 'https://api.icndb.com/jokes/random'
            uri = URI(url)
            response = Net::HTTP.get(uri)
            return JSON.parse(response)
        end
    end   
end