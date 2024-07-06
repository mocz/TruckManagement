require "application_system_test_case"

class PlantersTest < ApplicationSystemTestCase
  setup do
    @planter = planters(:one)
  end

  test "visiting the index" do
    visit planters_url
    assert_selector "h1", text: "Planters"
  end

  test "should create planter" do
    visit planters_url
    click_on "New planter"

    fill_in "Address", with: @planter.address
    fill_in "Mobile number", with: @planter.mobile_number
    fill_in "Name", with: @planter.name
    fill_in "Status", with: @planter.status
    click_on "Create Planter"

    assert_text "Planter was successfully created"
    click_on "Back"
  end

  test "should update Planter" do
    visit planter_url(@planter)
    click_on "Edit this planter", match: :first

    fill_in "Address", with: @planter.address
    fill_in "Mobile number", with: @planter.mobile_number
    fill_in "Name", with: @planter.name
    fill_in "Status", with: @planter.status
    click_on "Update Planter"

    assert_text "Planter was successfully updated"
    click_on "Back"
  end

  test "should destroy Planter" do
    visit planter_url(@planter)
    click_on "Destroy this planter", match: :first

    assert_text "Planter was successfully destroyed"
  end
end
