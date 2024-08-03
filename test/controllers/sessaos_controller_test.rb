require "test_helper"

class SessaosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sessaos_index_url
    assert_response :success
  end

  test "should get show" do
    get sessaos_show_url
    assert_response :success
  end

  test "should get create" do
    get sessaos_create_url
    assert_response :success
  end

  test "should get update" do
    get sessaos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get sessaos_destroy_url
    assert_response :success
  end
end
