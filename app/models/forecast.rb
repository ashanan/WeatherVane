# frozen_string_literal: true

# Model representing a weather forecast
class Forecast < ApplicationRecord
  attr_reader :from_cache

  def initialize(args)
    default_args = { from_cache: true }
    options = if args.nil?
                default_args
              else
                default_args.merge(args)
              end

    @from_cache = options[:from_cache]
    super(options.except(:from_cache))
  end

  after_initialize do
    @from_cache ||= false
  end

  after_find do
    @from_cache = true
  end

  def minutes_since_creation
    (created_at - DateTime.now) / -60
  end
end
