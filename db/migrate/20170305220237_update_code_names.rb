class UpdateCodeNames < ActiveRecord::Migration
  def change
    add_column :participants, :new_code_name, :string
    index = 1

    Participant.where(doc_version:  'original' ).order(:id).each do |participant|
      participant.new_code_name = "P#{index}"
      index += 1
    end


    Participant.where(doc_version:  'forked' ).order(:id).each do |participant|
      participant.new_code_name = "P#{index}"
      index += 1
    end

  end
end
