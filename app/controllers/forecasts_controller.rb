class ForecastsController < ApplicationController
  def index
  end

  def create
    @response = WeatherService.forecast(params['forecast']['zip'])
    render 'show'
  end
end
