class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :description
      t.integer :building_complex_id
    end
  end
end
