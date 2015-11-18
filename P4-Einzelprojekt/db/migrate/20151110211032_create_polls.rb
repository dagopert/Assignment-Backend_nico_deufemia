class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :category_id
      t.integer :genderdep, default: 0
      t.boolean :explicit
      t.string :question
      t.integer :flag, default: 0

      t.timestamps null: false
    end
  end
end
