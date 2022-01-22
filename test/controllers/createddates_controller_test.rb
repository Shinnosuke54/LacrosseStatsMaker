require "test_helper"

class CreateddatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @createddate = createddates(:one)
  end

  test "should get index" do
    get createddates_url
    assert_response :success
  end

  test "should get new" do
    get new_createddate_url
    assert_response :success
  end

  test "should create createddate" do
    assert_difference("Createddate.count") do
      post createddates_url, params: { createddate: { date: @createddate.date } }
    end

    assert_redirected_to createddate_url(Createddate.last)
  end

  test "should show createddate" do
    get createddate_url(@createddate)
    assert_response :success
  end

  test "should get edit" do
    get edit_createddate_url(@createddate)
    assert_response :success
  end

  test "should update createddate" do
    patch createddate_url(@createddate), params: { createddate: { date: @createddate.date } }
    assert_redirected_to createddate_url(@createddate)
  end

  test "should destroy createddate" do
    assert_difference("Createddate.count", -1) do
      delete createddate_url(@createddate)
    end

    assert_redirected_to createddates_url
  end
end
