class CreateZombies < ActiveRecord::Migration
  def change
    create_table :zombies do |t|
      t.string :Name
      t.string :Graveyard
      t.date :Day_of_death
      t.integer :No_of_arms
      t.text :Description

      t.timestamps null: false
    end
  end
end
