class ForecastsController < ApplicationController
  def index
    @forecast = Forecast.new
  end

  def create
    @response = WeatherService.forecast(params['forecast']['zip'])
    render 'show'
  end
end
