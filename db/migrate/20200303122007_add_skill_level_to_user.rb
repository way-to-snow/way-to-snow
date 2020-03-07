class AddSkillLevelToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :skill_level, :string
  end
end
