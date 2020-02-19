class RemoveColumnFromWeatherReports < ActiveRecord::Migration[6.0]
  def change
    remove_column :weather_reports, :api_response, :string
  end
end
