class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :task_id
      t.integer :participant_id
      t.string :path
      t.string :request_headers
      t.string :request_body

      t.timestamps null: false
    end
  end
end
