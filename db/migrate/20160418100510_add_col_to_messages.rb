class AddColToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :goal, index: true
    add_foreign_key :messages, :goals
  end
end
