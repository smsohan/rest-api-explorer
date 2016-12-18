class Api < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  def practice_task
    tasks.practice.first || tasks.first
  end
end
