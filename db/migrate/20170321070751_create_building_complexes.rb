class CreateBuildingComplexes < ActiveRecord::Migration
  def change
    create_table :building_complexes do |t|
      t.string :name
      t.string :description
      t.integer :user_id
    end
  end
end
