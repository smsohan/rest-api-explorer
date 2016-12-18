class AddRootToApi < ActiveRecord::Migration
  def change
    add_column :apis, :root, :string
  end
end
