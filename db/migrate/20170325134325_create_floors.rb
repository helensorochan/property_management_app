class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.integer :start_from
      t.integer :end_to
      t.string :description
      t.integer :property_id
    end
  end
end
