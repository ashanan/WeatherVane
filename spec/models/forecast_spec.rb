# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Forecast, type: :model do
  let(:zip) { '60613' }

  it 'initializes when no parameters are passed in' do
    expect { described_class.new }.not_to raise_error(NoMethodError)
  end

  describe '#from_cache' do
    it 'returns false when initialized as not coming from the cache' do
      forecast = described_class.create(zip:, temperature: 75, from_cache: false)
      expect(forecast.from_cache).to be_falsy
    end

    it 'returns true by default' do |_variable|
      forecast = described_class.create(zip:, temperature: 75)
      expect(forecast.from_cache).to be_truthy
    end
  end

  describe '#minutes_since_creation' do
    it 'accurately returns how long ago it was created (in minutes)' do
      forecast = described_class.create(zip:, temperature: 75)

      # Using the be_between matcher here due to the fuzziness of time travel
      travel(5.minutes) do
        expect(forecast.minutes_since_creation).to be_between(4, 5)
      end
    end
  end
end
