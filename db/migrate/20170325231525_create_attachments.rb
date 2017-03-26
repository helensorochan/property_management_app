class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string  :name
      t.integer :imageable_id
      t.string  :imageable_type
      t.timestamps
    end

    add_index :attachments, [:imageable_type, :imageable_id]
  end
end
