class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :initiator_id
      t.integer :acceptor_id
      t.text :subject
      t.text :content

      t.timestamps
    end
  end
end
