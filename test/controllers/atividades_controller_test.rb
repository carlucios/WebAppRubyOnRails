require "test_helper"

class AtividadesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get atividades_index_url
    assert_response :success
  end

  test "should get show" do
    get atividades_show_url
    assert_response :success
  end

  test "should get create" do
    get atividades_create_url
    assert_response :success
  end

  test "should get update" do
    get atividades_update_url
    assert_response :success
  end

  test "should get destroy" do
    get atividades_destroy_url
    assert_response :success
  end
end
