require "test_helper"

class AddonsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get addons_edit_url
    assert_response :success
  end

  test "should get index" do
    get addons_index_url
    assert_response :success
  end

  test "should get new" do
    get addons_new_url
    assert_response :success
  end
end
