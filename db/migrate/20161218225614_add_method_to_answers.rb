class AddMethodToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :method, :string
  end
end
