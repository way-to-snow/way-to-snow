class CreateResorts < ActiveRecord::Migration[6.0]
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :prefecture
      t.string :address
      t.string :town
      t.string :phone_number
      t.string :url
      t.integer :adult_price
      t.integer :child_price
      t.integer :top_elevation
      t.integer :bottom_elevation
      t.boolean :ski_school
      t.boolean :child_care
      t.integer :courses
      t.integer :lifts
      t.integer :advanced
      t.integer :beginner
      t.integer :intermediate

      t.timestamps
    end
  end
end
