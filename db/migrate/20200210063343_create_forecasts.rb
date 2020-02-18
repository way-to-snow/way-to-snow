class CreateForecasts < ActiveRecord::Migration[6.0]
  def change
    create_table :forecasts do |t|
      t.references :resort, null: false, foreign_key: true
      t.time :forecast_day
      t.integer :max_temperature
      t.integer :min_temperature
      t.string :wind_direction
      t.integer :wind_speed
      t.float :snow_amount
      t.string :weather
      t.integer :rain

      t.timestamps
    end
  end
end
