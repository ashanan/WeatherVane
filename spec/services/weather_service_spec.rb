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
      before do
        described_class.forecast(zip)
      end

      it 'sets from_cache to true on the return object' do
        forecast = described_class.forecast(zip)
        expect(forecast.from_cache).to be_truthy
      end

      it 'gets new data if the cached data is too old' do
        travel(31.minutes) do
          forecast = described_class.forecast(zip)
          expect(forecast.from_cache).to be_falsy
        end
      end
    end
  end
end
