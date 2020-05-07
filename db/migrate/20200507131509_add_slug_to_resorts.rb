class AddSlugToResorts < ActiveRecord::Migration[6.0]
  def change
    add_column :resorts, :slug, :string
    add_index :resorts, :slug, unique: true
  end
end
