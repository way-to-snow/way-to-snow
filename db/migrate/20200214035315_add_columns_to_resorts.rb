class AddColumnsToResorts < ActiveRecord::Migration[6.0]
  def change
    add_column :resorts, :url_path, :string
    add_column :resorts, :name_ja, :string
    add_column :resorts, :address_ja, :string
    add_column :resorts, :percent_snowboards, :float
    add_column :resorts, :longest_course, :integer
    add_column :resorts, :sb_school, :boolean
    add_column :resorts, :season_planned, :string
    add_column :resorts, :snow_depth, :integer
    add_column :resorts, :snow_change, :integer
  end
end
