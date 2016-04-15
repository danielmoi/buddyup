class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.string :image_url
      t.string :password_digest
      t.text :bio
      t.string :country
      t.string :city
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
