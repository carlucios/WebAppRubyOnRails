require "test_helper"

class AgendamentosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agendamentos_index_url
    assert_response :success
  end

  test "should get show" do
    get agendamentos_show_url
    assert_response :success
  end

  test "should get create" do
    get agendamentos_create_url
    assert_response :success
  end

  test "should get update" do
    get agendamentos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get agendamentos_destroy_url
    assert_response :success
  end
end
