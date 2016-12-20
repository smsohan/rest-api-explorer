require 'test_helper'

class WordpressFlowTest < ActionDispatch::IntegrationTest
  test "that the user is redirected to create an account" do
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
    assert Participant.where(name: 'Sohan').exists?
  end
end
