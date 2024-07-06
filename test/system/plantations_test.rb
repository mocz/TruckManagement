require "application_system_test_case"

class PlantationsTest < ApplicationSystemTestCase
  setup do
    @plantation = plantations(:one)
  end

  test "visiting the index" do
    visit plantations_url
    assert_selector "h1", text: "Plantations"
  end

  test "should create plantation" do
    visit plantations_url
    click_on "New plantation"

    fill_in "Area", with: @plantation.area
    fill_in "Location", with: @plantation.location_id
    fill_in "Name", with: @plantation.name
    click_on "Create Plantation"

    assert_text "Plantation was successfully created"
    click_on "Back"
  end

  test "should update Plantation" do
    visit plantation_url(@plantation)
    click_on "Edit this plantation", match: :first

    fill_in "Area", with: @plantation.area
    fill_in "Location", with: @plantation.location_id
    fill_in "Name", with: @plantation.name
    click_on "Update Plantation"

    assert_text "Plantation was successfully updated"
    click_on "Back"
  end

  test "should destroy Plantation" do
    visit plantation_url(@plantation)
    click_on "Destroy this plantation", match: :first

    assert_text "Plantation was successfully destroyed"
  end
end
