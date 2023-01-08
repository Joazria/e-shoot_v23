require "test_helper"

class BriefingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get briefings_index_url
    assert_response :success
  end

  test "should get create" do
    get briefings_create_url
    assert_response :success
  end

  test "should get new" do
    get briefings_new_url
    assert_response :success
  end

  test "should get edit" do
    get briefings_edit_url
    assert_response :success
  end

  test "should get update" do
    get briefings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get briefings_destroy_url
    assert_response :success
  end
end
