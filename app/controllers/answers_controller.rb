class AnswersController < ApplicationController
  skip_before_action :setup_session, only: :index

  def create
    @task = Task.find(params[:task_id])
    answer_params = params.require(:answer).permit(:path, :method, :request_headers, :request_body)

    @answer = @task.answers.create!(answer_params.merge(participant_id: participant.id))
    @answer.submit!
    redirect_to api_task_path(@task.api_id, @task, answer_id: @answer.id), notice: 'API call performed. See the response below.'
  end

  def index
    task_id = params[:task_id]
    file = Tempfile.open("task-#{task_id}-data.md")
    task = Task.find(task_id)
    file.puts "# Task:  #{task.title}. #{task.description}\n"

    Participant.order(:id).each do |participant|
       file.puts "\n### Participant: #{participant.code_name} using #{participant.doc_version} API documentation\n"
       task.answers.where(participant_id: participant.id).find_each.with_index do |answer, index|
         file.puts "\n#### Answer #{index + 1}"
         file.puts ""
         file.puts ""
         file.puts ""
         file.puts ""
         file.puts ""
         file.puts ""
         file.puts ""
         file.puts ""
         file.puts ""
         file.puts ""
         file.puts ""
         file.puts ""

         file.puts "- Time: ```#{answer.created_at.strftime("%H:%M:%S")}```\n"
         file.puts "- Method: ```#{answer.method}```\n"
         file.puts "- PATH: ```#{answer.path}```\n"
         file.puts "- Request Headers: ```#{answer.request_headers}```\n" if answer.request_headers.present?
         file.puts "- Request Body: ```#{answer.request_body}```\n" if answer.request_headers.present?
         file.puts "- Response Code: ```#{answer.response.status_code}```\n" if answer.response.present?
         file.puts "- Response Body: ```#{JSON.pretty_generate(JSON.parse(answer.response.body)).truncate(400)}```\n" if answer.response.present?
      end
    end

    file.close
    send_file file.path, type: 'text/markdown; charset=UTF-8', filename: "task-#{task_id}-data.md"
  end

end
