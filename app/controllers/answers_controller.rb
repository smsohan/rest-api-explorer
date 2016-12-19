class AnswersController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    answer_params = params.require(:answer).permit(:path, :method, :request_headers, :request_body)

    @answer = @task.answers.create!(answer_params.merge(participant_id: participant.id))
    @answer.submit!
    redirect_to api_task_path(@task.api_id, @task, answer_id: @answer.id), notice: 'API call performed. See the response below.'
  end
end
