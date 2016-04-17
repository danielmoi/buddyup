class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :amount
      t.boolean :user_paid, default: false
      t.boolean :user_refunded, default: false
      t.boolean :vault_paid, default: false
      t.belongs_to :goal, index: true

      t.timestamps null: false
    end
  end
end
