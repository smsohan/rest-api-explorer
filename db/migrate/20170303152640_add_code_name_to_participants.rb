class AddCodeNameToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :code_name, :string
    index = 1
    Participant.order(:id).each do |participant|
      participant.code_name = "P#{index}"
      participant.save!
      index += 1
    end
  end
end
