class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 50, index: true, null: false
      t.string :password_hash, limit: 60, null: false

      t.timestamps null: false
    end
  end
end
