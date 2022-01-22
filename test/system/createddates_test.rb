require "application_system_test_case"

class CreateddatesTest < ApplicationSystemTestCase
  setup do
    @createddate = createddates(:one)
  end

  test "visiting the index" do
    visit createddates_url
    assert_selector "h1", text: "Createddates"
  end

  test "should create createddate" do
    visit createddates_url
    click_on "New createddate"

    fill_in "Date", with: @createddate.date
    click_on "Create Createddate"

    assert_text "Createddate was successfully created"
    click_on "Back"
  end

  test "should update Createddate" do
    visit createddate_url(@createddate)
    click_on "Edit this createddate", match: :first

    fill_in "Date", with: @createddate.date
    click_on "Update Createddate"

    assert_text "Createddate was successfully updated"
    click_on "Back"
  end

  test "should destroy Createddate" do
    visit createddate_url(@createddate)
    click_on "Destroy this createddate", match: :first

    assert_text "Createddate was successfully destroyed"
  end
end
