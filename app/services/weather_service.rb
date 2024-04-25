class WeatherService
	@@data = {}

	def self.forecast(zip)
		if @@data[zip].nil?
			@@data[zip] = Forecast.new(temperature: rand(85), zip: zip)
		end

		@@data[zip]
	end
end