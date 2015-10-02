class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :round_id, index: true, null: false
      t.integer :card_id, index: true, null: false
      t.integer :count, null: false, default: 0
      t.boolean :answered, null: false, default: false

      t.timestamps null: false
    end
  end
end
