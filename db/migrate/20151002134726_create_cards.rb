class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :deck_id, index: true, null: false
      t.string  :question, limit: 255, null: false
      t.string  :answer, limit: 255, null: false

      t.timestamps null: false
    end
  end
end
