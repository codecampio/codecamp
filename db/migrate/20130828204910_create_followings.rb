class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.references :from, index: true
      t.references :to, index: true

      t.timestamps
    end
    add_index :followings, [ :from_id, :to_id ], unique: true
  end
end
