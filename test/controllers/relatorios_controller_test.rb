require "test_helper"

class RelatoriosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get relatorios_index_url
    assert_response :success
  end

  test "should get show" do
    get relatorios_show_url
    assert_response :success
  end

  test "should get create" do
    get relatorios_create_url
    assert_response :success
  end

  test "should get update" do
    get relatorios_update_url
    assert_response :success
  end

  test "should get destroy" do
    get relatorios_destroy_url
    assert_response :success
  end
end
