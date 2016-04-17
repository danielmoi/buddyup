class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.boolean :achieved, default: false
      t.references :acceptor
      t.references :initiator
      
      t.timestamps null: false
    end
  end
end
