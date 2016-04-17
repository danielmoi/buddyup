class CreateCategoriesGoals < ActiveRecord::Migration
  def change
    create_table :categories_goals, id: false do |t|
      t.belongs_to :goal, index: true
      t.belongs_to :category, index: true
    end
  end
end
