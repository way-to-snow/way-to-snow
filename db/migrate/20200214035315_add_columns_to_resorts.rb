class AddColumnsToResorts < ActiveRecord::Migration[6.0]
  def change
    add_column :resorts, :slopes_length, :float
    add_column :resorts, :uid, :string
  end
end
