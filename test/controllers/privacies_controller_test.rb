require 'test_helper'

class PrivaciesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get privacies_show_url
    assert_response :success
  end

end
