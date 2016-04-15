class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.boolean :achieved, default: false
      t.integer :order_id
      t.integer :initiator_id
      t.integer :acceptor_id

      t.timestamps
    end
  end
end
