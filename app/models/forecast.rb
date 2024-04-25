class Forecast < ApplicationRecord
	attr_reader :from_cache

	def initialize(args)
		@from_cache = args[:from_cache]
		super(args.except(:from_cache))
	end
end
