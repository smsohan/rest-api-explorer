class AnswersController < ApplicationController
  skip_before_action :setup_session, only: :index

  def create
    @task = Task.find(params[:task_id])
    answer_params = params.require(:answer).permit(:path, :method, :request_headers, :request_body)

    @answer = @task.answers.create!(answer_params.merge(participant_id: participant.id))
    @answer.submit!
    redirect_to api_task_path(@task.api_id, @task, answer_id: @answer.id), notice: 'API call performed. See the response below.'
  end

  # def index
  #   file = Tempfile.open("data.md")
  #   Api.find_each do |api|
  #     file.puts "# #{api.name}"
  #     api.tasks.order(:id).offset(1).find_each.with_index do |task, index|
  #       file.puts "\n## Task #{index + 1}\n"
  #       file.puts "#{task.title}. #{task.description}\n"

  #       Participant.order(:id).each do |participant|
  #         file.puts "\n### Participant: #{participant.id}\n"
  #         task.answers.where(participant_id: participant.id).find_each.with_index do |answer, index|
  #           file.puts "\n#### Answer #{index + 1}"
  #           file.puts ""
  #           file.puts ""

  #           file.puts "- Method: ```#{answer.method}```\n"
  #           file.puts "- PATH: ```#{answer.path}```\n"
  #           file.puts "- Request Headers: ```#{answer.request_headers}```\n" if answer.request_headers.present?
  #           file.puts "- Request Body: ```#{answer.request_body}```\n" if answer.request_headers.present?
  #           file.puts "- Response Headers: ```#{answer.response.headers}```\n" if answer.response.present?
  #           file.puts "- Response Body: ```#{answer.response.body.truncate(400)}```\n" if answer.response.present?
  #         end

  #       end

  #     end

  #     file.close
  #     send_file file.path, type: 'text/markdown; charset=UTF-8', filename: 'data.md'

  #   end
  # end
end
