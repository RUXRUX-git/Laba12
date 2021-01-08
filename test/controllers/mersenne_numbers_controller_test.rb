require 'test_helper'

class MersenneNumbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mersenne_number = mersenne_numbers(:one)
  end

  test "should get index" do
    get mersenne_numbers_url
    assert_response :success
  end

  test "should get new" do
    get new_mersenne_number_url
    assert_response :success
  end

  test "should create mersenne_number" do
    assert_difference('MersenneNumber.count') do
      post mersenne_numbers_url, params: { mersenne_number: { max_number: @mersenne_number.max_number, numbers: @mersenne_number.numbers } }
    end

    assert_redirected_to mersenne_number_url(MersenneNumber.last)
  end

  test "should show mersenne_number" do
    get mersenne_number_url(@mersenne_number)
    assert_response :success
  end

  test "should get edit" do
    get edit_mersenne_number_url(@mersenne_number)
    assert_response :success
  end

  test "should update mersenne_number" do
    patch mersenne_number_url(@mersenne_number), params: { mersenne_number: { max_number: @mersenne_number.max_number, numbers: @mersenne_number.numbers } }
    assert_redirected_to mersenne_number_url(@mersenne_number)
  end

  test "should destroy mersenne_number" do
    assert_difference('MersenneNumber.count', -1) do
      delete mersenne_number_url(@mersenne_number)
    end

    assert_redirected_to mersenne_numbers_url
  end
end
