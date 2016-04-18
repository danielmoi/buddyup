class AddAmountToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :amount, :integer
  end
end
