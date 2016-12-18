class AddPracticeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :practice, :boolean, default: false
  end
end
