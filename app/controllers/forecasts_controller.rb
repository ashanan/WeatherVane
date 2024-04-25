class ForecastsController < ApplicationController
  def index
  end

  def create
    redirect_to forecasts_path
  end

  def show
    @response = Forecast.new(temperature: 75)
  end
end
