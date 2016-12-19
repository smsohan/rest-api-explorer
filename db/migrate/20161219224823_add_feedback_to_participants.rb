class AddFeedbackToParticipants < ActiveRecord::Migration
  def change
    change_table :participants do |participants_table|
      participants_table.integer :experience_rating
      participants_table.text :feedback
    end
  end
end
