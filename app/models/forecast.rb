# frozen_string_literal: true

# Model representing a weather forecast
class Forecast < ApplicationRecord
  attr_reader :from_cache

  def initialize(args)
    args = {} if args.nil?
    @from_cache = args[:from_cache]
    super(args.except(:from_cache))
  end
end
