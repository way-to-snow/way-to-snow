class RemoveSnowChangeFromResorts < ActiveRecord::Migration[6.0]
  def change

    remove_column :resorts, :snow_change, :integer
  end
end
