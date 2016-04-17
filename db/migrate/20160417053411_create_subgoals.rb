class CreateSubgoals < ActiveRecord::Migration
  def change
    create_table :subgoals do |t|
      t.string :title
      t.string :description
      t.boolean :completed, default: false
      t.belongs_to :goal, index: true

      t.timestamps null: false
    end
  end
end
