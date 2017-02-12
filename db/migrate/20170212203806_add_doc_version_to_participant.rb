class AddDocVersionToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :doc_version, :string
  end
end
