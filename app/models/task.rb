class Task < ActiveRecord::Base
  belongs_to :api
  has_many :answers, dependent: :destroy

  scope :practice, -> { where(practice: true)}

  def default_or_new_answer
    answers.default.first.try(:dup) || answers.build
  end

end
