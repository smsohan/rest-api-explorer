class Participant < ActiveRecord::Base

  def self.experience_ratings
    (0..10).to_a
  end

end
