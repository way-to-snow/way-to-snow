class AddCoordinatesToResorts < ActiveRecord::Migration[6.0]
  def change
    add_column :resorts, :latitude, :float
    add_column :resorts, :longitude, :float
  end
end
