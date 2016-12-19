class Task < ActiveRecord::Base
  belongs_to :api
  has_many :answers, dependent: :destroy

  scope :practice, -> { where(practice: true)}

  def default_or_new_answer
    answers.default.first.try(:dup) || answers.build
  end

  def next
    tasks = api.tasks
    index = tasks.order(:id).index(self)
    if tasks.count > index + 1
      tasks.at(index + 1)
    else
      nil
    end
  end

end
