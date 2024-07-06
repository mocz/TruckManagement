require "test_helper"

class PlantersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @planter = planters(:one)
  end

  test "should get index" do
    get planters_url
    assert_response :success
  end

  test "should get new" do
    get new_planter_url
    assert_response :success
  end

  test "should create planter" do
    assert_difference("Planter.count") do
      post planters_url, params: { planter: { address: @planter.address, mobile_number: @planter.mobile_number, name: @planter.name, status: @planter.status } }
    end

    assert_redirected_to planter_url(Planter.last)
  end

  test "should show planter" do
    get planter_url(@planter)
    assert_response :success
  end

  test "should get edit" do
    get edit_planter_url(@planter)
    assert_response :success
  end

  test "should update planter" do
    patch planter_url(@planter), params: { planter: { address: @planter.address, mobile_number: @planter.mobile_number, name: @planter.name, status: @planter.status } }
    assert_redirected_to planter_url(@planter)
  end

  test "should destroy planter" do
    assert_difference("Planter.count", -1) do
      delete planter_url(@planter)
    end

    assert_redirected_to planters_url
  end
end
