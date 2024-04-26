# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherService do
  describe '#forecast' do
    let(:zip) { '60613' }

    it 'returns a Forecast object' do
      forecast = described_class.forecast(zip)
      expect(forecast).to be_a(Forecast)
    end
  end
end
