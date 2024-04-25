class ForecastsController < ApplicationController
  def index
  end

  def create
    @response = Forecast.new(temperature: 75)
  end
end
