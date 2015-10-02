class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id, index: true, null: false
      t.integer :deck_id, index: true, null: false

      t.timestamps null: false
    end
  end
end
