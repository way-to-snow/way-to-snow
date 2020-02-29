class AddConditionToForecast < ActiveRecord::Migration[6.0]
  def change
    add_column :forecasts, :condition, :string
  end
end
