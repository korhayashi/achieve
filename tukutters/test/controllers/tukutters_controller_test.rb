require 'test_helper'

class TukuttersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tukutters_index_url
    assert_response :success
  end

end
