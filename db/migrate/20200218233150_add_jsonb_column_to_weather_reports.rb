class AddJsonbColumnToWeatherReports < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_reports, :report, :jsonb, null: false, default: '{}'
  end
end
