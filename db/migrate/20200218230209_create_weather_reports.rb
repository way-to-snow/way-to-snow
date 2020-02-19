class CreateWeatherReports < ActiveRecord::Migration[6.0]
  def change
    create_table :weather_reports do |t|
      t.string :api_response
      t.integer :snow_depth
      t.integer :snow_change
      t.datetime :date
      t.belongs_to :resort, null: false, foreign_key: true

      t.timestamps
    end
  end
end
