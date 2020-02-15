class AddColumnToResorts < ActiveRecord::Migration[6.0]
  def change
    add_column :resorts, :url_path, :string
  end
end
