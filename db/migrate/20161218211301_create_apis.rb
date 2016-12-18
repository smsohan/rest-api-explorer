class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.string :name
      t.string :doc_url

      t.timestamps null: false
    end
  end
end
