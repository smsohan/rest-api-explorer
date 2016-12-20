require 'test_helper'

class WordpressFlowTest < ActionDispatch::IntegrationTest
  test "the user is redirected to create an account" do
    get '/'
    assert_response :redirect
    follow_redirect!
    assert_response :success

    post '/participants', {
      participant: {
        name: 'Sohan',
        company: 'Company',
        years_of_industry_experience: 10,
        years_of_experience_with_rest_apis: 8
      }
    }

    assert_response :redirect
    participant = Participant.find_by(name: 'Sohan')
    assert_equal session[:participant_id], participant.id
  end

end
