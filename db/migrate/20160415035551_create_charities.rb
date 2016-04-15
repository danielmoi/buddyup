class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :title
      t.text :description
      t.text :bank_name
      t.integer :bank_bsb
      t.integer :bank_acc
      t.integer :order_id

      t.timestamps
    end
  end
end
