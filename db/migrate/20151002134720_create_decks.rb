class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, limit: 50, index: true, null: false

      t.timestamps null: false
    end
  end
end
