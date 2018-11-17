require "application_system_test_case"

class SchooldistrictsTest < ApplicationSystemTestCase
  setup do
    @schooldistrict = schooldistricts(:one)
  end

  test "visiting the index" do
    visit schooldistricts_url
    assert_selector "h1", text: "Schooldistricts"
  end

  test "creating a Schooldistrict" do
    visit schooldistricts_url
    click_on "New Schooldistrict"

    fill_in "City", with: @schooldistrict.city
    fill_in "Name", with: @schooldistrict.name
    fill_in "State", with: @schooldistrict.state
    fill_in "Zip", with: @schooldistrict.zip
    click_on "Create Schooldistrict"

    assert_text "Schooldistrict was successfully created"
    click_on "Back"
  end

  test "updating a Schooldistrict" do
    visit schooldistricts_url
    click_on "Edit", match: :first

    fill_in "City", with: @schooldistrict.city
    fill_in "Name", with: @schooldistrict.name
    fill_in "State", with: @schooldistrict.state
    fill_in "Zip", with: @schooldistrict.zip
    click_on "Update Schooldistrict"

    assert_text "Schooldistrict was successfully updated"
    click_on "Back"
  end

  test "destroying a Schooldistrict" do
    visit schooldistricts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Schooldistrict was successfully destroyed"
  end
end
