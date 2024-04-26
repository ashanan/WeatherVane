# frozen_string_literal: true

# Service class encapsulating logic around storing and retrieving weather data
# For additional details, see:
#   [ADR 3](../architecture/adr/0003-encapsulate-cache-and-external-api-inside-a-service-class.md)
class WeatherService
  def self.forecast(zip)
    forecast = Forecast.find_by(zip:)
    forecast = Forecast.create(temperature: rand(85), zip:, from_cache: false) if get_new_data?(forecast)

    forecast
  end

  def self.get_new_data?(forecast)
    forecast.nil? || forecast.minutes_since_creation > 30
  end
end
