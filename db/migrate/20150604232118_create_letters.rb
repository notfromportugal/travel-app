class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :reciever
      t.string :title
      t.string :content
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :letters, :users
  end
end
