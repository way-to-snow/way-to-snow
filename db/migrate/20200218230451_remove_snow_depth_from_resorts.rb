class RemoveSnowDepthFromResorts < ActiveRecord::Migration[6.0]
  def change

    remove_column :resorts, :snow_depth, :integer
  end
end
