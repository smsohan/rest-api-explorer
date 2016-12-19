class ParticipantsController < ApplicationController
  skip_before_action :setup_session
  def new
    @participant = Participant.new
  end

  def create
    participant_params = params.require(:participant).permit(:name, :company, :years_of_industry_experience, :years_of_experience_with_rest_apis)
    participant = Participant.create!(participant_params)
    session[:participant_id] = participant.id
    redirect_to root_path
  end
end