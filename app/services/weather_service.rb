# frozen_string_literal: true

# Service class encapsulating logic around storing and retrieving weather data
# For additional details, see:
#   [ADR 3](../architecture/adr/0003-encapsulate-cache-and-external-api-inside-a-service-class.md)
class WeatherService
  @@data = {} # rubocop:disable Style/ClassVars (we can do this here because this is temporary code)

  def self.forecast(zip)
    @@data[zip] = Forecast.new(temperature: rand(85), zip:) if @@data[zip].nil?

    @@data[zip]
  end
end
