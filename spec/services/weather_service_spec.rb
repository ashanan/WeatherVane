# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherService do
  describe '#forecast' do
    let(:zip) { '60613' }

    it 'returns a Forecast object' do
      forecast = described_class.forecast(zip)
      expect(forecast).to be_a(Forecast)
    end

    describe 'when the zip code requested is not in the cache' do
      it 'sets from_cache to false on the return object' do
        forecast = described_class.forecast(zip)
        expect(forecast.from_cache).to be_falsy
      end
    end

    describe 'when the zip code requested is in the cache' do
      it 'sets from_cache to true on the return object' do
        described_class.forecast(zip)
        forecast = described_class.forecast(zip)

        expect(forecast.from_cache).to be_truthy
      end
    end
  end
end
