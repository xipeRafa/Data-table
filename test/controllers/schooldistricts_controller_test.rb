require 'test_helper'

class SchooldistrictsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schooldistrict = schooldistricts(:one)
  end

  test "should get index" do
    get schooldistricts_url
    assert_response :success
  end

  test "should get new" do
    get new_schooldistrict_url
    assert_response :success
  end

  test "should create schooldistrict" do
    assert_difference('Schooldistrict.count') do
      post schooldistricts_url, params: { schooldistrict: { city: @schooldistrict.city, name: @schooldistrict.name, state: @schooldistrict.state, zip: @schooldistrict.zip } }
    end

    assert_redirected_to schooldistrict_url(Schooldistrict.last)
  end

  test "should show schooldistrict" do
    get schooldistrict_url(@schooldistrict)
    assert_response :success
  end

  test "should get edit" do
    get edit_schooldistrict_url(@schooldistrict)
    assert_response :success
  end

  test "should update schooldistrict" do
    patch schooldistrict_url(@schooldistrict), params: { schooldistrict: { city: @schooldistrict.city, name: @schooldistrict.name, state: @schooldistrict.state, zip: @schooldistrict.zip } }
    assert_redirected_to schooldistrict_url(@schooldistrict)
  end

  test "should destroy schooldistrict" do
    assert_difference('Schooldistrict.count', -1) do
      delete schooldistrict_url(@schooldistrict)
    end

    assert_redirected_to schooldistricts_url
  end
end
