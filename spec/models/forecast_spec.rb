require 'rails_helper'

RSpec.describe Forecast, :type => :model do
	it 'initializes when no parameters are passed in' do
		expect { Forecast.new }.not_to raise_error(NoMethodError)
	end

	context '#from_cache' do
		it 'returns true when initialized as coming from the cache' do
			forecast = Forecast.create(zip: 60613, temperature: 75, from_cache: true)
			expect(forecast.from_cache).to be_truthy
		end

		it 'returns false by default' do |variable|
			forecast = Forecast.create(zip: 60613, temperature: 75)
			expect(forecast.from_cache).to be_falsy
		end
	end
end