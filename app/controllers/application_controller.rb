class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :setup_session

  helper_method :participant

  def participant
    @participant
  end

  private
  def setup_session
    if session[:participant_id]
      @participant = Participant.find(session[:participant_id])
    else
      redirect_to new_participant_path
    end
  end

end


