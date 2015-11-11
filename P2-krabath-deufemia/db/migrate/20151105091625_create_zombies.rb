class CreateZombies < ActiveRecord::Migration
  def change
    create_table :zombies do |t|
      t.string :Name
      t.string :Graveyard
      t.date :Day_Of_Death
      t.integer :No_Of_Arms
      t.string :Description

      t.timestamps null: false
    end
  end
end
