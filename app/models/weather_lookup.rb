class WeatherLookup 
    attr_accessor :temperature, :icon, :condition, :city, :state, :feelslike_f, :forecast_url
    
    def fetch_weather
     HTTParty.get("http://api.wunderground.com/api/" + ENV['wundergrond_api_key'] + "/conditions/hourly/q/#{@state}/#{@city}.json")
    end
   
    def initialize(state, city)
     @city = city
     @state = state
    #  fetch_weather
     weather_hash = fetch_weather
    #  weather_hash = JSON.parse(weather_response)
     assign_values(weather_hash)
    end
   
    def assign_values(weather_hash)
      hourly_forecast_response = weather_hash.parsed_response['hourly_forecast'].first
      self.temperature = weather_hash.parsed_response['current_observation']['temp_f']
      self.feelslike_f = weather_hash.parsed_response['current_observation']['feelslike_f']
      self.condition = hourly_forecast_response['condition']
      self.icon = hourly_forecast_response['icon_url']
      self.forecast_url = weather_hash.parsed_response['current_observation']['forecast_url']
      
    #     hourly_forecast_response = weather_hash.parsed_response['response']['hourly_forecast']['forecast'].first
    #   self.temperature = weather_json.parsed_response['current_observation']['temp_f']
    #   self.condition = hourly_forecast_response['condition']
    #   self.icon = hourly_forecast_response['icon_url']
    end

end