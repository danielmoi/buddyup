class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :amount
      t.boolean :user_paid
      t.boolean :user_refunded
      t.boolean :vault_paid
      t.integer :user_id

      t.timestamps
    end
  end
end
