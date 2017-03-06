class ParticipantsController < ApplicationController
  skip_before_action :setup_session, only: [:new, :create, :index]


  def index
    doc_version = params[:doc_version]
    file = Tempfile.open("participants-#{doc_version}-data.md")

    Participant.where(doc_version: doc_version).order(:new_code_name).each do |participant|
      file.puts "## #{participant.new_code_name}"
      file.puts ""
      file.puts "1. **Rating**: #{participant.experience_rating} / 10"
      file.puts "2. **Feedback**: #{participant.feedback}"
      file.puts ""
    end
    file.close
    send_file file.path, type: 'text/markdown; charset=UTF-8', filename: "participants-#{doc_version}-data.md"

  end

  def new
    @participant = Participant.new
  end

  def create
    participant_params = params.require(:participant).permit(:name, :company, :years_of_industry_experience, :years_of_experience_with_rest_apis)
    participant = Participant.create!(participant_params)
    session[:participant_id] = participant.id
    redirect_to root_path
  end

  def edit_feedback
    if @participant.answers.exists?
      @api = @participant.answers.last.task.api
    end
  end

  def update
    participant_params = params.require(:participant).permit(:experience_rating, :feedback)
    participant.update_attributes!(participant_params)
    redirect_to thank_you_path
  end

  def accept_consent
    participant_params = params.require(:participant).permit(:grant_company_name_use)
    participant.update_attributes!(participant_params)
    api = Api.first
    redirect_to api_task_path(api, api.tasks.first)
  end
end