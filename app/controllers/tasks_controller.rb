class TasksController < ApplicationController
  before_action :set_task

  def show
    if params[:answer_id]
      @answer = @task.answers.find(params[:answer_id])
    else
      @answer = @task.default_or_new_answer
    end

  end

  private
  def set_task
    @task = Task.find(params[:id])

  end
end
