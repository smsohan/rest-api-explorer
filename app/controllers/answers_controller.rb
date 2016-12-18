class AnswersController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    answer_params = params.require(:answer).permit(:path, :request_headers, :request_body)

    @answer = @task.answers.create!(answer_params)
    @answer.create_response!(headers: 'dummy: dummy', body: 'dummy body!')
    redirect_to api_task_path(@task.api_id, @task, answer_id: @answer.id), notice: 'API call performed. See the response below.'
  end
end
