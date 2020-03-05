class AddNewSnowColumnToWeatherReports < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_reports, :snow_fall, :boolean
  end
end
