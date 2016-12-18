class AddDefaultToAnswers < ActiveRecord::Migration
  def change
    change_table :answers do |answers|
      answers.boolean :default
    end
  end
end
