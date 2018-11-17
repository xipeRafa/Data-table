require "application_system_test_case"

class StudentdataTest < ApplicationSystemTestCase
  setup do
    @studentdatum = studentdata(:one)
  end

  test "visiting the index" do
    visit studentdata_url
    assert_selector "h1", text: "Studentdata"
  end

  test "creating a Studentdatum" do
    visit studentdata_url
    click_on "New Studentdatum"

    fill_in "Classroom", with: @studentdatum.classroom_id
    fill_in "Student", with: @studentdatum.student_id
    fill_in "Text", with: @studentdatum.text
    fill_in "Title", with: @studentdatum.title
    fill_in "User", with: @studentdatum.user_id
    click_on "Create Studentdatum"

    assert_text "Studentdatum was successfully created"
    click_on "Back"
  end

  test "updating a Studentdatum" do
    visit studentdata_url
    click_on "Edit", match: :first

    fill_in "Classroom", with: @studentdatum.classroom_id
    fill_in "Student", with: @studentdatum.student_id
    fill_in "Text", with: @studentdatum.text
    fill_in "Title", with: @studentdatum.title
    fill_in "User", with: @studentdatum.user_id
    click_on "Update Studentdatum"

    assert_text "Studentdatum was successfully updated"
    click_on "Back"
  end

  test "destroying a Studentdatum" do
    visit studentdata_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Studentdatum was successfully destroyed"
  end
end
