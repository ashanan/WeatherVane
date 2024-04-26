# frozen_string_literal: true

class CreateForecasts < ActiveRecord::Migration[7.1] # :nodoc:
  def change
    create_table :forecasts do |t|
      t.string :zip
      t.string :temperature

      t.timestamps
    end
  end
end
