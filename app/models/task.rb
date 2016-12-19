class Task < ActiveRecord::Base
  belongs_to :api
  has_many :answers, dependent: :destroy

  scope :practice, -> { where(practice: true)}

  def default_or_new_answer
    answers.default.first.try(:dup) || answers.build
  end

  def next
    if all_tasks.count > index + 1
      all_tasks.at(index + 1)
    else
      nil
    end
  end

  def all_tasks
    api.tasks
  end

  def index
    all_tasks.order(:id).index(self)
  end

  def previous_task
    if index > 0
      all_tasks.at(index - 1)
    else
      nil
    end
  end

  def self.completed_by(participant)
    joins(:answers).where(answers: {participant_id: participant.id})
  end

end
