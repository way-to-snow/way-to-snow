class AddConditionToWeatherReport < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_reports, :condition, :string
  end
end
