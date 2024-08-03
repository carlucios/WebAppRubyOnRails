require "test_helper"

class MedicosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get medicos_index_url
    assert_response :success
  end

  test "should get show" do
    get medicos_show_url
    assert_response :success
  end

  test "should get create" do
    get medicos_create_url
    assert_response :success
  end

  test "should get update" do
    get medicos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get medicos_destroy_url
    assert_response :success
  end
end
