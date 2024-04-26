# frozen_string_literal: true

class WeatherService
  @@data = {}

  def self.forecast(zip)
    @@data[zip] = Forecast.new(temperature: rand(85), zip:) if @@data[zip].nil?

    @@data[zip]
  end
end
