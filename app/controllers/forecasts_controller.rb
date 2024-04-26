# frozen_string_literal: true

# Controller class handling actions around the forecast form
class ForecastsController < ApplicationController
  def index
    @forecast = Forecast.new
  end

  def create
    # TODO: Add validation
    @response = WeatherService.forecast(params['forecast']['zip'])
    render 'show'
  end
end
