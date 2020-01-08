class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :title 
      t.text :method
      t.string :image
      t.integer :user_id
    end
  end
end
