require 'test_helper'

class BasesectorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get basesectors_index_url
    assert_response :success
  end

end
