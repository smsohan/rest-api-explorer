class ParticipantsController < ApplicationController
  skip_before_action :setup_session, only: [:new, :create]
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
  end

  def update
    participant_params = params.require(:participant).permit(:experience_rating, :feedback)
    participant.update_attributes!(participant_params)
    redirect_to thank_you_path
  end
end