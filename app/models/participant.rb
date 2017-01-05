class Participant < ActiveRecord::Base
  has_many :answers, dependent: :destroy

  def self.experience_ratings
    (0..10).to_a
  end

end
