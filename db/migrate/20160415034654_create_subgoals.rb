class CreateSubgoals < ActiveRecord::Migration
  def change
    create_table :subgoals do |t|
      t.string :title
      t.string :description
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
