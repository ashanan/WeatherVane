# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Forecast, type: :model do
  it 'initializes when no parameters are passed in' do
    expect { described_class.new }.not_to raise_error(NoMethodError)
  end

  describe '#from_cache' do
    let(:zip) { '60613' }

    it 'returns false when initialized as not coming from the cache' do
      forecast = described_class.create(zip:, temperature: 75, from_cache: false)
      expect(forecast.from_cache).to be_falsy
    end

    it 'returns true by default' do |_variable|
      forecast = described_class.create(zip:, temperature: 75)
      expect(forecast.from_cache).to be_truthy
    end
  end
end
