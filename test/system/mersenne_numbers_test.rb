require "application_system_test_case"

class MersenneNumbersTest < ApplicationSystemTestCase
  setup do
    @mersenne_number = mersenne_numbers(:one)
  end

  test "visiting the index" do
    visit mersenne_numbers_url
    assert_selector "h1", text: "Mersenne Numbers"
  end

  test "creating a Mersenne number" do
    visit mersenne_numbers_url
    click_on "New Mersenne Number"

    fill_in "Max number", with: @mersenne_number.max_number
    fill_in "Numbers", with: @mersenne_number.numbers
    click_on "Create Mersenne number"

    assert_text "Mersenne number was successfully created"
    click_on "Back"
  end

  test "updating a Mersenne number" do
    visit mersenne_numbers_url
    click_on "Edit", match: :first

    fill_in "Max number", with: @mersenne_number.max_number
    fill_in "Numbers", with: @mersenne_number.numbers
    click_on "Update Mersenne number"

    assert_text "Mersenne number was successfully updated"
    click_on "Back"
  end

  test "destroying a Mersenne number" do
    visit mersenne_numbers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mersenne number was successfully destroyed"
  end
end
