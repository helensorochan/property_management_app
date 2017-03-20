class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :integer
  end
end
