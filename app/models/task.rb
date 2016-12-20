class Task < ActiveRecord::Base
  belongs_to :api
  has_many :answers, dependent: :destroy

  scope :practice, -> { where(practice: true)}

  def default_or_new_answer
    answers.default.first.try(:dup) || answers.build
  end

  def next
    all_tasks.where('tasks.id > ?', id).first
  end

  def all_tasks
    api.tasks.order(:id)
  end

  def index
    all_tasks.index(self)
  end

  def previous_task
    all_tasks.where('tasks.id < ?', id).last
  end

  def self.completed_by(participant)
    joins(:answers).where(answers: {participant_id: participant.id}).distinct
  end

end
