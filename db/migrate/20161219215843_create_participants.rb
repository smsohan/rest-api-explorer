class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :company
      t.integer :years_of_industry_experience
      t.integer :years_of_experience_with_rest_apis

      t.timestamps null: false
    end
  end
end
