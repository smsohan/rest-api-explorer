class AddStatusCodeToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :status_code, :integer
  end
end
