class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :answer_id
      t.text :headers
      t.text :body

      t.timestamps null: false
    end
  end
end
