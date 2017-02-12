class Participant < ActiveRecord::Base

  has_many :answers, dependent: :destroy

  before_create :select_doc_version

  def self.experience_ratings
    (0..10).to_a
  end

  def select_doc_version
    if nth_partipant?(4)
      self.doc_version = Api::DocVersion::FORKED
    else
      self.doc_version = Api::DocVersion::ORIGINAL
    end
  end

  def nth_partipant?(every_n)
    total_participants = self.class.count
    total_participants % every_n == 0
  end

end
