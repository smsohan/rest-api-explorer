class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :api_id
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
