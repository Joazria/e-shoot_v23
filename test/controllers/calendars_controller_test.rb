require "test_helper"

class CalendarsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get calendars_edit_url
    assert_response :success
  end

  test "should get index" do
    get calendars_index_url
    assert_response :success
  end

  test "should get new" do
    get calendars_new_url
    assert_response :success
  end
end
